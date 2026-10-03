# NFC Etiket Yöneticisi (NFC Tag Master)

iPhone ve Android için NFC etiketlerini okuma, yazma ve yönetme uygulaması. Flutter ile yazıldı; NFC erişimi platform kanalları üzerinden doğrudan Core NFC (iOS) ve `android.nfc` (Android) ile yapılır.

- **Sürüm:** 1.5.0 — değişiklikler için [CHANGELOG.md](CHANGELOG.md)
- **Gereksinimler:** iOS 16+ (iPhone 8 ve sonrası), Android 7.0+ (NFC donanımı)
- **Diller:** Türkçe, English, Deutsch, Français, Español, Italiano, Português, Русский, العربية, 日本語, 简体中文, 한국어, Nederlands, Українська
- **Gizlilik:** Hesap, sunucu, reklam veya takip yok — [docs/PRIVACY.md](docs/PRIVACY.md)

## Özellikler

**Okuma**
- İçerik, UID, çip tahmini (NTAG213/215/216, Ultralight), üretici, kapasite, yazılabilirlik
- Etiket raporu: NDEF biçimi, statik/dinamik kilit bitleri, şifre koruması
- İki etiketi karşılaştırma, sürekli tarama (CSV dışa aktarma), okunan etiketi paylaşma
- Tarama geçmişi (isteğe bağlı, varsayılan kapalı), Türkçe karakter duyarsız arama

**Yazma**
- Kayıt türleri: metin, URL, e-posta, telefon, SMS, konum, vCard, takvim, Smart Poster, Wi-Fi (WSC), özel MIME, Bluetooth, uygulama kayıtları ve hazır sosyal/harita bağlantıları
- 27 hazır şablon (kategoriler, arama, favoriler)
- "Dokununca ne olur?" önizlemesi: iPhone ve Android'in etikete ne yapacağı
- Çip bazında kapasite uyarısı; boş (NDEF olmayan) NTAG etiketlere akıllı yazma
- Doğrulamalı yazma (geri okuyup bayt bayt karşılaştırma), geri al/yinele
- Toplu yazma (2–100 etiket): seri numara (`{n}` yer tutucusu), CSV'den her satır bir etiket, etiket kopyalama sihirbazı
- QR koddan, CSV'den, JSON'dan ve panodan içe aktarma

**Araçlar**
- Temizleme, kalıcı kilitleme, NTAG şifre belirleme/kaldırma
- Bellek okuma, NDEF biçimlendirme, bellek dökümü yazma, ham komutlar

**Kütüphane ve otomasyon**
- Etiket kütüphanesi: isim, fotoğraf, konum, not, kategori ve etiketler (klasör gibi)
- Siri / Kısayollar eylemleri ("Etiketi Tara", "Etikete Yaz") ve `nfctagmaster://scan|write|tools|history|settings` bağlantıları
- Hazır ev otomasyonu tarifleri
- JSON yedekleme (şema v2: şablonlar, kurallar, kütüphane, isteğe bağlı geçmiş)

**İşletme ve güvenlik (1.2.0)**
- Kayıt Defteri (yoklama, ilaç, envanter), son görülme takibi, toplu okuma raporu
- QR kodlu yazdırılabilir etiket sayfası (PDF)
- Face ID / cihaz parolası ile uygulama kilidi, parolalı (AES-256) yedekler
- İmzalı etiketler (HMAC-SHA256) ve çevrimdışı sahte site uyarıları
- Şablon değişkenleri `{date}` `{time}` `{counter}`, Akıllı Kart / Kayıp Eşya / Sesli Mesaj şablonları
- Basit mod, amiibo bilgisi, bellek sayfası düzenleyici, NFC çipleri rehberi, Uyumluluk modu

**1.3.0**
- Giriş/Çıkış (mesai) defteri ve okutunca deftere otomatik kayıt
- Kontrol aralığı / bakım hatırlatıcısı, tablodan toplu içe aktarma
- Kopya etiket uyarısı, NDEF Doktoru

**1.4.0**
- Güvenlik ve gizlilik bölümü, Anahtar Zinciri'nde imza anahtarı, Tüm verileri sil
- Etiket haritası, ekip paketleri, alternatif uygulama simgeleri

**1.5.0**
- Fikirler, istatistikler, QR/barkod tarayıcı, kayıt birleştirme, dijital kartvizit
- Alışkanlık, görev tablosu, besleme ve ziyaretçi defterleri; bildirim hatırlatıcıları
- Demirbaş/garanti, şablonları QR ile paylaşma, 12 simge ve 9 renk, sesli okuma

**Görünüm**
- Açık/koyu tema, tanıtım rehberi, titreşim ve ses ayarları

## Bilinen sınırlar

- UID ve şifreli sektörler kopyalanamaz; kopyalama yalnızca NDEF içeriğini kapsar.
- iPhone bazı içerikleri (metin, vCard, Wi-Fi, `geo:`) arka planda kendiliğinden açmaz; uygulama bunu yazmadan önce gösterir.
- Ödeme kartı, kimlik kartı veya erişim kartı klonlama/emülasyonu desteklenmez.
- Parolasız yedek dosyaları düz JSON'dur ve Wi-Fi şifreleri içerebilir; dışa aktarırken parola koruması önerilir.
- Etiket haritası açıldığında harita görüntüleri OpenStreetMap'ten indirilir.

## Geliştirme

```bash
flutter pub get
flutter gen-l10n          # lib/l10n/*.arb → app_localizations*.dart
flutter analyze
flutter test
```

- Metinler `lib/l10n/app_<dil>.arb` dosyalarındadır (şablon: `app_tr.arb`). `test/no_hardcoded_strings_test.dart` koda gömülü Türkçe metin kalmadığını, `test/l10n_test.dart` tüm dillerin aynı anahtarlara sahip olduğunu kontrol eder.
- iOS'un sistem NFC penceresi metinleri Flutter'dan gönderilir (`lib/services/native_messages.dart`); izin metinleri ve Siri ifadeleri `ios/Runner/<dil>.lproj/` altındadır.

## CI / yayın

| İş akışı | Ne zaman | Ne yapar |
|---|---|---|
| `ci.yml` | her push | gen-l10n tutarlılığı, analyze, testler |
| `ios-compile.yml` | `ios/` veya bağımlılık değişince | imzasız simülatör derlemesi |
| `android-compile.yml` | `android/` veya bağımlılık değişince | debug APK derlemesi |
| `testflight.yml` | elle veya `ios-v*` etiketi | imzalı derleme ve TestFlight yüklemesi |

Kurulum rehberleri: [TestFlight](TESTFLIGHT_SETUP.md) · [Mac olmadan iPhone IPA](IOS_IPHONE13_SETUP.md) · [Mağaza metinleri](docs/STORE_LISTING.md) · [Cihaz test listesi](docs/QA_CHECKLIST.md)
