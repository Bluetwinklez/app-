# Yeni uygulama başlatma promptu

Yeni bir oturumda bunu kopyalayıp yapıştır, `[...]` yerlerini doldur.

```
Yeni bir iPhone (ve isteğe bağlı Android) uygulaması yapıp App Store'a yükleyeceğiz.
NFC Tag Master'da (github.com/Bluetwinklez/app-) kurduğumuz düzenin aynısını kullan:
oradaki .github/workflows/testflight.yml, tool/asc_provision.py, tool/asc_status.py,
docs/APP_STORE_RELEASE.md ve docs/STORE_LISTING.md dosyalarını örnek al.

Uygulama:
- Ad: [uygulama adı]  (30 karakter)
- Ne yapacak: [kısa açıklama, ana özellikler]
- Bundle ID: com.bluetwinklez.[kisa-ad]
- Diller: Türkçe (ana dil) + [İngilizce / 14 dil]
- Platform: iPhone [+ iPad] [+ Android]

Hesap bilgilerim (değerleri GitHub Secrets'ta, sohbete yazmıyorum):
- Apple Team ID: 65S88D9LF5
- Yeni repo: github.com/Bluetwinklez/[repo-adı] — şu secret'ları NFC repodan kopyalayacağım:
  IOS_APPSTORE_P12_BASE64, IOS_APPSTORE_P12_PASSWORD (dağıtım sertifikası, aynı kalır)
  ASC_API_KEY_ID, ASC_API_ISSUER_ID, ASC_API_PRIVATE_KEY_BASE64 (yükleme anahtarı)
  ASC_ADMIN_KEY_ID, ASC_ADMIN_PRIVATE_KEY (Admin Takım anahtarı: bundle ID, profil,
  iCloud/widget/Watch için; yoksa söyle)
  IOS_TEAM_ID, IOS_BUNDLE_ID (yeni uygulamanın bundle ID'si)
  IOS_APPSTORE_PROFILE_BASE64 (Admin anahtarı yoksa: Apple Developer'dan bu
  uygulama için indirdiğim App Store profili)
- İletişim / gizlilik e-postası: doflerim@gmail.com
- Telif: 2026 Bluetwinklez

Kurallar:
- TestFlight'a yüklemeden ve main'e birleştirmeden önce benden onay iste.
- Model adını commit/PR'lara yazma; anahtar, keystore ve key.properties'i asla commit etme.
- Her değişiklikte analyze + test + iOS/Android derleme kontrolü çalıştır.
- Bana Türkçe, kısa ve adım adım anlat; App Store Connect'te benim yapmam gerekenleri
  hangi menüye tıklayacağımla birlikte yaz.

Hazırlaman gerekenler:
1. Uygulama kodu, testler, 14 dil (istersem), uygulama simgesi (1024×1024, saydamlık yok)
2. GitHub Actions: CI, iOS/Android derleme kontrolü, TestFlight (yükleme + yalnızca
   imzalama + yalnızca kimlik kurulumu modları), App Store durum kontrolü
3. docs/PRIVACY.md (iletişim e-postasıyla) ve main'deki herkese açık bağlantısı
4. docs/STORE_LISTING.md: ad, alt başlık, anahtar kelimeler, tanıtım metni, açıklama
5. docs/APP_STORE_RELEASE.md: kategori, yaş anketi, gizlilik cevapları, İngilizce
   inceleme notu, gönderme adımları
6. Ekran görüntüleri: iPhone 6,9" (1320×2868) ve iPad 13" (2064×2752), Türkçe + İngilizce
7. Info.plist izin açıklamaları (kamera, konum vb.) her dilde, ITSAppUsesNonExemptEncryption

Benim yapacaklarım (sen yönlendir):
- App Store Connect → Uygulamalar → + Yeni Uygulama (ad, ana dil, bundle ID, SKU)
- Uygulama Bilgileri, Uygulama Gizliliği, Fiyat, sürüm sayfası, İncelemeye Gönder
```
