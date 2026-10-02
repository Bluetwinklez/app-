# iPhone 13 için otomatik TestFlight yüklemesi

Bu projedeki [TestFlight iş akışı](.github/workflows/testflight.yml), `ios-v*` etiketli bir GitHub sürümü gönderildiğinde veya GitHub Actions'tan elle başlatıldığında macOS/Xcode üzerinde IPA üretip App Store Connect'e yükler. İlk çalıştırma, Apple imzalama ve GitHub yapılandırması tamamlanmadan başarılı olamaz. Bu bilgisayarda iOS derlemesi henüz doğrulanmadı.

## Bir kez yapılacaklar

1. Projeyi kendi **özel** GitHub deposuna gönder. Bu klasörde `git remote -v` henüz boşsa önce depoyu yerel Git'e bağlamak gerekir.
2. Apple Developer portalında explicit Bundle ID `com.bluetwinklez.nfctagmaster` ve **NFC Tag Reading** yeteneği oluşturuldu. Team ID `65S88D9LF5`. App Store Connect'te `NFC Etiket Yöneticisi` iOS uygulama kaydı oluşturuldu.
3. Apple Distribution sertifikası ve `NFC Tag Master App Store` dağıtım profili oluşturuldu. Sertifika ve `.p12` yerel imzalama klasöründedir. Profilin `.mobileprovision` dosyasını indirip güvenli sakla.
4. App Store Connect → Users and Access → Integrations → App Store Connect API bölümünde erişimi etkinleştirip uygun yetkili bir API anahtarı oluştur. `.p8` özel anahtarı yalnızca bir kez indirilebilir; güvenli sakla.
5. GitHub deposunda **Settings → Secrets and variables → Actions** bölümüne aşağıdaki repository secrets'ı ekle:

| Secret | İçerik |
| --- | --- |
| `IOS_APPSTORE_P12_BASE64` | Apple Distribution `.p12` dosyasının Base64 içeriği |
| `IOS_APPSTORE_P12_PASSWORD` | `.p12` parolası |
| `IOS_APPSTORE_PROFILE_BASE64` | App Store `.mobileprovision` dosyasının Base64 içeriği |
| `IOS_BUNDLE_ID` | `com.bluetwinklez.nfctagmaster` |
| `IOS_TEAM_ID` | `65S88D9LF5` |
| `ASC_API_KEY_ID` | App Store Connect API Key ID |
| `ASC_API_ISSUER_ID` | App Store Connect API Issuer ID |
| `ASC_API_PRIVATE_KEY_BASE64` | İndirilen `.p8` dosyasının Base64 içeriği |

Windows PowerShell'de gerekli dosyaların Base64 içeriğini tek tek panoya alabilirsin:

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes('C:\gizli\distribution.p12')) | Set-Clipboard
[Convert]::ToBase64String([IO.File]::ReadAllBytes('C:\gizli\appstore.mobileprovision')) | Set-Clipboard
[Convert]::ToBase64String([IO.File]::ReadAllBytes('C:\gizli\AuthKey_XXXXXXXXXX.p8')) | Set-Clipboard
```

Her seferinde yalnızca ilgili GitHub Secret alanına yapıştır. **Parolayı, Base64 metinlerini veya özel anahtarı sohbete ya da Git deposuna gönderme.**

## Çalıştırma ve iPhone'a kurma

- İlk deneme: GitHub → **Actions → Build and upload iPhone TestFlight beta → Run workflow**.
- Sonraki sürümler: `ios-v1.0.1` gibi yeni bir Git etiketi GitHub'a gönderildiğinde iş akışı otomatik başlar. Her çalıştırmada GitHub run numarası iOS build numarası olarak kullanılır.
- İş akışı başarılı olursa Apple derlemeyi işlemeye devam eder. App Store Connect → uygulama → **TestFlight** bölümünde durumu kontrol et. İlk defa gerekli beta/test bilgilerini ve iç test kullanıcılarını ayarla; uygun grupta otomatik yeni derleme dağıtımını açabilirsin.
- iPhone 13'e **TestFlight** uygulamasını App Store'dan yükle, daveti kabul et ve uygulamayı TestFlight içinden kur. İş akışı iPhone'a doğrudan/sessiz kurulum yapmaz.

Apple kaynakları: [Flutter iOS dağıtımı](https://docs.flutter.dev/deployment/ios), [TestFlight işleyişi](https://developer.apple.com/help/app-store-connect/test-a-beta-version/testflight-overview/), [API anahtarı güvenliği](https://developer.apple.com/documentation/AppStoreConnectAPI/creating-api-keys-for-app-store-connect-api).
