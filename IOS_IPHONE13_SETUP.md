# iPhone 13'e kurulum (Windows, yerel Mac olmadan)

Uygulama iPhone 13'te yerel Core NFC kullanır. Safari'de çalışan bir web sürümü aynı NFC okuma/yazma işlevini sağlayamaz. Bu depoda iOS kaynak kodu ve GitHub'ın macOS makinesinde **imzalı ad-hoc IPA** üreten [iş akışı](.github/workflows/build-ios.yml) hazırdır. Henüz bir GitHub uzak deposu, Apple imzalama bilgileri veya çalıştırılmış iOS derlemesi yoktur.

Bu ad-hoc yol için Apple Developer Program üyeliği gerekir. Ücretsiz Apple hesabıyla kendi cihazında Xcode üzerinden sınırlı süreli test yapılabilir; Apple, ücretsiz hesap için web portalından ad-hoc dağıtım sertifikası ve profili sağlamaz. Dolayısıyla ücretsiz hesapla bu otomatik iş akışı çalışmaz. [Apple'ın üyelik karşılaştırması](https://developer.apple.com/support/compare-memberships/) ve [hesap açıklaması](https://developer.apple.com/help/account/basics/about-your-developer-account) ayrıntıları verir.

## Hazırlık

1. Projeyi kendi GitHub depona gönder. Şu anda `git remote -v` boş; iş akışını burada henüz başlatamam. Depoyu özel tut ve `.p12`, `.mobileprovision` dosyalarını hiçbir zaman Git'e ekleme.
2. iPhone 13'ün UDID'sini Windows'ta Apple Devices veya iTunes üzerinden bul. Apple Developer portalında **Devices** bölümüne kaydet. Telefonda **Ayarlar → Gizlilik ve Güvenlik → Geliştirici Modu** seçeneğini aç; görünmüyorsa ilk geliştirici uygulaması yükleme aşamasında cihazın yönergelerini izle.
3. Apple Developer portalında benzersiz bir explicit App ID oluştur. **Near Field Communication Tag Reading** yeteneğini etkinleştir. Bu App ID için bir **Apple Distribution** sertifikası ve telefonun UDID'sini içeren **Ad Hoc** provisioning profile oluştur. Sertifikanın özel anahtarıyla birlikte `.p12` dosyasına ve şifresine ihtiyacın var. Yalnızca portalda görünen `.cer` dosyası yeterli değildir.
4. GitHub deponda **Settings → Secrets and variables → Actions** alanına aşağıdaki beş repository secret'ını ekle:

| Secret | Değer |
| --- | --- |
| `IOS_P12_BASE64` | `.p12` dosyasının Base64 içeriği |
| `IOS_P12_PASSWORD` | `.p12` şifresi |
| `IOS_MOBILEPROVISION_BASE64` | Ad Hoc `.mobileprovision` dosyasının Base64 içeriği |
| `IOS_BUNDLE_ID` | Profildeki explicit bundle ID; ör. `com.seninadın.nfctagmaster` |
| `IOS_TEAM_ID` | Apple Developer Team ID |

Mac'in yoksa sertifika isteğini Windows'ta Git for Windows içindeki OpenSSL ile oluşturabilirsin. Güvenli bir yerel klasörde şu komutları çalıştır; `distribution.key` dosyasını gizli tut:

```powershell
& 'C:\Program Files\Git\mingw64\bin\openssl.exe' genrsa -out distribution.key 2048
& 'C:\Program Files\Git\mingw64\bin\openssl.exe' req -new -key distribution.key -out distribution.csr -subj '/CN=iPhone Distribution'
```

Apple Developer portalında **Certificates → + → Apple Distribution** bölümüne `distribution.csr` dosyasını yükle ve verilen `distribution.cer` dosyasını indir. Aynı klasörde özel anahtarla birleştir:

```powershell
& 'C:\Program Files\Git\mingw64\bin\openssl.exe' x509 -inform DER -in distribution.cer -out distribution.pem
& 'C:\Program Files\Git\mingw64\bin\openssl.exe' pkcs12 -export -inkey distribution.key -in distribution.pem -out distribution.p12
```

Son komutun istediği şifreyi `IOS_P12_PASSWORD` secret'ına koy. `distribution.p12` dosyasını `IOS_P12_BASE64` için kullan. Bu dosyaları ve özel anahtarı Git'e yükleme.

Windows PowerShell'de dosyaları Base64 olarak panoya almak için:

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes('C:\yol\sertifika.p12')) | Set-Clipboard
[Convert]::ToBase64String([IO.File]::ReadAllBytes('C:\yol\profil.mobileprovision')) | Set-Clipboard
```

Her komutu çalıştırdıktan sonra panodaki metni yalnızca karşılık gelen GitHub Secret alanına yapıştır. Şifreyi ve Base64 içeriğini sohbet mesajına gönderme.

## Derleme ve yükleme

GitHub'da **Actions → Build signed iPhone IPA → Run workflow** seç. İş akışı macOS üzerinde Flutter 3.47.5, CocoaPods ve Xcode ile uygulamayı derler; profilin Team ID, bundle ID, NFC yetkisi ve kayıtlı cihaz içerdiğini kontrol eder. Başarılı olursa çalıştırmanın **Artifacts** bölümünden `iphone-adhoc-ipa` dosyasını indir; ZIP içindeki `.ipa` imzalı uygulamadır. İş akışının gerçekten başarılı olması gerekir; Windows'ta iOS derlemesini ve fiziksel NFC davranışını doğrulayamadım.

Windows'ta iPhone'u USB ile bağlayıp bilgisayara güven verdikten sonra, [iMazing'in IPA içe aktarma ve kurma yönergelerini](https://imazing.com/guides/how-to-manage-apps-without-itunes) izleyerek imzalı IPA'yı aktarabilirsin. Profildeki UDID bu iPhone'a ait olmalı ve sertifika/profil geçerli kalmalıdır. Kurulumdan sonra iPhone'da uygulamayı açıp gerçek bir NDEF etiketinde okuma ve yazma testleri yap.

Ücretsiz Apple hesabın varsa bu iş akışına sertifika/profil sağlayamazsın; geçici bir Mac'te Xcode ile Personal Team olarak cihazına yükleme veya Apple Developer Program üyeliği gerekir. Ayrıca burada Apple hesabına giriş yapılmadı, GitHub deposu bağlanmadı ve iPhone'a henüz uygulama kurulmadı.
