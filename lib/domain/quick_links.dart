import 'dart:convert';
import 'dart:typed_data';
import 'ndef_record.dart';

/// Ready-made record shortcuts offered in the composer next to the core
/// NDEF types. Most of them build a URI record from a few friendly fields.
enum QuickLinkKind {
  customUri,
  social,
  video,
  search,
  file,
  facetime,
  facetimeAudio,
  address,
  payment,
  app,
  bluetooth,
}

enum SocialNetwork {
  instagram('Instagram', 'https://www.instagram.com/'),
  x('X (Twitter)', 'https://x.com/'),
  tiktok('TikTok', 'https://www.tiktok.com/@'),
  facebook('Facebook', 'https://www.facebook.com/'),
  linkedin('LinkedIn', 'https://www.linkedin.com/in/'),
  youtube('YouTube', 'https://www.youtube.com/@'),
  github('GitHub', 'https://github.com/'),
  telegram('Telegram', 'https://t.me/'),
  whatsapp('WhatsApp (telefon)', 'https://wa.me/'),
  snapchat('Snapchat', 'https://www.snapchat.com/add/'),
  twitch('Twitch', 'https://www.twitch.tv/'),
  threads('Threads', 'https://www.threads.net/@');

  final String label;
  final String baseUrl;
  const SocialNetwork(this.label, this.baseUrl);
}

enum SearchEngine {
  google('Google', 'https://www.google.com/search?q='),
  bing('Bing', 'https://www.bing.com/search?q='),
  duckduckgo('DuckDuckGo', 'https://duckduckgo.com/?q='),
  youtube('YouTube', 'https://www.youtube.com/results?search_query='),
  wikipedia('Wikipedia', 'https://tr.wikipedia.org/w/index.php?search=');

  final String label;
  final String baseUrl;
  const SearchEngine(this.label, this.baseUrl);
}

enum MapProvider {
  apple('Apple Haritalar', 'https://maps.apple.com/?q='),
  google('Google Haritalar', 'https://www.google.com/maps/search/?api=1&query=');

  final String label;
  final String baseUrl;
  const MapProvider(this.label, this.baseUrl);
}

/// Thrown when a quick link input cannot be turned into a record.
class QuickLinkException implements Exception {
  final String message;
  const QuickLinkException(this.message);

  @override
  String toString() => message;
}

class QuickLinkBuilder {
  static const String bluetoothOobMime = 'application/vnd.bluetooth.ep.oob';

  /// Accepts any URI with a scheme, e.g. `spotify:track:...` or `https://...`
  static bool isValidUri(String value) {
    final parsed = Uri.tryParse(value);
    if (parsed == null || !parsed.hasScheme) return false;
    if (parsed.scheme == 'http' || parsed.scheme == 'https') {
      return parsed.host.isNotEmpty;
    }
    return value.length > parsed.scheme.length + 1;
  }

  static String socialUrl(SocialNetwork network, String handle) {
    var clean = handle.trim();
    if (clean.isEmpty) {
      throw const QuickLinkException('Kullanıcı adı boş bırakılamaz.');
    }
    if (clean.startsWith('http://') || clean.startsWith('https://')) {
      return clean;
    }
    clean = clean.replaceFirst(RegExp(r'^@'), '');
    if (network == SocialNetwork.whatsapp) {
      clean = clean.replaceAll(RegExp(r'[^\d]'), '');
      if (clean.length < 6) {
        throw const QuickLinkException('Ülke koduyla birlikte telefon numarası giriniz (Örn: 905551112233).');
      }
    } else if (clean.contains(RegExp(r'\s'))) {
      throw const QuickLinkException('Kullanıcı adı boşluk içeremez.');
    }
    return '${network.baseUrl}${Uri.encodeComponent(clean)}';
  }

  /// Accepts a full video URL or a bare YouTube video id.
  static String videoUrl(String input) {
    final clean = input.trim();
    if (clean.isEmpty) {
      throw const QuickLinkException('Video bağlantısı boş bırakılamaz.');
    }
    if (clean.startsWith('http://') || clean.startsWith('https://')) {
      if (!isValidUri(clean)) {
        throw const QuickLinkException('Geçerli bir video bağlantısı giriniz.');
      }
      return clean;
    }
    if (RegExp(r'^[A-Za-z0-9_-]{6,20}$').hasMatch(clean)) {
      return 'https://www.youtube.com/watch?v=$clean';
    }
    throw const QuickLinkException('Video bağlantısı (https://...) veya YouTube video kimliği giriniz.');
  }

