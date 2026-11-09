# Google Play yayını

Paket adı: `com.bluetwinklez.nfctagmaster` (yayından sonra değiştirilemez).
Derleme ve yükleme: `.github/workflows/play-release.yml`.

## 1. Bir kez yapılacaklar (Play Console)

1. https://play.google.com/console → geliştirici hesabı aç (tek seferlik 25 $, kimlik doğrulama birkaç gün sürebilir).
2. **Uygulama oluştur**
   - Ad: NFC Tools: Read & Write
   - Varsayılan dil: Türkçe
   - Tür: Uygulama, ücretsiz
3. **GitHub gizli anahtarları** (Settings → Secrets and variables → Actions):
   - `ANDROID_KEYSTORE_BASE64` ve `ANDROID_KEYSTORE_PASSWORD`: yükleme anahtarı dosyasındaki değerler.
   - `PLAY_SERVICE_ACCOUNT_JSON`: aşağıdaki hizmet hesabının JSON dosyasının tüm içeriği.
4. **Hizmet hesabı** (otomatik yükleme için):
   1. https://console.cloud.google.com → yeni proje → "Google Play Android Developer API"yi etkinleştir.
   2. IAM → Hizmet hesapları → oluştur → Anahtarlar → JSON anahtar ekle (dosya iner).
   3. Play Console → Kullanıcılar ve izinler → hizmet hesabının e-postasını davet et → bu uygulama için "Sürümleri yayınla" iznini ver.

Yükleme anahtarı kaybolursa Play Console → Uygulama bütünlüğü → "Yükleme anahtarını sıfırla" ile yenisi istenebilir (uygulamanın asıl imza anahtarını Google saklar).

## 2. İlk derleme

1. GitHub → Actions → **Build and upload Google Play release** → Run workflow (`upload` kapalı).
2. Bitince **app-release-aab** dosyasını indir.
3. Play Console → Test → **Dahili test** → Yeni sürüm → `.aab` dosyasını yükle. İlk sürüm elle yüklenmeli; sonrakileri iş akışı yapar.

## 3. Mağaza girişi

**Ana mağaza girişi** sayfasına aşağıdakileri gir.

| Alan | Türkçe | English |
|---|---|---|
| Ad (≤30) | NFC Tools: Read & Write | NFC Tools: Read & Write |
| Kısa açıklama (≤80) | NFC etiketlerini okuyun, yazın ve yönetin. Hesap yok, reklam yok. | Scan and write NFC tags, create smart templates, and organize your tag library. |

Görseller (`docs/store_screenshots/google_play/`):

- Uygulama simgesi: `icon_512.png`
- Öne çıkan görsel: `feature_graphic_tr.png` / `feature_graphic_en.png` (1024×500)
- Telefon ekran görüntüleri: `phone_tr_*.jpg` / `phone_en_*.jpg` (1080×1920)

**Tam açıklama (Türkçe):**

```
NFC etiketlerinizle daha fazlasını yapın. Her dokunuşu işe yarar hale getirin.

NFC Tools: Read & Write; okuma, yazma, düzenleme ve günlük otomasyonu tek bir uygulamada toplar.

• OKU: İçerik, çip türü (NTAG213/215/216), kapasite, kilit ve şifre durumu
• ETİKET SAĞLIK TESTİ: 0–100 puan ve yapılacaklar
• YAZ: Web, metin, telefon, SMS, e-posta, konum, Wi-Fi, kartvizit, takvim, uygulama bağlantıları
• 27 HAZIR ŞABLON: Misafir Wi-Fi, Google yorum, menü, evcil hayvan künyesi, acil durum kartı ve dahası
• DOKUNUNCA NE OLUR: Telefonun etikete ne yapacağını yazmadan önce görün
• TOPLU YAZMA: Seri numara, CSV'den her satır bir etikete, etiket kopyalama
• ARAÇLAR: Etiket raporu, karşılaştırma, temizleme, kilitleme, şifre, bellek dökümü, QR ve barkod tarayıcı
• KÜTÜPHANE: Etiketlerinize isim, fotoğraf, konum ve etiket ekleyin; harita görünümü
• KAYIT DEFTERLERİ: Yoklama, mesai, ilaç, alışkanlık, ev işleri; hatırlatmalarla
• HAZİNE AVI: İpuçlarını etiketlere yazın, oyuncular sırayla bulsun
• GÜNLÜK ARAÇLAR: Birim çevirici, hesap bölüşme, şifre üretici, zar ve kura, sayaç
• 14 dil ve koyu mod

Gizlilik: Hesap, reklam veya takip yok. Etiket kütüphaneniz varsayılan olarak cihazınızda saklanır.
NFC desteği ve her işlem telefonunuza ve etiket donanımına bağlıdır. Etiketi kalıcı olarak kilitlemek geri alınamaz.
```

