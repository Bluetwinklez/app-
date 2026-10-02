// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get addRecord => 'Kayıt Ekle';

  @override
  String get addRule => 'Kural Ekle';

  @override
  String get addTag => 'Etiket Ekle';

  @override
  String get addToComposerList => 'Yazma Listesine Ekle';

  @override
  String get addToWriteList => 'Yazma listesine ekle';

  @override
  String get addressCannotBeEmpty => 'Adres boş bırakılamaz.';

  @override
  String get advancedCommandsDesc =>
      'Her satıra bir komut yazın (hex). Örn: 60 = GET_VERSION, 30 04 = sayfa 4\'ten oku. Yanlış yazma komutları etiketi kalıcı olarak bozabilir.';

  @override
  String get advancedCommandsSubtitle =>
      'Etikete ham onaltılık (hex) komut gönderir';

  @override
  String get advancedCommandsTitle => 'Gelişmiş NFC Komutları';

  @override
  String get allRulesCleared => 'Tüm kurallar silindi';

  @override
  String get appLinksDesc =>
      'Bu bağlantıları bir etikete yazarsanız, iPhone etikete dokununca bildirim gösterir ve uygulamayı ilgili ekranda açar.';

  @override
  String get appLinksSection => 'Uygulama bağlantıları';

  @override
  String get appPackageName => 'Android Paket Adı';

  @override
  String get appSettings => 'Uygulama Ayarları';

  @override
  String get appTitle => 'NFC Etiket Yöneticisi';

  @override
  String get autoRunOnTap => 'Etikete dokununca otomatik çalıştır';

  @override
  String get backupExportSuccess => 'Yedek dosyası başarıyla kaydedildi';

  @override
  String get backupFileSizeExceeded =>
      'Yedek dosyası boyutu 2 MiB sınırını aşıyor.';

  @override
  String get backupHistoryMustBeList => '\"history\" alanı bir dizi olmalıdır.';

  @override
  String backupImportFailed(String error) {
    return 'Yedek içe aktarılamadı: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'Yedek başarıyla içe aktarıldı: $templates şablon, $rules kural, $history geçmiş eklendi';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'Kayıt kimliği geçerli Base64 verisi değil: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Kayıt yükü geçerli Base64 verisi değil: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Kayıt türü geçerli Base64 verisi değil: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'Geçersiz JSON biçimi: $error';
  }

  @override
  String get backupInvalidRuleNote =>
      'Etiket kuralı notu (note) geçerli bir metin olmalıdır.';

  @override
  String get backupInvalidRuleSha =>
      'Etiket kuralı NDEF özeti geçerli bir 64 karakterli SHA-256 onaltılık (hex) dize olmalıdır.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'Şablon oluşturulma tarihi (createdAt) ISO-8601 olmalıdır: $date';
  }

  @override
  String get backupInvalidTemplateId =>
      'Şablon kimliği (id) geçerli bir metin olmalıdır.';

  @override
  String get backupInvalidTemplateName =>
      'Şablon adı (name) geçerli bir metin olmalıdır.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'Geçersiz TNF değeri ($tnf). 0-7 arasında bir tamsayı olmalıdır.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Geçmiş kayıt sayısı izin verilen $max sınırını aşıyor ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'Kayıt sayısı izin verilen $max sınırını aşıyor ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'Etiket kuralı sayısı izin verilen $max sınırını aşıyor ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'Şablon sayısı izin verilen $max sınırını aşıyor ($count).';
  }

  @override
  String get backupMissingSchemaVersion =>
      'Yedek dosyasında \"schemaVersion\" alanı eksik.';

  @override
  String get backupRecordMustBeObject =>
      'Her NDEF kaydı bir JSON nesnesi olmalıdır.';

  @override
  String get backupRecordsMustBeList =>
      'Kayıt listesi (records) bir dizi olmalıdır.';

  @override
  String get backupRestoreSubtitle =>
      'Şablonlarınızı, uygulama içi etiket notlarınızı ve isteğe bağlı tarama geçmişinizi sürüm kontrollü JSON formatında yedekleyin veya mevcut verilerinizle birleştirin.';

  @override
  String get backupRestoreTitle => 'Yedekleme ve Geri Yükleme (JSON)';

  @override
  String get backupRootMustBeObject =>
      'Yedek dosyasının kök yapısı bir JSON nesnesi olmalıdır.';

  @override
  String get backupRuleMustBeObject =>
      'Her etiket kuralı bir JSON nesnesi olmalıdır.';

  @override
  String get backupSchemaVersionMustBeInt =>
      '\"schemaVersion\" alanı bir tamsayı olmalıdır.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'Yedekleme verisi izin verilen 2 MiB sınırını aşıyor ($bytes bayt).';
  }

  @override
  String get backupTagRulesMustBeList =>
      '\"tagRules\" alanı bir dizi olmalıdır.';

  @override
  String get backupTemplateMustBeObject =>
      'Her şablon bir JSON nesnesi olmalıdır.';

  @override
  String get backupTemplatesMustBeList =>
      '\"templates\" alanı bir dizi (list) olmalıdır.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'Desteklenmeyen yedek şema sürümü: $version.';
  }

  @override
  String get batchWrite => 'Toplu Yazma';

  @override
  String get bluetoothDeviceName => 'Cihaz Adı (İsteğe bağlı)';

  @override
  String get bluetoothMac => 'Bluetooth MAC Adresi';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'Yazılan Bayt: $bytes | Doğrulama: $status';
  }

  @override
  String cameraError(String error) {
    return 'Kamera açılamadı. Ayarlar > Gizlilik > Kamera bölümünden izin verin.\n($error)';
  }

  @override
  String get cancel => 'İptal';

  @override
  String get catBusiness => 'İşletme';

  @override
  String get catCar => 'Araba';

  @override
  String get catHome => 'Ev';

  @override
  String get catOther => 'Diğer';

  @override
  String get catPersonal => 'Kişisel';

  @override
  String get catWork => 'İş';

  @override
  String get categoryLabel => 'Kategori';

  @override
  String get chooseFromGallery => 'Galeriden seç';

  @override
  String get clear => 'Temizle';

  @override
  String get clearAll => 'Tümünü Sil';

  @override
  String get clearAllRulesConfirm =>
      'Kayıtlı tüm uygulama içi etiket notları silinecektir. Onaylıyor musunuz?';

  @override
  String get clearConfirmButton => 'Evet, Temizle';

  @override
  String get clearConfirmMessage =>
      'Bu işlem etiket üzerindeki tüm NDEF kayıtlarını silecek ve boş bir kayıt yazacaktır. Devam etmek istiyor musunuz?';

  @override
  String get clearConfirmTitle => 'Etiket İçeriğini Sıfırla';

  @override
  String get clearHistory => 'Geçmişi Temizle';

  @override
  String get clearList => 'Listeyi Temizle';

  @override
  String get clearTagSubtitle => 'Tüm kayıtları silip boş NDEF yazar';

  @override
  String get clearTagTitle => 'Etiketi Sil';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Panoda $count kayıt hazır',
      one: 'Panoda 1 kayıt hazır',
    );
    return '$_temp0 ($bytes B) · $source';
  }

  @override
  String get close => 'Kapat';

  @override
  String get commandsEmptyError => 'En az bir komut giriniz.';

  @override
  String get commandsLabel => 'Komutlar';

  @override
  String get composeRecordTitle => 'Yeni Kayıt Ekle';

  @override
  String get confirmClearHistoryContent =>
      'Cihazda kayıtlı tüm tarama geçmişi silinecektir. Onaylıyor musunuz?';

  @override
  String get confirmClearHistoryTitle => 'Tarama Geçmişini Temizle';

  @override
  String get confirmClearTemplatesContent =>
      'Kayıtlı tüm yazma şablonları silinecektir. Onaylıyor musunuz?';

  @override
  String get confirmClearTemplatesTitle => 'Şablonları Temizle';

  @override
  String get contactCompany => 'Şirket / Kurum';

  @override
  String get contactEmail => 'E-posta';

  @override
  String get contactFullName => 'Ad Soyad';

  @override
  String get contactNote => 'Not';

  @override
  String get contactPhone => 'Telefon';

  @override
  String get contactTitle => 'Unvan';

  @override
  String get contactWebsite => 'Web Sitesi';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kayıt',
      one: '1 kayıt',
    );
    return 'İçerik: $_temp0 · $content';
  }

  @override
  String get copy => 'Kopyala';

  @override
  String get copyAllRecords => 'Tüm Kayıtları Kopyala';

  @override
  String get copyTagUid => 'UID Kopyala';

  @override
  String get copyToComposer => 'Yazma listesine kopyala';

  @override
  String get csvInvalidAddress => 'geçersiz adres.';

  @override
  String get csvInvalidEmail => 'geçersiz e-posta adresi.';

  @override
  String get csvInvalidLocation =>
      'konum için enlem ve boylam giriniz (Örn: konum,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'En fazla $max kayıt içe aktarılabilir; kalan satırlar atlandı.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'Satır $row: değer boş.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'Satır $row: $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'bilinmeyen tür \"$type\".';
  }

  @override
  String get csvWifiPasswordLength => 'Wi-Fi şifresi 8-63 karakter olmalı.';

  @override
  String get delete => 'Sil';

  @override
  String deleteTagConfirmContent(String name) {
    return '\"$name\" kütüphaneden silinsin mi? Fiziksel etiket değişmez.';
  }

  @override
  String get deleteTagConfirmTitle => 'Etiketi Sil';

  @override
  String get deleteTemplateTooltip => 'Şablonu Sil';

  @override
  String get deviceNameTooLong => 'Cihaz adı çok uzun.';

  @override
  String get dismiss => 'Vazgeç';

  @override
  String get editRecordTitle => 'Kaydı Düzenle';

  @override
  String get editRule => 'Kuralı Düzenle';

  @override
  String get editTag => 'Etiketi Düzenle';

  @override
  String get emailBody => 'E-posta Metni';

  @override
  String get emailRecipient => 'Alıcı E-posta';

  @override
  String get emailSubject => 'Konu';

  @override
  String get emptyComposerSubtitle =>
      '\"Kayıt Ekle\" butonuna dokunarak Web URL, Metin, Wi-Fi, Kişi Kartı ve daha fazlasını oluşturun.';

  @override
  String get emptyComposerTitle => 'Henüz kayıt eklenmedi';

  @override
  String get emptyHistorySubtitle =>
      'Etiket taradığınızda geçmiş kayıtları burada listelenir.';

  @override
  String get emptyHistoryTitle => 'Henüz tarama geçmişi yok';

  @override
  String get emptyLibrary =>
      'Henüz kayıtlı etiket yok.\nBir etiketi okuttuktan sonra buraya isim ve fotoğrafla kaydedin.';

  @override
  String get eventDescription => 'Açıklama';

  @override
  String get eventEnd => 'Bitiş Zamanı';

  @override
  String get eventLocation => 'Konum / Yer';

  @override
  String get eventStart => 'Başlangıç Zamanı';

  @override
  String get eventTitle => 'Etkinlik Başlığı';

  @override
  String get exportBackup => 'Dışa Aktar';

  @override
  String get facetimePrompt =>
      'Telefon numarası veya Apple kimliği e-posta adresi giriniz.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" boş bırakılamaz.';
  }

  @override
  String get fieldTextPrompt => 'Etikete yazılacak metin';

  @override
  String get fieldUrlPrompt => 'Web sitesi adresi (https://...)';

  @override
  String get fileUrl => 'Dosya Bağlantısı (URL)';

  @override
  String get filterAll => 'Tümü';

  @override
  String get flashlight => 'Fener';

  @override
  String get formatConfirmButton => 'Biçimlendir';

  @override
  String get formatConfirmMessage =>
      'Etiketteki veriler silinir ve etiket boş bir NDEF etiketi olarak hazırlanır. Devam edilsin mi?';

  @override
  String get formatMemorySubtitle =>
      'NDEF için hazırlar (boş veya bozuk etiketler)';

  @override
  String get formatMemoryTitle => 'Belleği Biçimlendir';

  @override
  String get hardwareAvailable => 'NFC Donanımı Hazır';

  @override
  String get hardwareDisabled => 'NFC Devre Dışı';

  @override
  String get hardwareNotSupported => 'NFC Desteklenmiyor';

  @override
  String get historyFilteredEmpty =>
      'Aramayla eşleşen geçmiş kaydı bulunamadı.';

  @override
  String get idTooLarge => 'Kimlik (ID) boyutu 255 baytı aşamaz';

  @override
  String get importBackup => 'İçe Aktar (Birleştir)';

  @override
  String get importCsv => 'CSV İçe Aktar';

  @override
  String get inAppTagRules => 'Uygulama İçi Etiket Kuralları';

  @override
  String get invalidHexId => 'Geçersiz Hex ID dizesi';

  @override
  String get invalidHexPayload => 'Geçersiz Hex yük (payload) dizesi';

  @override
  String get invalidHexType => 'Geçersiz Hex tür dizesi';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get latitude => 'Enlem (Lat)';

  @override
  String get linkCopied => 'Bağlantı kopyalandı';

  @override
  String get linkHistoryDesc => 'Geçmişi açar';

  @override
  String get linkScanDesc => 'Uygulamayı açıp taramayı başlatır';

  @override
  String get linkToolsDesc => 'Araçlar ekranını açar';

  @override
  String get linkWriteDesc => 'Yazma ekranını açar';

  @override
  String get loadToComposerTooltip => 'Yazma Bestesine Aktar';

  @override
  String get locationHint => 'Örn: Buzdolabının kapağı';

  @override
  String get locationLabel => 'Nerede?';

  @override
  String get lockAcknowledge => 'Bu işlemin geri alınamayacağını anlıyorum';

  @override
  String get lockButton => 'Kilitle';

  @override
  String get lockTagSubtitle =>
      'Kalıcı olarak salt okunur yapar (geri alınamaz)';

  @override
  String get lockTagTitle => 'Etiketi Kilitle';

  @override
  String get lockWarning =>
      'Kilitlenen etiket salt okunur olur: içeriği bir daha DEĞİŞTİRİLEMEZ, silinemez ve kilit KALDIRILAMAZ. Önce doğru içeriği yazdığınızdan emin olun.';

  @override
  String get longitude => 'Boylam (Lng)';

  @override
  String get manage => 'Yönet';

  @override
  String get matchedRule => 'Eşleşen Kural / Not';

  @override
  String get mimePayloadHex => 'Yük (Payload) Hex / Metin';

  @override
  String get mimeTypeLabel => 'MIME Türü';

  @override
  String get nameRequired => 'Etikete bir isim verin.';

  @override
  String get navHistory => 'Geçmiş';

  @override
  String get navHistoryTitle => 'Geçmiş';

  @override
  String get navRead => 'Oku';

  @override
  String get navReadTitle => 'Etiket Oku';

  @override
  String get navSettings => 'Ayarlar';

  @override
  String get navSettingsTitle => 'Şablonlar & Ayarlar';

  @override
  String get navTools => 'Araçlar';

  @override
  String get navToolsTitle => 'Araçlar';

  @override
  String get navWrite => 'Yaz';

  @override
  String get navWriteTitle => 'Etiket Yaz';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kayıt',
      one: '1 Kayıt',
    );
    return '$_temp0';
  }

  @override
  String get ndefRecordsTitle => 'NDEF Kayıtları';

  @override
  String get nfcPromptClear => 'Etiketi sıfırlamak için cihazınıza yaklaştırın';

  @override
  String get nfcPromptLock => 'Kalıcı olarak kilitlenecek etiketi yaklaştırın';

  @override
  String get nfcPromptScan =>
      'NFC etiketini okumak için cihazınızın arkasına dokundurun';

  @override
  String get nfcPromptWrite =>
      'Verileri kaydetmek için NFC etiketini yaklaştırın';

  @override
  String get no => 'Hayır';

  @override
  String get noContentInTag => 'Bu kayıtta etiket içeriği yok.';

  @override
  String get noLibraryMatches => 'Aramayla eşleşen etiket yok.';

  @override
  String get noRecordsOnTag => 'Etikette NDEF kaydı bulunamadı.';

  @override
  String get noTemplates =>
      'Henüz kayıtlı bir yazma şablonu yok.\n\"Etiket Yaz\" sekmesinden kayıt oluşturup şablon olarak kaydedebilirsiniz.';

  @override
  String get noteLabel => 'Not';

  @override
  String get onboardingContinue => 'Devam';

  @override
  String get onboardingSkip => 'Geç';

  @override
  String get onboardingStart => 'Başla';

  @override
  String get onboardingStep1Body =>
      'Alttaki mavi butona dokunun ve etiketi telefonun üst kısmına yaklaştırın. İçerik, kapasite ve seri numarası anında görünür.';

  @override
  String get onboardingStep1Title => 'Etiketi okut';

  @override
  String get onboardingStep2Body =>
      '\"Yaz\" bölümünde \"Kayıt Ekle\"ye dokunun: web adresi, Wi-Fi, kartvizit, sosyal medya ve daha fazlası. Hazır şablonlarla saniyeler içinde hazırlayın.';

  @override
  String get onboardingStep2Title => 'İstediğini yaz';

  @override
  String get onboardingStep3Body =>
      'Belleği okuyun, şifre koyun, etiketi kilitleyin veya biçimlendirin. Hepsi \"Araçlar\" bölümünde.';

  @override
  String get onboardingStep3Title => 'Uzman araçlar';

  @override
  String get onboardingStep4Body =>
      'Yazdığınız etiketlere isim, not ve fotoğraf ekleyip kütüphanenizde saklayın. Dili ve görünümü Ayarlar\'dan değiştirebilirsiniz.';

  @override
  String get onboardingStep4Title => 'Etiketlerini düzenle';

  @override
  String optionalField(String label) {
    return '$label (isteğe bağlı)';
  }

  @override
  String pageN(int page) {
    return 'Sayfa $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'Veri';

  @override
  String get pageRoleLock => 'Kilit';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / Kilit';

  @override
  String get passwordDialogAction => 'Şifreyi Ayarla';

  @override
  String get passwordDialogTitle => 'Şifre Belirle';

  @override
  String get passwordDialogWarning =>
      'Şifreyi unutursanız etiketin içeriğini bir daha değiştiremezsiniz. Okuma herkese açık kalır.';

  @override
  String get passwordError => 'Tam 4 karakter veya 8 hex rakam giriniz.';

  @override
  String get passwordHint => '4 karakter (Örn: 1234) veya 8 hex';

  @override
  String get passwordLabel => 'Şifre';

  @override
  String get paste => 'Yapıştır';

  @override
  String get phoneNumber => 'Telefon Numarası';

  @override
  String get phoneWithCountryCode =>
      'Ülke koduyla birlikte telefon numarası giriniz (Örn: 905551112233).';

  @override
  String get presetAppDownloadDesc =>
      'Android kullanıcılarına uygulamanızı açar veya yükletir.';

  @override
  String get presetAppDownloadTitle => 'Uygulama İndirme';

  @override
  String get presetBusinessCardDesc =>
      'Telefona dokununca kişi kartınız rehbere eklenir.';

  @override
  String get presetBusinessCardTitle => 'Dijital Kartvizit';

  @override
  String get presetDirectionsDesc => 'Haritada adres veya mekan gösterir.';

  @override
  String get presetDirectionsTitle => 'Konum / Yol Tarifi';

  @override
  String get presetEmergencyDesc =>
      'Kan grubu, acil durum irtibatı ve kritik bilgiler.';

  @override
  String get presetEmergencyTitle => 'Acil Durum Kartı';

  @override
  String get presetGoogleReviewDesc =>
      'İşletmenizin Google yorum sayfasına yönlendirir.';

  @override
  String get presetGoogleReviewTitle => 'Google Harita / Yorum';

  @override
  String get presetGuestWifiDesc => 'Misafirler şifre yazmadan ağa bağlanır.';

  @override
  String get presetGuestWifiTitle => 'Misafir Wi-Fi Kartı';

  @override
  String get presetInstagramDesc =>
      'Dokunan kişi doğrudan Instagram profilinizi açar.';

  @override
  String get presetInstagramTitle => 'Instagram Profili';

  @override
  String get presetMenuLinkDesc =>
      'Masaya yapıştırın, müşteriler menüyü anında görsün.';

  @override
  String get presetMenuLinkTitle => 'Restoran Menüsü';

  @override
  String get presetPetTagDesc =>
      'Kayıp durumunda bulan kişinin sizi aramasını sağlar.';

  @override
  String get presetPetTagTitle => 'Evcil Hayvan Tasması';

  @override
  String get presetShortcutDesc =>
      'iPhone Kısayollar ve uygulama içi eylemleri başlatır.';

  @override
  String get presetShortcutTitle => 'Kısayol Tetikleyici';

  @override
  String get presetWebsiteDesc => 'Herhangi bir web sayfasına yönlendirir.';

  @override
  String get presetWebsiteTitle => 'Web Sitesi';

  @override
  String get presetWhatsappDesc =>
      'Numara kaydetmeden doğrudan sohbet başlatır.';

  @override
  String get presetWhatsappTitle => 'WhatsApp ile İletişim';

  @override
  String get qrCode => 'QR Kod';

  @override
  String qrContentChars(int chars) {
    return 'İçerik ($chars Karakter):';
  }

  @override
  String get qrContentEmpty => 'QR koda dönüştürülecek içerik boş.';

  @override
  String qrContentTooLarge(int chars) {
    return 'İçerik boyutu QR kod için çok büyük ($chars karakter, maksimum 2048 karakter desteklenir).';
  }

  @override
  String get qrFrameInstructions =>
      'QR kodu çerçevenin içine getirin. Web adresi, Wi-Fi ve metin QR kodları kayda dönüştürülür.';

  @override
  String qrGenerationFailed(String error) {
    return 'QR kod oluşturulamadı: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'QR Kod Önizleme: $title';
  }

  @override
  String get qrScanTitle => 'QR Kodu Tara';

  @override
  String get qrSecurityNote =>
      'QR kod önizlemesi yalnızca okunabilir Düz Metin (Text) ve Web URL kayıtları için desteklenir.\n\nWi-Fi parolaları, vCard veya ikili yükler gizlilik ve güvenlik nedeniyle otomatik olarak QR koduna dönüştürülmez.';

  @override
  String get qrUserOnlyNote =>
      'Sadece kullanıcı isteğiyle açılır. Otomatik işlem yürütülmez.';

  @override
  String get rawInspection => 'Ayrıntılı İnceleme';

  @override
  String get rawRecordDetailsTitle => 'Kayıt Ayrıntıları (Salt Okunur)';

  @override
  String get rawRecordEditorTitle => 'Ham NDEF Kaydı Düzenle';

  @override
  String get readHeroButton => 'Taramayı Başlat';

  @override
  String get readHeroEyebrow => 'NFC OKUYUCU';

  @override
  String get readHeroScanning => 'Taranıyor...';

  @override
  String get readHeroSubtitle =>
      'Telefonunuzun üst kısmını bir NFC etiketine yaklaştırarak içindeki tüm NDEF kayıtlarını ve donanım bilgilerini okuyun.';

  @override
  String get readHeroTitle => 'Etiketi Tara';

  @override
  String get readMemorySubtitle =>
      'Sayfa sayfa ham bellek; kopyala veya .bin olarak kaydet';

  @override
  String get readMemoryTitle => 'Belleği Oku';

  @override
  String get readyTemplates => 'Hazır Şablonlar';

  @override
  String get recordCopied => 'Kayıt içeriği kopyalandı';

  @override
  String recordIndex(int index) {
    return 'Kayıt #$index';
  }

  @override
  String get recordTypeCalendar => 'Takvim Etkinliği (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'Özel MIME ($mime)';
  }

  @override
  String get recordTypeEmail => 'E-posta Kaydı';

  @override
  String get recordTypeLocation => 'Konum / GPS';

  @override
  String get recordTypePhone => 'Telefon Numarası';

  @override
  String get recordTypeSmartPoster => 'Akıllı Poster (Smart Poster)';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'Bozuk veya eksik akıllı poster yükü ($bytes bayt)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'Akıllı Poster (Geçersiz Yük)';

  @override
  String get recordTypeSms => 'SMS Kaydı';

  @override
  String get recordTypeText => 'Metin Kaydı';

  @override
  String get recordTypeUnknown => 'Bilinmeyen Kayıt';

  @override
  String get recordTypeUrl => 'Web Bağlantısı (URL)';

  @override
  String get recordTypeVCard => 'Kişi Kartı (vCard)';

  @override
  String get recordTypeWifi => 'Wi-Fi Yapılandırması (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'Bozuk veya tanınmayan WSC yükü';

  @override
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kayıt panoya kopyalandı',
      one: '1 kayıt panoya kopyalandı',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'Yinele';

  @override
  String get removePasswordDialogTitle => 'Şifreyi Kaldır';

  @override
  String get removePasswordDialogWarning =>
      'Etikete daha önce koyduğunuz şifreyi girin.';

  @override
  String get removePasswordSubtitle => 'Bilinen şifreyle korumayı kaldırır';

  @override
  String get removePasswordTitle => 'Şifreyi Kaldır';

  @override
  String get removePhoto => 'Kaldır';

  @override
  String get rewriteTag => 'Yeniden Yaz';

  @override
  String ruleDeleteConfirm(String note) {
    return '\"$note\" açıklamalı etiket kuralı silinecektir. Devam edilsin mi?';
  }

  @override
  String get ruleDeleted => 'Kural silindi';

  @override
  String get ruleNoteDialogTitle => 'Etiket Notunu Düzenle';

  @override
  String get ruleNoteHint => 'Örn: Depo Rafı #4 veya Toplantı Odası';

  @override
  String get ruleNoteLabel => 'Uygulama İçi Not / Açıklama';

  @override
  String get ruleSaved => 'Kural kaydedildi';

  @override
  String get save => 'Kaydet';

  @override
  String get saveAsTemplate => 'Şablon Olarak Kaydet';

  @override
  String get saveBin => '.bin Kaydet';

  @override
  String get saveLocalHistory => 'Yerel Tarama Geçmişini Kaydet';

  @override
  String get saveLocalHistorySubtitle =>
      'Kapalıyken taramalar cihazda tutulmaz. Açıldığında başarılı taramalar yerel belleğe kaydedilir. Hatalı taramalar asla kaydedilmez.';

  @override
  String get saveTemplateDialogTitle => 'Şablon Olarak Kaydet';

  @override
  String get saveToLibrary => 'Kütüphaneye Kaydet';

  @override
  String get scanFabLabel => 'Etiketi tara';

  @override
  String get scanQrToRecord => 'QR Kod Tara';

  @override
  String get scannedTag => 'Taranan Etiket';

  @override
  String get searchEngine => 'Arama Motoru';

  @override
  String get searchHistoryHint => 'Geçmişte ara (UID, içerik, tür)...';

  @override
  String get searchLibraryHint => 'İsim, not, konum veya içerikte ara';

  @override
  String get searchQuery => 'Arama Metni';

  @override
  String get searchQueryCannotBeEmpty => 'Arama metni boş bırakılamaz.';

  @override
  String get securityRestriction => 'Güvenlik Kısıtlaması';

  @override
  String get send => 'Gönder';

  @override
  String get setPasswordSubtitle =>
      'Etiket içeriğini yazmaya karşı şifreyle korur';

  @override
  String get setPasswordTitle => 'Şifre Belirle';

  @override
  String get shareRecords => 'Kayıtları Paylaş';

  @override
  String get shortcutAutomationNote =>
      'Not: Otomasyon etiketin seri numarasına bağlanır; etiketin içeriği değişse de çalışır.';

  @override
  String get shortcutStep1 =>
      'Kısayollar uygulamasını açın ve alttan \"Otomasyon\"a dokunun.';

  @override
  String get shortcutStep2 => '\"Yeni Otomasyon\" (+) → \"NFC\" seçin.';

  @override
  String get shortcutStep3 =>
      '\"Tara\"ya dokunun, etiketi iPhone\'un üst kısmına yaklaştırın ve bir isim verin.';

  @override
  String get shortcutStep4 =>
      '\"Hemen Çalıştır\"ı seçin, sonra istediğiniz eylemi ekleyin (ışıkları aç, müzik çal, mesaj gönder…).';

  @override
  String get shortcutStep5 =>
      'Bu uygulamayı açtırmak için eylem olarak \"Etiketi Tara\" veya \"Etikete Yaz\"ı seçin.';

  @override
  String get shortcutsGuideSubtitle =>
      'Etikete dokununca bir işlemi otomatik çalıştırabilir veya Siri\'ye sesle tarama yaptırabilirsiniz.';

  @override
  String get shortcutsGuideTitle => 'Siri ve Kısayollar';

  @override
  String get siriPhraseScan =>
      '\"Hey Siri, NFC Etiket Yöneticisi ile etiket tara\"';

  @override
  String get siriPhraseWrite =>
      '\"Hey Siri, NFC Etiket Yöneticisi ile etikete yaz\"';

  @override
  String get siriShortcutsNote =>
      'Aynı komutlar Kısayollar uygulamasında ve Spotlight aramasında da görünür.';

  @override
  String get smsMessage => 'Mesaj Metni';

  @override
  String get socialNetwork => 'Platform';

  @override
  String get socialUsername => 'Kullanıcı Adı';

  @override
  String get sourceComposer => 'Yazma listesindeki kayıtlar';

  @override
  String get sourceEmpty => 'İçeriksiz (sadece not)';

  @override
  String get sourceLastScan => 'Son taranan etiket';

  @override
  String get sourceSelectPrompt => 'Etiketin içeriği nereden alınsın?';

  @override
  String get statusCancelled => 'İşlem iptal edildi.';

  @override
  String statusClearError(String error) {
    return 'Sıfırlama hatası: $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'Sıfırlama başarısız: $error';
  }

  @override
  String get statusClearSuccess => 'Etiket içeriği başarıyla temizlendi.';

  @override
  String get statusClearing => 'Sıfırlama modu aktif. Etiketi yaklaştırın...';

  @override
  String statusLockError(String error) {
    return 'Kilitleme hatası: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'Kilitleme başarısız: $error';
  }

  @override
  String get statusLockSuccess =>
      'Etiket kalıcı olarak kilitlendi (salt okunur).';

  @override
  String get statusLocking => 'Kilitleme modu aktif. Etiketi yaklaştırın...';

  @override
  String get statusNfcDisabled =>
      'NFC kapalı. Lütfen cihaz ayarlarından NFC özelliğini açın.';

  @override
  String get statusNfcNotSupported =>
      'Bu cihazda NFC donanımı bulunmuyor veya desteklenmiyor.';

  @override
  String get statusNfcUnavailable => 'NFC şu anda kullanılamaz durumda.';

  @override
  String get statusReady => 'Hazır';

  @override
  String statusScanError(String error) {
    return 'Tarama Hatası: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'Etiket başarıyla okundu ($id).';
  }

  @override
  String get statusScanning =>
      'Etiket taranıyor... Telefonunuzu etikete yaklaştırın.';

  @override
  String statusUnexpectedError(String error) {
    return 'Beklenmeyen hata: $error';
  }

  @override
  String statusWriteError(String error) {
    return 'Yazma hatası: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'Yazma işlemi tamamlanamadı: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return 'Yazma ve doğrulama başarılı! ($bytes bayt)';
  }

  @override
  String get statusWriting =>
      'Yazma modu aktif. Hedef NFC etiketini yaklaştırın...';

  @override
  String get systemLanguage => 'Sistem Dili';

  @override
  String get tabApp => 'Uygulama';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'Takvim';

  @override
  String get tabContact => 'Kişi (vCard)';

  @override
  String get tabCustomMime => 'Özel MIME';

  @override
  String get tabEmail => 'E-posta';

  @override
  String get tabFile => 'Dosya';

  @override
  String get tabLocation => 'Konum';

  @override
  String get tabPhone => 'Telefon';

  @override
  String get tabSearch => 'Arama';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'Sosyal Medya';

  @override
  String get tabText => 'Metin';

  @override
  String get tabUrl => 'Web URL';

  @override
  String get tabVideo => 'Video';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'Kapasite';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max bayt ($available bayt boş)';
  }

  @override
  String get tagInfoTitle => 'Etiket Bilgileri';

  @override
  String get tagLibraryTitle => 'Etiket Kütüphanem';

  @override
  String get tagNameHint => 'Örn: Mutfak etiketi';

  @override
  String get tagNameLabel => 'İsim';

  @override
  String get tagReadOnly => 'Salt Okunur (Kilitli)';

  @override
  String tagRulesCount(int count) {
    return 'Kayıtlı Kural / Not Sayısı: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'NDEF içerik baytlarının SHA-256 özetine göre eşleşen etiketlerde yalnızca kaydedilen not gösterilir. Harici işlem başlatmaz.';

  @override
  String get tagSerialNumber => 'Seri Numarası (UID)';

  @override
  String get tagTechnology => 'Teknoloji';

  @override
  String get tagType => 'Tür';

  @override
  String get tagUidCopied => 'Etiket UID kopyalandı';

  @override
  String get tagWritable => 'Yazılabilir';

  @override
  String get takePhoto => 'Fotoğraf çek';

  @override
  String get templateGalleryTitle => 'Hazır Şablonlar';

  @override
  String get templateNameHint => 'Şablon Adı';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kayıt',
      one: '1 Kayıt',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'Şablon başarıyla kaydedildi';

  @override
  String get toolsExpertSection => 'Uzman';

  @override
  String get toolsFooterNote =>
      'Bellek, şifre ve komut araçları NTAG213/215/216 ve MIFARE Ultralight EV1 etiketlerde çalışır. Etiketi işlem bitene kadar telefona yakın tutun.';

  @override
  String get toolsMemorySection => 'Bellek';

  @override
  String get toolsSecuritySection => 'Güvenlik';

  @override
  String get toolsTagSection => 'Etiket';

  @override
  String get totalBytes => 'Toplam Boyut';

  @override
  String get typeTooLarge => 'Tür boyutu 255 baytı aşamaz';

  @override
  String get undo => 'Geri Al';

  @override
  String get unknownChip16Pages => 'Bilinmeyen çip (ilk 16 sayfa)';

  @override
  String get urlSafetyInvalidUrl =>
      'Geçersiz veya ayrıştırılamayan URL biçimi.';

  @override
  String get urlSafetyIpv4 =>
      'Hedef adres doğrudan IPv4 adresi içeriyor. Standart alan adı yerine IP kullanımı dikkat gerektirir.';

  @override
  String get urlSafetyIpv6 => 'Hedef adres IPv6 adresi içeriyor.';

  @override
  String get urlSafetyMissingScheme =>
      'URL protokol şeması (http/https vb.) eksik veya tanımsız.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'Standart dışı ağ bağlantı noktası (Port: $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'Uluslararası alan adı / Punycode tespit edildi (\"xn--\"). Benzer harflerle yanıltma (homoglif saldırısı) olabilir.';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'Standart dışı URL şeması: \"$scheme\". Cihazda beklenmeyen bir uygulamayı tetikleyebilir.';
  }

  @override
  String get urlSafetyUnencrypted =>
      'Şifrelenmemiş bağlantı (http://). Veriler ağ üzerinde açık iletilir.';

  @override
  String get urlSafetyUserInfo =>
      'URL kimlik doğrulama/kullanıcı bilgisi içeriyor (userinfo). Oltalama/yanıltma amaçlı olabilir.';

  @override
  String get usernameCannotBeEmpty => 'Kullanıcı adı boş bırakılamaz.';

  @override
  String get usernameNoSpaces => 'Kullanıcı adı boşluk içeremez.';

  @override
  String get validAndroidPackage =>
      'Geçerli bir Android paket adı giriniz (Örn: com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'Geçerli bir Bluetooth MAC adresi giriniz (Örn: 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'Geçerli bir video bağlantısı giriniz.';

  @override
  String get validWebAddress =>
      'Geçerli bir web adresi giriniz (Örn: https://example.com/dosya.pdf).';

  @override
  String get verificationNotChecked => 'Kontrol edilmedi';

  @override
  String get verificationPassed => 'Geçti';

  @override
  String get videoUrlCannotBeEmpty => 'Video bağlantısı boş bırakılamaz.';

  @override
  String get videoUrlOrId => 'Video Bağlantısı veya YouTube ID';

  @override
  String get videoUrlOrIdPrompt =>
      'Video bağlantısı (https://...) veya YouTube video kimliği giriniz.';

  @override
  String get wifiAuthOpen => 'Açık (Şifresiz)';

  @override
  String get wifiAuthType => 'Güvenlik Türü';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'Gizli Ağ';

  @override
  String get wifiPassword => 'Şifre';

  @override
  String get wifiSsid => 'Ağ Adı (SSID)';

  @override
  String get withSiri => 'Siri ile';

  @override
  String get writeDumpConfirmButton => 'Yaz';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes bayt) etiketin kullanıcı belleğine yazılacak. UID, kilit ve ayar sayfalarına dokunulmaz. Etiketteki mevcut veri silinir.';
  }

  @override
  String get writeDumpSubtitle => 'Kayıtlı bellek dosyasını etikete yazar';

  @override
  String get writeDumpTitle => 'Dump Yaz (.bin)';

  @override
  String get writeHeroButton => 'Yazmayı Başlat';

  @override
  String get writeHeroEyebrow => 'NDEF YAZICI';

  @override
  String get writeHeroSubtitle =>
      'Birden fazla NDEF kaydı hazırlayın ve hedef NFC etiketine tek seferde yazın.';

  @override
  String get writeHeroTitle => 'Etikete Yaz';

  @override
  String get writeHeroWriting => 'Yazılıyor...';

  @override
  String get writeResultFailed => 'İşlem Başarısız';

  @override
  String get writeResultSuccess => 'İşlem Başarılı';

  @override
  String get writeTemplates => 'Yazma Şablonları';

  @override
  String get writeTemplatesSubtitle =>
      'Sık kullandığınız NDEF içeriklerini şablon olarak kaydedip dilediğiniz zaman etiketlere tek dokunuşla yazabilirsiniz.';

  @override
  String get yes => 'Evet';
}
