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
  String get nfcPromptScan => 'Etiketi telefonunuza yaklaştırın';

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
  String get statusCancelled => 'İptal Edildi';

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

  @override
  String get unknown => 'Bilinmiyor';

  @override
  String get error => 'Hata';

  @override
  String get nfcPromptReady => 'Etiketi yaklaştırın';

  @override
  String get invalidResponseFormat => 'Geçersiz yanıt formatı alındı';

  @override
  String get nfcReadError => 'NFC okuma hatası';

  @override
  String get invalidPlatformResponse => 'Platformdan geçersiz yanıt alındı';

  @override
  String get writeFailed => 'Yazma başarısız oldu';

  @override
  String get lockFailed => 'Kilitleme başarısız oldu';

  @override
  String get failedToConnectTag => 'Etikete bağlanılamadı';

  @override
  String get invalidTagResponse => 'Etiketten geçersiz yanıt alındı';

  @override
  String get commandFailed => 'Komut başarısız';

  @override
  String get ndefTypeOrIdTooLong => 'NDEF türü veya kimliği 255 baytı aşıyor';

  @override
  String get ndefUnsupportedOrInvalidRecord =>
      'Desteklenmeyen veya geçersiz NDEF kaydı';

  @override
  String get ndefMissingTypeLength => 'Eksik NDEF tür uzunluğu';

  @override
  String get ndefMissingPayloadLength => 'Eksik NDEF yük uzunluğu';

  @override
  String get ndefMissingIdLength => 'Eksik NDEF kimlik uzunluğu';

  @override
  String get ndefMissingType => 'Eksik NDEF türü';

  @override
  String get ndefMissingId => 'Eksik NDEF kimliği';

  @override
  String get ndefMissingPayload => 'Eksik NDEF yükü';

  @override
  String get unprotected => '(Şifresiz)';

  @override
  String get binaryDataPreview => '(İkili/Binary Veri)';

  @override
  String get emptyValue => '(Boş)';

  @override
  String get tnfEmpty => '0: Empty (Boş)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (NFC Forum Standart RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME Türü)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986 Mutlak URI)';

  @override
  String get tnfExternal => '4: NFC Forum External (Harici Tür)';

  @override
  String get tnfUnknown => '5: Unknown (Bilinmeyen İçerik)';

  @override
  String get tnfUnchanged => '6: Unchanged (Değişmemiş - Parçalı NDEF)';

  @override
  String get tnfReserved => '7: Reserved (Ayrılmış)';

  @override
  String get ntagUnsupportedChip =>
      'Bu işlem yalnızca NTAG213/215/216 ve MIFARE Ultralight EV1 etiketlerde destekleniyor.';

  @override
  String ntagPageReadFailed(String page) {
    return 'Sayfa $page okunamadı (etiket yanıt vermedi veya alan korumalı).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'Sayfa $page yazılamadı: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'Sayfa $page yazılamadı (etiket reddetti; kilitli veya şifreli olabilir).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'Sayfa $page sonrası okunamadı; bu alan şifre ile korunuyor olabilir.';
  }

  @override
  String get ntagPasswordPackSize => 'Şifre 4 bayt, PACK 2 bayt olmalıdır.';

  @override
  String get ntagPasswordSize => 'Şifre 4 bayt olmalıdır.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'Şifre yanlış veya etiket şifre doğrulamasını reddetti.';

  @override
  String get ntagPasswordWrong => 'Şifre yanlış.';

  @override
  String get ntagCcInvalid =>
      'Etiketin CC alanı NDEF dışı bir değerle yazılmış; bu alan tek seferlik olduğu için biçimlendirilemez.';

  @override
  String get ntagDumpTooShort =>
      'Dump dosyası çok kısa; kullanıcı verisi içermiyor.';

  @override
  String get ntagInvalidHex =>
      'Geçerli bir onaltılık (hex) değer giriniz (Örn: 30 04).';

  @override
  String get googleReviewFieldLabel => 'Yorum Bağlantısı veya Place ID';

  @override
  String get menuLinkFieldLabel => 'Menü Bağlantısı';

  @override
  String get menuTitleHint => 'Menümüz';

  @override
  String get petName => 'Hayvanın Adı';

  @override
  String get ownerPhone => 'Sahibinin Telefonu';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'Merhaba, ben $pet! Sahibimi arar mısınız: $phone$note';
  }

  @override
  String get bloodType => 'Kan Grubu';

  @override
  String get allergies => 'Alerjiler / İlaçlar';

  @override
  String get emergencyContact => 'Acil Durumda Aranacak';

  @override
  String get emergencyInfo => 'ACİL DURUM BİLGİSİ';

  @override
  String emergencyBlood(String blood) {
    return 'Kan grubu: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'Alerjiler: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'Acil durumda arayın: $contact';
  }

  @override
  String get storeLink => 'Mağaza Bağlantısı';

  @override
  String get link => 'Bağlantı';

  @override
  String get title => 'Başlık';

  @override
  String get webAddress => 'Web adresi';

  @override
  String get address => 'Adres';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'Şablonlar: $added eklendi, $updated güncellendi';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'Etiket Notları/Kuralları: $added eklendi, $updated güncellendi';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'Tarama geçmişi cihazda kapalı olduğu için ${skipped}atlandı';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'Geçmiş: $added eklendi, $skipped mevcut/atlandı';
  }

  @override
  String get backupSummaryNoNewData =>
      'İçe aktarılacak yeni veri bulunamadı (mevcut kayıtlarla eşleşti).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field bir metin olmalıdır.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field geçerli bir tarih olmalıdır.';
  }

  @override
  String get rawTypeHexLabel => 'Tür / Type (Hex Baytları)';

  @override
  String get rawIdHexLabel => 'Kimlik / ID (Hex Baytları, isteğe bağlı)';

  @override
  String get rawPayloadHexLabel => 'Yük / Payload (Hex Baytları)';

  @override
  String get rawOptionalHexHint => 'İsteğe bağlı hex baytları';

  @override
  String get saveChanges => 'Değişikliği Kaydet';

  @override
  String get edit => 'Düzenle';

  @override
  String get clearAllButton => 'Tümünü Temizle';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: $count sayfa okundu';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip biçimlendirildi';
  }

  @override
  String get ntagInvalidDumpFile =>
      'Geçersiz dump dosyası (4 baytın katı, 32–1024 bayt olmalı).';

  @override
  String ntagPagesWritten(int count) {
    return '$count sayfa yazıldı';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: şifre koruması etkin';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: şifre kaldırıldı';
  }

  @override
  String get memoryDumpCopied => 'Bellek dökümü kopyalandı';

  @override
  String ntagCommandsSent(int count) {
    return '$count komut gönderildi';
  }

  @override
  String get emptyResponse => '(boş yanıt)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages sayfa · $bytes bayt';
  }

  @override
  String get composeTextEmpty => 'Metin içeriği boş bırakılamaz.';

  @override
  String get composeTextTooLong => 'Metin çok uzun (en fazla 5000 karakter).';

  @override
  String get composeUrlInvalid =>
      'Geçerli bir adres giriniz (Örn: https://example.com veya uygulama:// bağlantısı).';

  @override
  String get composeUrlTooLong => 'URL çok uzun (en fazla 2000 karakter).';

  @override
  String get composeEmailInvalid =>
      'Geçerli bir e-posta adresi giriniz (Örn: ad@alanadi.com).';

  @override
  String get composePhoneInvalid =>
      'Geçerli bir telefon numarası giriniz (Örn: +905551234567).';

  @override
  String get composeSmsPhoneInvalid =>
      'Geçerli bir alıcı telefon numarası giriniz.';

  @override
  String get composeLatInvalid => 'Enlem -90 ile +90 arasında olmalıdır.';

  @override
  String get composeLngInvalid => 'Boylam -180 ile +180 arasında olmalıdır.';

  @override
  String get composeVcardNameEmpty => 'Kişi adı veya tam ad boş bırakılamaz.';

  @override
  String get composeVcardNameTooLong =>
      'Kişi adı çok uzun (en fazla 200 karakter).';

  @override
  String get composeVcardEmailInvalid => 'Geçerli bir e-posta adresi giriniz.';

  @override
  String get composeVcardPhoneInvalid =>
      'Geçerli bir telefon numarası giriniz.';

  @override
  String get composeVcardUrlInvalid =>
      'Geçerli bir web adresi giriniz (Örn: https://...).';

  @override
  String get composeCalSummaryEmpty => 'Etkinlik başlığı boş bırakılamaz.';

  @override
  String get composeCalSummaryTooLong =>
      'Etkinlik başlığı çok uzun (en fazla 250 karakter).';

  @override
  String get composeCalDateInvalid =>
      'Bitiş zamanı, başlangıç zamanından sonra olmalıdır.';

  @override
  String get composeSpUriInvalid =>
      'Geçerli bir hedef URL giriniz (Örn: https://...).';

  @override
  String get composeSpLangInvalid =>
      'Geçerli bir ISO dil kodu giriniz (Örn: tr, en).';

  @override
  String get composeMimeTypeInvalid =>
      'Geçerli bir MIME türü giriniz (Örn: application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'Geçerli bir onaltılık (hex) dize giriniz (çift sayıda hex karakter).';

  @override
  String get composeMimePayloadTooLarge =>
      'Yük boyutu çok büyük (en fazla 10 KB).';

  @override
  String get composeWifiSsidEmpty => 'Ağ adı (SSID) boş bırakılamaz.';

  @override
  String get composeWifiPasswordRequired =>
      'Şifreli ağlar için Wi-Fi şifresi zorunludur.';

  @override
  String get composeWifiPasswordLength =>
      'WPA/WPA2 şifresi 8 ile 63 karakter arasında olmalıdır.';

  @override
  String get composeEditNdefRecord => 'NDEF Kaydını Düzenle';

  @override
  String get composeNewNdefRecord => 'Yeni NDEF Kaydı Oluştur';

  @override
  String get quickLinksHeader => 'Hazır Bağlantılar';

  @override
  String get quickLinkCustomUri => 'Özel URI';

  @override
  String get quickLinkSocial => 'Sosyal Ağlar';

  @override
  String get quickLinkVideo => 'Video';

  @override
  String get quickLinkSearch => 'Arama';

  @override
  String get quickLinkFile => 'Dosya';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime Ses';

  @override
  String get quickLinkAddress => 'Adres';

  @override
  String get quickLinkPayment => 'Ödeme Bağlantısı';

  @override
  String get quickLinkApp => 'Uygulama (Android)';

  @override
  String get updateRecord => 'Kaydı Güncelle';

  @override
  String get addToList => 'Listeye Ekle';

  @override
  String get quickCustomUriError =>
      'Şema içeren bir adres giriniz (Örn: spotify:track:... veya myapp://sayfa).';

  @override
  String get quickFileEmptyMessage => 'Dosyanın bağlantısını giriniz.';

  @override
  String get quickPaymentEmptyMessage => 'Ödeme bağlantısını giriniz.';

  @override
  String get quickCustomUriDesc =>
      'Herhangi bir şemayla başlayan adres yazılabilir; telefon bu adresi destekleyen uygulamayı açar.';

  @override
  String get quickSocialLabel => 'Sosyal Ağ';

  @override
  String get quickVideoLabel => 'Video Bağlantısı';

  @override
  String get quickVideoHint => 'https://youtu.be/... veya video kimliği';

  @override
  String get quickVideoDesc =>
      'YouTube, Vimeo vb. bağlantı ya da yalnızca YouTube video kimliği yazılabilir.';

  @override
  String get quickSearchHint => 'Örn: İstanbul hava durumu';

  @override
  String get quickFileLabel => 'Dosya Bağlantısı';

  @override
  String get quickFileDesc =>
      'Etiketlerin kapasitesi küçük olduğu için dosyanın kendisi değil, internetteki bağlantısı yazılır (Google Drive, Dropbox vb.).';

  @override
  String get quickPhoneOrAppleId => 'Telefon veya Apple Kimliği';

  @override
  String get quickFacetimeVideoDesc =>
      'Etikete dokunan iPhone görüntülü FaceTime araması başlatır.';

  @override
  String get quickFacetimeAudioDesc =>
      'Etikete dokunan iPhone yalnızca sesli FaceTime araması başlatır.';

  @override
  String get quickMapProvider => 'Harita Uygulaması';

  @override
  String get quickAddressHint => 'Örn: Bağdat Cad. No:1 Kadıköy İstanbul';

  @override
  String get quickPaymentDesc =>
      'PayPal.me, Papara, iyzico, Stripe gibi ödeme sayfası bağlantıları kullanılabilir. Kart bilgisi asla etikete yazılmaz.';

  @override
  String get quickAppDesc =>
      'Android telefonlar etikete dokununca bu uygulamayı açar (yüklü değilse Play Store\'u açar). iPhone bu kayıt türünü yok sayar; iPhone için App Store bağlantısını URL olarak ekleyin.';

  @override
  String get quickDeviceNameOptional => 'Cihaz Adı (isteğe bağlı)';

  @override
  String get quickSpeakerHint => 'Örn: Hoparlör';

  @override
  String get quickBluetoothDesc =>
      'Android telefonlar etikete dokununca bu cihazla eşleşmeyi önerir. iPhone Bluetooth eşleştirme etiketlerini desteklemez.';

  @override
  String get composeTextContent => 'Metin İçeriği';

  @override
  String get composeTextHint => 'Yazmak istediğiniz metni giriniz';

  @override
  String get composeEmailSubjectOptional => 'Konu (İsteğe bağlı)';

  @override
  String get composeEmailBodyOptional => 'Mesaj Gövdesi (İsteğe bağlı)';

  @override
  String get composeSmsRecipient => 'Alıcı Telefon Numarası';

  @override
  String get composeSmsHint => 'Gönderilecek kısa mesaj...';

  @override
  String get composeVcardFullName => 'Tam Ad (Görünen İsim) *';

  @override
  String get composeVcardNameHint => 'Ahmet Yılmaz';

  @override
  String get composeVcardNote => 'Not / Açıklama';

  @override
  String get composeCalTitle => 'Etkinlik Başlığı *';

  @override
  String get composeCalTitleHint => 'Proje Toplantısı';

  @override
  String get composeCalLocationHint => 'Toplantı Odası 2 veya Online';

  @override
  String get composeCalDesc => 'Etkinlik Açıklaması';

  @override
  String get composeCalStartEndTime => 'Başlangıç ve Bitiş Zamanı:';

  @override
  String get composeSpTitleLabel => 'Başlık (Görünen Metin)';

  @override
  String get composeSpTitleHint => 'Şirket Tanıtım Broşürü';

  @override
  String get composeMimeTypeLabel => 'MIME Türü *';

  @override
  String get composeDataFormat => 'Veri Formatı: ';

  @override
  String get composeFormatHex => 'Hex (Onaltılık)';

  @override
  String get composeMimeHexBytes => 'Hex Baytları *';

  @override
  String get composeMimeTextPayload => 'Yük Metni (UTF-8) *';

  @override
  String get composeWifiWarningTitle => 'Güvenlik ve Platform Uyarısı:';

  @override
  String get composeWifiWarningBody =>
      '• Etikete yazılan Wi-Fi parolası şifresiz/düz metin olarak saklanır ve etiketi okuyan herhangi biri tarafından kolayca okunabilir.\n• iPhone veya Android cihazların etikete dokunulduğunda ağa otomatik olarak katılması garanti edilmez; işletim sistemi ve cihaz desteğine göre kullanıcı onayı veya ağ seçimi gerektirebilir.';

  @override
  String get composeWifiSsidLabel => 'Ağ Adı (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'Güvenlik Türü (Kimlik Doğrulama)';

  @override
  String get composeWifiOpenNetwork => 'Açık Ağ (Şifresiz)';

  @override
  String get composeWifiPasswordLabel => 'Wi-Fi Şifresi *';

  @override
  String get composeWifiEncryptionLabel => 'Şifreleme Türü';

  @override
  String get composeWifiAesRecommended => 'AES (Önerilen)';

  @override
  String get quickSearchTextLabel => 'Aranacak Metin';

  @override
  String get readTagMemoryPrompt => 'Okunacak etiketi telefona yaklaştırın';

  @override
  String get readingTagMemoryStatus => 'Bellek okunuyor...';

  @override
  String get formatTagConfirmTitle => 'Belleği Biçimlendir';

  @override
  String get formatTagConfirmMessage =>
      'Etiketteki veriler silinir ve etiket boş bir NDEF etiketi olarak hazırlanır. Devam edilsin mi?';

  @override
  String get formatButton => 'Biçimlendir';

  @override
  String get formatTagPrompt => 'Biçimlendirilecek etiketi yaklaştırın';

  @override
  String get formattingStatus => 'Biçimlendiriliyor...';

  @override
  String filePickerFailed(String error) {
    return 'Dosya seçici açılamadı: $error';
  }

  @override
  String get writeButton => 'Yaz';

  @override
  String get writeDumpPrompt => 'Yazılacak etiketi yaklaştırın';

  @override
  String get writingDumpStatus => 'Dump yazılıyor...';

  @override
  String get setPasswordWarning =>
      'Şifreyi unutursanız etiketin içeriğini bir daha değiştiremezsiniz. Okuma herkese açık kalır.';

  @override
  String get setPasswordAction => 'Şifreyi Ayarla';

  @override
  String get setPasswordPrompt => 'Şifrelenecek etiketi yaklaştırın';

  @override
  String get settingPasswordStatus => 'Şifre ayarlanıyor...';

  @override
  String get removePasswordPromptMessage =>
      'Etikete daha önce koyduğunuz şifreyi girin.';

  @override
  String get remove => 'Kaldır';

  @override
  String get removePasswordPrompt => 'Şifresi kaldırılacak etiketi yaklaştırın';

  @override
  String get removingPasswordStatus => 'Şifre kaldırılıyor...';

  @override
  String get sendCommandsPrompt => 'Komut gönderilecek etiketi yaklaştırın';

  @override
  String get sendingCommandsStatus => 'Komutlar gönderiliyor...';

  @override
  String get sendButton => 'Gönder';

  @override
  String get tagNoteEditTitle => 'Etiket Notunu Düzenle';

  @override
  String get tagNoteInputLabel => 'Uygulama İçi Not / Açıklama';

  @override
  String get tagNoteInputHint =>
      'Örn: Toplantı Odası Bilgisi veya Depo Rafı #12';

  @override
  String get tagNoteDeleteTitle => 'Etiket Notunu Sil';

  @override
  String get clearAllTagRulesTitle => 'Tüm Notları Sil';

  @override
  String get clearAllTagRulesConfirm =>
      'Kayıtlı tüm uygulama içi etiket notları silinecektir. Onaylıyor musunuz?';

  @override
  String get deleteAll => 'Tümünü Sil';

  @override
  String get tagRulesExplanation =>
      'NDEF içerik baytlarının SHA-256 özetine göre eşleşen etiketlerde yalnızca kaydedilen not gösterilir. Harici işlem başlatmaz.';

  @override
  String get noTagRulesDefined => 'Henüz tanımlanmış bir etiket notu yok.';

  @override
  String lastUpdated(String time) {
    return 'Son güncelleme: $time';
  }

  @override
  String get tagLibraryNoMatch => 'Aramanızla eşleşen etiket bulunamadı.';

  @override
  String get tagLibraryAddToLibrary => 'Kütüphaneye Ekle';

  @override
  String get name => 'İsim';

  @override
  String get tagLibraryAddTag => 'Etiket Ekle';

  @override
  String get all => 'Tümü';

  @override
  String tagLibraryPhotoError(String error) {
    return 'Fotoğraf seçilemedi: $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'Etiketi Sil';

  @override
  String get tagLibraryNameHint => 'Örn: Ofis Anahtarlığı';

  @override
  String get tagLibraryNoTagContent => 'Bu kayıtta etiket içeriği yok.';

  @override
  String get tagLibrarySourceLastScanned => 'Son Taranan';

  @override
  String get tagLibraryEmpty => 'Henüz kayıtlı etiket yok.';

  @override
  String get tagLibrarySourceEmpty => 'Boş Kayıt';

  @override
  String get tagLibraryNamePrompt => 'Lütfen bir etiket ismi girin';

  @override
  String get tagLibrarySearchHint => 'İsim, kategori veya konum ile ara...';

  @override
  String get tagLibrarySourceWriteList => 'Yazma Listesi';

  @override
  String get tagLibraryLocationHint => 'Örn: Masaüstü, Giriş Kapısı';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return '\"$name\" etiketini kütüphaneden silmek istediğinize emin misiniz?';
  }

  @override
  String get noContent => 'İçerik yok';

  @override
  String tagLibraryRecordSummary(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count NDEF kaydı',
      one: '1 NDEF kaydı',
    );
    return '$_temp0';
  }

  @override
  String get tagLibraryEditTag => 'Etiketi Düzenle';

  @override
  String get rawTypeHexHint => '41 (A) veya 55 (U) vb.';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: \"records\" alanı bir liste olmalıdır.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: Bir öğede en fazla $max NDEF kaydı bulunabilir.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - Kayıt #$index geçerli bir nesne değil.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - Kayıt #$index: Geçersiz TNF değeri ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - Kayıt #$index: \"type\" Base64 dizesi olmalıdır.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - Kayıt #$index: \"type\" geçerli Base64 verisi değil ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - Kayıt #$index: \"id\" Base64 dizesi olmalıdır.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - Kayıt #$index: \"id\" geçerli Base64 verisi değil ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - Kayıt #$index: \"payload\" Base64 dizesi olmalıdır.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - Kayıt #$index: \"payload\" geçerli Base64 verisi değil ($error).';
  }

  @override
  String get composerUndoSnack => 'Son beste değişikliği geri alındı.';

  @override
  String get composerRedoSnack => 'Beste değişikliği yinelendi.';

  @override
  String get noRecordsToCopy => 'Kopyalanacak NDEF kaydı bulunmuyor.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count adet NDEF kaydı ($bytes Bayt) panoya kopyalandı.\n(Yalnızca NDEF içerik baytları kopyalanır; UID veya şifreli sektörler asla klonlanamaz)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: $count kayıt eklendi.';
  }

  @override
  String get tagEmptyNoRecordsToImport =>
      'Etiket boş; içe aktarılacak kayıt yok.';

  @override
  String get sourceTag => 'Etiketten';

  @override
  String get sourceQr => 'QR koddan';

  @override
  String filePickerError(String error) {
    return 'Dosya seçici açılamadı: $error';
  }

  @override
  String get csvFileTooLarge => 'CSV dosyası çok büyük (en fazla 512 KB).';

  @override
  String get noRecordsFound => 'Kayıt bulunamadı';

  @override
  String get someRowsSkipped => 'Bazı satırlar atlandı';

  @override
  String get expectedFormat => 'Beklenen biçim:';

  @override
  String get noClipboardContent =>
      'Panoda kopyalanmış NDEF içeriği bulunmuyor.';

  @override
  String get pasteFromClipboardTitle => 'NDEF Panosundan Yapıştır';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'Panodaki Veri: $count kayıt, $bytes bayt ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      'Mevcut beste kayıtlarını tamamen değiştirmek mi yoksa sonuna eklemek mi istiyorsunuz?';

  @override
  String get pasteOverwriteOption => 'Üzerine Yaz (Değiştir)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'Mevcut $count kayıt silinip pano içeriğiyle değiştirilir (onay istenir).';
  }

  @override
  String get pasteEmptySubtitle => 'Pano içeriği besteye yerleştirilir.';

  @override
  String get pasteAppendOption => 'Sonuna Ekle (Append)';

  @override
  String get pasteAppendSubtitle =>
      'Mevcut kayıtlar korunur, panodaki kayıtlar listenin sonuna ilave edilir.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count adet kayıt besteye eklendi.';
  }

  @override
  String get confirmOverwriteTitle => 'Kayıtların Üzerine Yazılsın mı?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'Mevcut bestede $currentCount adet kayıt bulunuyor. Bu kayıtlar silinecek ve yerlerine panodaki $newCount adet kayıt getirilecektir. Devam edilsin mi?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return '$count adet kayıt ile bestedeki kayıtlar değiştirildi.';
  }

  @override
  String get yesReplace => 'Evet, Değiştir';

  @override
  String recordsImportedToComposer(num count) {
    return '$count adet kayıt besteye aktarıldı.';
  }

  @override
  String get noContentToCopy => 'Kopyalanacak NDEF içeriği bulunamadı.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count adet NDEF kaydı panoya alındı ve besteye eklendi (İçerik kopyalandı, UID kopyalanmaz).';
  }

  @override
  String get noContentToRewrite => 'Yeniden yazılacak NDEF içeriği bulunamadı.';

  @override
  String get rewriteTagTitle => 'Etiketi Yeniden Yaz';

  @override
  String get importantNotice => 'ÖNEMLİ BİLGİLENDİRME:';

  @override
  String get rewriteNotice1 =>
      '• Bu işlem hedef etiketin mevcut NDEF içeriğini TAMAMEN DEĞİŞTİRİR (üzerine yazar), sonuna eklemez.\n';

  @override
  String get rewriteNotice2 =>
      '• Hedef etiketin yazılabilir (kilitsiz) bir NDEF etiketi olması şarttır.\n';

  @override
  String get rewriteNotice3 =>
      '• İşlem önceki etikete sessizce yazmaz; yeni bir NFC dokunuşu beklenir.';

  @override
  String rewriteSourceUidLabel(String uid) {
    return 'Kaynak UID: $uid';
  }

  @override
  String rewriteRecordCountLabel(num count) {
    return 'Yazılacak Kayıt Sayısı: $count';
  }

  @override
  String get rewriteInstruction =>
      'Hedef etiketi hazırlayın ve \"Dokun ve Yaz\" butonuna bastıktan sonra etiketi telefonun arkasına yaklaştırın.';

  @override
  String get tapAndWrite => 'Dokun ve Yaz';

  @override
  String get rewritePromptMessage =>
      'Hedef etiketi cihazınıza yaklaştırın (İçerik tamamen yenilenecektir)';

  @override
  String rewriteFailedMessage(String error) {
    return 'Yeniden yazma başarısız: $error';
  }

  @override
  String get writeVerifiedTitle => 'Yazma Doğrulandı';

  @override
  String get writeVerifiedDesc =>
      'NDEF içeriği hedef etikete başarıyla yazıldı ve doğrulandı.';

  @override
  String writtenRecordCount(num count) {
    return 'Yazılan Kayıt Sayısı: $count';
  }

  @override
  String get writeVerifiedHint =>
      'Yazılan veriyi doğrulamak veya karşılaştırmak için sonraki taramayı başlatabilirsiniz.';

  @override
  String get scanAndCompareNow => 'Şimdi Tara ve Karşılaştır';

  @override
  String get contentMatchesExactly => 'İçerik Birebir Eşleşiyor';

  @override
  String get differenceDetected => 'Farklılık Tespit Edildi';

  @override
  String compareScannedUid(String uid) {
    return 'Taranan Etiket UID: $uid';
  }

  @override
  String compareWrittenData(num count, num bytes) {
    return 'Yazılan Veri: $count kayıt ($bytes Bayt)';
  }

  @override
  String compareScannedData(num count, num bytes) {
    return 'Taranan Veri: $count kayıt ($bytes Bayt)';
  }

  @override
  String get compareMatchDesc =>
      'Hedef etiketteki NDEF mesajı ile yazılan kaynak NDEF mesajı bayt bayt tamamen aynıdır.';

  @override
  String get compareDiffDesc =>
      'Hedef etiketten okunan veriler ile yazılmak istenen veri arasında farklılık var. Etiketin kilitli veya farklı bir etiket olup olmadığını kontrol ediniz.';

  @override
  String get batchEmptyComposerError =>
      'Toplu yazım başlatmak için önce beste sekmesine en az bir kayıt ekleyiniz.';

  @override
  String get batchWriteTitle => 'Toplu Etiket Yazımı (Batch)';

  @override
  String get batchWriteSubtitle =>
      'Aynı NDEF içeriğini birden fazla etikete sırayla yazabilirsiniz.';

  @override
  String get attention => 'DİKKAT:';

  @override
  String get batchNotice1 =>
      '• Yanlışlıkla aynı etikete iki kez yazılmasını engellemek için her yazım kullanıcı tarafından açıkça \"Sıradakini Yaz\" butonu ile başlatılır.\n';

  @override
  String get batchNotice2 =>
      '• Otomatik arka arkaya tarama yapılmaz; her etiket fiziksel olarak değiştirilmelidir.';

  @override
  String batchTargetCountLabel(num count) {
    return 'Hedef Etiket Sayısı: $count';
  }

  @override
  String batchComposerSummary(num count, num bytes) {
    return 'Bestedeki Kayıtlar: $count adet ($bytes Bayt)';
  }

  @override
  String get batchStartButton => 'Toplu Yazımı Başlat';

  @override
  String get batchControlPanelTitle => 'Toplu Yazım Kontrol Paneli';

  @override
  String get batchCancelOrClose => 'İptal Et / Kapat';

  @override
  String get batchAllCompleted => 'Tüm etiket denemeleri tamamlandı!';

  @override
  String batchNextTag(num current, num total) {
    return 'Sıradaki: Etiket #$current / $total';
  }

  @override
  String batchStats(num success, num fail, num remaining) {
    return 'Başarılı: $success | Hatalı: $fail | Kalan: $remaining';
  }

  @override
  String batchSuccessMsg(String message) {
    return 'Başarılı ($message)';
  }

  @override
  String batchFailMsg(String message) {
    return 'Başarısız: $message';
  }

  @override
  String tagNumberLabel(num index) {
    return 'Etiket #$index: ';
  }

  @override
  String get waitingForTag => 'Etiket Bekleniyor...';

  @override
  String tapToWriteForTag(num index) {
    return 'Etiket #$index İçin Dokun ve Yaz';
  }

  @override
  String get batchFinishButton => 'Toplu Yazımı Bitir';

  @override
  String batchPromptMessage(num current, num total) {
    return 'Toplu Yazım: #$current / $total etiketi cihaza yaklaştırın';
  }

  @override
  String batchTagSuccessSummary(num count) {
    return '$count kayıt yazıldı ve doğrulandı';
  }

  @override
  String get writeError => 'Yazma hatası';

  @override
  String get batchConfirmCancelTitle => 'Toplu Yazımı İptal Et';

  @override
  String get batchConfirmCancelMessage =>
      'Toplu yazım oturumu sonlandırılsın mı? Şimdiye kadar yazılmış olan etiketlerdeki veriler korunur; kalan etiketler yazılmaz.';

  @override
  String get cancelled => 'İptal edildi';

  @override
  String get batchCancelledSnack =>
      'Toplu yazım işlemi iptal edildi. Besteniz korundu.';

  @override
  String get cancelAndClose => 'İptal Et ve Kapat';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'Çevrimdışı URL İncelemesi';

  @override
  String get urlSafetyScheme => 'Şema (Protokol):';

  @override
  String get urlSafetyPort => 'Bağlantı Noktası (Port):';

  @override
  String get urlSafetyUserInfoLabel => 'Kullanıcı Bilgisi (UserInfo):';

  @override
  String get urlSafetyIpLiteral => 'Doğrudan IP Adresi (IP Literal):';

  @override
  String get urlSafetyDomain => 'Hayır (Alan adı)';

  @override
  String get urlSafetyPunycodeLabel => 'Uluslararası / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => 'Evet (Homoglif şüphesi)';

  @override
  String get urlSafetyWarningsHeader => 'Güvenlik / Dikkat Uyarıları:';

  @override
  String get urlSafetyDisclaimer =>
      'NOT: Bu analiz tamamen yerel/çevrimdışı kurallarla yapılmıştır. Ağ üzerinden zararlı yazılım veya antivirüs kontrolü iddiasında bulunmaz. URL otomatik olarak açılmaz.';

  @override
  String templateLoadedToComposer(String name) {
    return '\"$name\" şablonundaki kayıtlar yazma bestesine aktarıldı.';
  }

  @override
  String get templateSaveEmptyError =>
      'Şablon olarak kaydetmek için önce kayıt ekleyiniz.';

  @override
  String templateDefaultName(num index) {
    return 'Şablon $index';
  }

  @override
  String get templateNameSample => 'Örn: Şirket Web Sitesi & İletişim';

  @override
  String get templateSavedSnack => 'Şablon kaydedildi.';

  @override
  String get ruleNoteRequiresNdef =>
      'Not eklemek için etikette en az bir NDEF kaydı bulunmalıdır.';

  @override
  String get ruleNoteAddTitle => 'Etikete Özel Not Ekle';

  @override
  String get ruleNoteDigestExplanation =>
      'Bu not, etiketin NDEF içerik SHA-256 özetine bağlanır. Etiket tekrar tarandığında sadece bu açıklama gösterilir; harici eylem başlatmaz veya sistem ayarlarını değiştirmez.';

  @override
  String ruleNoteShaSummary(String sha) {
    return 'NDEF İçerik Özeti (SHA-256):\n$sha';
  }

  @override
  String get ruleNoteSavedSnack => 'Etiket notu kaydedildi.';

  @override
  String get ruleNoteDeleteTitle => 'Etiket Notunu Sil';

  @override
  String get ruleNoteDeleteConfirm =>
      'Bu etikete ait kayıtlı uygulama içi not silinecektir. Devam edilsin mi?';

  @override
  String get ruleNoteDeletedSnack => 'Etiket notu silindi.';

  @override
  String get backupExportTitle => 'Yedek Dışa Aktar';

  @override
  String get backupExportWarningTitle => 'GİZLİLİK VE GÜVENLİK UYARISI';

  @override
  String get backupExportWarningBody =>
      'Dışa aktarılan yedek dosyası (JSON) düz metin biçimindedir. Kayıtlarınız içerisinde Wi-Fi parolaları, iletişim (vCard) veya e-posta gibi hassas veriler bulunabilir. Dosyayı güvenli bir konumda saklayınız ve üçüncü şahıslarla paylaşırken dikkatli olunuz.';

  @override
  String get backupIncludedItems => 'Dahil Edilecek Öğeler:';

  @override
  String backupTemplatesCount(num count) {
    return '• Şablonlar: $count adet';
  }

  @override
  String backupRulesCount(num count) {
    return '• Uygulama İçi Etiket Notları/Kuralları: $count adet';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Tarama Geçmişini Dahil Et (İsteğe Bağlı)';

  @override
  String backupHistoryCount(num count) {
    return '$count adet geçmiş kaydı';
  }

  @override
  String get backupHistoryDisabled => 'Tarama geçmişi bu cihazda kapalıdır';

  @override
  String get backupExportAndShare => 'Dışa Aktar ve Paylaş';

  @override
  String get backupFileNameLabel => 'NFC Etiket Yöneticisi Yedek Dosyası';

  @override
  String get backupFileShareSubject =>
      'NFC Etiket Yöneticisi şablon ve veri yedeği (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'Yedek dosyası başarıyla dışa aktarıldı ve paylaşıldı.';

  @override
  String get backupExportCancelled => 'Dışa aktarma paylaşımı iptal edildi.';

  @override
  String backupExportError(String error) {
    return 'Dışa aktarma hatası: $error';
  }

  @override
  String get backupImportTitle => 'Yedek İçe Aktar';

  @override
  String get backupMergeRuleTitle => 'GÜVENLİK VE BİRLEŞTİRME KURALI';

  @override
  String get backupMergeRule1 =>
      '• İçe aktarma BİRLEŞTİRME (merge) mantığıyla çalışır; mevcut kayıtlarınız ASLA silinmez.\n';

  @override
  String get backupMergeRule2 =>
      '• Yedek dosyasında Wi-Fi parolaları veya kişisel veriler bulunabilir; yalnızca güvendiğiniz kaynaklardan gelen yedekleri yükleyiniz.\n';

  @override
  String get backupMergeRule3 =>
      '• Dosya boyutu sınırı: 2 MiB. Veriler yüklenmeden önce katı şema ve Base64 doğrulamasına tabi tutulur.';

  @override
  String get backupSelectFilePrompt =>
      'Birleştirmek istediğiniz geçerli bir .json yedek dosyasını seçiniz.';

  @override
  String get selectFileButton => 'Dosya Seç';

  @override
  String get fileSelectionCancelled => 'Dosya seçimi iptal edildi.';

  @override
  String get backupFileExceedsLimit =>
      'Seçilen dosya izin verilen 2 MiB sınırını aşıyor.';

  @override
  String fileReadError(String error) {
    return 'Dosya okuma hatası: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Yedek doğrulama hatası: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Tarama Geçmişi Algılandı';

  @override
  String backupHistoryDetectedMsg(num count) {
    return 'Yedek dosyasında $count adet tarama geçmişi kaydı bulunuyor, ancak bu cihazda tarama geçmişi özelliği kapalıdır.\n\n';
  }

  @override
  String get backupHistoryDetectedPrompt =>
      'Geçmişi de içe aktarıp tarama geçmişini etkinleştirmek istiyor musunuz? Yoksa geçmiş kayıtları atlanıp yalnızca şablonlar ve etiket notları mı içe aktarılsın?';

  @override
  String get backupSkipHistoryOption =>
      'Geçmişi Atla (Yalnızca Şablon ve Notları Yükle)';

  @override
  String get backupEnableHistoryOption => 'Geçmişi Etkinleştir ve Yükle';

  @override
  String backupImportSuccessWithSummary(String summary) {
    return 'İçe Aktarma Başarılı:\n$summary';
  }

  @override
  String backupMergeError(String error) {
    return 'Birleştirme hatası: $error';
  }

  @override
  String get nfcReadyStatus => 'NFC Hazır';

  @override
  String get nfcReadyDesc => 'NFC donanımı aktif ve kullanıma hazır';

  @override
  String get nfcDisabledStatus => 'NFC Kapalı';

  @override
  String get nfcDisabledDesc => 'NFC kapalı. Lütfen cihaz ayarlarından açın.';

  @override
  String ndefClipboardBanner(num count, num bytes, String source) {
    return 'NDEF Panosu: $count kayıt ($bytes B) - $source';
  }

  @override
  String get template => 'Şablon';

  @override
  String get nfcScannerTitle => 'NFC Tarayıcı';

  @override
  String lastScannedTagId(String id) {
    return 'Son etiket: $id';
  }

  @override
  String get composeRecord => 'Kayıt oluştur';

  @override
  String get protectOrRemove => 'Koru / kaldır';

  @override
  String get previousScans => 'Önceki taramalar';

  @override
  String scanErrorWithMsg(String error) {
    return 'Tarama hatası: $error';
  }

  @override
  String get noScannedTagYet => 'Henüz taranmış bir NFC etiketi yok';

  @override
  String get tapScanPrompt =>
      '\"Taramayı Başlat\" butonuna dokunun ve etiketi telefona yaklaştırın.';

  @override
  String get ndefCopyAndRewriteTitle =>
      'NDEF İçerik Kopyalama ve Yeniden Yazım';

  @override
  String ndefCopyNotice(num count, num bytes) {
    return '$count kayıt ($bytes Bayt) - Yalnızca NDEF verisi işlenir, UID kopyalanmaz.';
  }

  @override
  String tagIdHeader(String id) {
    return 'Etiket $id';
  }

  @override
  String get savedTagNoteHeader => 'Kayıtlı Etiket Notu (Uygulama İçi Kural)';

  @override
  String get tagNoteOrRule => 'Etiket Notu / Kuralı';

  @override
  String get editNote => 'Notu Düzenle';

  @override
  String get deleteNote => 'Notu Sil';

  @override
  String get tagNoteDigestNotice =>
      'Bu not tam NDEF baytlarının SHA-256 özetiyle eşleştirilmiştir. Harici işlem başlatmaz.';

  @override
  String get addCustomTagNotePrompt =>
      'Bu NDEF içeriğine özel yerel bir not veya açıklama ekleyebilirsiniz.';

  @override
  String get addNoteToThisTag => 'Bu Etikete Not Ekle';

  @override
  String get ndefSupport => 'NDEF Desteği:';

  @override
  String get usedSpace => 'Kullanılan Alan:';

  @override
  String get freeSpace => 'Boş Alan:';

  @override
  String errorWithMsg(String error) {
    return 'Hata: $error';
  }

  @override
  String get noNdefMessageOnTag => 'Etikette kayıtlı NDEF mesajı bulunamadı.';

  @override
  String readNdefRecordsHeader(num count) {
    return 'Okunan NDEF Kayıtları ($count)';
  }

  @override
  String stagedNdefRecordsHeader(num count) {
    return 'Bestelenen NDEF Kayıtları ($count)';
  }

  @override
  String get hideDetails => 'Ayrıntıları Gizle';

  @override
  String get advancedRecordInspector => 'Kayıt Denetçisi (Gelişmiş)';

  @override
  String get ndefRecordInspectorTitle =>
      'Gelişmiş Kayıt Denetçisi (NDEF Record Inspector)';

  @override
  String get inspectorType => 'Tür (Type):';

  @override
  String get inspectorPayloadLength => 'Yük Uzunluğu (Payload):';

  @override
  String get inspectorRawHexPreview => 'Ham Hex Önizleme (Sınırlandırılmış):';

  @override
  String inspectorPayloadTruncated(num length) {
    return 'Not: Yük $length bayt olduğu için ilk 64 baytı gösterilmektedir.';
  }

  @override
  String get ndefRecordsToWriteTitle => 'Yazılacak NDEF Kayıtları';

  @override
  String get pasteFromClipboardAction => 'Panodan Yapıştır (Değiştir / Ekle)';

  @override
  String get importAction => 'İçe Aktar';

  @override
  String get importFromTagAction => 'NFC etiketten içe aktar';

  @override
  String get importFromQrAction => 'QR koddan içe aktar';

  @override
  String get importFromCsvAction => 'CSV dosyasından içe aktar';

  @override
  String composerTotalSizeAndCount(num bytes, num count) {
    return 'Toplam Boyut: $bytes Bayt | Kayıt Sayısı: $count';
  }

  @override
  String get composerEmptyDescription =>
      'Etikete metin, web adresi, Wi-Fi, telefon, e-posta, kişi kartı ve daha fazlasını yazabilirsiniz.';

  @override
  String get urlSafetyReview => 'URL İncelemesi';

  @override
  String get inspector => 'Denetçi';

  @override
  String get typeLabel => 'Tür:';

  @override
  String get payloadLabel => 'Yük:';

  @override
  String get writeAndVerify => 'Etikete Yaz ve Doğrula';

  @override
  String writeAndVerifyWithBytes(num bytes) {
    return 'Etikete Yaz ve Doğrula ($bytes Bayt)';
  }

  @override
  String get batchWriteButtonLabel => 'Toplu Etiket Yazımı (2..100 Etiket)';

  @override
  String get clearTagButtonLabel => 'Etiketi Sıfırla (İçeriği Temizle)';

  @override
  String get confirmWriteTitle => 'Etikete Yazmayı Onayla';

  @override
  String get confirmWriteMessage1 =>
      'Bu işlem hedef etiketin mevcut NDEF içeriğini tamamen DEĞİŞTİRİR (üzerine yazar).';

  @override
  String confirmWriteRecordCount(num count) {
    return 'Yazılacak Kayıt Sayısı: $count';
  }

  @override
  String get confirmWriteMessage2 =>
      'Hedef etiketin yazılabilir (kilitsiz) olduğundan emin olun. Yazdıktan sonra etiket içeriği otomatik olarak doğrulanacaktır.';

  @override
  String get yesWrite => 'Evet, Yaz';

  @override
  String get scanHistoryDisabledTitle => 'Tarama Geçmişi Kapalı';

  @override
  String get scanHistoryDisabledDesc =>
      'Gizlilik nedeniyle tarama geçmişi varsayılan olarak kaydedilmez. Geçmişi tutmak için ayarlar sekmesinden etkinleştirebilirsiniz.';

  @override
  String get enableHistory => 'Geçmişi Etkinleştir';

  @override
  String get historySearchHint =>
      'UID, metin veya tür ile ara (Örn: URL, Wi-Fi, 04A1...)';

  @override
  String historyScansCount(num count) {
    return 'Kayıtlı Taramalar: $count';
  }

  @override
  String get noHistoryYet => 'Henüz kayıtlı tarama geçmişi bulunmuyor.';

  @override
  String noHistoryResultsForQuery(String query) {
    return '\"$query\" için sonuç bulunamadı.';
  }

  @override
  String get tryDifferentQuery =>
      'Farklı bir UID, metin içeriği veya kayıt türü deneyiniz.';

  @override
  String get clearSearch => 'Aramayı Temizle';

  @override
  String historyItemHeader(String time, num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kayıt',
      one: '1 Kayıt',
    );
    return '$time | $_temp0';
  }

  @override
  String get deleteThisRecord => 'Bu kaydı sil';

  @override
  String historyCapacitySummary(num cap, num used) {
    return 'Kapasite: ${cap}B | Kullanılan: ${used}B';
  }

  @override
  String historyUidHeader(String uid) {
    return 'Geçmiş UID $uid';
  }

  @override
  String get qrPreview => 'QR Önizleme';

  @override
  String templateRecordCountWithDate(num count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Kayıt',
      one: '1 Kayıt',
    );
    return '$_temp0 | $date';
  }

  @override
  String writeVerificationSummary(num bytes, String status) {
    return 'Yazılan Bayt: $bytes | Doğrulama: $status';
  }

  @override
  String get lockTagConfirmTitle => 'Etiketi Kalıcı Olarak Kilitle';

  @override
  String get lockTagWarning1 =>
      'Kilitlenen etiket salt okunur olur: içeriği bir daha DEĞİŞTİRİLEMEZ, silinemez ve kilit KALDIRILAMAZ.';

  @override
  String get lockTagWarning2 => 'Önce doğru içeriği yazdığınızdan emin olun.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langEn => 'English';

  @override
  String get langDe => 'Deutsch';

  @override
  String get langFr => 'Français';

  @override
  String get langEs => 'Español';

  @override
  String get langIt => 'Italiano';

  @override
  String get langPt => 'Português';

  @override
  String get langRu => 'Русский';

  @override
  String get langAr => 'العربية';

  @override
  String get langJa => '日本語';

  @override
  String get langZh => '中文';

  @override
  String get langKo => '한국어';

  @override
  String get langNl => 'Nederlands';

  @override
  String get langUk => 'Українська';

  @override
  String get qrPreviewTooltip => 'QR Kod Önizleme';

  @override
  String get unknownParentheses => '(Bilinmiyor)';

  @override
  String get ok => 'Tamam';
}
