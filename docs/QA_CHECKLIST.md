# Cihaz test listesi (TestFlight)

Gerçek bir iPhone ve birkaç NFC etiketiyle (ideal: NTAG213, NTAG215/216, bir de fabrikadan boş etiket) kontrol edin. Sorun görürseniz ekran görüntüsüyle bildirin.

## 1. İlk açılış
- [ ] Tanıtım rehberi görünüyor; "Başla" sonrası bir daha çıkmıyor
- [ ] Telefon dili Türkçe değilse uygulama o dilde (veya İngilizce) açılıyor
- [ ] Ayarlar → Dil değiştirince tüm ekranlar ve iPhone NFC penceresi yeni dilde
- [ ] Ayarlar → Görünüm → Koyu: tüm sekmeler okunaklı

## 2. Okuma
- [ ] Dolu etiketi okut: içerik, UID, çip (NTAG21x), kapasite doğru
- [ ] Boş/fabrika etiketi okut: "NDEF biçiminde değil" mesajı, uygulama çökmez
- [ ] Okuma penceresinde "İptal": hata sesi/titreşimi yok, durum "iptal edildi"
- [ ] Pencere açıkken 60 sn bekle: "Süre doldu" mesajı
- [ ] Okunan etiketi Paylaş; Kütüphaneye kaydet (fotoğraf ekle)

## 3. Yazma
- [ ] Hazır şablonlar: arama, kategori, yıldızla favori (uygulamayı kapatıp açınca duruyor)
- [ ] URL yaz → "Dokununca ne olur?" kartı doğru; kilit ekranı açıkken etikete dokununca Safari bildirimi
- [ ] Boş etikete yaz: "biçimlendir ve yaz" önerisi çalışıyor
- [ ] Kapasiteyi aşan içerik: uyarı chip'i kırmızı; yazmayı denerken anlaşılır mesaj
- [ ] Yazarken etiketi erken çek: "bağlantı koptu" mesajı

## 4. Toplu yazma
- [ ] 3 etikete seri numaralı yaz (ön ek "A-", 3 basamak): A-001, A-002, A-003 okunuyor
- [ ] Kayıt metninde `{n}` kullanınca numara oraya geliyor
- [ ] CSV ile toplu yazma: her satır ayrı etikete
- [ ] Araçlar → Etiket Kopyala: kaynak okunup 2 etikete yazılıyor

## 5. Araçlar
- [ ] Etiket raporu, iki etiketi karşılaştırma
- [ ] Şifre belirle → şifreyle kaldır (yanlış şifre reddediliyor)
- [ ] Bellek oku / döküm yaz
- [ ] Kilitleme (yalnızca atılabilir bir etikette!) — sonrası salt okunur

## 6. Kütüphane ve yedek
- [ ] Etiket ekle, etiketler "ofis, 2. kat" → filtre chip'leri; fotoğraf değiştir
- [ ] Yedeği dışa aktar → uygulamayı silmeden içe aktar: kopya oluşmuyor
- [ ] CSV dışa aktarma Excel/Numbers'ta Türkçe karakterlerle doğru açılıyor

## 7. Siri ve Kısayollar
- [ ] "Hey Siri, NFC Etiket Yöneticisi ile etiket tara" (dil telefonun diline göre)
- [ ] Kısayollar → Otomasyon → NFC ile tarif kurulumu
- [ ] Safari'de `nfctagmaster://write` açınca Yaz sekmesi

## 8. Widget, Kontrol Merkezi, Apple Watch, iCloud (1.6.0)
- [ ] Ana ekrana "Hızlı Tarama" (küçük) ve "NFC Kısayolları" (orta) widget'larını ekle → dokununca ilgili ekran açılıyor
- [ ] Kilit ekranına yuvarlak widget ekle → dokununca tarama başlıyor
- [ ] Kontrol Merkezi → Denetim ekle → "Etiketi Tara" (iOS 18) → uygulama açılıp tarama başlıyor
- [ ] Apple Watch: Watch uygulamasından NFC Tag Master'ı yükle; iPhone'da uygulamayı açınca saatte son okumalar ve defterler görünüyor
- [ ] Saatte bir deftere dokun → iPhone'da defterde "Apple Watch" girişi
- [ ] Ayarlar → iCloud yedekleme (kart görünüyorsa): Şimdi yedekle → başka cihazda/yeniden kurulumda Geri yükle

## 9. Genel
- [ ] Ayarlar → Hakkında: sürüm 1.6.0, yenilikler listesi
- [ ] Büyük yazı boyutu (Ayarlar → Ekran → Metin Boyutu): taşma yok
- [ ] Uygulama arka plana alınıp geri gelince takılma yok
