import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';
import '../domain/ndef_record.dart';
import '../domain/quick_links.dart';
import 'app_theme.dart';

/// Form dialog / bottom sheet for composing or editing NDEF records
class ComposeRecordSheet extends StatefulWidget {
  final Function(NdefRecordModel record) onRecordCreated;
  final NdefRecordModel? initialRecord;

  const ComposeRecordSheet({
    super.key,
    required this.onRecordCreated,
    this.initialRecord,
  });

  @override
  State<ComposeRecordSheet> createState() => _ComposeRecordSheetState();
}

class _ComposeRecordSheetState extends State<ComposeRecordSheet> {
  ParsedRecordType _selectedType = ParsedRecordType.text;

  // Ready-made shortcut (social, video, FaceTime...) selected instead of a core type
  QuickLinkKind? _quickKind;
  final _quickController = TextEditingController();
  final _quickSecondaryController = TextEditingController();
  SocialNetwork _socialNetwork = SocialNetwork.instagram;
  SearchEngine _searchEngine = SearchEngine.google;
  MapProvider _mapProvider = MapProvider.apple;
  String? _quickError;

  // Generic & Previous Controllers
  final _textController = TextEditingController();
  final _urlController = TextEditingController(text: 'https://');
  final _emailController = TextEditingController();
  final _emailSubjectController = TextEditingController();
  final _emailBodyController = TextEditingController();
  final _phoneController = TextEditingController();
  final _smsPhoneController = TextEditingController();
  final _smsBodyController = TextEditingController();
  final _latController = TextEditingController(text: '41.0082');
  final _lngController = TextEditingController(text: '28.9784');

  // vCard Controllers
  final _vcardNameController = TextEditingController();
  final _vcardFirstController = TextEditingController();
  final _vcardLastController = TextEditingController();
  final _vcardOrgController = TextEditingController();
  final _vcardTitleController = TextEditingController();
  final _vcardPhoneController = TextEditingController();
  final _vcardEmailController = TextEditingController();
  final _vcardUrlController = TextEditingController();
  final _vcardNoteController = TextEditingController();

  // Calendar Controllers
  final _calSummaryController = TextEditingController();
  final _calLocationController = TextEditingController();
  final _calDescController = TextEditingController();
  DateTime _calStartDate = DateTime.now().add(const Duration(hours: 1));
  TimeOfDay _calStartTime = const TimeOfDay(hour: 10, minute: 0);
  DateTime _calEndDate = DateTime.now().add(const Duration(hours: 2));
  TimeOfDay _calEndTime = const TimeOfDay(hour: 11, minute: 0);

  // Smart Poster Controllers
  final _spUriController = TextEditingController(text: 'https://');
  final _spTitleController = TextEditingController();
  final _spLangController = TextEditingController(text: 'tr');

  // Custom MIME Controllers
  final _mimeTypeController = TextEditingController(text: 'application/json');
  final _mimePayloadController = TextEditingController();
  bool _mimeIsHex = false;

  // Wi-Fi Controllers
  final _wifiSsidController = TextEditingController();
  final _wifiPasswordController = TextEditingController();
  WifiAuthType _wifiAuthType = WifiAuthType.wpa2Psk;
  WifiEncryptionType _wifiEncryptionType = WifiEncryptionType.aes;

  // Field validation error states
  String? _textError;
  String? _urlError;
  String? _emailError;
  String? _phoneError;
  String? _smsPhoneError;
  String? _latError;
  String? _lngError;

  String? _vcardNameError;
  String? _vcardEmailError;
  String? _vcardPhoneError;
  String? _vcardUrlError;

  String? _calSummaryError;
  String? _calDateError;

  String? _spUriError;
  String? _spLangError;

  String? _mimeTypeError;
  String? _mimePayloadError;

  String? _wifiSsidError;
  String? _wifiPasswordError;

  bool get _isEditing => widget.initialRecord != null;

  @override
  void initState() {
    super.initState();
    if (widget.initialRecord != null) {
      _initializeFromRecord(widget.initialRecord!);
    }
  }

