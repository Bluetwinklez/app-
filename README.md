# NFC Etiket Yöneticisi (NFC Tag Master)

Modern, çapraz platform destekli (Android ve iOS) NFC okuma ve yazma uygulaması.

Mac olmadan iPhone 13 için imzalı IPA hazırlama adımları: [iPhone 13 kurulum rehberi](IOS_IPHONE13_SETUP.md). Gerçek iOS derlemesi ve telefonda NFC testi henüz yapılmadı.

Apple Developer Program üyeliğiyle otomatik TestFlight yüklemesi için [TestFlight kurulum rehberi](TESTFLIGHT_SETUP.md) ve [GitHub iş akışı](.github/workflows/testflight.yml) eklendi.

## Uygulanan Özellikler

### 1. NDEF Okuma ve Yazma (Android & iOS)
- **Çapraz Platform NFC Desteği**: Android (`enableReaderMode`, `Ndef`, `NdefFormatable`) ve iOS (Core NFC `NFCNDEFReaderSession`) üzerinde doğrudan platform kanalları (MethodChannel) ile donanım erişimi.
- **Doğrulamalı Yazma**: Yazma işlemi sonrasında etiket verisi otomatik olarak geri okunup içerik baytları (TNF, type, id, payload) ile karşılaştırılarak doğrulanır.
- **Etiket Sıfırlama**: Etiketi boş NDEF mesajı ile temizleme desteği.

### 2. Gelişmiş İş Akışları (NDEF Pano, Yeniden Yazma, Toplu Yazım)
- **Uygulama İçi NDEF Panosu (In-Memory Clipboard)**: Son taranan etiketten veya tarama geçmişinden TNF, type, id ve payload baytlarının tamamını değiştirmeden hafızada anlık görüntü (snapshot) olarak saklar. Kayıt sayısı ve bayt boyutu gösterilir. Besteye yapıştırırken **Üzerine Yaz (Değiştir)** ve **Sonuna Ekle (Append)** seçenekleri sunulur. Beste doluysa üzerine yazmadan önce onay ister.
- **Yeniden Yazma Akışı (Rewrite Flow)**: Taranan kayıtların düzenlenebilir bir kopyasını aşamalandırır ve kullanıcıyı yeni bir hedef etikete dokunmaya davet eder. Hedef etiketin mevcut NDEF içeriğini tamamen değiştireceğini (üzerine yazacağını) açıkça belirtir ve yazmadan önce onay alır. Önceki etikete sessizce yazmaz, taze NFC dokunuşu bekler. İşlem sonrasında sonucu sonraki tarama ile karşılaştırma imkanı sunar.
- **Toplu Etiket Yazımı (Batch Write, 2..100 Etiket)**: Kullanıcı hedef etiket sayısını seçer (2..100). Her yazım denemesi kullanıcı tarafından açıkça başlatılır; otomatik peş peşe tarama veya aynı etikete yanlışlıkla çift yazım engellenir. Deneme bazlı başarı/hata durumu, ilerleme çubuğu ve iptal etme desteği mevcuttur.
- **Gelişmiş Kayıt Denetçisi (Record Inspector)**: Her kaydın TNF, Type (metin ve hex), ID (metin ve hex), payload uzunluğu ve sınırlandırılmış onaltılık (hex) önizlemesini gösterir. Etiketin toplam ve kullanılan kapasite kullanımını sunar; bellek tüketimini korumak için devasa metinler sınırlandırılır.
- **Kayıt Düzenleme ve Ham Düzenleyici (Record Editing & Raw Editor)**: Bestelenmiş NDEF kayıtları listedeki düzenleme butonundan açılır. Güvenle yeniden oluşturulabilen basit türler (Metin, URL, E-posta, Telefon, SMS, Konum, Özel MIME) dolu form alanlarıyla düzenlenir. Özel kayıt kimliği, dil/kodlama bilgisi veya formun göstermediği ek alanlar taşıyabilecek kayıtlar (vCard, Takvim, Wi-Fi WSC, Smart Poster ve bilinmeyen türler) veri kaybını önlemek için TNF, tür, kimlik ve yük baytlarını gösteren ham onaltılık düzenleyicide açılır.
- **Sınırlandırılmış Geri Al / Yinele (Bounded Undo/Redo)**: Beste üzerindeki tüm değişiklikler (kayıt ekleme, panodan değiştirme/ekleme, silme, temizleme, yukarı/aşağı yeniden sıralama, şablon yükleme, yeniden yazma ve düzenleme) `ComposerHistory` modeli ile izlenir. En fazla 30 anlık görüntü (snapshot) saklanır; bayt dizileri derinlemesine kopyalanarak (deep clone) sonraki mutasyonların geçmiş durumları bozması önlenir. Geri al ve yinele butonları araç çubuğunda görünür olup yalnızca geçerli durumlarda etkinleşir.
- **Kayıt Yeniden Sıralama (Reordering)**: Yazma bestesindeki kayıtların sırası yukarı/aşağı butonlarıyla değiştirilebilir.
- **Çevrimdışı URL Güvenlik İncelemesi (URL Safety Preview)**: Web URL ve SmartPoster kayıtları için şema, sunucu adı (host), port, kullanıcı bilgisi (userinfo), doğrudan IP adresi kullanımı (IPv4/IPv6 literal) ve Punycode (`xn--`) göstergelerini çevrimdışı kurallarla inceler. URL'ler asla otomatik olarak açılmaz ve antivirüs/zararlı yazılım taraması iddiasında bulunulmaz.

