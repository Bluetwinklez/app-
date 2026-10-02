import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../domain/ndef_record.dart';
import '../services/launch_action_service.dart';
import 'app_theme.dart';

/// Explains Siri phrases, the Shortcuts "NFC" personal automation and the
/// nfctagmaster:// links that open the app on a given screen.
class ShortcutsGuideSheet extends StatelessWidget {
  /// Adds a record to the write list (used to put a deep link on a tag).
  final void Function(NdefRecordModel record, String title) onAddRecord;

  const ShortcutsGuideSheet({super.key, required this.onAddRecord});

  static Future<void> show(
    BuildContext context, {
    required void Function(NdefRecordModel record, String title) onAddRecord,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => ShortcutsGuideSheet(onAddRecord: onAddRecord),
    );
  }

  static const _links = [
    (LaunchAction.scan, 'Uygulamayı açıp taramayı başlatır'),
    (LaunchAction.write, 'Yazma ekranını açar'),
    (LaunchAction.tools, 'Araçlar ekranını açar'),
    (LaunchAction.history, 'Geçmişi açar'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          children: [
            Text('Siri ve Kısayollar', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 6),
            const Text(
              'Etikete dokununca bir işlemi otomatik çalıştırabilir veya Siri\'ye sesle tarama yaptırabilirsiniz.',
              style: TextStyle(color: AppColors.secondary, height: 1.4),
            ),
            const SectionHeader(title: 'Siri ile'),
            const _Bullet(icon: Icons.mic_none_rounded, text: '"Hey Siri, NFC Etiket Yöneticisi ile etiket tara"'),
            const _Bullet(icon: Icons.mic_none_rounded, text: '"Hey Siri, NFC Etiket Yöneticisi ile etikete yaz"'),
            const _Bullet(
              icon: Icons.apps_rounded,
              text: 'Aynı komutlar Kısayollar uygulamasında ve Spotlight aramasında da görünür.',
            ),
            const SectionHeader(title: 'Etikete dokununca otomatik çalıştır'),
            const _Step(n: 1, text: 'Kısayollar uygulamasını açın ve alttan "Otomasyon"a dokunun.'),
            const _Step(n: 2, text: '"Yeni Otomasyon" (+) → "NFC" seçin.'),
            const _Step(n: 3, text: '"Tara"ya dokunun, etiketi iPhone\'un üst kısmına yaklaştırın ve bir isim verin.'),
            const _Step(n: 4, text: '"Hemen Çalıştır"ı seçin, sonra istediğiniz eylemi ekleyin (ışıkları aç, müzik çal, mesaj gönder…).'),
            const _Step(n: 5, text: 'Bu uygulamayı açtırmak için eylem olarak "Etiketi Tara" veya "Etikete Yaz"ı seçin.'),
            const Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                'Not: Otomasyon etiketin seri numarasına bağlanır; etiketin içeriği değişse de çalışır.',
                style: TextStyle(fontSize: 12.5, color: AppColors.secondary),
              ),
            ),
            const SectionHeader(title: 'Uygulama bağlantıları'),
            const Text(
              'Bu bağlantıları bir etikete yazarsanız, iPhone etikete dokununca bildirim gösterir ve uygulamayı ilgili ekranda açar.',
              style: TextStyle(color: AppColors.secondary, height: 1.4),
            ),
            const SizedBox(height: 10),
            for (final (action, description) in _links)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: SoftCard(
                  padding: const EdgeInsetsDirectional.fromSTEB(14, 10, 6, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LaunchActionService.linkFor(action),
                              style: const TextStyle(fontFamily: 'Courier', fontWeight: FontWeight.w600),
                            ),
                            Text(description, style: const TextStyle(fontSize: 12.5, color: AppColors.secondary)),
                          ],
                        ),
                      ),
                      IconButton(
                        tooltip: 'Kopyala',
                        icon: const Icon(Icons.copy_rounded, size: 20),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: LaunchActionService.linkFor(action)));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Bağlantı kopyalandı')),
                          );
                        },
                      ),
                      IconButton(
                        tooltip: 'Yazma listesine ekle',
                        icon: const Icon(Icons.add_circle_outline_rounded, size: 22, color: AppColors.accent),
                        onPressed: () {
                          onAddRecord(
                            NdefCodec.encodeUri(LaunchActionService.linkFor(action)),
                            LaunchActionService.linkFor(action),
                          );
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _Bullet extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Bullet({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: AppColors.accent),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(height: 1.4))),
        ],
      ),
    );
  }
}

class _Step extends StatelessWidget {
  final int n;
  final String text;

  const _Step({required this.n, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            decoration: const BoxDecoration(color: AppColors.accent, shape: BoxShape.circle),
            child: Text('$n', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(height: 1.4))),
        ],
      ),
    );
  }
}