  void _initializeFromRecord(NdefRecordModel record) {
    final parsed = NdefCodec.parseRecord(record);
    _selectedType = parsed.type;

    switch (parsed.type) {
      case ParsedRecordType.text:
        _textController.text = parsed.content;
        break;
      case ParsedRecordType.url:
        _urlController.text = parsed.extra['url'] as String? ?? parsed.content;
        break;
      case ParsedRecordType.email:
        _emailController.text = parsed.content;
        _emailSubjectController.text = parsed.extra['subject'] as String? ?? '';
        _emailBodyController.text = parsed.extra['body'] as String? ?? '';
        break;
      case ParsedRecordType.phone:
        _phoneController.text = parsed.content;
        break;
      case ParsedRecordType.sms:
        _smsPhoneController.text = parsed.content;
        _smsBodyController.text = parsed.extra['message'] as String? ?? '';
        break;
      case ParsedRecordType.location:
        _latController.text = parsed.extra['latitude'] as String? ?? '41.0082';
        _lngController.text = parsed.extra['longitude'] as String? ?? '28.9784';
        break;
      case ParsedRecordType.vcard:
        final extra = parsed.extra;
        _vcardNameController.text = extra['fn'] as String? ?? '';
        _vcardFirstController.text = extra['firstName'] as String? ?? '';
        _vcardLastController.text = extra['lastName'] as String? ?? '';
        _vcardOrgController.text = extra['org'] as String? ?? '';
        _vcardTitleController.text = extra['title'] as String? ?? '';
        _vcardPhoneController.text = extra['tel'] as String? ?? '';
        _vcardEmailController.text = extra['email'] as String? ?? '';
        _vcardUrlController.text = extra['url'] as String? ?? '';
        _vcardNoteController.text = extra['note'] as String? ?? '';
        break;
      case ParsedRecordType.calendar:
        final extra = parsed.extra;
        _calSummaryController.text = extra['summary'] as String? ?? '';
        _calLocationController.text = extra['location'] as String? ?? '';
        _calDescController.text = extra['description'] as String? ?? '';
        final startDt = extra['dtStart'] as DateTime?;
        if (startDt != null) {
          _calStartDate = startDt.toLocal();
          _calStartTime = TimeOfDay(hour: startDt.toLocal().hour, minute: startDt.toLocal().minute);
        }
        final endDt = extra['dtEnd'] as DateTime?;
        if (endDt != null) {
          _calEndDate = endDt.toLocal();
          _calEndTime = TimeOfDay(hour: endDt.toLocal().hour, minute: endDt.toLocal().minute);
        }
        break;
      case ParsedRecordType.smartPoster:
        final extra = parsed.extra;
        _spUriController.text = extra['uri'] as String? ?? '';
        _spTitleController.text = extra['title'] as String? ?? '';
        _spLangController.text = (extra['lang'] as String?)?.isNotEmpty == true ? extra['lang'] as String : 'tr';
        break;
      case ParsedRecordType.customMime:
        final extra = parsed.extra;
        _mimeTypeController.text = extra['mimeType'] as String? ?? ascii.decode(record.type, allowInvalid: true);
        final isPrintable = record.payload.isNotEmpty &&
            record.payload.every((b) => (b >= 32 && b <= 126) || b == 10 || b == 13 || b == 9);
        if (isPrintable) {
          _mimeIsHex = false;
          _mimePayloadController.text = utf8.decode(record.payload, allowMalformed: true);
        } else {
          _mimeIsHex = true;
          _mimePayloadController.text =
              record.payload.map((b) => b.toRadixString(16).padLeft(2, '0')).join(' ');
        }
        break;
      case ParsedRecordType.wifi:
        final extra = parsed.extra;
        _wifiSsidController.text = extra['ssid'] as String? ?? '';
        _wifiPasswordController.text = extra['password'] as String? ?? '';
        final wifiDecoded = NdefCodec.decodeWifiWsc(record);
        if (wifiDecoded != null) {
          _wifiAuthType = wifiDecoded.authType;
          _wifiEncryptionType = wifiDecoded.encryptionType;
        }
        break;
      default:
        break;
    }
  }

  @override
  void dispose() {
    _quickController.dispose();
    _quickSecondaryController.dispose();
    _textController.dispose();
    _urlController.dispose();
    _emailController.dispose();
    _emailSubjectController.dispose();
    _emailBodyController.dispose();
    _phoneController.dispose();
    _smsPhoneController.dispose();
    _smsBodyController.dispose();
    _latController.dispose();
    _lngController.dispose();

    _vcardNameController.dispose();
    _vcardFirstController.dispose();
    _vcardLastController.dispose();
    _vcardOrgController.dispose();
    _vcardTitleController.dispose();
    _vcardPhoneController.dispose();
    _vcardEmailController.dispose();
    _vcardUrlController.dispose();
    _vcardNoteController.dispose();

    _calSummaryController.dispose();
    _calLocationController.dispose();
    _calDescController.dispose();

    _spUriController.dispose();
    _spTitleController.dispose();
    _spLangController.dispose();

    _mimeTypeController.dispose();
    _mimePayloadController.dispose();

    _wifiSsidController.dispose();
    _wifiPasswordController.dispose();
    super.dispose();
  }

  void _clearErrors() {
    setState(() {
      _quickError = null;
      _textError = null;
      _urlError = null;
      _emailError = null;
      _phoneError = null;
      _smsPhoneError = null;
      _latError = null;
      _lngError = null;

      _vcardNameError = null;
      _vcardEmailError = null;
      _vcardPhoneError = null;
      _vcardUrlError = null;

      _calSummaryError = null;
      _calDateError = null;

      _spUriError = null;
      _spLangError = null;

      _mimeTypeError = null;
      _mimePayloadError = null;

      _wifiSsidError = null;
      _wifiPasswordError = null;
    });
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+$').hasMatch(email);
  }

