import '../l10n/l10n.dart';
import 'ndef_record.dart';
import 'quick_links.dart';

enum GalleryFieldKind { text, multiline, phone, email, url, password }

class GalleryField {
  final String key;
  final String label;
  final String hint;
  final GalleryFieldKind kind;
  final bool required;

  const GalleryField(
    this.key,
    this.label, {
    this.hint = '',
    this.kind = GalleryFieldKind.text,
    this.required = true,
  });
}

/// A ready-made use case ("guest Wi-Fi card", "pet tag" ...) that turns a few
/// form fields into the records to write.
class GalleryPreset {
  final String id;
  final String title;
  final String description;

  /// Icon key mapped to an IconData by the UI.
  final String icon;
  final List<GalleryField> fields;
  final List<NdefRecordModel> Function(Map<String, String> values) build;

  const GalleryPreset({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.fields,
    required this.build,
  });

  /// Validates required fields, then builds. Throws [QuickLinkException].
  List<NdefRecordModel> create(Map<String, String> values) {
    final clean = {for (final e in values.entries) e.key: e.value.trim()};
    for (final field in fields) {
      if (field.required && (clean[field.key] ?? '').isEmpty) {
        throw QuickLinkException(L10n.current.fieldCannotBeEmpty(field.label));
      }
    }
    return build(clean);
  }
}

String? _opt(Map<String, String> v, String key) {
  final value = v[key];
  return value == null || value.isEmpty ? null : value;
}

String _phoneDigits(String phone) => phone.replaceAll(RegExp(r'[^\d+]'), '');

