import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../domain/ndef_record.dart';
import '../domain/nfc_tag_info.dart';
import '../domain/storage_models.dart';
import '../domain/nfc_workflow_models.dart';
import '../domain/composer_history.dart';
import '../controllers/nfc_controller.dart';
import '../services/nfc_service.dart';
import '../services/backup_codec.dart';
import 'compose_record_sheet.dart';
import 'raw_record_editor_dialog.dart';
import 'qr_preview_dialog.dart';
import 'tag_rules_manager_sheet.dart';

class HomeScreen extends StatefulWidget {
  final NfcStateController? controller;

  const HomeScreen({super.key, this.controller});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final NfcStateController _controller;
  late final TabController _tabController;

  // Staged records for writing
  final List<NdefRecordModel> _recordsToWrite = [];

  // Bounded Undo/Redo history for composer changes
  final ComposerHistory _composerHistory = ComposerHistory(maxSnapshots: 30);

  // Expanded records for Advanced Record Inspector
  final Set<int> _expandedReadIndices = <int>{};
  final Set<int> _expandedComposerIndices = <int>{};

  // State for Rewrite flow (staged for rewrite)
  List<NdefRecordModel>? _rewriteStagedRecords;
  String? _rewriteSourceUid;

  // State for Batch Write flow
  int _batchTargetCount = 5;
  int _batchCurrentIndex = 0; // 0-based
  bool _batchActive = false;
  final List<BatchTagAttempt> _batchAttempts = [];