### 3. Desteklenen Kayıt Türleri (NDEF Record Types)
- **Metin (Text)**: UTF-8 / UTF-16 kodlama ve IANA dil kodu desteği.
- **Web URL**: URI tanımlayıcı kod önek sıkıştırmasıyla (`https://`, `http://`, vb.).
- **E-posta (Email)**: `mailto:` URI şeması (alıcı, konu, gövde).
- **Telefon (Phone)**: `tel:` URI şeması.
- **SMS**: `sms:` URI şeması (alıcı ve mesaj metni).
- **GPS Konumu (Location)**: `geo:lat,lng` URI şeması.
- **Kişi Kartı (vCard 3.0)**: `text/vcard` MIME türü. RFC 2426 ve RFC 2425 kurallarına uygun CRLF sonlandırmaları, özel karakter kaçışları (`\`, `;`, `,`, `\n`) ve satır açma (unfolding) desteği.
- **Takvim Etkinliği (Calendar Event - iCal)**: `text/calendar` MIME türü. RFC 5545 iCalendar VEVENT formatı, UTC `DTSTART`/`DTEND` (`YYYYMMDDTHHMMSSZ`), UID, özet, konum ve açıklama alanları.
- **Akıllı Poster (NFC Forum Smart Poster - Sp)**: `urn:nfc:wkt:Sp` TNF well-known türü. İçerisinde iç içe (nested) NDEF mesajı olarak Web URI kaydı ve opsiyonel dil kodlu Başlık (Text) kaydı barındırır.
- **Wi-Fi Ağ Yapılandırması (Wi-Fi Simple Configuration - WSC)**: `application/vnd.wfa.wsc` MIME türü. Standart Wi-Fi Alliance WSC TLV (Type-Length-Value) kimlik bilgisi (Credential) yapısı; SSID, Kimlik Doğrulama Türü (WPA2-PSK, WPA/WPA2, Open), Şifreleme (AES, TKIP) ve Ağ Anahtarı (şifre).
- **Özel MIME Kayıtları (Custom MIME)**: Belirlenen herhangi bir MIME türüyle eşleşen ham UTF-8 metin veya onaltılık (hexadecimal) bayt yükü.
- **Hazır Bağlantılar**: Özel URI (her şema), Sosyal Ağlar (Instagram, X, TikTok, WhatsApp vb.), Video, Arama, Dosya bağlantısı, FaceTime, FaceTime Ses, Adres (Apple/Google Haritalar), Ödeme bağlantısı, Android Uygulama Kaydı (`android.com:pkg`) ve Bluetooth eşleştirme (`application/vnd.bluetooth.ep.oob`).
- **Etiket Kilitleme**: Etiketi kalıcı olarak salt okunur yapar (Android `Ndef.makeReadOnly`, iOS `writeLock`). Geri alınamaz; onay kutusu ile ayrıca onay istenir.

### 4. İsteğe Bağlı Yerel Veri, Şablon ve Kural Yönetimi
- **Kullanıcı İsteğine Bağlı Tarama Geçmişi**: Gizlilik gözetilerek varsayılan olarak kapalıdır; ayarlar sekmesinden kullanıcı tarafından etkinleştirilebilir. Hatalı taramalar geçmişe kaydedilmez.
- **Geçmiş İçi Arama ve Filtreleme**: Kayıtlı taramalar UID, metin içeriği veya kayıt türü (URL, Metin, Wi-Fi vb.) ile çevrimdışı olarak anında filtrelenebilir. Arama sonucunda eşleşme bulunmadığında açıklayıcı durum ve temizleme seçeneği sunulur.
- **Yazma Şablonları**: Sık kullanılan NDEF kayıt kümeleri şablon olarak adlandırılıp yerel depolamaya kaydedilebilir ve doğrudan yazma bestesine aktarılabilir.
- **Uygulama İçi Etiket Kuralları (In-App Tag Rules)**: Etiket UID yerine doğrudan ham NDEF mesaj baytlarının SHA-256 özetine (64 karakter) bağlanan yerel notlar. Başarılı bir tarama sonrasında eşleşen not kart olarak görüntülenir. Harici eylem başlatmaz, URL otomatik açmaz ve cihaz ayarlarını değiştirmez. Kullanıcı son tarama için not ekleyebilir, düzenleyebilir veya silebilir.
- **Sürüm Kontrollü JSON Yedekleme (BackupCodec)**: Şablonları, uygulama içi etiket kurallarını ve isteğe bağlı tarama geçmişini `schemaVersion: 1` formatında dışa aktarır ve içe aktarır. 2 MiB boyut sınırı, öğe sayı sınırları ve Base64 doğrulaması zorunludur. İçe aktarma birleştirme (merge) mantığıyla çalışır; mevcut verileri asla silmez ve yerel geçmiş kapalıysa geçmişi sessizce açmaz (onay ister veya geçmişi atlar).
- **Mobil Paylaşım ve Dosya Seçimi**: JSON dışa aktarma `share_plus` (XFile.fromData ve fileNameOverrides) paylaşım menüsüyle; içe aktarma `file_selector` (`openFile`) ile gerçekleştirilir. Ağ çağrısı yapılmaz.
- **QR Kod Önizleme**: Yalnızca okunabilir Düz Metin (Text) ve Web URL kayıtları için kullanıcı tarafından butona basıldığında açılan `qr_flutter` destekli QR önizleme penceresi. Taşma ve kapasite korumalıdır. Wi-Fi parolaları veya ikili veriler güvenlik nedeniyle otomatik olarak QR koduna dönüştürülmez.
- **Güvenli Depolama**: Veriler cihaz belgeler dizininde (`getApplicationDocumentsDirectory()`) saklanır. Geçici dosya yazımı ve yeniden adlandırma (atomic write) ile kaydedilir; bir dosyadaki bozulma diğer geçerli verileri etkilemez.

## Belirgin Sınırlar ve Kısıtlamalar

- **NFC Tools Eşitliği Değildir**: Uygulama kapsamlı NFC Tools paketinin tam dengi olmayıp, odaklanmış NDEF okuma/yazma, denetleme ve şablonlama yetenekleri sunmaktadır.
- **Klonlama İddiası Yoktur**: İçerik kopyalama ve pano işlemleri yalnızca açık NDEF mesaj kayıtlarını (TNF, type, id, payload) kopyalar. Cihaz seri numarası (UID), şifreli sektörler veya özel donanım hafızaları klonlanamaz ve kopyalanmaz.
- **Hassas Yedek JSON Verisi**: Yedek JSON dosyası düz metin formatında olup kaydedilmiş Wi-Fi parolalarını veya kişi verilerini içerebilir. Dışa aktarma ve içe aktarma öncesinde kullanıcıya açık güvenlik uyarısı verilir; dosyanın güvenli ortamda saklanması kullanıcının sorumluluğundadır.
- **Uygulama İçi Kural Sınırları**: Etiket kuralları tamamen uygulama içi ve yereldir. Kurallar, etiket değişse bile aynı içeriği tanıyabilmek için UID yerine tam NDEF içerik baytlarının SHA-256 özetine bağlanmıştır. Arka planda tetikleme yapmaz, URL otomatik açmaz ve cihaz ayarı değiştirmez.
- **Wi-Fi Otomatik Katılım Sınırı**: Etikette saklanan Wi-Fi bilgileri standart WSC formatında yazılsa dahi ne Apple iOS ne de modern Android sürümleri kullanıcı etkileşimi/onayı olmadan otomatik olarak ağa bağlanmaz; etiket üzerindeki parola şifrelenmemiş durumdadır.
- **Çevrimdışı URL İncelemesi Sınırı**: URL inceleme aracı yalnızca yerel sözdizimsel kuralları (IP literal, userinfo, Punycode, bilinmeyen şemalar) kontrol eder; gerçek zamanlı web itibar sorgusu veya antivirüs/malware tespiti yapmaz.
- **Toplu Yazım Hedef Ayrımı**: Toplu yazım sırasında etiketlerin fiziksel olarak farklı olduğu garanti edilmez; kullanıcının etiketleri sırayla cihaza yaklaştırması gerekir.
- **Ödeme Kartı ve Kimlik Klonlama Yoktur**: Finansal ödeme kartları (EMV, kredi/banka kartları), şifreli geçiş kartları veya yetkisiz APDU emülasyonu/klonlaması kesinlikle desteklenmez.
- **Fiziksel Cihaz Testi ve Derleme**: Flutter analiz ve otomatik testler geçti; Android debug APK Windows ortamında derlendi. NFC donanımı fiziksel cihazda, iOS uygulaması ise macOS/Xcode ortamında henüz doğrulanmadı.
- **iOS Derleme Gereksinimleri**: iOS sürümünü derlemek, imzalamak ve Core NFC yetkileriyle cihazda çalıştırmak için macOS işletim sistemi ve Xcode gereklidir.