  bool _isValidUrl(String url) {
    final parsed = Uri.tryParse(url);
    return parsed != null && parsed.hasScheme && parsed.scheme.isNotEmpty && parsed.host.isNotEmpty;
  }

  bool _isValidPhone(String phone) {
    final clean = phone.replaceAll(RegExp(r'[\s\-\(\)\+]'), '');
    return clean.isNotEmpty && clean.length >= 3 && clean.length <= 20 && RegExp(r'^\d+$').hasMatch(clean);
  }

  void _saveRecord() {
    _clearErrors();
    final loc = AppLocalizations.of(context)!;
    if (_quickKind != null) {
      _saveQuickLink(_quickKind!);
      return;
    }
    NdefRecordModel? record;

    switch (_selectedType) {
      case ParsedRecordType.text:
        final txt = _textController.text.trim();
        if (txt.isEmpty) {
          setState(() => _textError = loc.composeTextEmpty);
          return;
        }
        if (txt.length > 5000) {
          setState(() => _textError = loc.composeTextTooLong);
          return;
        }
        record = NdefCodec.encodeText(txt);
        break;

      case ParsedRecordType.url:
        final url = _urlController.text.trim();
        if (url.isEmpty || !QuickLinkBuilder.isValidUri(url)) {
          setState(() => _urlError = loc.composeUrlInvalid);
          return;
        }
        if (url.length > 2000) {
          setState(() => _urlError = loc.composeUrlTooLong);
          return;
        }
        record = NdefCodec.encodeUri(url);
        break;

      case ParsedRecordType.email:
        final email = _emailController.text.trim();
        if (email.isEmpty || !_isValidEmail(email)) {
          setState(() => _emailError = loc.composeEmailInvalid);
          return;
        }
        record = NdefCodec.encodeEmail(
          recipient: email,
          subject: _emailSubjectController.text.trim(),
          body: _emailBodyController.text.trim(),
        );
        break;

      case ParsedRecordType.phone:
        final phone = _phoneController.text.trim();
        if (phone.isEmpty || !_isValidPhone(phone)) {
          setState(() => _phoneError = loc.composePhoneInvalid);
          return;
        }
        record = NdefCodec.encodePhone(phone);
        break;

      case ParsedRecordType.sms:
        final phone = _smsPhoneController.text.trim();
        if (phone.isEmpty || !_isValidPhone(phone)) {
          setState(() => _smsPhoneError = loc.composeSmsPhoneInvalid);
          return;
        }
        record = NdefCodec.encodeSms(
          phoneNumber: phone,
          message: _smsBodyController.text.trim(),
        );
        break;

      case ParsedRecordType.location:
        final latStr = _latController.text.trim();
        final lngStr = _lngController.text.trim();
        final lat = double.tryParse(latStr);
        final lng = double.tryParse(lngStr);

        if (lat == null || lat < -90.0 || lat > 90.0) {
          setState(() => _latError = loc.composeLatInvalid);
          return;
        }
        if (lng == null || lng < -180.0 || lng > 180.0) {
          setState(() => _lngError = loc.composeLngInvalid);
          return;
        }
        record = NdefCodec.encodeLocation(latitude: lat, longitude: lng);
        break;

      case ParsedRecordType.vcard:
        final fn = _vcardNameController.text.trim();
        if (fn.isEmpty) {
          setState(() => _vcardNameError = loc.composeVcardNameEmpty);
          return;
        }
        if (fn.length > 200) {
          setState(() => _vcardNameError = loc.composeVcardNameTooLong);
          return;
        }
        final email = _vcardEmailController.text.trim();
        if (email.isNotEmpty && !_isValidEmail(email)) {
          setState(() => _vcardEmailError = loc.composeVcardEmailInvalid);
          return;
        }
        final phone = _vcardPhoneController.text.trim();
        if (phone.isNotEmpty && !_isValidPhone(phone)) {
          setState(() => _vcardPhoneError = loc.composeVcardPhoneInvalid);
          return;
        }
        final url = _vcardUrlController.text.trim();
        if (url.isNotEmpty && !_isValidUrl(url)) {
          setState(() => _vcardUrlError = loc.composeVcardUrlInvalid);
          return;
        }

        record = NdefCodec.encodeVCard(
          formattedName: fn,
          firstName: _vcardFirstController.text.trim(),
          lastName: _vcardLastController.text.trim(),
          organization: _vcardOrgController.text.trim(),
          title: _vcardTitleController.text.trim(),
          phone: phone.isNotEmpty ? phone : null,
          email: email.isNotEmpty ? email : null,
          url: url.isNotEmpty ? url : null,
          note: _vcardNoteController.text.trim(),
        );
        break;

      case ParsedRecordType.calendar:
        final summary = _calSummaryController.text.trim();
        if (summary.isEmpty) {
          setState(() => _calSummaryError = loc.composeCalSummaryEmpty);
          return;
        }
        if (summary.length > 250) {
          setState(() => _calSummaryError = loc.composeCalSummaryTooLong);
          return;
        }

        final startDt = DateTime(
          _calStartDate.year,
          _calStartDate.month,
          _calStartDate.day,
          _calStartTime.hour,
          _calStartTime.minute,
        );
        final endDt = DateTime(
          _calEndDate.year,
          _calEndDate.month,
          _calEndDate.day,
          _calEndTime.hour,
          _calEndTime.minute,
        );

        if (!endDt.isAfter(startDt)) {
          setState(() => _calDateError = loc.composeCalDateInvalid);
          return;
        }

        record = NdefCodec.encodeCalendarEvent(
          summary: summary,
          dtStart: startDt,
          dtEnd: endDt,
          location: _calLocationController.text.trim(),
          description: _calDescController.text.trim(),
        );
        break;

      case ParsedRecordType.smartPoster:
        final uri = _spUriController.text.trim();
        if (uri.isEmpty || !_isValidUrl(uri)) {
          setState(() => _spUriError = loc.composeSpUriInvalid);
          return;
        }
        final lang = _spLangController.text.trim().toLowerCase();
        if (lang.isEmpty || !RegExp(r'^[a-z]{2,3}(-[a-z0-9]+)?$').hasMatch(lang)) {
          setState(() => _spLangError = loc.composeSpLangInvalid);
          return;
        }

        record = NdefCodec.encodeSmartPoster(
          uri: uri,
          title: _spTitleController.text.trim().isNotEmpty ? _spTitleController.text.trim() : null,
          lang: lang,
        );
        break;

      case ParsedRecordType.customMime:
        final mime = _mimeTypeController.text.trim().toLowerCase();
        if (mime.isEmpty || !RegExp(r'^[-\w.+]+/[-\w.+]+$').hasMatch(mime)) {
          setState(() => _mimeTypeError = loc.composeMimeTypeInvalid);
          return;
        }

        final rawPayload = _mimePayloadController.text.trim();
        Uint8List payloadBytes;
        if (_mimeIsHex) {
          final cleanHex = rawPayload.replaceAll(RegExp(r'[\s,]'), '');
          if (cleanHex.isEmpty || cleanHex.length.isOdd || !RegExp(r'^[0-9a-fA-F]+$').hasMatch(cleanHex)) {
            setState(() => _mimePayloadError = loc.composeMimeHexInvalid);
            return;
          }
          final list = <int>[];
          for (int i = 0; i < cleanHex.length; i += 2) {
            list.add(int.parse(cleanHex.substring(i, i + 2), radix: 16));
          }
          payloadBytes = Uint8List.fromList(list);
        } else {
          payloadBytes = Uint8List.fromList(utf8.encode(rawPayload));
        }

        if (payloadBytes.length > 10000) {
          setState(() => _mimePayloadError = loc.composeMimePayloadTooLarge);
          return;
        }

        record = NdefCodec.encodeCustomMime(
          mimeType: mime,
          payload: payloadBytes,
        );
        break;

      case ParsedRecordType.wifi:
        final ssid = _wifiSsidController.text.trim();
        if (ssid.isEmpty) {
          setState(() => _wifiSsidError = loc.composeWifiSsidEmpty);
          return;
        }
        if (utf8.encode(ssid).length > 32) {
          setState(() => _wifiSsidError = 'SSID en fazla 32 bayt olabilir.');
          return;
        }

        final pass = _wifiPasswordController.text;
        if (_wifiAuthType != WifiAuthType.open) {
          if (pass.isEmpty) {
            setState(() => _wifiPasswordError = loc.composeWifiPasswordRequired);
            return;
          }
          if (pass.length < 8 || pass.length > 63) {
            setState(() => _wifiPasswordError = loc.composeWifiPasswordLength);
            return;
          }
        }

        record = NdefCodec.encodeWifiWsc(
          ssid: ssid,
          authType: _wifiAuthType,
          password: pass,
          encryptionType: _wifiEncryptionType,
        );
        break;

      default:
        break;
    }

    if (record != null) {
      widget.onRecordCreated(record);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        top: 0,
        left: 20,
        right: 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _isEditing ? loc.composeEditNdefRecord : loc.composeNewNdefRecord,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Type Selector Chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _buildChoiceChip(ParsedRecordType.text, loc.tabText, Icons.text_fields),
                _buildChoiceChip(ParsedRecordType.url, loc.tabUrl, Icons.link),
                _buildChoiceChip(ParsedRecordType.email, loc.tabEmail, Icons.email),
                _buildChoiceChip(ParsedRecordType.phone, loc.tabPhone, Icons.phone),
                _buildChoiceChip(ParsedRecordType.sms, loc.tabSms, Icons.sms),
                _buildChoiceChip(ParsedRecordType.location, loc.recordTypeLocation, Icons.location_on),
                _buildChoiceChip(ParsedRecordType.vcard, loc.tabContact, Icons.contact_page),
                _buildChoiceChip(ParsedRecordType.calendar, loc.recordTypeCalendar, Icons.calendar_month),
                _buildChoiceChip(ParsedRecordType.smartPoster, loc.recordTypeSmartPoster, Icons.web_stories),
                _buildChoiceChip(ParsedRecordType.wifi, loc.tabWifi, Icons.wifi),
                _buildChoiceChip(ParsedRecordType.customMime, loc.tabCustomMime, Icons.data_object),
              ],
            ),
            if (!_isEditing) ...[
              const SizedBox(height: 16),
              Text(
                loc.quickLinksHeader,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildQuickChip(QuickLinkKind.customUri, loc.quickLinkCustomUri, Icons.link_off),
                  _buildQuickChip(QuickLinkKind.social, loc.quickLinkSocial, Icons.people),
                  _buildQuickChip(QuickLinkKind.video, loc.quickLinkVideo, Icons.play_circle),
                  _buildQuickChip(QuickLinkKind.search, loc.quickLinkSearch, Icons.search),
                  _buildQuickChip(QuickLinkKind.file, loc.quickLinkFile, Icons.insert_drive_file),
                  _buildQuickChip(QuickLinkKind.facetime, 'FaceTime', Icons.videocam),
                  _buildQuickChip(QuickLinkKind.facetimeAudio, loc.quickLinkFacetimeAudio, Icons.mic),
                  _buildQuickChip(QuickLinkKind.address, loc.quickLinkAddress, Icons.flag),
                  _buildQuickChip(QuickLinkKind.payment, loc.quickLinkPayment, Icons.payments),
                  _buildQuickChip(QuickLinkKind.app, loc.quickLinkApp, Icons.apps),
                  _buildQuickChip(QuickLinkKind.bluetooth, 'Bluetooth', Icons.bluetooth),
                ],
              ),
            ],
            const Divider(height: 28),
            _buildTypeFields(),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _saveRecord,
              icon: Icon(_isEditing ? Icons.check : Icons.add_task),
              label: Text(_isEditing ? loc.updateRecord : loc.addToList),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: _isEditing ? AppColors.accent : AppColors.accent,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickChip(QuickLinkKind kind, String label, IconData icon) {
    final isSelected = _quickKind == kind;
    return ChoiceChip(
      avatar: Icon(icon, size: 18, color: isSelected ? Colors.white : Colors.blueGrey),
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _quickKind = kind;
            _quickController.clear();
            _quickSecondaryController.clear();
            _clearErrors();
          });
        }
      },
    );
  }

  void _saveQuickLink(QuickLinkKind kind) {
    final loc = AppLocalizations.of(context)!;
    final input = _quickController.text;
    final NdefRecordModel record;
    try {
      switch (kind) {
        case QuickLinkKind.customUri:
          final uri = input.trim();
          if (!QuickLinkBuilder.isValidUri(uri)) {
            throw QuickLinkException(loc.quickCustomUriError);
          }
          record = NdefCodec.encodeUri(uri);
          break;
        case QuickLinkKind.social:
          record = NdefCodec.encodeUri(QuickLinkBuilder.socialUrl(_socialNetwork, input));
          break;
        case QuickLinkKind.video:
          record = NdefCodec.encodeUri(QuickLinkBuilder.videoUrl(input));
          break;
        case QuickLinkKind.search:
          record = NdefCodec.encodeUri(QuickLinkBuilder.searchUrl(_searchEngine, input));
          break;
        case QuickLinkKind.file:
          record = NdefCodec.encodeUri(
            QuickLinkBuilder.httpsUrl(input, emptyMessage: loc.quickFileEmptyMessage),
          );
          break;
        case QuickLinkKind.payment:
          record = NdefCodec.encodeUri(
            QuickLinkBuilder.httpsUrl(input, emptyMessage: loc.quickPaymentEmptyMessage),
          );
          break;
        case QuickLinkKind.facetime:
          record = NdefCodec.encodeUri(QuickLinkBuilder.facetimeUri(input, audioOnly: false));
          break;
        case QuickLinkKind.facetimeAudio:
          record = NdefCodec.encodeUri(QuickLinkBuilder.facetimeUri(input, audioOnly: true));
          break;
        case QuickLinkKind.address:
          record = NdefCodec.encodeUri(QuickLinkBuilder.addressUrl(_mapProvider, input));
          break;
        case QuickLinkKind.app:
          record = QuickLinkBuilder.androidAppRecord(input);
          break;
        case QuickLinkKind.bluetooth:
          record = QuickLinkBuilder.bluetoothRecord(
            input,
            deviceName: _quickSecondaryController.text,
          );
          break;
      }
    } on QuickLinkException catch (e) {
      setState(() => _quickError = e.message);
      return;
    }
    widget.onRecordCreated(record);
    Navigator.of(context).pop();
  }

  Widget _quickField({
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    TextEditingController? controller,
    bool showError = true,
  }) {
    return TextField(
      controller: controller ?? _quickController,
      keyboardType: keyboardType,
      autocorrect: false,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: showError ? _quickError : null,
        errorMaxLines: 3,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _quickNote(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(text, style: const TextStyle(fontSize: 12, color: Colors.black54)),
    );
  }

  Widget _buildQuickFields(QuickLinkKind kind) {
    final loc = AppLocalizations.of(context)!;
    switch (kind) {
      case QuickLinkKind.customUri:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _quickField(
              label: loc.quickLinkCustomUri,
              hint: 'spotify:track:... / myapp://page',
              keyboardType: TextInputType.url,
            ),
            _quickNote(loc.quickCustomUriDesc),
          ],
        );
      case QuickLinkKind.social:
        return Column(
          children: [
            DropdownButtonFormField<SocialNetwork>(
              initialValue: _socialNetwork,
              decoration: InputDecoration(
                labelText: loc.quickSocialLabel,
                border: const OutlineInputBorder(),
              ),
              items: [
                for (final n in SocialNetwork.values)
                  DropdownMenuItem(value: n, child: Text(n.label)),
              ],
              onChanged: (v) => setState(() => _socialNetwork = v ?? _socialNetwork),
            ),
            const SizedBox(height: 10),
            _quickField(
              label: _socialNetwork == SocialNetwork.whatsapp ? loc.phoneNumber : loc.socialUsername,
              hint: _socialNetwork == SocialNetwork.whatsapp ? '905551112233' : 'kullaniciadi',
              keyboardType: _socialNetwork == SocialNetwork.whatsapp
                  ? TextInputType.phone
                  : TextInputType.text,
            ),
          ],
        );
      case QuickLinkKind.video:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _quickField(
              label: loc.quickVideoLabel,
              hint: loc.quickVideoHint,
              keyboardType: TextInputType.url,
            ),
            _quickNote(loc.quickVideoDesc),
          ],
        );
      case QuickLinkKind.search:
        return Column(
          children: [
            DropdownButtonFormField<SearchEngine>(
              initialValue: _searchEngine,
              decoration: InputDecoration(
                labelText: loc.quickLinkSearch,
                border: const OutlineInputBorder(),
              ),
              items: [
                for (final e in SearchEngine.values)
                  DropdownMenuItem(value: e, child: Text(e.label)),
              ],
              onChanged: (v) => setState(() => _searchEngine = v ?? _searchEngine),
            ),
            const SizedBox(height: 10),
            _quickField(label: loc.quickSearchTextLabel, hint: loc.quickSearchHint),
          ],
        );
      case QuickLinkKind.file:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _quickField(
              label: loc.quickFileLabel,
              hint: 'https://site.com/menu.pdf',
              keyboardType: TextInputType.url,
            ),
            _quickNote(loc.quickFileDesc),
          ],
        );
      case QuickLinkKind.facetime:
      case QuickLinkKind.facetimeAudio:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _quickField(
              label: loc.quickPhoneOrAppleId,
              hint: '+905551112233 veya ad@icloud.com',
              keyboardType: TextInputType.emailAddress,
            ),
            _quickNote(kind == QuickLinkKind.facetime
                ? loc.quickFacetimeVideoDesc
                : loc.quickFacetimeAudioDesc),
          ],
        );
      case QuickLinkKind.address:
        return Column(
          children: [
            DropdownButtonFormField<MapProvider>(
              initialValue: _mapProvider,
              decoration: InputDecoration(
                labelText: loc.quickMapProvider,
                border: const OutlineInputBorder(),
              ),
              items: [
                for (final m in MapProvider.values)
                  DropdownMenuItem(value: m, child: Text(m.label)),
              ],
              onChanged: (v) => setState(() => _mapProvider = v ?? _mapProvider),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _quickController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: loc.quickLinkAddress,
                hintText: loc.quickAddressHint,
                errorText: _quickError,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        );
      case QuickLinkKind.payment:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _quickField(
              label: loc.quickLinkPayment,
              hint: 'https://paypal.me/kullanici',
              keyboardType: TextInputType.url,
            ),
            _quickNote(loc.quickPaymentDesc),
          ],
        );
      case QuickLinkKind.app:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _quickField(label: loc.appPackageName, hint: 'com.whatsapp'),
            _quickNote(loc.quickAppDesc),
          ],
        );
      case QuickLinkKind.bluetooth:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _quickField(label: 'Bluetooth MAC Adresi', hint: '00:11:22:AA:BB:CC'),
            const SizedBox(height: 10),
            _quickField(
              label: loc.quickDeviceNameOptional,
              hint: loc.quickSpeakerHint,
              controller: _quickSecondaryController,
              showError: false,
            ),
            _quickNote(loc.quickBluetoothDesc),
          ],
        );
    }
  }

  Widget _buildChoiceChip(ParsedRecordType type, String label, IconData icon) {
    final isSelected = _quickKind == null && _selectedType == type;
    return ChoiceChip(
      avatar: Icon(icon, size: 18, color: isSelected ? Colors.white : Colors.blueGrey),
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedType = type;
            _quickKind = null;
            _clearErrors();
          });
        }
      },
    );
  }

  Widget _buildTypeFields() {
    final loc = AppLocalizations.of(context)!;
    final quickKind = _quickKind;
    if (quickKind != null) return _buildQuickFields(quickKind);
    switch (_selectedType) {
      case ParsedRecordType.text:
        return TextField(
          controller: _textController,
          maxLines: 3,
          decoration: InputDecoration(
            labelText: loc.composeTextContent,
            hintText: loc.composeTextHint,
            errorText: _textError,
            border: const OutlineInputBorder(),
          ),
        );

      case ParsedRecordType.url:
        return TextField(
          controller: _urlController,
          keyboardType: TextInputType.url,
          decoration: InputDecoration(
            labelText: 'Web Adresi (URL)',
            hintText: 'https://example.com',
            errorText: _urlError,
            border: const OutlineInputBorder(),
          ),
        );

      case ParsedRecordType.email:
        return Column(
          children: [
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: loc.emailRecipient,
                hintText: 'ornek@alanadi.com',
                errorText: _emailError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailSubjectController,
              decoration: InputDecoration(
                labelText: loc.composeEmailSubjectOptional,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _emailBodyController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: loc.composeEmailBodyOptional,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        );

      case ParsedRecordType.phone:
        return TextField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            labelText: loc.phoneNumber,
            hintText: '+905551234567',
            errorText: _phoneError,
            border: const OutlineInputBorder(),
          ),
        );

      case ParsedRecordType.sms:
        return Column(
          children: [
            TextField(
              controller: _smsPhoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: loc.composeSmsRecipient,
                hintText: '+905551234567',
                errorText: _smsPhoneError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _smsBodyController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: loc.smsMessage,
                hintText: loc.composeSmsHint,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        );

      case ParsedRecordType.location:
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                controller: _latController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                decoration: InputDecoration(
                  labelText: 'Enlem (Lat)',
                  hintText: '41.0082',
                  errorText: _latError,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: _lngController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                decoration: InputDecoration(
                  labelText: 'Boylam (Lng)',
                  hintText: '28.9784',
                  errorText: _lngError,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
          ],
        );

      case ParsedRecordType.vcard:
        return Column(
          children: [
            TextField(
              controller: _vcardNameController,
              decoration: InputDecoration(
                labelText: loc.composeVcardFullName,
                hintText: loc.composeVcardNameHint,
                errorText: _vcardNameError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _vcardFirstController,
                    decoration: const InputDecoration(
                      labelText: 'Ad',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _vcardLastController,
                    decoration: const InputDecoration(
                      labelText: 'Soyad',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _vcardOrgController,
              decoration: InputDecoration(
                labelText: loc.contactCompany,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _vcardTitleController,
              decoration: const InputDecoration(
                labelText: 'Unvan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _vcardPhoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: loc.phoneNumber,
                hintText: '+905551234567',
                errorText: _vcardPhoneError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _vcardEmailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-posta Adresi',
                hintText: 'ahmet@sirket.com',
                errorText: _vcardEmailError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _vcardUrlController,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Web Sitesi',
                hintText: 'https://ahmet.dev',
                errorText: _vcardUrlError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _vcardNoteController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: loc.composeVcardNote,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        );

      case ParsedRecordType.calendar:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _calSummaryController,
              decoration: InputDecoration(
                labelText: loc.composeCalTitle,
                hintText: loc.composeCalTitleHint,
                errorText: _calSummaryError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _calLocationController,
              decoration: InputDecoration(
                labelText: 'Konum / Yer',
                hintText: loc.composeCalLocationHint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _calDescController,
              maxLines: 2,
              decoration: InputDecoration(
                labelText: loc.composeCalDesc,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            Text(loc.composeCalStartEndTime, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.date_range, size: 16),
                    label: Text('${_calStartDate.toLocal()}'.substring(0, 10)),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _calStartDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) setState(() => _calStartDate = picked);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.access_time, size: 16),
                    label: Text(_calStartTime.format(context)),
                    onPressed: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: _calStartTime,
                      );
                      if (picked != null) setState(() => _calStartTime = picked);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.date_range, size: 16),
                    label: Text('${_calEndDate.toLocal()}'.substring(0, 10)),
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: _calEndDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (picked != null) setState(() => _calEndDate = picked);
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.access_time, size: 16),
                    label: Text(_calEndTime.format(context)),
                    onPressed: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: _calEndTime,
                      );
                      if (picked != null) setState(() => _calEndTime = picked);
                    },
                  ),
                ),
              ],
            ),
            if (_calDateError != null) ...[
              const SizedBox(height: 6),
              Text(_calDateError!, style: const TextStyle(color: Colors.red, fontSize: 12)),
            ],
          ],
        );

      case ParsedRecordType.smartPoster:
        return Column(
          children: [
            TextField(
              controller: _spUriController,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'Hedef Web URL *',
                hintText: 'https://example.com',
                errorText: _spUriError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _spTitleController,
              decoration: InputDecoration(
                labelText: loc.composeSpTitleLabel,
                hintText: loc.composeSpTitleHint,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _spLangController,
              decoration: InputDecoration(
                labelText: 'Dil Kodu (ISO 639-1) *',
                hintText: 'tr',
                errorText: _spLangError,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        );

      case ParsedRecordType.customMime:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _mimeTypeController,
              decoration: InputDecoration(
                labelText: loc.composeMimeTypeLabel,
                hintText: 'application/json veya text/plain',
                errorText: _mimeTypeError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(loc.composeDataFormat, style: const TextStyle(fontWeight: FontWeight.w500)),
                ChoiceChip(
                  label: const Text('UTF-8 Metin'),
                  selected: !_mimeIsHex,
                  onSelected: (val) {
                    if (val) setState(() => _mimeIsHex = false);
                  },
                ),
                const SizedBox(width: 8),
                ChoiceChip(
                  label: Text(loc.composeFormatHex),
                  selected: _mimeIsHex,
                  onSelected: (val) {
                    if (val) setState(() => _mimeIsHex = true);
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _mimePayloadController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: _mimeIsHex ? loc.composeMimeHexBytes : loc.composeMimeTextPayload,
                hintText: _mimeIsHex ? '01 02 0A FF' : '{"key": "value"}',
                errorText: _mimePayloadError,
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        );

      case ParsedRecordType.wifi:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Warning Notice regarding Wi-Fi password visibility on tag and platform joining
            Card(
              color: Colors.amber.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: Colors.amber.shade400),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.warning_amber_rounded, color: Colors.orange, size: 24),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            loc.composeWifiWarningTitle,
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.brown, fontSize: 13),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            loc.composeWifiWarningBody,
                            style: const TextStyle(fontSize: 12, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _wifiSsidController,
              decoration: InputDecoration(
                labelText: loc.composeWifiSsidLabel,
                hintText: 'Ev_Interneti_5G',
                errorText: _wifiSsidError,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<WifiAuthType>(
              initialValue: _wifiAuthType,
              decoration: InputDecoration(
                labelText: loc.composeWifiAuthTypeLabel,
                border: const OutlineInputBorder(),
              ),
              items: [
                const DropdownMenuItem(value: WifiAuthType.wpa2Psk, child: Text('WPA2 Personal (Standart Ev/Ofis)')),
                const DropdownMenuItem(value: WifiAuthType.wpaWpa2Personal, child: Text('WPA/WPA2 Personal (Karma)')),
                const DropdownMenuItem(value: WifiAuthType.wpaPsk, child: Text('WPA Personal')),
                DropdownMenuItem(value: WifiAuthType.open, child: Text(loc.composeWifiOpenNetwork)),
              ],
              onChanged: (val) {
                if (val != null) setState(() => _wifiAuthType = val);
              },
            ),
            if (_wifiAuthType != WifiAuthType.open) ...[
              const SizedBox(height: 10),
              TextField(
                controller: _wifiPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: loc.composeWifiPasswordLabel,
                  hintText: 'En az 8 karakter',
                  errorText: _wifiPasswordError,
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
            const SizedBox(height: 10),
            DropdownButtonFormField<WifiEncryptionType>(
              initialValue: _wifiEncryptionType,
              decoration: InputDecoration(
                labelText: loc.composeWifiEncryptionLabel,
                border: const OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(value: WifiEncryptionType.aes, child: Text(loc.composeWifiAesRecommended)),
                const DropdownMenuItem(value: WifiEncryptionType.tkipAes, child: Text('TKIP / AES')),
                const DropdownMenuItem(value: WifiEncryptionType.tkip, child: Text('TKIP')),
                const DropdownMenuItem(value: WifiEncryptionType.none, child: Text('Yok / None')),
              ],
              onChanged: (val) {
                if (val != null) setState(() => _wifiEncryptionType = val);
              },
            ),
          ],
        );

      default:
        return const SizedBox.shrink();
    }
  }
}