  // State for History search & filter
  final TextEditingController _historySearchController =
      TextEditingController();
  String _historySearchQuery = '';

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? NfcStateController();
    _tabController = TabController(length: 4, vsync: this);
    _controller.addListener(_onControllerUpdate);
    _controller.init();
  }

  void _onControllerUpdate() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    _historySearchController.dispose();
    _controller.removeListener(_onControllerUpdate);
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  void _undoComposer() {
    if (!_composerHistory.canUndo) return;
    setState(() {
      final restored = _composerHistory.undo(_recordsToWrite);
      if (restored != null) {
        _recordsToWrite
          ..clear()
          ..addAll(restored);
        _expandedComposerIndices.clear();
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Son beste değişikliği geri alındı.'),
        backgroundColor: Colors.indigo,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _redoComposer() {
    if (!_composerHistory.canRedo) return;
    setState(() {
      final restored = _composerHistory.redo(_recordsToWrite);
      if (restored != null) {
        _recordsToWrite
          ..clear()
          ..addAll(restored);
        _expandedComposerIndices.clear();
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Beste değişikliği yinelendi.'),
        backgroundColor: Colors.teal,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _openComposeSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => ComposeRecordSheet(
        onRecordCreated: (rec) {
          setState(() {
            _composerHistory.push(_recordsToWrite);
            _recordsToWrite.add(rec);
          });
        },
      ),
    );
  }

  void _editComposerRecord(int index) {
    if (index < 0 || index >= _recordsToWrite.length) return;
    final current = _recordsToWrite[index];
    final parsed = NdefCodec.parseRecord(current);

    // Can this record safely round-trip through ComposeRecordSheet?
    // Check if high-level parsed type can roundtrip without losing fields.
    bool canRoundTrip = false;

    switch (parsed.type) {
      case ParsedRecordType.text:
      case ParsedRecordType.url:
      case ParsedRecordType.email:
      case ParsedRecordType.phone:
      case ParsedRecordType.sms:
      case ParsedRecordType.location:
      case ParsedRecordType.customMime:
        canRoundTrip = true;
        break;
      case ParsedRecordType.vcard:
      case ParsedRecordType.calendar:
        // Imported cards/events may carry fields the simplified form does not expose.
        canRoundTrip = false;
        break;
      case ParsedRecordType.smartPoster:
        canRoundTrip = false;
        break;
      case ParsedRecordType.wifi:
        // WSC may contain extra TLV attributes not represented by the form.
        canRoundTrip = false;
        break;
      case ParsedRecordType.unknown:
        canRoundTrip = false;
        break;
    }

    // The form creates a new NDEF record and cannot retain a custom record ID.
    if (current.id.isNotEmpty) canRoundTrip = false;
    // Text form encodes UTF-8 with its default language, so preserve other metadata.
    if (parsed.type == ParsedRecordType.text &&
        (current.payload.isEmpty ||
            current.payload.first != 2 ||
            current.payload.length < 3 ||
            current.payload[1] != 0x74 ||
            current.payload[2] != 0x72)) {
      canRoundTrip = false;
    }

    if (canRoundTrip) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (ctx) => ComposeRecordSheet(
          initialRecord: current,
          onRecordCreated: (updatedRec) {
            setState(() {
              _composerHistory.push(_recordsToWrite);
              _recordsToWrite[index] = updatedRec;
            });
          },
        ),
      );
    } else {
      // Preserve all original metadata and unexposed fields in the raw editor.
      RawRecordEditorDialog.show(
        context,
        record: current,
        onSave: (updatedRec) {
          setState(() {
            _composerHistory.push(_recordsToWrite);
            _recordsToWrite[index] = updatedRec;
          });
        },
      );
    }
  }

  int get _stagedBytesTotal {
    return encodeNdefMessage(_recordsToWrite).length;
  }

  // -------------------------------------------------------------
  // Workflow 1: NDEF Content Clipboard with Replace / Append & Confirmation
  // -------------------------------------------------------------

  /// Copies full NDEF records from source into the in-memory clipboard snapshot
  void _copyToClipboard(List<NdefRecordModel> records,
      {String source = 'Taranan Etiket'}) {
    if (records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kopyalanacak NDEF kaydı bulunmuyor.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    _controller.copyToClipboard(records, sourceDescription: source);
    final count = records.length;
    final bytes = encodeNdefMessage(records).length;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$count adet NDEF kaydı ($bytes Bayt) panoya kopyalandı.\n(Yalnızca NDEF içerik baytları kopyalanır; UID veya şifreli sektörler asla klonlanamaz)',
        ),
        backgroundColor: Colors.teal,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  /// Pastes clipboard records into the composer with Replace or Append choice
  void _pasteFromClipboard() {
    final clip = _controller.clipboardSnapshot;
    if (clip == null || clip.records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Panoda kopyalanmış NDEF içeriği bulunmuyor.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.paste, color: Colors.teal),
                  const SizedBox(width: 8),
                  Text(
                    'NDEF Panosundan Yapıştır',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Panodaki Veri: ${clip.recordCount} kayıt, ${clip.byteSize} bayt (${clip.sourceDescription})',
                style: const TextStyle(color: Colors.black87),
              ),
              const SizedBox(height: 4),
              const Text(
                'Mevcut beste kayıtlarını tamamen değiştirmek mi yoksa sonuna eklemek mi istiyorsunuz?',
                style: TextStyle(color: Colors.black54, fontSize: 13),
              ),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.find_replace, color: Colors.orange),
                title: const Text('Üzerine Yaz (Değiştir)'),
                subtitle: Text(_recordsToWrite.isNotEmpty
                    ? 'Mevcut ${_recordsToWrite.length} kayıt silinip pano içeriğiyle değiştirilir (onay istenir).'
                    : 'Pano içeriği besteye yerleştirilir.'),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _handlePasteReplace(clip.records);
                },
              ),
              ListTile(
                leading: const Icon(Icons.add_to_photos, color: Colors.teal),
                title: const Text('Sonuna Ekle (Append)'),
                subtitle: const Text(
                    'Mevcut kayıtlar korunur, panodaki kayıtlar listenin sonuna ilave edilir.'),
                onTap: () {
                  Navigator.of(ctx).pop();
                  _handlePasteAppend(clip.records);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePasteAppend(List<NdefRecordModel> records) {
    setState(() {
      _composerHistory.push(_recordsToWrite);
      _recordsToWrite.addAll(records);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${records.length} adet kayıt besteye eklendi.'),
        backgroundColor: Colors.teal,
      ),
    );
  }

  void _handlePasteReplace(List<NdefRecordModel> records) {
    if (_recordsToWrite.isNotEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Kayıtların Üzerine Yazılsın mı?'),
          content: Text(
            'Mevcut bestede ${_recordsToWrite.length} adet kayıt bulunuyor. Bu kayıtlar silinecek ve yerlerine panodaki ${records.length} adet kayıt getirilecektir. Devam edilsin mi?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Vazgeç'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade800),
              onPressed: () {
                Navigator.of(ctx).pop();
                setState(() {
                  _composerHistory.push(_recordsToWrite);
                  _recordsToWrite.clear();
                  _recordsToWrite.addAll(records);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        '${records.length} adet kayıt ile bestedeki kayıtlar değiştirildi.'),
                    backgroundColor: Colors.teal,
                  ),
                );
              },
              child: const Text('Evet, Değiştir',
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    } else {
      setState(() {
        _composerHistory.push(_recordsToWrite);
        _recordsToWrite.clear();
        _recordsToWrite.addAll(records);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${records.length} adet kayıt besteye aktarıldı.'),
          backgroundColor: Colors.teal,
        ),
      );
    }
  }

  /// Copies full NDEF records from scanned tag into write composer (Backward-compatible method)
  void _copyScannedContentToComposer(List<NdefRecordModel> records) {
    if (records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Kopyalanacak NDEF içeriği bulunamadı.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    _controller.copyToClipboard(records, sourceDescription: 'Taranan Etiket');

    if (_recordsToWrite.isNotEmpty) {
      // Prompt Replace vs Append for consistency with new clipboard semantics
      _pasteFromClipboard();
      _tabController.animateTo(1);
    } else {
      setState(() {
        _composerHistory.push(_recordsToWrite);
        _recordsToWrite.addAll(records);
      });
      _tabController.animateTo(1);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${records.length} adet NDEF kaydı panoya alındı ve besteye eklendi (İçerik kopyalandı, UID kopyalanmaz).',
          ),
          backgroundColor: Colors.teal,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  // -------------------------------------------------------------
  // Workflow 2: Rewrite Flow (Stage -> Tap target tag -> Verify -> Compare)
  // -------------------------------------------------------------

  void _startRewriteFlow(
      List<NdefRecordModel> sourceRecords, String sourceUid) {
    if (sourceRecords.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Yeniden yazılacak NDEF içeriği bulunamadı.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    setState(() {
      _rewriteStagedRecords = List<NdefRecordModel>.from(sourceRecords);
      _rewriteSourceUid = sourceUid;
    });

    _showRewriteConfirmationDialog();
  }

  void _showRewriteConfirmationDialog() {
    final records = _rewriteStagedRecords;
    if (records == null || records.isEmpty) return;
    final byteSize = encodeNdefMessage(records).length;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.replay_circle_filled, color: Colors.indigo),
            SizedBox(width: 8),
            Text('Etiketi Yeniden Yaz'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade300),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ÖNEMLİ BİLGİLENDİRME:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                          fontSize: 13),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '• Bu işlem hedef etiketin mevcut NDEF içeriğini TAMAMEN DEĞİŞTİRİR (üzerine yazar), sonuna eklemez.\n'
                      '• Hedef etiketin yazılabilir (kilitsiz) bir NDEF etiketi olması şarttır.\n'
                      '• İşlem önceki etikete sessizce yazmaz; yeni bir NFC dokunuşu beklenir.',
                      style: TextStyle(fontSize: 12, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text('Kaynak UID: ${_rewriteSourceUid ?? "Bilinmiyor"}'),
              Text('Yazılacak Kayıt Sayısı: ${records.length}'),
              Text('Mesaj Boyutu: $byteSize Bayt'),
              const Divider(height: 20),
              const Text(
                'Hedef etiketi hazırlayın ve "Dokun ve Yaz" butonuna bastıktan sonra etiketi telefonun arkasına yaklaştırın.',
                style: TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _rewriteStagedRecords = null;
                _rewriteSourceUid = null;
              });
            },
            child: const Text('İptal'),
          ),
          TextButton.icon(
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Düzenle'),
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _composerHistory.push(_recordsToWrite);
                _recordsToWrite
                  ..clear()
                  ..addAll(records);
                _rewriteStagedRecords = null;
                _rewriteSourceUid = null;
              });
              _tabController.animateTo(1);
            },
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.nfc),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
            ),
            label: const Text('Dokun ve Yaz'),
            onPressed: () async {
              Navigator.of(ctx).pop();
              await _executeRewrite();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _executeRewrite() async {
    final records = _rewriteStagedRecords;
    if (records == null || records.isEmpty) return;

    final success = await _controller.writeRecords(
      records,
      promptMessage:
          'Hedef etiketi cihazınıza yaklaştırın (İçerik tamamen yenilenecektir)',
    );

    if (mounted) {
      if (success) {
        _showRewriteSuccessAndCompareDialog(records);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Yeniden yazma başarısız: ${_controller.lastWriteResult?.message ?? "Hata"}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _showRewriteSuccessAndCompareDialog(
      List<NdefRecordModel> writtenRecords) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Yazma Doğrulandı'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'NDEF içeriği hedef etikete başarıyla yazıldı ve doğrulandı.',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Yazılan Kayıt Sayısı: ${writtenRecords.length}'),
            Text('Bayt: ${encodeNdefMessage(writtenRecords).length} B'),
            const SizedBox(height: 12),
            const Text(
              'Yazılan veriyi doğrulamak veya karşılaştırmak için sonraki taramayı başlatabilirsiniz.',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Kapat'),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, foregroundColor: Colors.white),
            icon: const Icon(Icons.document_scanner),
            label: const Text('Şimdi Tara ve Karşılaştır'),
            onPressed: () async {
              Navigator.of(ctx).pop();
              _tabController.animateTo(0);
              await _controller.scanTag();
              if (mounted) {
                _compareWrittenWithLastScan(writtenRecords);
              }
            },
          ),
        ],
      ),
    );
  }

  void _compareWrittenWithLastScan(List<NdefRecordModel> written) {
    final scannedTag = _controller.lastScannedTag;
    if (scannedTag == null || scannedTag.error != null) return;

    final scanned = scannedTag.records;
    final writtenBytes = encodeNdefMessage(written);
    final scannedBytes = encodeNdefMessage(scanned);

    bool match = (writtenBytes.length == scannedBytes.length);
    if (match) {
      for (int i = 0; i < writtenBytes.length; i++) {
        if (writtenBytes[i] != scannedBytes[i]) {
          match = false;
          break;
        }
      }
    }

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(match ? Icons.verified : Icons.warning,
                color: match ? Colors.green : Colors.orange),
            const SizedBox(width: 8),
            Text(
                match ? 'İçerik Birebir Eşleşiyor' : 'Farklılık Tespit Edildi'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Taranan Etiket UID: ${scannedTag.identifier}'),
            const Divider(height: 16),
            Text(
                'Yazılan Veri: ${written.length} kayıt (${writtenBytes.length} Bayt)'),
            Text(
                'Taranan Veri: ${scanned.length} kayıt (${scannedBytes.length} Bayt)'),
            const SizedBox(height: 8),
            Text(
              match
                  ? 'Hedef etiketteki NDEF mesajı ile yazılan kaynak NDEF mesajı bayt bayt tamamen aynıdır.'
                  : 'Hedef etiketten okunan veriler ile yazılmak istenen veri arasında farklılık var. Etiketin kilitli veya farklı bir etiket olup olmadığını kontrol ediniz.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: match ? Colors.green.shade900 : Colors.deepOrange,
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // Workflow 3: Batch Write Flow (2..100 tags, manual trigger, progress)
  // -------------------------------------------------------------

  void _openBatchWriteModal() {
    if (_recordsToWrite.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Toplu yazım başlatmak için önce beste sekmesine en az bir kayıt ekleyiniz.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    int chosenCount = _batchTargetCount;
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlgState) => AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.dynamic_feed, color: Colors.teal),
              SizedBox(width: 8),
              Text('Toplu Etiket Yazımı (Batch)'),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Aynı NDEF içeriğini birden fazla etikete sırayla yazabilirsiniz.',
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blueGrey.shade200),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DİKKAT:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.blueGrey),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '• Yanlışlıkla aynı etikete iki kez yazılmasını engellemek için her yazım kullanıcı tarafından açıkça "Sıradakini Yaz" butonu ile başlatılır.\n'
                        '• Otomatik arka arkaya tarama yapılmaz; her etiket fiziksel olarak değiştirilmelidir.',
                        style: TextStyle(fontSize: 12, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Hedef Etiket Sayısı: $chosenCount',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Slider(
                  value: chosenCount.toDouble(),
                  min: 2,
                  max: 100,
                  divisions: 98,
                  label: '$chosenCount',
                  onChanged: (val) {
                    setDlgState(() {
                      chosenCount = val.toInt();
                    });
                  },
                ),
                Text(
                  'Bestedeki Kayıtlar: ${_recordsToWrite.length} adet ($_stagedBytesTotal Bayt)',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Vazgeç'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, foregroundColor: Colors.white),
              onPressed: () {
                Navigator.of(ctx).pop();
                _initBatchWrite(chosenCount);
              },
              child: const Text('Toplu Yazımı Başlat'),
            ),
          ],
        ),
      ),
    );
  }

  void _initBatchWrite(int totalCount) {
    setState(() {
      _batchTargetCount = totalCount;
      _batchCurrentIndex = 0;
      _batchActive = true;
      _batchAttempts.clear();
      for (int i = 0; i < totalCount; i++) {
        _batchAttempts.add(BatchTagAttempt(index: i));
      }
    });

    _showBatchControlSheet();
  }

  void _showBatchControlSheet() {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      enableDrag: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetCtx) => StatefulBuilder(
        builder: (ctx, setSheetState) {
          final successCount = _batchAttempts
              .where((a) => a.status == BatchTagStatus.success)
              .length;
          final failCount = _batchAttempts
              .where((a) => a.status == BatchTagStatus.failed)
              .length;
          final isCompleted = _batchCurrentIndex >= _batchTargetCount;
          final currentAttemptNum =
              min(_batchCurrentIndex + 1, _batchTargetCount);

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.dynamic_feed, color: Colors.teal),
                          const SizedBox(width: 8),
                          Text(
                            'Toplu Yazım Kontrol Paneli',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        tooltip: 'İptal Et / Kapat',
                        onPressed: () => _confirmCancelBatch(sheetCtx),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  LinearProgressIndicator(
                    value: _batchTargetCount > 0
                        ? (_batchCurrentIndex / _batchTargetCount)
                        : 0,
                    color: Colors.teal,
                    backgroundColor: Colors.teal.shade50,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isCompleted
                        ? 'Tüm etiket denemeleri tamamlandı!'
                        : 'Sıradaki: Etiket #$currentAttemptNum / $_batchTargetCount',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    'Başarılı: $successCount | Hatalı: $failCount | Kalan: ${_batchTargetCount - _batchCurrentIndex}',
                    style: const TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const Divider(height: 20),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: _batchAttempts.length,
                      itemBuilder: (c, idx) {
                        final att = _batchAttempts[idx];
                        Icon icon;
                        Color? textColor;
                        String statusText;
                        switch (att.status) {
                          case BatchTagStatus.success:
                            icon = const Icon(Icons.check_circle,
                                color: Colors.green, size: 20);
                            textColor = Colors.green.shade800;
                            statusText = 'Başarılı (${att.message ?? ""})';
                            break;
                          case BatchTagStatus.failed:
                            icon = const Icon(Icons.cancel,
                                color: Colors.red, size: 20);
                            textColor = Colors.red.shade800;
                            statusText = 'Başarısız: ${att.message ?? ""}';
                            break;
                          case BatchTagStatus.writing:
                            icon = const Icon(Icons.hourglass_top,
                                color: Colors.orange, size: 20);
                            textColor = Colors.orange.shade800;
                            statusText = 'Yazılıyor...';
                            break;
                          case BatchTagStatus.cancelled:
                            icon = const Icon(Icons.remove_circle_outline,
                                color: Colors.grey, size: 20);
                            textColor = Colors.grey;
                            statusText = 'İptal Edildi';
                            break;
                          case BatchTagStatus.pending:
                            icon = const Icon(Icons.radio_button_unchecked,
                                color: Colors.blueGrey, size: 20);
                            textColor = Colors.black54;
                            statusText = 'Bekliyor';
                            break;
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Row(
                            children: [
                              icon,
                              const SizedBox(width: 8),
                              Text('Etiket #${idx + 1}: ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Expanded(
                                child: Text(
                                  statusText,
                                  style:
                                      TextStyle(color: textColor, fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 20),
                  if (!isCompleted)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            icon: const Icon(Icons.nfc),
                            label: Text(
                              _controller.isBusy
                                  ? 'Etiket Bekleniyor...'
                                  : 'Etiket #$currentAttemptNum İçin Dokun ve Yaz',
                            ),
                            onPressed: _controller.isBusy
                                ? null
                                : () async {
                                    await _executeNextBatchItem(setSheetState);
                                  },
                          ),
                        ),
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () {
                              Navigator.of(sheetCtx).pop();
                              setState(() {
                                _batchActive = false;
                              });
                            },
                            child: const Text('Toplu Yazımı Bitir'),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _executeNextBatchItem(
      void Function(void Function()) setSheetState) async {
    if (!_batchActive || _batchCurrentIndex >= _batchTargetCount) return;
    final index = _batchCurrentIndex;

    setSheetState(() {
      _batchAttempts[index] =
          _batchAttempts[index].copyWith(status: BatchTagStatus.writing);
    });

    final currentNum = index + 1;
    final success = await _controller.writeRecords(
      _recordsToWrite,
      promptMessage:
          'Toplu Yazım: #$currentNum / $_batchTargetCount etiketi cihaza yaklaştırın',
    );
    if (!_batchActive || !mounted) return;

    final msg = success
        ? '${_recordsToWrite.length} kayıt yazıldı ve doğrulandı'
        : (_controller.lastWriteResult?.message ?? 'Yazma hatası');

    setSheetState(() {
      _batchAttempts[index] = _batchAttempts[index].copyWith(
        status: success ? BatchTagStatus.success : BatchTagStatus.failed,
        message: msg,
        completedAt: DateTime.now(),
      );
      _batchCurrentIndex++;
    });
    setState(() {});
  }

  void _confirmCancelBatch(BuildContext sheetCtx) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Toplu Yazımı İptal Et'),
        content: const Text(
          'Toplu yazım oturumu sonlandırılsın mı? Şimdiye kadar yazılmış olan etiketlerdeki veriler korunur; kalan etiketler yazılmaz.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Devam Et'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              Navigator.of(ctx).pop();
              Navigator.of(sheetCtx).pop();
              setState(() {
                for (int i = _batchCurrentIndex; i < _batchTargetCount; i++) {
                  _batchAttempts[i] = _batchAttempts[i].copyWith(
                    status: BatchTagStatus.cancelled,
                    message: 'İptal edildi',
                  );
                }
                _batchActive = false;
              });
              await _controller.cancelSession();
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Toplu yazım işlemi iptal edildi. Besteniz korundu.'),
                  backgroundColor: Colors.orange,
                ),
              );
            },
            child: const Text('İptal Et ve Kapat',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // Workflow 4: Composer Record Reordering
  // -------------------------------------------------------------

  void _moveComposerRecordUp(int index) {
    if (index <= 0) return;
    setState(() {
      _composerHistory.push(_recordsToWrite);
      final item = _recordsToWrite.removeAt(index);
      _recordsToWrite.insert(index - 1, item);
    });
  }

  void _moveComposerRecordDown(int index) {
    if (index >= _recordsToWrite.length - 1) return;
    setState(() {
      _composerHistory.push(_recordsToWrite);
      final item = _recordsToWrite.removeAt(index);
      _recordsToWrite.insert(index + 1, item);
    });
  }

  // -------------------------------------------------------------
  // Workflow 5: Offline URL Safety Dialog
  // -------------------------------------------------------------

  void _showUrlSafetyDialog(String rawUrl) {
    final assessment = UrlSafetyAssessment.evaluate(rawUrl);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(
              assessment.warnings.isEmpty
                  ? Icons.security
                  : Icons.warning_amber_rounded,
              color: assessment.warnings.isEmpty
                  ? Colors.green
                  : Colors.orange.shade800,
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Text('Çevrimdışı URL İncelemesi',
                  style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  assessment.rawUrl,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              const SizedBox(height: 12),
              _buildSafetyParam('Şema (Protokol):',
                  assessment.scheme.isEmpty ? '(Eksik)' : assessment.scheme),
              _buildSafetyParam('Sunucu / Host:',
                  assessment.host.isEmpty ? '(Bilinmiyor)' : assessment.host),
              if (assessment.port != null)
                _buildSafetyParam(
                    'Bağlantı Noktası (Port):', assessment.port.toString()),
              _buildSafetyParam(
                'Kullanıcı Bilgisi (UserInfo):',
                assessment.hasUserInfo ? 'Mevcut (Riskli olabilir)' : 'Yok',
                highlight: assessment.hasUserInfo,
              ),
              _buildSafetyParam(
                'Doğrudan IP Adresi (IP Literal):',
                assessment.isIpLiteral
                    ? 'Evet (IP adresi)'
                    : 'Hayır (Alan adı)',
                highlight: assessment.isIpLiteral,
              ),
              _buildSafetyParam(
                'Uluslararası / Punycode (xn--):',
                assessment.isPunycode ? 'Evet (Homoglif şüphesi)' : 'Hayır',
                highlight: assessment.isPunycode,
              ),
              const Divider(height: 20),
              if (assessment.warnings.isNotEmpty) ...[
                const Text(
                  'Güvenlik / Dikkat Uyarıları:',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                      fontSize: 13),
                ),
                const SizedBox(height: 4),
                ...assessment.warnings.map(
                  (w) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('⚠️ ', style: TextStyle(fontSize: 12)),
                        Expanded(
                          child: Text(w,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.brown)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'NOT: Bu analiz tamamen yerel/çevrimdışı kurallarla yapılmıştır. Ağ üzerinden zararlı yazılım veya antivirüs kontrolü iddiasında bulunmaz. URL otomatik olarak açılmaz.',
                  style: TextStyle(fontSize: 11, color: Colors.blueGrey),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Kapat'),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyParam(String label, String value,
      {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: highlight ? Colors.red.shade800 : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // Template & Settings Handlers
  // -------------------------------------------------------------

  void _loadTemplateToComposer(WriteTemplate template) {
    setState(() {
      _composerHistory.push(_recordsToWrite);
      _recordsToWrite.addAll(template.records);
    });
    _tabController.animateTo(1);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
            '"${template.name}" şablonundaki kayıtlar yazma bestesine aktarıldı.'),
        backgroundColor: Colors.indigo,
      ),
    );
  }

  void _promptSaveAsTemplate() {
    if (_recordsToWrite.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Şablon olarak kaydetmek için önce kayıt ekleyiniz.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final nameController = TextEditingController(
        text: 'Şablon ${_controller.storage.getTemplates().length + 1}');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Şablon Olarak Kaydet'),
        content: TextField(
          controller: nameController,
          autofocus: true,
          decoration: const InputDecoration(
            labelText: 'Şablon Adı',
            hintText: 'Örn: Şirket Web Sitesi & İletişim',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            onPressed: () async {
              final name = nameController.text.trim();
              if (name.isEmpty) return;
              await _controller.storage.saveTemplate(
                WriteTemplate(
                  id: DateTime.now().microsecondsSinceEpoch.toString(),
                  name: name,
                  createdAt: DateTime.now(),
                  records: List<NdefRecordModel>.from(_recordsToWrite),
                ),
              );
              if (!mounted || !ctx.mounted) return;
              Navigator.of(ctx).pop();
              setState(() {});
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Şablon kaydedildi.')),
              );
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // Tag Rules (In-App Notes keyed by SHA-256 of exact NDEF bytes)
  // -------------------------------------------------------------

  void _showAddOrEditTagRuleDialog(List<NdefRecordModel> records) {
    if (records.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Not eklemek için etikette en az bir NDEF kaydı bulunmalıdır.'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    final sha = NfcStateController.computeRecordsSha256(records);
    final existingRule = _controller.storage.getTagRuleBySha256(sha);
    final noteController =
        TextEditingController(text: existingRule?.note ?? '');

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(existingRule != null
            ? 'Etiket Notunu Düzenle'
            : 'Etikete Özel Not Ekle'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.amber.shade200),
                ),
                child: const Text(
                  'Bu not, etiketin NDEF içerik SHA-256 özetine bağlanır. Etiket tekrar tarandığında sadece bu açıklama gösterilir; harici eylem başlatmaz veya sistem ayarlarını değiştirmez.',
                  style: TextStyle(fontSize: 11, color: Colors.brown),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'NDEF İçerik Özeti (SHA-256):\n$sha',
                style: const TextStyle(
                    fontSize: 9,
                    fontFamily: 'monospace',
                    color: Colors.blueGrey),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: noteController,
                autofocus: true,
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Uygulama İçi Not / Açıklama',
                  hintText: 'Örn: Toplantı Odası Bilgisi veya Depo Rafı #12',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            onPressed: () async {
              final note = noteController.text.trim();
              if (note.isNotEmpty) {
                await _controller.setRuleForRecords(records, note);
                if (mounted && ctx.mounted) {
                  setState(() {});
                  Navigator.of(ctx).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Etiket notu kaydedildi.'),
                      backgroundColor: Colors.teal,
                    ),
                  );
                }
              }
            },
            child: const Text('Kaydet'),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteTagRule(List<NdefRecordModel> records) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Etiket Notunu Sil'),
        content: const Text(
            'Bu etikete ait kayıtlı uygulama içi not silinecektir. Devam edilsin mi?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await _controller.deleteRuleForRecords(records);
              if (mounted && ctx.mounted) {
                setState(() {});
                Navigator.of(ctx).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Etiket notu silindi.'),
                    backgroundColor: Colors.teal,
                  ),
                );
              }
            },
            child: const Text('Sil', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _openTagRulesManager() {
    TagRulesManagerSheet.show(
      context,
      storage: _controller.storage,
      onRulesChanged: () {
        if (mounted) setState(() {});
      },
    );
  }

  // -------------------------------------------------------------
  // JSON Backup: Export & Import with Sensitive Data Warnings
  // -------------------------------------------------------------

  void _promptExportBackup() {
    final templates = _controller.storage.getTemplates();
    final history = _controller.storage.getHistory();
    final rules = _controller.storage.getTagRules();
    final isHistoryEnabled = _controller.storage.isHistoryEnabled;

    bool includeHistory = isHistoryEnabled && history.isNotEmpty;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDlgState) => AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.file_download_outlined, color: Colors.indigo),
              SizedBox(width: 8),
              Text('Yedek Dışa Aktar'),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber.shade400),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.warning_amber_rounded,
                              color: Colors.orange, size: 20),
                          SizedBox(width: 6),
                          Text('GİZLİLİK VE GÜVENLİK UYARISI',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.brown)),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Dışa aktarılan yedek dosyası (JSON) düz metin biçimindedir. Kayıtlarınız içerisinde Wi-Fi parolaları, iletişim (vCard) veya e-posta gibi hassas veriler bulunabilir. Dosyayı güvenli bir konumda saklayınız ve üçüncü şahıslarla paylaşırken dikkatli olunuz.',
                        style: TextStyle(fontSize: 11, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Dahil Edilecek Öğeler:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                Text('• Şablonlar: ${templates.length} adet'),
                Text(
                    '• Uygulama İçi Etiket Notları/Kuralları: ${rules.length} adet'),
                const SizedBox(height: 8),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: const Text('Tarama Geçmişini Dahil Et (İsteğe Bağlı)'),
                  subtitle: Text(
                    isHistoryEnabled
                        ? '${history.length} adet geçmiş kaydı'
                        : 'Tarama geçmişi bu cihazda kapalıdır',
                    style: const TextStyle(fontSize: 11),
                  ),
                  value: includeHistory,
                  onChanged: isHistoryEnabled && history.isNotEmpty
                      ? (val) {
                          setDlgState(() {
                            includeHistory = val ?? false;
                          });
                        }
                      : null,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: const Text('Vazgeç'),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.share),
              label: const Text('Dışa Aktar ve Paylaş'),
              onPressed: () async {
                Navigator.of(ctx).pop();
                await _executeExportBackup(includeHistory: includeHistory);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _executeExportBackup({required bool includeHistory}) async {
    try {
      final templates = _controller.storage.getTemplates();
      final history = includeHistory ? _controller.storage.getHistory() : null;
      final rules = _controller.storage.getTagRules();

      final jsonContent = BackupCodec.encodeBackup(
        templates: templates,
        history: history,
        tagRules: rules,
        clientAppVersion: '1.0.0+1',
      );

      final dateStr = DateTime.now().toIso8601String().substring(0, 10);
      final fileName = 'nfc_tag_master_backup_$dateStr.json';
      final bytes = Uint8List.fromList(utf8.encode(jsonContent));

      final xfile = XFile.fromData(
        bytes,
        mimeType: 'application/json',
        name: fileName,
      );

      final result = await SharePlus.instance.share(
        ShareParams(
          files: [xfile],
          fileNameOverrides: [fileName],
          subject: 'NFC Etiket Yöneticisi Yedek Dosyası',
          text: 'NFC Etiket Yöneticisi şablon ve veri yedeği (JSON)',
        ),
      );

      if (!mounted) return;
      if (result.status == ShareResultStatus.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Yedek dosyası başarıyla dışa aktarıldı ve paylaşıldı.'),
            backgroundColor: Colors.teal,
          ),
        );
      } else if (result.status == ShareResultStatus.dismissed) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Dışa aktarma paylaşımı iptal edildi.'),
            backgroundColor: Colors.blueGrey,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dışa aktarma hatası: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _promptImportBackup() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.file_upload_outlined, color: Colors.indigo),
            SizedBox(width: 8),
            Text('Yedek İçe Aktar'),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.amber.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.amber.shade400),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.warning_amber_rounded,
                            color: Colors.orange, size: 20),
                        SizedBox(width: 6),
                        Text('GÜVENLİK VE BİRLEŞTİRME KURALI',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.brown)),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      '• İçe aktarma BİRLEŞTİRME (merge) mantığıyla çalışır; mevcut kayıtlarınız ASLA silinmez.\n'
                      '• Yedek dosyasında Wi-Fi parolaları veya kişisel veriler bulunabilir; yalnızca güvendiğiniz kaynaklardan gelen yedekleri yükleyiniz.\n'
                      '• Dosya boyutu sınırı: 2 MiB. Veriler yüklenmeden önce katı şema ve Base64 doğrulamasına tabi tutulur.',
                      style: TextStyle(fontSize: 11, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Birleştirmek istediğiniz geçerli bir .json yedek dosyasını seçiniz.',
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.folder_open),
            label: const Text('Dosya Seç'),
            onPressed: () async {
              Navigator.of(ctx).pop();
              await _executeImportBackup();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _executeImportBackup() async {
    XFile? file;
    try {
      file = await openFile();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dosya seçici açılamadı: $e'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (file == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Dosya seçimi iptal edildi.'),
          backgroundColor: Colors.blueGrey,
        ),
      );
      return;
    }

    String content;
    try {
      final bytes = await file.readAsBytes();
      if (bytes.length > BackupCodec.maxByteSize) {
        throw const BackupValidationException(
          'Seçilen dosya izin verilen 2 MiB sınırını aşıyor.',
        );
      }
      content = utf8.decode(bytes);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Dosya okuma hatası: $e'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    BackupPayload payload;
    try {
      payload = BackupCodec.decodeAndValidate(content);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Yedek doğrulama hatası: $e'),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 5),
        ),
      );
      return;
    }

    // Check if backup contains history and local history is disabled
    final isLocalHistoryEnabled = _controller.storage.isHistoryEnabled;
    bool enableHistoryIfDisabled = false;

    if (payload.hasHistory && !isLocalHistoryEnabled) {
      if (!mounted) return;
      final bool? proceedWithHistory = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          title: const Text('Tarama Geçmişi Algılandı'),
          content: Text(
            'Yedek dosyasında ${payload.history!.length} adet tarama geçmişi kaydı bulunuyor, ancak bu cihazda tarama geçmişi özelliği kapalıdır.\n\n'
            'Geçmişi de içe aktarıp tarama geçmişini etkinleştirmek istiyor musunuz? Yoksa geçmiş kayıtları atlanıp yalnızca şablonlar ve etiket notları mı içe aktarılsın?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child:
                  const Text('Geçmişi Atla (Yalnızca Şablon ve Notları Yükle)'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              child: const Text('Geçmişi Etkinleştir ve Yükle'),
            ),
          ],
        ),
      );

      if (proceedWithHistory == null) return;
      enableHistoryIfDisabled = proceedWithHistory;
    }

    try {
      final result = await _controller.storage.mergeBackup(
        payload,
        enableHistoryIfDisabled: enableHistoryIfDisabled,
      );

      if (!mounted) return;
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('İçe Aktarma Başarılı:\n${result.toSummaryMessage()}'),
          backgroundColor: Colors.teal,
          duration: const Duration(seconds: 5),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Birleştirme hatası: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NFC Etiket Yöneticisi'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: const [
            Tab(icon: Icon(Icons.nfc), text: 'Etiket Oku'),
            Tab(icon: Icon(Icons.edit_note), text: 'Etiket Yaz'),
            Tab(icon: Icon(Icons.history), text: 'Geçmiş'),
            Tab(
                icon: Icon(Icons.bookmark_outline),
                text: 'Şablonlar & Ayarlar'),
          ],
        ),
      ),
      body: Column(
        children: [
          _buildHardwareStatusBanner(),
          _buildClipboardBanner(),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildReadTab(),
                _buildWriteTab(),
                _buildHistoryTab(),
                _buildTemplatesAndSettingsTab(),
              ],
            ),
          ),
          _buildBottomStatusArea(),
        ],
      ),
    );
  }

  Widget _buildHardwareStatusBanner() {
    Color bg;
    IconData icon;
    String text;

    switch (_controller.availability) {
      case NfcAvailability.available:
        bg = Colors.green.shade700;
        icon = Icons.check_circle;
        text = 'NFC Donanımı Aktif ve Kullanıma Hazır';
        break;
      case NfcAvailability.disabled:
        bg = Colors.amber.shade800;
        icon = Icons.warning_amber_rounded;
        text =
            'NFC Donanımı Mevcut Ancak Kapalı. Lütfen Cihaz Ayarlarından Açın.';
        break;
      case NfcAvailability.notSupported:
        bg = Colors.red.shade700;
        icon = Icons.cancel;
        text = 'Bu Cihazda NFC Donanımı Desteklenmiyor veya Bulunmuyor.';
        break;
    }

    return Container(
      width: double.infinity,
      color: bg,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white, size: 18),
            onPressed: () => _controller.init(),
            tooltip: 'Yenile',
          ),
        ],
      ),
    );
  }

  Widget _buildClipboardBanner() {
    final clip = _controller.clipboardSnapshot;
    if (clip == null) return const SizedBox.shrink();

    return Container(
      color: Colors.teal.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.inventory_2_outlined, color: Colors.teal, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'NDEF Panosu: ${clip.recordCount} kayıt (${clip.byteSize} B) - ${clip.sourceDescription}',
              style: TextStyle(
                  color: Colors.teal.shade900,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: _pasteFromClipboard,
            child: const Text('Yapıştır',
                style:
                    TextStyle(color: Colors.teal, fontWeight: FontWeight.bold)),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.close, size: 16, color: Colors.black54),
            tooltip: 'Panoyu Temizle',
            onPressed: () => _controller.clearClipboard(),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // TAB 1: READ TAB (Inspector & Safety Preview & Content Copy / Rewrite)
  // -------------------------------------------------------------

  Widget _buildReadTab() {
    final tag = _controller.lastScannedTag;

    return RefreshIndicator(
      onRefresh: () => _controller.scanTag(),
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton.icon(
            onPressed: _controller.isBusy ? null : () => _controller.scanTag(),
            icon: const Icon(Icons.document_scanner),
            label:
                Text(_controller.isBusy ? 'Okunuyor...' : 'NFC Etiketini Tara'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 16),
          if (tag?.error != null)
            Card(
              color: Colors.red.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text('Tarama hatası: ${tag!.error}'),
              ),
            )
          else if (tag == null)
            Card(
              elevation: 0,
              color: Colors.grey.shade100,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  children: [
                    Icon(Icons.contactless, size: 64, color: Colors.blueGrey),
                    SizedBox(height: 12),
                    Text(
                      'Henüz taranmış bir NFC etiketi yok',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Yukarıdaki butona dokunun ve etiketi cihazın arkasına yaklaştırın.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ),
            )
          else ...[
            _buildTagMetaCard(tag),
            const SizedBox(height: 12),
            if (tag.records.isNotEmpty)
              Card(
                color: Colors.teal.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.teal.shade200),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.content_copy, color: Colors.teal),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'NDEF İçerik Kopyalama ve Yeniden Yazım',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal),
                                ),
                                Text(
                                  '${tag.records.length} kayıt (${tag.currentBytesUsed} Bayt) - Yalnızca NDEF verisi işlenir, UID kopyalanmaz.',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.black87),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.teal,
                                side: const BorderSide(color: Colors.teal),
                              ),
                              icon: const Icon(Icons.copy, size: 16),
                              label: const Text('Panoya Kopyala',
                                  style: TextStyle(fontSize: 12)),
                              onPressed: () => _copyToClipboard(tag.records,
                                  source: 'Etiket ${tag.identifier}'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                foregroundColor: Colors.white,
                              ),
                              icon: const Icon(Icons.replay, size: 16),
                              label: const Text('Yeniden Yaz',
                                  style: TextStyle(fontSize: 12)),
                              onPressed: () => _startRewriteFlow(
                                  tag.records, tag.identifier),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 12),
            // In-app Tag Rule / Note banner
            if (tag.records.isNotEmpty)
              Card(
                color: _controller.matchingRuleForLastScan != null
                    ? Colors.amber.shade50
                    : Colors.grey.shade50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: _controller.matchingRuleForLastScan != null
                        ? Colors.amber.shade400
                        : Colors.grey.shade300,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            _controller.matchingRuleForLastScan != null
                                ? Icons.sticky_note_2
                                : Icons.note_add_outlined,
                            color: _controller.matchingRuleForLastScan != null
                                ? Colors.amber.shade900
                                : Colors.blueGrey,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              _controller.matchingRuleForLastScan != null
                                  ? 'Kayıtlı Etiket Notu (Uygulama İçi Kural)'
                                  : 'Etiket Notu / Kuralı',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:
                                    _controller.matchingRuleForLastScan != null
                                        ? Colors.brown.shade900
                                        : Colors.black87,
                              ),
                            ),
                          ),
                          if (_controller.matchingRuleForLastScan != null)
                            IconButton(
                              icon: const Icon(Icons.edit,
                                  size: 18, color: Colors.indigo),
                              tooltip: 'Notu Düzenle',
                              onPressed: () =>
                                  _showAddOrEditTagRuleDialog(tag.records),
                            ),
                          if (_controller.matchingRuleForLastScan != null)
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  size: 18, color: Colors.red),
                              tooltip: 'Notu Sil',
                              onPressed: () =>
                                  _confirmDeleteTagRule(tag.records),
                            ),
                        ],
                      ),
                      if (_controller.matchingRuleForLastScan != null) ...[
                        const SizedBox(height: 6),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.amber.shade200),
                          ),
                          child: Text(
                            _controller.matchingRuleForLastScan!.note,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Bu not tam NDEF baytlarının SHA-256 özetiyle eşleştirilmiştir. Harici işlem başlatmaz.',
                          style: TextStyle(fontSize: 10, color: Colors.black54),
                        ),
                      ] else ...[
                        const SizedBox(height: 4),
                        const Text(
                          'Bu NDEF içeriğine özel yerel bir not veya açıklama ekleyebilirsiniz.',
                          style: TextStyle(fontSize: 12, color: Colors.black54),
                        ),
                        const SizedBox(height: 8),
                        OutlinedButton.icon(
                          icon:
                              const Icon(Icons.add_comment_outlined, size: 16),
                          label: const Text('Bu Etikete Not Ekle',
                              style: TextStyle(fontSize: 12)),
                          onPressed: () =>
                              _showAddOrEditTagRuleDialog(tag.records),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 16),
            _buildRecordsList(tag.records,
                isReadTab: true, maxCapacity: tag.maxByteCapacity),
          ],
        ],
      ),
    );
  }

  Widget _buildTagMetaCard(NfcTagInfo tag) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.tag, color: Colors.indigo),
                const SizedBox(width: 8),
                Text(
                  'Etiket Bilgileri',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: tag.isWritable
                        ? Colors.green.shade50
                        : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: tag.isWritable ? Colors.green : Colors.red),
                  ),
                  child: Text(
                    tag.isWritable ? 'Yazılabilir' : 'Salt Okunur (Kilitli)',
                    style: TextStyle(
                      color: tag.isWritable
                          ? Colors.green.shade800
                          : Colors.red.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 20),
            _buildMetaRow('Seri No (UID):', tag.identifier),
            _buildMetaRow('NDEF Desteği:',
                tag.isNdefSupported ? 'Destekleniyor' : 'Desteklenmiyor'),
            _buildMetaRow('Toplam Kapasite:', '${tag.maxByteCapacity} Bayt'),
            _buildMetaRow('Kullanılan Alan:', '${tag.currentBytesUsed} Bayt'),
            _buildMetaRow('Boş Alan:', '${tag.availableBytes} Bayt'),
            if (tag.maxByteCapacity > 0) ...[
              const SizedBox(height: 6),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  value: (tag.currentBytesUsed / tag.maxByteCapacity)
                      .clamp(0.0, 1.0),
                  backgroundColor: Colors.grey.shade200,
                  color: tag.currentBytesUsed > tag.maxByteCapacity
                      ? Colors.red
                      : Colors.indigo,
                  minHeight: 6,
                ),
              ),
            ],
            if (tag.standardTechnologies.isNotEmpty)
              _buildMetaRow(
                  'Teknolojiler:', tag.standardTechnologies.join(', ')),
            if (tag.error != null) ...[
              const SizedBox(height: 8),
              Text(
                'Hata: ${tag.error}',
                style: const TextStyle(
                    color: Colors.red, fontWeight: FontWeight.bold),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMetaRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // Advanced Record Inspector & Bounded Hex Preview
  // -------------------------------------------------------------

  Widget _buildRecordsList(List<NdefRecordModel> records,
      {required bool isReadTab, int maxCapacity = 0}) {
    if (records.isEmpty) {
      return const Card(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Etikette kayıtlı NDEF mesajı bulunamadı.'),
        ),
      );
    }

    final totalBytes = encodeNdefMessage(records).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isReadTab
                  ? 'Okunan NDEF Kayıtları (${records.length})'
                  : 'Bestelenen NDEF Kayıtları (${records.length})',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '$totalBytes Bayt ${maxCapacity > 0 ? "/ $maxCapacity Bayt" : ""}',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...records.asMap().entries.map((entry) {
          final idx = entry.key;
          final rec = entry.value;
          final parsed = NdefCodec.parseRecord(rec);
          final inspection = RecordInspectionData.inspect(rec, index: idx);
          final isExpanded = isReadTab
              ? _expandedReadIndices.contains(idx)
              : _expandedComposerIndices.contains(idx);

          // Determine if record is a URL or SmartPoster containing URL
          String? urlCandidate;
          if (parsed.type == ParsedRecordType.url) {
            urlCandidate = parsed.extra['url'] as String? ?? parsed.content;
          } else if (parsed.type == ParsedRecordType.smartPoster) {
            urlCandidate = parsed.extra['uri'] as String?;
          }

          IconData icon;
          switch (parsed.type) {
            case ParsedRecordType.text:
              icon = Icons.text_snippet;
              break;
            case ParsedRecordType.url:
              icon = Icons.link;
              break;
            case ParsedRecordType.email:
              icon = Icons.email;
              break;
            case ParsedRecordType.phone:
              icon = Icons.phone;
              break;
            case ParsedRecordType.sms:
              icon = Icons.sms;
              break;
            case ParsedRecordType.location:
              icon = Icons.location_on;
              break;
            case ParsedRecordType.vcard:
              icon = Icons.contact_page;
              break;
            case ParsedRecordType.calendar:
              icon = Icons.calendar_month;
              break;
            case ParsedRecordType.smartPoster:
              icon = Icons.web_stories;
              break;
            case ParsedRecordType.wifi:
              icon = Icons.wifi;
              break;
            case ParsedRecordType.customMime:
              icon = Icons.data_object;
              break;
            default:
              icon = Icons.help_outline;
          }

          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo.shade50,
                    child: Icon(icon, color: Colors.indigo),
                  ),
                  title: Text('${idx + 1}. ${parsed.title}',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    parsed.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (urlCandidate != null && urlCandidate.isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.shield_outlined,
                              color: Colors.indigo),
                          tooltip: 'Çevrimdışı URL İncelemesi',
                          onPressed: () => _showUrlSafetyDialog(urlCandidate!),
                        ),
                      if (QrPreviewDialog.isQrSupported(parsed.type))
                        IconButton(
                          icon:
                              const Icon(Icons.qr_code_2, color: Colors.indigo),
                          tooltip: 'QR Kod Önizleme',
                          onPressed: () {
                            final qrContent =
                                parsed.type == ParsedRecordType.url
                                    ? (parsed.extra['url'] as String? ??
                                        parsed.content)
                                    : parsed.content;
                            QrPreviewDialog.show(
                              context,
                              type: parsed.type,
                              title: parsed.title,
                              contentToEncode: qrContent,
                            );
                          },
                        ),
                      Text('${rec.payload.length}B',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.grey)),
                      IconButton(
                        icon: Icon(
                            isExpanded ? Icons.expand_less : Icons.expand_more),
                        tooltip: isExpanded
                            ? 'Ayrıntıları Gizle'
                            : 'Kayıt Denetçisi (Gelişmiş)',
                        onPressed: () {
                          setState(() {
                            if (isReadTab) {
                              if (isExpanded) {
                                _expandedReadIndices.remove(idx);
                              } else {
                                _expandedReadIndices.add(idx);
                              }
                            } else {
                              if (isExpanded) {
                                _expandedComposerIndices.remove(idx);
                              } else {
                                _expandedComposerIndices.add(idx);
                              }
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                if (isExpanded)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gelişmiş Kayıt Denetçisi (NDEF Record Inspector)',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.indigo),
                        ),
                        const Divider(height: 12),
                        _buildInspectorRow(
                            'TNF (Type Name Format):', inspection.tnfName),
                        _buildInspectorRow('Tür (Type):',
                            '${inspection.typeText} [Hex: ${inspection.typeHex}]'),
                        _buildInspectorRow('Kimlik (ID):',
                            '${inspection.idText} [Hex: ${inspection.idHex}]'),
                        _buildInspectorRow('Yük Uzunluğu (Payload):',
                            '${inspection.payloadLength} Bayt'),
                        const SizedBox(height: 6),
                        const Text('Ham Hex Önizleme (Sınırlandırılmış):',
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54)),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(6),
                          color: Colors.white,
                          child: SelectableText(
                            inspection.payloadHexPreview,
                            style: const TextStyle(
                                fontFamily: 'monospace', fontSize: 11),
                          ),
                        ),
                        if (inspection.isPayloadTruncated)
                          Text(
                            'Not: Yük ${inspection.payloadLength} bayt olduğu için ilk 64 baytı gösterilmektedir.',
                            style: const TextStyle(
                                fontSize: 10, color: Colors.grey),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _buildInspectorRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(value,
                style: const TextStyle(fontSize: 11, color: Colors.black87)),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // TAB 2: WRITE TAB (Composer, Reorder, Batch Write, Single Write)
  // -------------------------------------------------------------

  Widget _buildWriteTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          elevation: 1,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Yazılacak NDEF Kayıtları',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      spacing: 4,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.undo),
                          tooltip: 'Geri Al (Undo)',
                          onPressed:
                              _composerHistory.canUndo ? _undoComposer : null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.redo),
                          tooltip: 'Yinele (Redo)',
                          onPressed:
                              _composerHistory.canRedo ? _redoComposer : null,
                        ),
                        IconButton(
                          icon: const Icon(Icons.paste, color: Colors.teal),
                          tooltip: 'Panodan Yapıştır (Değiştir / Ekle)',
                          onPressed: _pasteFromClipboard,
                        ),
                        if (_recordsToWrite.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.bookmark_add,
                                color: Colors.indigo),
                            tooltip: 'Şablon Olarak Kaydet',
                            onPressed: _promptSaveAsTemplate,
                          ),
                        if (_recordsToWrite.isNotEmpty)
                          IconButton(
                            icon: const Icon(Icons.delete_sweep_outlined,
                                color: Colors.red),
                            tooltip: 'Besteyi Temizle',
                            onPressed: () {
                              setState(() {
                                _composerHistory.push(_recordsToWrite);
                                _recordsToWrite.clear();
                              });
                            },
                          ),
                        TextButton.icon(
                          onPressed: _openComposeSheet,
                          icon: const Icon(Icons.add),
                          label: const Text('Kayıt Ekle'),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Toplam Boyut: $_stagedBytesTotal Bayt | Kayıt Sayısı: ${_recordsToWrite.length}',
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),
                const Divider(),
                if (_recordsToWrite.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24),
                    child: Center(
                      child: Text(
                        'Yazılacak kayıt eklemek için "Kayıt Ekle" butonuna dokunun veya taranan etiketten içerik kopyalayın.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                else
                  ..._recordsToWrite.asMap().entries.map((entry) {
                    final index = entry.key;
                    final rec = entry.value;
                    final parsed = NdefCodec.parseRecord(rec);
                    final isExpanded = _expandedComposerIndices.contains(index);
                    final inspection =
                        RecordInspectionData.inspect(rec, index: index);

                    String? urlCandidate;
                    if (parsed.type == ParsedRecordType.url) {
                      urlCandidate =
                          parsed.extra['url'] as String? ?? parsed.content;
                    } else if (parsed.type == ParsedRecordType.smartPoster) {
                      urlCandidate = parsed.extra['uri'] as String?;
                    }

                    return Card(
                      margin: const EdgeInsets.only(bottom: 6),
                      color: Colors.grey.shade50,
                      child: Column(
                        children: [
                          ListTile(
                            dense: true,
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('#${index + 1}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(width: 4),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: index > 0
                                          ? () => _moveComposerRecordUp(index)
                                          : null,
                                      child: Icon(
                                        Icons.arrow_drop_up,
                                        size: 20,
                                        color: index > 0
                                            ? Colors.indigo
                                            : Colors.grey.shade400,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: index < _recordsToWrite.length - 1
                                          ? () => _moveComposerRecordDown(index)
                                          : null,
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color:
                                            index < _recordsToWrite.length - 1
                                                ? Colors.indigo
                                                : Colors.grey.shade400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            title: Text(parsed.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            subtitle: Text(parsed.content,
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit_outlined,
                                      size: 18, color: Colors.indigo),
                                  tooltip: 'Kaydı Düzenle',
                                  onPressed: () => _editComposerRecord(index),
                                ),
                                if (urlCandidate != null &&
                                    urlCandidate.isNotEmpty)
                                  IconButton(
                                    icon: const Icon(Icons.shield_outlined,
                                        size: 18, color: Colors.indigo),
                                    tooltip: 'URL İncelemesi',
                                    onPressed: () =>
                                        _showUrlSafetyDialog(urlCandidate!),
                                  ),
                                if (QrPreviewDialog.isQrSupported(parsed.type))
                                  IconButton(
                                    icon: const Icon(Icons.qr_code_2,
                                        size: 18, color: Colors.indigo),
                                    tooltip: 'QR Kod Önizleme',
                                    onPressed: () {
                                      final qrContent = parsed.type ==
                                              ParsedRecordType.url
                                          ? (parsed.extra['url'] as String? ??
                                              parsed.content)
                                          : parsed.content;
                                      QrPreviewDialog.show(
                                        context,
                                        type: parsed.type,
                                        title: parsed.title,
                                        contentToEncode: qrContent,
                                      );
                                    },
                                  ),
                                IconButton(
                                  icon: Icon(
                                      isExpanded
                                          ? Icons.expand_less
                                          : Icons.expand_more,
                                      size: 18),
                                  tooltip: 'Denetçi',
                                  onPressed: () {
                                    setState(() {
                                      if (isExpanded) {
                                        _expandedComposerIndices.remove(index);
                                      } else {
                                        _expandedComposerIndices.add(index);
                                      }
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline,
                                      color: Colors.red, size: 18),
                                  tooltip: 'Sil',
                                  onPressed: () {
                                    setState(() {
                                      _composerHistory.push(_recordsToWrite);
                                      _recordsToWrite.removeAt(index);
                                      _expandedComposerIndices.remove(index);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          if (isExpanded)
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(color: Colors.grey.shade300),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildInspectorRow(
                                      'TNF:', inspection.tnfName),
                                  _buildInspectorRow(
                                      'Tür:', inspection.typeText),
                                  _buildInspectorRow('Yük:',
                                      '${inspection.payloadLength} Bayt'),
                                  const SizedBox(height: 4),
                                  SelectableText(
                                    'Hex: ${inspection.payloadHexPreview}',
                                    style: const TextStyle(
                                        fontFamily: 'monospace', fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    );
                  }),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: (_recordsToWrite.isEmpty || _controller.isBusy)
              ? null
              : () => _confirmAndWriteSingleTag(),
          icon: const Icon(Icons.save),
          label: const Text('Etikete Yaz ve Doğrula'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton.icon(
          onPressed: (_recordsToWrite.isEmpty || _controller.isBusy)
              ? null
              : _openBatchWriteModal,
          icon: const Icon(Icons.dynamic_feed),
          label: const Text('Toplu Etiket Yazımı (2..100 Etiket)'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            textStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: _controller.isBusy ? null : () => _confirmClearTag(),
          icon: const Icon(Icons.delete_sweep, color: Colors.red),
          label: const Text('Etiketi Sıfırla (İçeriği Temizle)',
              style: TextStyle(color: Colors.red)),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            side: const BorderSide(color: Colors.red),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        if (_controller.lastWriteResult != null) ...[
          const SizedBox(height: 16),
          _buildWriteResultCard(_controller.lastWriteResult!),
        ],
      ],
    );
  }

  void _confirmAndWriteSingleTag() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Etikete Yazmayı Onayla'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Bu işlem hedef etiketin mevcut NDEF içeriğini tamamen DEĞİŞTİRİR (üzerine yazar).',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Yazılacak Kayıt Sayısı: ${_recordsToWrite.length}'),
            Text('Toplam Boyut: $_stagedBytesTotal Bayt'),
            const SizedBox(height: 8),
            const Text(
              'Hedef etiketin yazılabilir (kilitsiz) olduğundan emin olun. Yazdıktan sonra etiket içeriği otomatik olarak doğrulanacaktır.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            onPressed: () {
              Navigator.of(ctx).pop();
              _controller.writeRecords(_recordsToWrite);
            },
            child:
                const Text('Evet, Yaz', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  // -------------------------------------------------------------
  // TAB 3: HISTORY TAB
  // -------------------------------------------------------------

  Widget _buildHistoryTab() {
    final isEnabled = _controller.storage.isHistoryEnabled;

    if (!isEnabled) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.history_toggle_off,
                  size: 64, color: Colors.grey),
              const SizedBox(height: 16),
              const Text(
                'Tarama Geçmişi Kapalı',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Gizlilik nedeniyle tarama geçmişi varsayılan olarak kaydedilmez. Geçmişi tutmak için ayarlar sekmesinden etkinleştirebilirsiniz.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () async {
                  await _controller.storage.setHistoryEnabled(true);
                  setState(() {});
                },
                icon: const Icon(Icons.check),
                label: const Text('Geçmişi Etkinleştir'),
              ),
            ],
          ),
        ),
      );
    }

    final allHistory = _controller.storage.getHistory();
    final query = _historySearchQuery.trim().toLowerCase();

    final filteredHistory = allHistory.where((entry) {
      if (query.isEmpty) return true;
      // Search in UID / identifier
      if (entry.identifier.toLowerCase().contains(query)) return true;
      // Search in records content, title, or type
      for (final rec in entry.records) {
        final parsed = NdefCodec.parseRecord(rec);
        if (parsed.title.toLowerCase().contains(query)) return true;
        if (parsed.content.toLowerCase().contains(query)) return true;
        if (parsed.type.name.toLowerCase().contains(query)) return true;
      }
      return false;
    }).toList();

    return Column(
      children: [
        // Search bar
        Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          color: Colors.white,
          child: TextField(
            controller: _historySearchController,
            decoration: InputDecoration(
              hintText:
                  'UID, metin veya tür ile ara (Örn: URL, Wi-Fi, 04A1...)',
              prefixIcon: const Icon(Icons.search, size: 20),
              suffixIcon: _historySearchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, size: 18),
                      onPressed: () {
                        setState(() {
                          _historySearchController.clear();
                          _historySearchQuery = '';
                        });
                      },
                    )
                  : null,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey.shade100,
            ),
            onChanged: (val) {
              setState(() {
                _historySearchQuery = val;
              });
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: Colors.grey.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                query.isEmpty
                    ? 'Kayıtlı Taramalar: ${allHistory.length}'
                    : 'Bulunan: ${filteredHistory.length} / ${allHistory.length}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              if (allHistory.isNotEmpty)
                TextButton.icon(
                  onPressed: _confirmClearHistory,
                  icon: const Icon(Icons.delete_outline,
                      size: 18, color: Colors.red),
                  label: const Text('Tümünü Temizle',
                      style: TextStyle(color: Colors.red)),
                ),
            ],
          ),
        ),
        Expanded(
          child: allHistory.isEmpty
              ? const Center(
                  child: Text(
                    'Henüz kayıtlı tarama geçmişi bulunmuyor.',
                    style: TextStyle(color: Colors.grey),
                  ),
                )
              : filteredHistory.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.search_off,
                              size: 48, color: Colors.grey),
                          const SizedBox(height: 12),
                          Text(
                            '"$_historySearchQuery" için sonuç bulunamadı.',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Farklı bir UID, metin içeriği veya kayıt türü deneyiniz.',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(height: 12),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _historySearchController.clear();
                                _historySearchQuery = '';
                              });
                            },
                            child: const Text('Aramayı Temizle'),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(12),
                      itemCount: filteredHistory.length,
                      itemBuilder: (ctx, index) {
                        final item = filteredHistory[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: ExpansionTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.indigo.shade50,
                              child:
                                  const Icon(Icons.nfc, color: Colors.indigo),
                            ),
                            title: Text(
                              'UID: ${item.identifier}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              '${item.timestamp.toLocal().toString().substring(0, 16)} | ${item.records.length} Kayıt',
                              style: const TextStyle(fontSize: 12),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.red),
                              tooltip: 'Bu kaydı sil',
                              onPressed: () async {
                                await _controller.storage
                                    .deleteHistoryEntry(item.id);
                                setState(() {});
                              },
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            'Kapasite: ${item.maxByteCapacity}B | Kullanılan: ${item.currentBytesUsed}B'),
                                        Wrap(
                                          spacing: 4,
                                          children: [
                                            OutlinedButton.icon(
                                              style: OutlinedButton.styleFrom(
                                                foregroundColor: Colors.teal,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                minimumSize: Size.zero,
                                              ),
                                              onPressed: () => _copyToClipboard(
                                                item.records,
                                                source:
                                                    'Geçmiş UID ${item.identifier}',
                                              ),
                                              icon: const Icon(Icons.copy,
                                                  size: 14),
                                              label: const Text(
                                                  'Panoya Kopyala',
                                                  style:
                                                      TextStyle(fontSize: 11)),
                                            ),
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.teal,
                                                foregroundColor: Colors.white,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                minimumSize: Size.zero,
                                              ),
                                              onPressed: () =>
                                                  _copyScannedContentToComposer(
                                                      item.records),
                                              icon: const Icon(
                                                  Icons.content_copy,
                                                  size: 14),
                                              label: const Text('Besteye Aktar',
                                                  style:
                                                      TextStyle(fontSize: 11)),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    ...item.records.map((r) {
                                      final p = NdefCodec.parseRecord(r);
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2.0),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  '• ${p.title}: ${p.content}',
                                                  style: const TextStyle(
                                                      fontSize: 13)),
                                            ),
                                            if (QrPreviewDialog.isQrSupported(
                                                p.type))
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.qr_code_2,
                                                    size: 16,
                                                    color: Colors.indigo),
                                                tooltip: 'QR Önizleme',
                                                padding: EdgeInsets.zero,
                                                constraints:
                                                    const BoxConstraints(),
                                                onPressed: () {
                                                  final qrContent = p.type ==
                                                          ParsedRecordType.url
                                                      ? (p.extra['url']
                                                              as String? ??
                                                          p.content)
                                                      : p.content;
                                                  QrPreviewDialog.show(
                                                    context,
                                                    type: p.type,
                                                    title: p.title,
                                                    contentToEncode: qrContent,
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }

  // -------------------------------------------------------------
  // TAB 4: TEMPLATES & SETTINGS TAB
  // -------------------------------------------------------------

  Widget _buildTemplatesAndSettingsTab() {
    final templates = _controller.storage.getTemplates();
    final isHistoryEnabled = _controller.storage.isHistoryEnabled;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Settings Section
        Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.settings, color: Colors.indigo),
                    SizedBox(width: 8),
                    Text(
                      'Uygulama Ayarları',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const Divider(),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Yerel Tarama Geçmişini Kaydet'),
                  subtitle: const Text(
                    'Kapalıyken taramalar cihazda tutulmaz. Açıldığında başarılı taramalar yerel belleğe kaydedilir. Hatalı taramalar asla kaydedilmez.',
                  ),
                  value: isHistoryEnabled,
                  onChanged: (val) async {
                    await _controller.storage.setHistoryEnabled(val);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Reusable Write Templates Section
        Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.bookmark, color: Colors.indigo),
                        SizedBox(width: 8),
                        Text(
                          'Yazma Şablonları',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if (templates.isNotEmpty)
                      TextButton.icon(
                        onPressed: _confirmClearTemplates,
                        icon: const Icon(Icons.delete_outline,
                            size: 18, color: Colors.red),
                        label: const Text('Tümünü Sil',
                            style: TextStyle(color: Colors.red)),
                      ),
                  ],
                ),
                const Text(
                  'Sık kullandığınız NDEF içeriklerini şablon olarak kaydedip dilediğiniz zaman etiketlere tek dokunuşla yazabilirsiniz.',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const Divider(),
                if (templates.isEmpty)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Center(
                      child: Text(
                        'Henüz kayıtlı bir yazma şablonu yok.\n"Etiket Yaz" sekmesinden kayıt oluşturup şablon olarak kaydedebilirsiniz.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  )
                else
                  ...templates.map((tpl) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      color: Colors.grey.shade50,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.teal.shade50,
                          child: const Icon(Icons.note_alt_outlined,
                              color: Colors.teal),
                        ),
                        title: Text(tpl.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          '${tpl.records.length} Kayıt | ${tpl.createdAt.toLocal().toString().substring(0, 10)}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.file_upload_outlined,
                                  color: Colors.teal),
                              tooltip: 'Yazma Bestesine Aktar',
                              onPressed: () => _loadTemplateToComposer(tpl),
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete_outline,
                                  color: Colors.red),
                              tooltip: 'Şablonu Sil',
                              onPressed: () async {
                                await _controller.storage
                                    .deleteTemplate(tpl.id);
                                setState(() {});
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // In-App Tag Rules Section
        Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.rule_folder_outlined, color: Colors.indigo),
                        SizedBox(width: 8),
                        Text(
                          'Uygulama İçi Etiket Kuralları',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    TextButton.icon(
                      onPressed: _openTagRulesManager,
                      icon: const Icon(Icons.tune, size: 18),
                      label: const Text('Yönet'),
                    ),
                  ],
                ),
                Text(
                  'Kayıtlı Kural / Not Sayısı: ${_controller.storage.getTagRules().length}',
                  style: const TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4),
                const Text(
                  'NDEF içerik baytlarının SHA-256 özetine göre eşleşen etiketlerde yalnızca kaydedilen not gösterilir. Harici işlem başlatmaz.',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Backup and Restore Section
        Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.backup_outlined, color: Colors.indigo),
                    SizedBox(width: 8),
                    Text(
                      'Yedekleme ve Geri Yükleme (JSON)',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'Şablonlarınızı, uygulama içi etiket notlarınızı ve isteğe bağlı tarama geçmişinizi sürüm kontrollü JSON formatında yedekleyin veya mevcut verilerinizle birleştirin.',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        icon: const Icon(Icons.file_download_outlined),
                        label: const Text('Dışa Aktar'),
                        onPressed: _promptExportBackup,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.file_upload_outlined),
                        label: const Text('İçe Aktar (Birleştir)'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: _promptImportBackup,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _confirmClearHistory() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Tarama Geçmişini Temizle'),
        content: const Text(
            'Cihazda kayıtlı tüm tarama geçmişi silinecektir. Onaylıyor musunuz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await _controller.storage.clearHistory();
              if (mounted && ctx.mounted) {
                setState(() {});
                Navigator.of(ctx).pop();
              }
            },
            child: const Text('Sil'),
          ),
        ],
      ),
    );
  }

  void _confirmClearTemplates() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Şablonları Temizle'),
        content: const Text(
            'Kayıtlı tüm yazma şablonları silinecektir. Onaylıyor musunuz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              await _controller.storage.clearTemplates();
              if (mounted && ctx.mounted) {
                setState(() {});
                Navigator.of(ctx).pop();
              }
            },
            child: const Text('Sil'),
          ),
        ],
      ),
    );
  }

  Widget _buildWriteResultCard(NfcWriteResult result) {
    return Card(
      color: result.isSuccess ? Colors.green.shade50 : Colors.red.shade50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: result.isSuccess ? Colors.green : Colors.red),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  result.isSuccess ? Icons.check_circle : Icons.error,
                  color: result.isSuccess ? Colors.green : Colors.red,
                ),
                const SizedBox(width: 8),
                Text(
                  result.isSuccess ? 'İşlem Başarılı' : 'İşlem Başarısız',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: result.isSuccess
                        ? Colors.green.shade900
                        : Colors.red.shade900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(result.message),
            if (result.isSuccess) ...[
              const SizedBox(height: 4),
              Text(
                'Yazılan Bayt: ${result.bytesWritten} | Doğrulama: ${result.verificationPassed ? "Geçti" : "Kontrol edilmedi"}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _confirmClearTag() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Etiket İçeriğini Sıfırla'),
        content: const Text(
          'Bu işlem etiket üzerindeki tüm NDEF kayıtlarını silecek ve boş bir kayıt yazacaktır. Devam etmek istiyor musunuz?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Vazgeç'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.of(ctx).pop();
              _controller.clearTag();
            },
            child: const Text('Evet, Temizle'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomStatusArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border(top: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Row(
        children: [
          if (_controller.isBusy)
            const Padding(
              padding: EdgeInsets.only(right: 12),
              child: SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2)),
            )
          else
            const Icon(Icons.info_outline, size: 18, color: Colors.blueGrey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              _controller.statusMessage,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