class TemplateGallery {
  static List<GalleryPreset> get presets => [
    GalleryPreset(
      id: 'business_card',
      title: L10n.current.presetBusinessCardTitle,
      description: L10n.current.presetBusinessCardDesc,
      icon: 'badge',
      fields: [
        GalleryField('name', L10n.current.contactFullName, hint: 'Ayşe Yılmaz'),
        GalleryField('title', L10n.current.contactTitle, hint: 'Satış Müdürü', required: false),
        GalleryField('company', L10n.current.contactCompany, hint: 'Örnek A.Ş.', required: false),
        GalleryField('phone', L10n.current.contactPhone, hint: '+90 555 111 22 33', kind: GalleryFieldKind.phone, required: false),
        GalleryField('email', L10n.current.contactEmail, hint: 'ayse@ornek.com', kind: GalleryFieldKind.email, required: false),
        GalleryField('website', L10n.current.contactWebsite, hint: 'https://ornek.com', kind: GalleryFieldKind.url, required: false),
      ],
      build: (v) {
        final parts = v['name']!.split(RegExp(r'\s+'));
        return [
          NdefCodec.encodeVCard(
            formattedName: v['name']!,
            firstName: parts.length > 1 ? parts.sublist(0, parts.length - 1).join(' ') : parts.first,
            lastName: parts.length > 1 ? parts.last : null,
            organization: _opt(v, 'company'),
            title: _opt(v, 'title'),
            phone: _opt(v, 'phone'),
            email: _opt(v, 'email'),
            url: _opt(v, 'website') == null
                ? null
                : QuickLinkBuilder.httpsUrl(v['website']!, emptyMessage: 'Web sitesi'),
          ),
        ];
      },
    ),
    GalleryPreset(
      id: 'guest_wifi',
      title: L10n.current.presetGuestWifiTitle,
      description: L10n.current.presetGuestWifiDesc,
      icon: 'wifi',
      fields: [
        GalleryField('ssid', L10n.current.wifiSsid, hint: 'Ev_Misafir'),
        GalleryField('password', L10n.current.wifiPassword, hint: 'En az 8 karakter (boşsa açık ağ)', kind: GalleryFieldKind.password, required: false),
      ],
      build: (v) {
        final password = v['password'] ?? '';
        if (password.isNotEmpty && (password.length < 8 || password.length > 63)) {
          throw QuickLinkException(L10n.current.csvWifiPasswordLength);
        }
        final open = password.isEmpty;
        return [
          NdefCodec.encodeWifiWsc(
            ssid: v['ssid']!,
            authType: open ? WifiAuthType.open : WifiAuthType.wpa2Psk,
            password: password,
            encryptionType: open ? WifiEncryptionType.none : WifiEncryptionType.aes,
          ),
        ];
      },
    ),
    GalleryPreset(
      id: 'google_review',
      title: L10n.current.presetGoogleReviewTitle,
      description: L10n.current.presetGoogleReviewDesc,
      icon: 'star',
      fields: const [
        GalleryField('link', 'Yorum Bağlantısı veya Place ID',
            hint: 'https://g.page/r/... veya ChIJ...', kind: GalleryFieldKind.url),
      ],
      build: (v) {
        final input = v['link']!;
        final url = input.contains('/') || input.contains('.')
            ? QuickLinkBuilder.httpsUrl(input, emptyMessage: 'Bağlantı')
            : 'https://search.google.com/local/writereview?placeid=${Uri.encodeQueryComponent(input)}';
        return [NdefCodec.encodeUri(url)];
      },
    ),
    GalleryPreset(
      id: 'menu',
      title: L10n.current.presetMenuLinkTitle,
      description: L10n.current.presetMenuLinkDesc,
      icon: 'menu',
      fields: const [
        GalleryField('url', 'Menü Bağlantısı', hint: 'https://restoran.com/menu', kind: GalleryFieldKind.url),
        GalleryField('title', 'Başlık', hint: 'Menümüz', required: false),
      ],
      build: (v) {
        final url = QuickLinkBuilder.httpsUrl(v['url']!, emptyMessage: 'Menü bağlantısı');
        final title = _opt(v, 'title');
        return [title == null ? NdefCodec.encodeUri(url) : NdefCodec.encodeSmartPoster(uri: url, title: title)];
      },
    ),
    GalleryPreset(
      id: 'pet_tag',
      title: L10n.current.presetPetTagTitle,
      description: L10n.current.presetPetTagDesc,
      icon: 'pets',
      fields: const [
        GalleryField('pet', 'Hayvanın Adı', hint: 'Pamuk'),
        GalleryField('phone', 'Sahibinin Telefonu', hint: '+90 555 111 22 33', kind: GalleryFieldKind.phone),
        GalleryField('note', 'Not', hint: 'Alerjisi var, ödül verilecektir', kind: GalleryFieldKind.multiline, required: false),
      ],
      build: (v) {
        final note = _opt(v, 'note');
        final text = 'Merhaba, ben ${v['pet']}! Sahibimi arar mısınız: ${v['phone']}${note == null ? '' : '\n$note'}';
        return [NdefCodec.encodeText(text), NdefCodec.encodePhone(_phoneDigits(v['phone']!))];
      },
    ),
    GalleryPreset(
      id: 'instagram',
      title: L10n.current.presetInstagramTitle,
      description: L10n.current.presetInstagramDesc,
      icon: 'camera',
      fields: [
        GalleryField('user', L10n.current.socialUsername, hint: '@kullaniciadi'),
      ],
      build: (v) => [NdefCodec.encodeUri(QuickLinkBuilder.socialUrl(SocialNetwork.instagram, v['user']!))],
    ),
    GalleryPreset(
      id: 'whatsapp',
      title: L10n.current.presetWhatsappTitle,
      description: L10n.current.presetWhatsappDesc,
      icon: 'chat',
      fields: [
        GalleryField('phone', L10n.current.contactPhone, hint: '905551112233', kind: GalleryFieldKind.phone),
        GalleryField('message', L10n.current.smsMessage, hint: 'Merhaba, bilgi almak istiyorum', kind: GalleryFieldKind.multiline, required: false),
      ],
      build: (v) {
        final base = QuickLinkBuilder.socialUrl(SocialNetwork.whatsapp, v['phone']!);
        final message = _opt(v, 'message');
        return [NdefCodec.encodeUri(message == null ? base : '$base?text=${Uri.encodeQueryComponent(message)}')];
      },
    ),
    GalleryPreset(
      id: 'emergency',
      title: L10n.current.presetEmergencyTitle,
      description: L10n.current.presetEmergencyDesc,
      icon: 'medical',
      fields: [
        GalleryField('name', L10n.current.contactFullName, hint: 'Ayşe Yılmaz'),
        const GalleryField('blood', 'Kan Grubu', hint: 'A Rh+', required: false),
        const GalleryField('allergies', 'Alerjiler / İlaçlar', hint: 'Penisilin', kind: GalleryFieldKind.multiline, required: false),
        const GalleryField('contact', 'Acil Durumda Aranacak', hint: '+90 555 111 22 33', kind: GalleryFieldKind.phone),
      ],
      build: (v) {
        final lines = [
          'ACİL DURUM BİLGİSİ',
          v['name']!,
          if (_opt(v, 'blood') != null) 'Kan grubu: ${v['blood']}',
          if (_opt(v, 'allergies') != null) 'Alerjiler: ${v['allergies']}',
          'Acil durumda arayın: ${v['contact']}',
        ];
        return [NdefCodec.encodeText(lines.join('\n')), NdefCodec.encodePhone(_phoneDigits(v['contact']!))];
      },
    ),
    GalleryPreset(
      id: 'app_download',
      title: L10n.current.presetAppDownloadTitle,
      description: L10n.current.presetAppDownloadDesc,
      icon: 'download',
      fields: const [
        GalleryField('url', 'Mağaza Bağlantısı', hint: 'https://apps.apple.com/...', kind: GalleryFieldKind.url),
      ],
      build: (v) => [NdefCodec.encodeUri(QuickLinkBuilder.httpsUrl(v['url']!, emptyMessage: 'Mağaza bağlantısı'))],
    ),
    GalleryPreset(
      id: 'location',
      title: L10n.current.presetDirectionsTitle,
      description: L10n.current.presetDirectionsDesc,
      icon: 'place',
      fields: const [
        GalleryField('address', 'Adres', hint: 'Bağdat Cad. No:1 Kadıköy İstanbul', kind: GalleryFieldKind.multiline),
      ],
      build: (v) => [NdefCodec.encodeUri(QuickLinkBuilder.addressUrl(MapProvider.google, v['address']!))],
    ),
    GalleryPreset(
      id: 'website',
      title: L10n.current.presetWebsiteTitle,
      description: L10n.current.presetWebsiteDesc,
      icon: 'web',
      fields: [
        GalleryField('url', L10n.current.contactWebsite, hint: 'https://ornek.com', kind: GalleryFieldKind.url),
        const GalleryField('title', 'Başlık', hint: 'Portfolyom', required: false),
      ],
      build: (v) {
        final url = QuickLinkBuilder.httpsUrl(v['url']!, emptyMessage: 'Web adresi');
        final title = _opt(v, 'title');
        return [title == null ? NdefCodec.encodeUri(url) : NdefCodec.encodeSmartPoster(uri: url, title: title)];
      },
    ),
    GalleryPreset(
      id: 'shortcut_trigger',
      title: L10n.current.presetShortcutTitle,
      description: L10n.current.presetShortcutDesc,
      icon: 'bolt',
      fields: const [],
      build: (_) => [NdefCodec.encodeUri('nfctagmaster://scan')],
    ),
  ];

  static GalleryPreset? byId(String id) {
    for (final preset in presets) {
      if (preset.id == id) return preset;
    }
    return null;
  }
}