**Full description (English):**

```
Your NFC tags can do more. Make every tap count.

NFC Tools: Read & Write brings NFC reading, writing, organization and everyday automation together in one easy-to-use app.

• READ: content, chip type (NTAG213/215/216), capacity, lock and password status
• TAG HEALTH CHECK: a 0–100 score with plain-language advice
• WRITE: websites, text, phone, SMS, email, locations, Wi-Fi, contact cards, calendar events, app links
• 27 READY-MADE TEMPLATES: guest Wi-Fi, review links, menus, pet tags, emergency cards and more
• TAP PREVIEW: see how your phone will handle a tag before you write it
• BATCH WRITING: serial numbers, one CSV row per tag, NDEF copying
• TOOLS: erase, format, compare, memory view, supported password and lock operations, QR and barcode scanner
• LIBRARY: names, notes, labels, photos and locations for your tags, with a map
• LOGBOOKS: attendance, work hours, medication, habits, chores, with reminders
• TREASURE HUNT: write ordered clues to tags and let players find them against a timer
• EVERYDAY TOOLS: unit converter, bill splitter, password generator, dice and draws, tally counter
• Dark mode and 14 languages

Privacy: no account, ads or tracking. Your tag library is stored on your device by default.
NFC availability and individual operations depend on your phone and tag hardware. Permanently locking a tag cannot be undone. Copying NDEF data does not duplicate payment cards, access credentials or encrypted sectors.
```

## 4. Uygulama içeriği formları

Play Console → Politika → **Uygulama içeriği**:

| Form | Cevap |
|---|---|
| Gizlilik politikası | https://github.com/Bluetwinklez/app-/blob/main/docs/PRIVACY.md |
| Reklamlar | Reklam içermiyor |
| Uygulama erişimi | Tüm işlevler özel erişim olmadan kullanılabilir |
| İçerik derecelendirmesi | Kategori: Yardımcı programlar; şiddet, cinsellik, kumar vb. sorularına "Hayır" |
| Hedef kitle | 18 yaş ve üzeri (çocuklara yönelik değil) |
| Veri güvenliği | Veri toplanmıyor ve paylaşılmıyor (her şey cihazda işleniyor). Aktarım şifreleniyor: Evet. Veri silme isteği: Uygulama içinde "Tüm verileri sil" |
| Haber uygulaması / COVID / devlet uygulaması / finans özellikleri | Hayır |
| Sağlık uygulaması | Hayır (ilaç defteri yalnızca kişisel hatırlatmadır) |

Kategori: **Araçlar**. İletişim e-postası: doflerim@gmail.com.

## 5. Kapalı test şartı (yeni kişisel hesaplar)

Kasım 2023'ten sonra açılan kişisel geliştirici hesaplarında üretime çıkmadan önce **kapalı test** zorunludur: en az **12 test kullanıcısı**, **14 gün** boyunca katılmış olmalı. Ardından Play Console → Kontrol paneli → "Üretime erişim için başvur".

1. Test → **Kapalı test** → Sürüm oluştur (dahili testteki sürümü yükselt).
2. Testçiler: Google hesaplarının e-postalarını içeren bir liste ekle.
3. Katılım bağlantısını testçilere gönder; uygulamayı yükleyip 14 gün tutmaları gerekir.

Kuruluş hesaplarında (D-U-N-S ile) bu şart yoktur.

## 6. Sonraki sürümler

Actions → **Build and upload Google Play release** → Run workflow:

- `upload`: açık
- `track`: internal / alpha (kapalı test) / beta (açık test) / production
- `status`: uygulama yayınlanana kadar `draft`; sonra `completed`

Sürüm kodu her çalıştırmada otomatik artar (`100 + çalıştırma numarası`).