  static String searchUrl(SearchEngine engine, String query) {
    final clean = query.trim();
    if (clean.isEmpty) {
      throw const QuickLinkException('Arama metni boş bırakılamaz.');
    }
    return '${engine.baseUrl}${Uri.encodeQueryComponent(clean)}';
  }

  static String httpsUrl(String input, {required String emptyMessage}) {
    final clean = input.trim();
    if (clean.isEmpty || clean == 'https://') {
      throw QuickLinkException(emptyMessage);
    }
    final withScheme = clean.contains('://') ? clean : 'https://$clean';
    final parsed = Uri.tryParse(withScheme);
    if (parsed == null ||
        (parsed.scheme != 'https' && parsed.scheme != 'http') ||
        parsed.host.isEmpty) {
      throw const QuickLinkException('Geçerli bir web adresi giriniz (Örn: https://example.com/dosya.pdf).');
    }
    return withScheme;
  }

  /// FaceTime accepts a phone number or an Apple ID e-mail address.
  static String facetimeUri(String target, {required bool audioOnly}) {
    final clean = target.trim().replaceAll(RegExp(r'[\s\-\(\)]'), '');
    final isEmail = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(clean);
    final isPhone = RegExp(r'^\+?\d{3,20}$').hasMatch(clean);
    if (!isEmail && !isPhone) {
      throw const QuickLinkException('Telefon numarası veya Apple kimliği e-posta adresi giriniz.');
    }
    return '${audioOnly ? 'facetime-audio' : 'facetime'}:$clean';
  }

  static String addressUrl(MapProvider provider, String address) {
    final clean = address.trim();
    if (clean.isEmpty) {
      throw const QuickLinkException('Adres boş bırakılamaz.');
    }
    return '${provider.baseUrl}${Uri.encodeQueryComponent(clean)}';
  }

  /// Android Application Record: opens (or offers to install) the given app
  /// on Android. iOS ignores this record type.
  static NdefRecordModel androidAppRecord(String packageName) {
    final clean = packageName.trim();
    if (!RegExp(r'^[A-Za-z][A-Za-z0-9_]*(\.[A-Za-z][A-Za-z0-9_]*)+$').hasMatch(clean)) {
      throw const QuickLinkException('Geçerli bir Android paket adı giriniz (Örn: com.whatsapp).');
    }
    return NdefRecordModel(
      tnf: NdefTnf.external,
      type: Uint8List.fromList(ascii.encode('android.com:pkg')),
      id: Uint8List(0),
      payload: Uint8List.fromList(ascii.encode(clean)),
    );
  }

  /// Bluetooth BR/EDR out-of-band pairing record (Android can pair from it).
  static NdefRecordModel bluetoothRecord(String macAddress, {String? deviceName}) {
    final hex = macAddress.trim().replaceAll(RegExp(r'[:\-\s]'), '');
    if (!RegExp(r'^[0-9A-Fa-f]{12}$').hasMatch(hex)) {
      throw const QuickLinkException('Geçerli bir Bluetooth MAC adresi giriniz (Örn: 00:11:22:AA:BB:CC).');
    }
    final mac = <int>[
      for (int i = 0; i < 12; i += 2) int.parse(hex.substring(i, i + 2), radix: 16),
    ];

    final body = BytesBuilder();
    // The OOB address field is little-endian
    body.add(mac.reversed.toList());
    final name = deviceName?.trim() ?? '';
    if (name.isNotEmpty) {
      final nameBytes = utf8.encode(name);
      if (nameBytes.length > 240) {
        throw const QuickLinkException('Cihaz adı çok uzun.');
      }
      body.addByte(nameBytes.length + 1);
      body.addByte(0x09); // EIR: Complete Local Name
      body.add(nameBytes);
    }

    final bodyBytes = body.toBytes();
    final total = bodyBytes.length + 2;
    final payload = Uint8List(total)
      ..[0] = total & 0xFF
      ..[1] = (total >> 8) & 0xFF
      ..setRange(2, total, bodyBytes);

    return NdefCodec.encodeCustomMime(mimeType: bluetoothOobMime, payload: payload);
  }
}
