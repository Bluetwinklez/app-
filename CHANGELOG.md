# Değişiklik Günlüğü

## 1.2.0

**NFC Tools'ta olup eksik kalanlar**
- Kayıtları sürükleyerek sıralama, Uyumluluk modu (geri okumasız yazma)
- "NFC çipleri" rehberi, "Uygulamayı değerlendirin"

**Yazma**
- Şablon değişkenleri: `{date}`/`{tarih}`, `{time}`/`{saat}`, `{counter}`/`{sayac}`
- Kütüphanedeki bir etiketi yeni etikete tek dokunuşla yazma
- Yeni şablonlar: Akıllı Kart (site + kartvizit + Wi-Fi), Kayıp Eşya (hazır SMS), Sesli Mesaj

**İşletme**
- Kayıt Defteri: yoklama, ilaç takibi, envanter sayımı; CSV dışa aktarma
- Okutulan etiket kütüphanedeyse yer/not/etiket kartı (envanter)
- Etiket sağlık takibi: son görülme, 30+ gün uyarısı, sıralama
- Sürekli taramada toplu okuma raporu
- QR kodlu yazdırılabilir A4 etiket sayfası (PDF)

**Güvenlik**
- Face ID / Touch ID / cihaz parolasıyla uygulama kilidi
- Parolalı (AES-256) yedekler
- İmzalı etiketler (HMAC-SHA256) ile içerik değişikliği tespiti
- Sahte site / oltalama bağlantı uyarıları (çevrimdışı)

**Diğer**
- Basit mod (çocuklar ve yaşlılar için dev düğmeler)
- Amiibo bilgisi, bellek sayfası düzenleyici, okuma hızı
- MIFARE Classic, DESFire, ISO 15693 ve FeliCa tanıma

## 1.1.0

**Görünüm ve dil**
- Yeni tasarım: yumuşak arka plan, beyaz kartlar, yüzen alt menü
- 14 dil (Türkçe, İngilizce, Almanca, Fransızca, İspanyolca, İtalyanca, Portekizce, Rusça, Arapça, Japonca, Çince, Korece, Felemenkçe, Ukraynaca); iPhone NFC penceresi, izin metinleri ve Siri ifadeleri de çevrildi
- Koyu mod, tanıtım rehberi, titreşim ve ses ayarları

**Yazma**
- Hazır şablon galerisi (18 şablon): kategoriler, arama, favoriler
- "Dokununca ne olur?" önizlemesi (iPhone ve Android için ayrı)
- Çip bazında kapasite uyarıları, boş etiketlere akıllı yazma (biçimlendir + yaz)
- Toplu yazma: seri numara (`{n}`), CSV'den her satır bir etikete, etiket kopyalama sihirbazı

**Okuma ve araçlar**
- Etiket raporu (çip, kilit, şifre durumu), iki etiketi karşılaştırma
- Sürekli tarama ve CSV dışa aktarma, okunan etiketi paylaşma
- Etiket kütüphanesi: isim, fotoğraf, konum, not ve etiketler (klasör gibi)

**Otomasyon**
- Siri ve Kısayollar eylemleri, `nfctagmaster://` bağlantıları
- Hazır ev otomasyonu tarifleri

**Güvenilirlik**
- Yedekler kütüphaneyi ve ayarları da içerir (şema v2)
- Etiket kopması, zaman aşımı ve iptal için anlaşılır mesajlar
- Beklenmeyen hatalarda uygulama kapanmaz

## 1.0.0

- İlk TestFlight sürümü: okuma, yazma, temizleme, kilitleme, geçmiş, şablonlar, yedekleme
