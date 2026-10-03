import '../l10n/l10n.dart';
import 'ndef_record.dart';
import 'quick_links.dart';
import '../util/text_search.dart';

enum GalleryFieldKind { text, multiline, phone, email, url, password }

enum GalleryCategory { business, social, home, personal, automation }

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
  final GalleryCategory category;
  final List<GalleryField> fields;
  final List<NdefRecordModel> Function(Map<String, String> values) build;

  const GalleryPreset({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.category,
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
      category: GalleryCategory.business,
      fields: [
        GalleryField('name', L10n.current.contactFullName, hint: 'Jane Doe'),
        GalleryField('title', L10n.current.contactTitle, hint: 'Product Manager', required: false),
        GalleryField('company', L10n.current.contactCompany, hint: 'Acme Corp', required: false),
        GalleryField('phone', L10n.current.contactPhone, hint: '+1 555 111 22 33', kind: GalleryFieldKind.phone, required: false),
        GalleryField('email', L10n.current.contactEmail, hint: 'jane@example.com', kind: GalleryFieldKind.email, required: false),
        GalleryField('website', L10n.current.contactWebsite, hint: 'https://example.com', kind: GalleryFieldKind.url, required: false),
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
                : QuickLinkBuilder.httpsUrl(v['website']!, emptyMessage: L10n.current.webAddress),
          ),
        ];
      },
    ),
    GalleryPreset(
      id: 'guest_wifi',
      title: L10n.current.presetGuestWifiTitle,
      description: L10n.current.presetGuestWifiDesc,
      icon: 'wifi',
      category: GalleryCategory.home,
      fields: [
        GalleryField('ssid', L10n.current.wifiSsid, hint: 'Guest_WiFi'),
        GalleryField('password', L10n.current.wifiPassword, hint: '••••••••', kind: GalleryFieldKind.password, required: false),
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
      category: GalleryCategory.business,
      fields: [
        GalleryField('link', L10n.current.googleReviewFieldLabel,
            hint: 'https://g.page/r/...', kind: GalleryFieldKind.url),
      ],
      build: (v) {
        final input = v['link']!;
        final url = input.contains('/') || input.contains('.')
            ? QuickLinkBuilder.httpsUrl(input, emptyMessage: L10n.current.link)
            : 'https://search.google.com/local/writereview?placeid=${Uri.encodeQueryComponent(input)}';
        return [NdefCodec.encodeUri(url)];
      },
    ),
    GalleryPreset(
      id: 'menu',
      title: L10n.current.presetMenuLinkTitle,
      description: L10n.current.presetMenuLinkDesc,
      icon: 'menu',
      category: GalleryCategory.business,
      fields: [
        GalleryField('url', L10n.current.menuLinkFieldLabel, hint: 'https://example.com/menu', kind: GalleryFieldKind.url),
        GalleryField('title', L10n.current.title, hint: L10n.current.menuTitleHint, required: false),
      ],
      build: (v) {
        final url = QuickLinkBuilder.httpsUrl(v['url']!, emptyMessage: L10n.current.menuLinkFieldLabel);
        final title = _opt(v, 'title');
        return [title == null ? NdefCodec.encodeUri(url) : NdefCodec.encodeSmartPoster(uri: url, title: title)];
      },
    ),
    GalleryPreset(
      id: 'pet_tag',
      title: L10n.current.presetPetTagTitle,
      description: L10n.current.presetPetTagDesc,
      icon: 'pets',
      category: GalleryCategory.personal,
      fields: [
        GalleryField('pet', L10n.current.petName, hint: 'Buddy'),
        GalleryField('phone', L10n.current.ownerPhone, hint: '+1 555 111 22 33', kind: GalleryFieldKind.phone),
        GalleryField('note', L10n.current.noteLabel, hint: 'Friendly, reward if found', kind: GalleryFieldKind.multiline, required: false),
      ],
      build: (v) {
        final note = _opt(v, 'note');
        final text = L10n.current.petTagMessage(v['pet']!, v['phone']!, note == null ? '' : '\n$note');
        return [NdefCodec.encodeText(text), NdefCodec.encodePhone(_phoneDigits(v['phone']!))];
      },
    ),
    GalleryPreset(
      id: 'instagram',
      title: L10n.current.presetInstagramTitle,
      description: L10n.current.presetInstagramDesc,
      icon: 'camera',
      category: GalleryCategory.social,
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
      category: GalleryCategory.social,
      fields: [
        GalleryField('phone', L10n.current.contactPhone, hint: '905551112233', kind: GalleryFieldKind.phone),
        GalleryField('message', L10n.current.smsMessage, hint: L10n.current.whatsappMessageHint, kind: GalleryFieldKind.multiline, required: false),
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
      category: GalleryCategory.personal,
      fields: [
        GalleryField('name', L10n.current.contactFullName, hint: 'Jane Doe'),
        GalleryField('blood', L10n.current.bloodType, hint: 'A Rh+', required: false),
        GalleryField('allergies', L10n.current.allergies, hint: 'Penicillin', kind: GalleryFieldKind.multiline, required: false),
        GalleryField('contact', L10n.current.emergencyContact, hint: '+1 555 111 22 33', kind: GalleryFieldKind.phone),
      ],
      build: (v) {
        final lines = [
          L10n.current.emergencyInfo,
          v['name']!,
          if (_opt(v, 'blood') != null) L10n.current.emergencyBlood(v['blood']!),
          if (_opt(v, 'allergies') != null) L10n.current.emergencyAllergies(v['allergies']!),
          L10n.current.emergencyCall(v['contact']!),
        ];
        return [NdefCodec.encodeText(lines.join('\n')), NdefCodec.encodePhone(_phoneDigits(v['contact']!))];
      },
    ),
    GalleryPreset(
      id: 'app_download',
      title: L10n.current.presetAppDownloadTitle,
      description: L10n.current.presetAppDownloadDesc,
      icon: 'download',
      category: GalleryCategory.business,
      fields: [
        GalleryField('url', L10n.current.storeLink, hint: 'https://apps.apple.com/...', kind: GalleryFieldKind.url),
      ],
      build: (v) => [NdefCodec.encodeUri(QuickLinkBuilder.httpsUrl(v['url']!, emptyMessage: L10n.current.storeLink))],
    ),
    GalleryPreset(
      id: 'location',
      title: L10n.current.presetDirectionsTitle,
      description: L10n.current.presetDirectionsDesc,
      icon: 'place',
      category: GalleryCategory.business,
      fields: [
        GalleryField('address', L10n.current.address, hint: '100 Main St, New York, NY', kind: GalleryFieldKind.multiline),
      ],
      build: (v) => [NdefCodec.encodeUri(QuickLinkBuilder.addressUrl(MapProvider.google, v['address']!))],
    ),
    GalleryPreset(
      id: 'website',
      title: L10n.current.presetWebsiteTitle,
      description: L10n.current.presetWebsiteDesc,
      icon: 'web',
      category: GalleryCategory.social,
      fields: [
        GalleryField('url', L10n.current.contactWebsite, hint: 'https://example.com', kind: GalleryFieldKind.url),
        GalleryField('title', L10n.current.title, hint: 'Portfolio', required: false),
      ],
      build: (v) {
        final url = QuickLinkBuilder.httpsUrl(v['url']!, emptyMessage: L10n.current.webAddress);
        final title = _opt(v, 'title');
        return [title == null ? NdefCodec.encodeUri(url) : NdefCodec.encodeSmartPoster(uri: url, title: title)];
      },
    ),
    GalleryPreset(
      id: 'call_me',
      title: L10n.current.presetCallMeTitle,
      description: L10n.current.presetCallMeDesc,
      icon: 'phone',
      category: GalleryCategory.business,
      fields: [
        GalleryField('phone', L10n.current.contactPhone, hint: '+1 555 111 22 33', kind: GalleryFieldKind.phone),
      ],
      build: (v) {
        final phone = _phoneDigits(v['phone']!);
        if (phone.replaceAll('+', '').length < 3) {
          throw QuickLinkException(L10n.current.fieldCannotBeEmpty(L10n.current.contactPhone));
        }
        return [NdefCodec.encodePhone(phone)];
      },
    ),
    GalleryPreset(
      id: 'email_me',
      title: L10n.current.presetEmailMeTitle,
      description: L10n.current.presetEmailMeDesc,
      icon: 'mail',
      category: GalleryCategory.business,
      fields: [
        GalleryField('email', L10n.current.contactEmail, hint: 'jane@example.com', kind: GalleryFieldKind.email),
        GalleryField('subject', L10n.current.composeEmailSubjectOptional, hint: 'Hello', required: false),
      ],
      build: (v) {
        final email = v['email']!;
        if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email)) {
          throw QuickLinkException(L10n.current.fieldCannotBeEmpty(L10n.current.contactEmail));
        }
        return [NdefCodec.encodeEmail(recipient: email, subject: _opt(v, 'subject'))];
      },
    ),
    GalleryPreset(
      id: 'event_invite',
      title: L10n.current.presetEventTitle,
      description: L10n.current.presetEventDesc,
      icon: 'event',
      category: GalleryCategory.business,
      fields: [
        GalleryField('name', L10n.current.eventNameLabel, hint: 'Launch party'),
        GalleryField('date', L10n.current.eventDateLabel, hint: '2026-12-31'),
        GalleryField('time', L10n.current.eventTimeLabel, hint: '19:00'),
        GalleryField('place', L10n.current.address, hint: '100 Main St', required: false),
      ],
      build: (v) {
        final start = parseEventStart(v['date']!, v['time']!);
        if (start == null) throw QuickLinkException(L10n.current.eventDateTimeInvalid);
        return [
          NdefCodec.encodeCalendarEvent(
            summary: v['name']!,
            dtStart: start,
            dtEnd: start.add(const Duration(hours: 2)),
            location: _opt(v, 'place'),
          ),
        ];
      },
    ),
    GalleryPreset(
      id: 'playlist',
      title: L10n.current.presetPlaylistTitle,
      description: L10n.current.presetPlaylistDesc,
      icon: 'music',
      category: GalleryCategory.social,
      fields: [
        GalleryField('url', L10n.current.playlistLinkLabel, hint: 'https://open.spotify.com/playlist/...', kind: GalleryFieldKind.url),
      ],
      build: (v) => [NdefCodec.encodeUri(QuickLinkBuilder.httpsUrl(v['url']!, emptyMessage: L10n.current.playlistLinkLabel))],
    ),
    GalleryPreset(
      id: 'luggage_tag',
      title: L10n.current.presetLuggageTitle,
      description: L10n.current.presetLuggageDesc,
      icon: 'luggage',
      category: GalleryCategory.personal,
      fields: [
        GalleryField('name', L10n.current.contactFullName, hint: 'Jane Doe'),
        GalleryField('phone', L10n.current.contactPhone, hint: '+1 555 111 22 33', kind: GalleryFieldKind.phone),
        GalleryField('email', L10n.current.contactEmail, hint: 'jane@example.com', kind: GalleryFieldKind.email, required: false),
      ],
      build: (v) {
        final email = _opt(v, 'email');
        final contact = email == null ? v['phone']! : '${v['phone']} · $email';
        return [
          NdefCodec.encodeText(L10n.current.luggageMessage(v['name']!, contact)),
          NdefCodec.encodePhone(_phoneDigits(v['phone']!)),
        ];
      },
    ),
    GalleryPreset(
      id: 'run_shortcut',
      title: L10n.current.presetRunShortcutTitle,
      description: L10n.current.presetRunShortcutDesc,
      icon: 'home',
      category: GalleryCategory.automation,
      fields: [
        GalleryField('name', L10n.current.shortcutNameLabel, hint: 'Good Night'),
      ],
      build: (v) => [
        NdefCodec.encodeUri('shortcuts://run-shortcut?name=${Uri.encodeComponent(v['name']!)}'),
      ],
    ),
    GalleryPreset(
      id: 'smart_card',
      title: L10n.current.presetSmartCardTitle,
      description: L10n.current.presetSmartCardDesc,
      icon: 'badge',
      category: GalleryCategory.business,
      fields: [
        GalleryField('website', L10n.current.contactWebsite, hint: 'https://example.com', kind: GalleryFieldKind.url),
        GalleryField('name', L10n.current.contactFullName, hint: 'Jane Doe'),
        GalleryField('phone', L10n.current.contactPhone, hint: '+1 555 111 22 33', kind: GalleryFieldKind.phone, required: false),
        GalleryField('email', L10n.current.contactEmail, hint: 'jane@example.com', kind: GalleryFieldKind.email, required: false),
        GalleryField('ssid', L10n.current.wifiSsid, hint: 'Office_WiFi', required: false),
        GalleryField('password', L10n.current.wifiPassword, hint: '••••••••', kind: GalleryFieldKind.password, required: false),
      ],
      build: (v) {
        final url = QuickLinkBuilder.httpsUrl(v['website']!, emptyMessage: L10n.current.webAddress);
        final ssid = _opt(v, 'ssid');
        final password = v['password'] ?? '';
        if (ssid != null && password.isNotEmpty && (password.length < 8 || password.length > 63)) {
          throw QuickLinkException(L10n.current.csvWifiPasswordLength);
        }
        return [
          NdefCodec.encodeUri(url),
          NdefCodec.encodeVCard(
            formattedName: v['name']!,
            phone: _opt(v, 'phone'),
            email: _opt(v, 'email'),
            url: url,
          ),
          if (ssid != null)
            NdefCodec.encodeWifiWsc(
              ssid: ssid,
              authType: password.isEmpty ? WifiAuthType.open : WifiAuthType.wpa2Psk,
              password: password,
              encryptionType: password.isEmpty ? WifiEncryptionType.none : WifiEncryptionType.aes,
            ),
        ];
      },
    ),
    GalleryPreset(
      id: 'lost_item',
      title: L10n.current.presetLostItemTitle,
      description: L10n.current.presetLostItemDesc,
      icon: 'search',
      category: GalleryCategory.personal,
      fields: [
        GalleryField('item', L10n.current.lostItemNameLabel, hint: 'Keys'),
        GalleryField('name', L10n.current.contactFullName, hint: 'Jane Doe'),
        GalleryField('phone', L10n.current.contactPhone, hint: '+1 555 111 22 33', kind: GalleryFieldKind.phone),
      ],
      build: (v) => [
        // SMS first: it is the record phones act on.
        NdefCodec.encodeSms(
          phoneNumber: _phoneDigits(v['phone']!),
          message: L10n.current.lostItemSms(v['item']!),
        ),
        NdefCodec.encodeText(L10n.current.lostItemText(v['item']!, v['name']!)),
      ],
    ),
    GalleryPreset(
      id: 'voice_message',
      title: L10n.current.presetVoiceTitle,
      description: L10n.current.presetVoiceDesc,
      icon: 'mic',
      category: GalleryCategory.personal,
      fields: [
        GalleryField('url', L10n.current.voiceLinkLabel, hint: 'https://www.icloud.com/iclouddrive/...', kind: GalleryFieldKind.url),
      ],
      build: (v) => [NdefCodec.encodeUri(QuickLinkBuilder.httpsUrl(v['url']!, emptyMessage: L10n.current.voiceLinkLabel))],
    ),
    GalleryPreset(
      id: 'shortcut_trigger',
      title: L10n.current.presetShortcutTitle,
      description: L10n.current.presetShortcutDesc,
      icon: 'bolt',
      category: GalleryCategory.automation,
      fields: const [],
      build: (_) => [NdefCodec.encodeUri('nfctagmaster://scan')],
    ),
  ];

  /// `2026-12-31` + `19:00` → local DateTime; null when either is invalid.
  static DateTime? parseEventStart(String date, String time) {
    final d = RegExp(r'^(\d{4})-(\d{1,2})-(\d{1,2})$').firstMatch(date.trim());
    final t = RegExp(r'^(\d{1,2})[:.](\d{2})$').firstMatch(time.trim());
    if (d == null || t == null) return null;
    final y = int.parse(d[1]!), m = int.parse(d[2]!), day = int.parse(d[3]!);
    final h = int.parse(t[1]!), min = int.parse(t[2]!);
    if (m < 1 || m > 12 || day < 1 || day > 31 || h > 23 || min > 59) return null;
    final result = DateTime(y, m, day, h, min);
    // DateTime rolls 31 Feb over to March; reject that.
    if (result.month != m || result.day != day) return null;
    return result;
  }

  /// Presets in [category] (all when null) whose title or description
  /// contains [query], favourites first in the order given.
  static List<GalleryPreset> filter({
    String query = '',
    GalleryCategory? category,
    bool favoritesOnly = false,
    List<String> favorites = const [],
  }) {
    final q = TextSearch.fold(query.trim());
    final list = presets.where((p) {
      if (category != null && p.category != category) return false;
      if (favoritesOnly && !favorites.contains(p.id)) return false;
      if (q.isEmpty) return true;
      return TextSearch.fold('${p.title} ${p.description}').contains(q);
    }).toList();
    int rank(GalleryPreset p) {
      final i = favorites.indexOf(p.id);
      return i < 0 ? favorites.length : i;
    }
    // Stable: keeps catalogue order inside each rank.
    final indexed = list.asMap().entries.toList()
      ..sort((a, b) {
        final r = rank(a.value).compareTo(rank(b.value));
        return r != 0 ? r : a.key.compareTo(b.key);
      });
    return [for (final e in indexed) e.value];
  }

  static GalleryPreset? byId(String id) {
    for (final preset in presets) {
      if (preset.id == id) return preset;
    }
    return null;
  }
}
