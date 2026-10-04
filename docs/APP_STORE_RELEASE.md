# App Store yayın rehberi

Mağaza metinleri (14 dil): `docs/STORE_LISTING.md`. Gizlilik politikası: `docs/PRIVACY.md`.

## 1. Uygulama bilgileri (App Store Connect → Uygulama Bilgileri)

| Alan | Değer |
|---|---|
| Kategori | Birincil: **Utilities (Araçlar)**, ikincil: **Productivity (Verimlilik)** |
| Gizlilik politikası URL'si | https://github.com/Bluetwinklez/app-/blob/main/docs/PRIVACY.md |
| Destek URL'si | https://github.com/Bluetwinklez/app- |
| Telif hakkı | 2026 Bluetwinklez |
| Yaş sınırı | Anketteki tüm sorulara "Hayır / Yok" → **4+** |
| Fiyat | Ücretsiz |

Gizlilik politikası bağlantısı, değişiklikler `main` dalına birleştirildikten sonra çalışır.

## 2. Uygulama gizliliği (App Privacy)

- "Bu uygulamadan veri topluyor musunuz?" → **Hayır, veri toplamıyoruz.**
- Gerekçe: Konum, fotoğraflar, notlar ve kayıtlar yalnızca cihazda kalır. iCloud yedeği kullanıcının kendi hesabına gider. Harita görüntüleri OpenStreetMap'ten indirilir, ama uygulama bu sırada hiçbir veri göndermez. Apple'ın tanımına göre bunlar "toplama" sayılmaz.

## 3. İhracat uyumluluğu (şifreleme)

`ITSAppUsesNonExemptEncryption = NO` uygulamanın ayarlarında zaten var. Yedek şifrelemesi işletim sisteminin standart AES algoritmasını kullanıyor, bu yüzden Apple ek belge istemez.

## 4. İnceleme notu (App Review Information → Notes)

İnceleme ekibi İngilizce okuduğu için not İngilizce:

```
NFC Tag Master reads and writes NFC tags (NTAG213/215/216, MIFARE Ultralight and other NDEF tags).
No account or sign-in is needed.

Testing without an NFC tag:
- Tools tab: the template gallery, QR/barcode scanner, text-from-photo (OCR), tag map, statistics and logbooks all work without a tag.
- Write tab: compose any record (link, Wi-Fi, contact card...) and use "QR" to preview it; "Tap preview" shows what iPhone and Android will do with the tag.
- Home Screen / Lock Screen widgets and the Control Center control open the app on the scan or write screen.
- The Apple Watch app shows recent scans and lets you add a logbook entry with one tap (create a logbook in Tools > Logbooks first).

Testing with a tag: tap "Scan" on the Read tab and hold the top of the iPhone near any NFC sticker or card.

Location is only used when the user taps "Add current location" or searches for an address. Notifications are only local reminders the user sets up.
```

İletişim bilgileri: ad, soyad, telefon ve doflerim@gmail.com. Demo hesap gerekmiyor.

## 5. Ekran görüntüleri

Hazır görüntüler: `docs/store_screenshots/` (Türkçe `tr_`, İngilizce `en_`). Diğer dillerde İngilizce görüntüler kullanılabilir.

- iPhone 6,9 inç (1320×2868): en az 3, en fazla 10 görüntü
- iPad 13 inç (2064×2752): uygulama iPad'de de çalıştığı için zorunlu
- Apple Watch (isteğe bağlı): 410×502

## 6. Gönderme

1. TestFlight'ta son derlemeyi telefonda dene.
2. App Store Connect → uygulama → **+ Sürüm** (ör. 1.6.0).
3. Metinleri, ekran görüntülerini ve inceleme notunu gir; **Derleme** bölümünden TestFlight derlemesini seç.
4. **İncelemeye Ekle → İncelemeye Gönder**. İnceleme genelde 24–48 saat sürer.
5. Onaydan sonra "Otomatik yayınla" seçiliyse uygulama hemen mağazaya çıkar.
