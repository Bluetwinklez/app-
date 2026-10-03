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
  String get appLinksDesc =>
      'Bu bağlantıları bir etikete yazarsanız, iPhone etikete dokununca bildirim gösterir ve uygulamayı ilgili ekranda açar.';

  @override
  String get appLinksSection => 'Uygulama bağlantıları';

  @override
  String get appPackageName => 'Android Paket Adı';

  @override
  String get appTitle => 'NFC Etiket Yöneticisi';

  @override
  String get autoRunOnTap => 'Etikete dokununca otomatik çalıştır';

  @override
  String get backupFileSizeExceeded =>
      'Yedek dosyası boyutu 2 MiB sınırını aşıyor.';

  @override
  String get backupHistoryMustBeList => '\"history\" alanı bir dizi olmalıdır.';

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
  String get backupInvalidTemplateId =>
      'Şablon kimliği (id) geçerli bir metin olmalıdır.';

  @override
  String get backupInvalidTemplateName =>
      'Şablon adı (name) geçerli bir metin olmalıdır.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Geçmiş kayıt sayısı izin verilen $max sınırını aşıyor ($count).';
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
  String get clearConfirmMessage =>
      'Bu işlem etiket üzerindeki tüm NDEF kayıtlarını silecek ve boş bir kayıt yazacaktır. Devam etmek istiyor musunuz?';

  @override
  String get clearConfirmTitle => 'Etiket İçeriğini Sıfırla';

  @override
  String get clearHistory => 'Geçmişi Temizle';

  @override
  String get clearTagSubtitle => 'Tüm kayıtları silip boş NDEF yazar';

  @override
  String get clearTagTitle => 'Etiketi Sil';

  @override
  String get close => 'Kapat';

  @override
  String get commandsEmptyError => 'En az bir komut giriniz.';

  @override
  String get commandsLabel => 'Komutlar';

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
  String get contactPhone => 'Telefon';

  @override
  String get contactTitle => 'Unvan';

  @override
  String get contactWebsite => 'Web Sitesi';

  @override
  String get copy => 'Kopyala';

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
  String get deleteTemplateTooltip => 'Şablonu Sil';

  @override
  String get deviceNameTooLong => 'Cihaz adı çok uzun.';

  @override
  String get dismiss => 'Vazgeç';

  @override
  String get editRecordTitle => 'Kaydı Düzenle';

  @override
  String get emailRecipient => 'Alıcı E-posta';

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
  String get flashlight => 'Fener';

  @override
  String get formatMemorySubtitle =>
      'NDEF için hazırlar (boş veya bozuk etiketler)';

  @override
  String get formatMemoryTitle => 'Belleği Biçimlendir';

  @override
  String get idTooLarge => 'Kimlik (ID) boyutu 255 baytı aşamaz';

  @override
  String get importBackup => 'İçe Aktar (Birleştir)';

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
  String get locationLabel => 'Nerede?';

  @override
  String get lockAcknowledge => 'Bu işlemin geri alınamayacağını anlıyorum';

  @override
  String get lockTagSubtitle =>
      'Kalıcı olarak salt okunur yapar (geri alınamaz)';

  @override
  String get lockTagTitle => 'Etiketi Kilitle';

  @override
  String get manage => 'Yönet';

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
      'Kişi kartınızı paylaşır; Android rehbere eklemeyi önerir, iPhone\'da NFC uygulamasıyla açılır.';

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
  String get presetGuestWifiDesc =>
      'Android telefonlar dokununca ağa bağlanır; iPhone\'da bilgiler bir NFC uygulamasıyla görülür.';

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
  String get rawRecordDetailsTitle => 'Kayıt Ayrıntıları (Salt Okunur)';

  @override
  String get rawRecordEditorTitle => 'Ham NDEF Kaydı Düzenle';

  @override
  String get readHeroButton => 'Taramayı Başlat';

  @override
  String get readMemorySubtitle =>
      'Sayfa sayfa ham bellek; kopyala veya .bin olarak kaydet';

  @override
  String get readMemoryTitle => 'Belleği Oku';

  @override
  String get readyTemplates => 'Hazır Şablonlar';

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
  String get redo => 'Yinele';

  @override
  String get removePasswordSubtitle => 'Bilinen şifreyle korumayı kaldırır';

  @override
  String get removePasswordTitle => 'Şifreyi Kaldır';

  @override
  String get rewriteTag => 'Yeniden Yaz';

  @override
  String ruleDeleteConfirm(String note) {
    return '\"$note\" açıklamalı etiket kuralı silinecektir. Devam edilsin mi?';
  }

  @override
  String get ruleNoteDialogTitle => 'Etiket Notunu Düzenle';

  @override
  String get ruleNoteLabel => 'Uygulama İçi Not / Açıklama';

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
  String get scanFabLabel => 'Etiketi tara';

  @override
  String get scannedTag => 'Taranan Etiket';

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
  String get socialUsername => 'Kullanıcı Adı';

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
  String get tabContact => 'Kişi (vCard)';

  @override
  String get tabCustomMime => 'Özel MIME';

  @override
  String get tabEmail => 'E-posta';

  @override
  String get tabPhone => 'Telefon';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabText => 'Metin';

  @override
  String get tabUrl => 'Web URL';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => 'Etiket Bilgileri';

  @override
  String get tagLibraryTitle => 'Etiket Kütüphanem';

  @override
  String tagRulesCount(int count) {
    return 'Kayıtlı Kural / Not Sayısı: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'NDEF içerik baytlarının SHA-256 özetine göre eşleşen etiketlerde yalnızca kaydedilen not gösterilir. Harici işlem başlatmaz.';

  @override
  String get tagWritable => 'Yazılabilir';

  @override
  String get takePhoto => 'Fotoğraf çek';

  @override
  String get templateNameHint => 'Şablon Adı';

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
  String get videoUrlOrIdPrompt =>
      'Video bağlantısı (https://...) veya YouTube video kimliği giriniz.';

  @override
  String get wifiAuthOpen => 'Açık (Şifresiz)';

  @override
  String get wifiPassword => 'Şifre';

  @override
  String get wifiSsid => 'Ağ Adı (SSID)';

  @override
  String get withSiri => 'Siri ile';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes bayt) etiketin kullanıcı belleğine yazılacak. UID, kilit ve ayar sayfalarına dokunulmaz. Etiketteki mevcut veri silinir.';
  }

  @override
  String get writeDumpSubtitle => 'Kayıtlı bellek dosyasını etikete yazar';

  @override
  String get writeDumpTitle => 'Dump Yaz (.bin)';

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
  String get rewriteInstruction =>
      'Hedef etiketi hazırlayın ve \"Dokun ve Yaz\" butonuna bastıktan sonra etiketi telefonun arkasına yaklaştırın.';

  @override
  String get tapAndWrite => 'Dokun ve Yaz';

  @override
  String get rewritePromptMessage =>
      'Hedef etiketi cihazınıza yaklaştırın (İçerik tamamen yenilenecektir)';

  @override
  String get writeVerifiedTitle => 'Yazma Doğrulandı';

  @override
  String get writeVerifiedDesc =>
      'NDEF içeriği hedef etikete başarıyla yazıldı ve doğrulandı.';

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
  String get batchStartButton => 'Toplu Yazımı Başlat';

  @override
  String get batchControlPanelTitle => 'Toplu Yazım Kontrol Paneli';

  @override
  String get batchCancelOrClose => 'İptal Et / Kapat';

  @override
  String get batchAllCompleted => 'Tüm etiket denemeleri tamamlandı!';

  @override
  String batchStats(String ok, String failed, String left) {
    return 'Başarılı: $ok | Hatalı: $failed | Kalan: $left';
  }

  @override
  String get waitingForTag => 'Etiket Bekleniyor...';

  @override
  String get batchFinishButton => 'Toplu Yazımı Bitir';

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
  String get templateSaveEmptyError =>
      'Şablon olarak kaydetmek için önce kayıt ekleyiniz.';

  @override
  String templateDefaultName(String n) {
    return 'Şablon $n';
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
  String get ruleNoteSavedSnack => 'Etiket notu kaydedildi.';

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
  String backupTemplatesCount(String count) {
    return '• Şablonlar: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• Uygulama içi etiket notları/kuralları: $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Tarama Geçmişini Dahil Et (İsteğe Bağlı)';

  @override
  String backupHistoryCount(String count) {
    return '$count geçmiş kaydı';
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
  String get backupHistoryDetectedPrompt =>
      'Geçmişi de içe aktarıp tarama geçmişini etkinleştirmek istiyor musunuz? Yoksa geçmiş kayıtları atlanıp yalnızca şablonlar ve etiket notları mı içe aktarılsın?';

  @override
  String get backupSkipHistoryOption =>
      'Geçmişi Atla (Yalnızca Şablon ve Notları Yükle)';

  @override
  String get backupEnableHistoryOption => 'Geçmişi Etkinleştir ve Yükle';

  @override
  String get nfcReadyStatus => 'NFC Hazır';

  @override
  String get nfcReadyDesc => 'NFC donanımı aktif ve kullanıma hazır';

  @override
  String get nfcDisabledStatus => 'NFC Kapalı';

  @override
  String get nfcDisabledDesc => 'NFC kapalı. Lütfen cihaz ayarlarından açın.';

  @override
  String get template => 'Şablon';

  @override
  String get nfcScannerTitle => 'NFC Tarayıcı';

  @override
  String get composeRecord => 'Kayıt oluştur';

  @override
  String get protectOrRemove => 'Koru / kaldır';

  @override
  String get previousScans => 'Önceki taramalar';

  @override
  String get noScannedTagYet => 'Henüz taranmış bir NFC etiketi yok';

  @override
  String get tapScanPrompt =>
      '\"Taramayı Başlat\" butonuna dokunun ve etiketi telefona yaklaştırın.';

  @override
  String get ndefCopyAndRewriteTitle =>
      'NDEF İçerik Kopyalama ve Yeniden Yazım';

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
  String get noNdefMessageOnTag => 'Etikette kayıtlı NDEF mesajı bulunamadı.';

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
  String get batchWriteButtonLabel => 'Toplu Etiket Yazımı (2..100 Etiket)';

  @override
  String get clearTagButtonLabel => 'Etiketi Sıfırla (İçeriği Temizle)';

  @override
  String get confirmWriteTitle => 'Etikete Yazmayı Onayla';

  @override
  String get confirmWriteMessage1 =>
      'Bu işlem hedef etiketin mevcut NDEF içeriğini tamamen DEĞİŞTİRİR (üzerine yazar).';

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
  String get noHistoryYet => 'Henüz kayıtlı tarama geçmişi bulunmuyor.';

  @override
  String get tryDifferentQuery =>
      'Farklı bir UID, metin içeriği veya kayıt türü deneyiniz.';

  @override
  String get clearSearch => 'Aramayı Temizle';

  @override
  String get deleteThisRecord => 'Bu kaydı sil';

  @override
  String get qrPreview => 'QR Önizleme';

  @override
  String get lockTagConfirmTitle => 'Etiketi Kalıcı Olarak Kilitle';

  @override
  String get lockTagWarning2 => 'Önce doğru içeriği yazdığınızdan emin olun.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'QR Kod Önizleme';

  @override
  String get unknownParentheses => '(Bilinmiyor)';

  @override
  String get ok => 'Tamam';

  @override
  String rewriteSourceUid(String uid) {
    return 'Kaynak UID: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return 'Yazılacak kayıt: $count';
  }

  @override
  String rewriteFailed(String message) {
    return 'Yeniden yazma başarısız: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return 'Yazılan kayıt: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'Taranan etiket UID: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return 'Yazılan veri: $count kayıt ($bytes bayt)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'Taranan veri: $count kayıt ($bytes bayt)';
  }

  @override
  String batchTargetCount(String count) {
    return 'Hedef etiket sayısı: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return 'Yazma listesi: $count kayıt ($bytes bayt)';
  }

  @override
  String batchNext(String current, String total) {
    return 'Sıradaki: Etiket #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return 'Başarılı ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return 'Başarısız: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'Etiket #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'Etiket #$n için dokun ve yaz';
  }

  @override
  String batchPrompt(String current, String total) {
    return 'Toplu yazım: #$current / $total etiketi cihaza yaklaştırın';
  }

  @override
  String batchWrittenVerified(String count) {
    return '$count kayıt yazıldı ve doğrulandı';
  }

  @override
  String templateLoaded(String name) {
    return '\"$name\" şablonundaki kayıtlar yazma listesine aktarıldı.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'NDEF içerik özeti (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return 'Dışa aktarma hatası: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'Yedek dosyasında $count tarama geçmişi kaydı var, ancak bu cihazda tarama geçmişi kapalı.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'İçe aktarma başarılı:\n$summary';
  }

  @override
  String mergeError(String error) {
    return 'Birleştirme hatası: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'NDEF panosu: $count kayıt ($bytes B) - $source';
  }

  @override
  String get heroScanSubtitle =>
      'Etiketi telefonun üst kısmına yaklaştırın; içerik, kapasite ve seri numarası anında görünür.';

  @override
  String lastTagLabel(String uid) {
    return 'Son etiket: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'Tarama hatası: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count kayıt ($bytes bayt) - Yalnızca NDEF verisi işlenir, UID kopyalanmaz.';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'Etiket $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'Hata: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return 'Okunan NDEF kayıtları ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return 'Yazılacak NDEF kayıtları ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return 'Not: Yük $bytes bayt olduğu için ilk 64 baytı gösteriliyor.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return 'Toplam boyut: $bytes bayt | Kayıt sayısı: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return 'Etikete yaz ve doğrula ($bytes bayt)';
  }

  @override
  String savedScansCount(String count) {
    return 'Kayıtlı taramalar: $count';
  }

  @override
  String historyNoResults(String query) {
    return '\"$query\" için sonuç bulunamadı.';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count kayıt';
  }

  @override
  String historyCapacity(String max, String used) {
    return 'Kapasite: $max B | Kullanılan: $used B';
  }

  @override
  String historySourceLabel(String uid) {
    return 'Geçmiş UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count kayıt | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return 'Kayıtlı kural / not sayısı: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return 'Yazılan bayt: $bytes | Doğrulama: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'Kilitlenen etiket salt okunur olur: içeriği bir daha DEĞİŞTİRİLEMEZ, silinemez ve kilit KALDIRILAMAZ. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'Mesaj boyutu: $bytes bayt';
  }

  @override
  String bytesShort(String bytes) {
    return 'Bayt: $bytes B';
  }

  @override
  String bytesValue(String bytes) {
    return '$bytes bayt';
  }

  @override
  String bytesOfCapacity(String bytes, String max) {
    return '$bytes / $max bayt';
  }

  @override
  String get valueNone => 'Yok';

  @override
  String get valueYesIp => 'Evet (IP adresi)';

  @override
  String get nfcMissingShort => 'NFC Yok';

  @override
  String get clearClipboard => 'Panoyu temizle';

  @override
  String get statLibrary => 'Kütüphane';

  @override
  String get scanTagTitle => 'Etiketi Tara';

  @override
  String get readingInProgress => 'Okunuyor...';

  @override
  String get rawMemorySubtitle => 'Ham bellek';

  @override
  String get copyToClipboard => 'Panoya kopyala';

  @override
  String get serialUidLabel => 'Seri No (UID):';

  @override
  String get totalCapacityLabel => 'Toplam kapasite:';

  @override
  String get technologiesLabel => 'Teknolojiler:';

  @override
  String get idLabel => 'Kimlik (ID):';

  @override
  String get undoTooltip => 'Geri al';

  @override
  String get clearComposer => 'Listeyi temizle';

  @override
  String composerTotalSize(String bytes) {
    return 'Toplam boyut: $bytes bayt';
  }

  @override
  String get yesClear => 'Evet, temizle';

  @override
  String get ssidTooLong => 'SSID en fazla 32 bayt olabilir.';

  @override
  String get locationPlace => 'Konum / Yer';

  @override
  String get targetWebUrl => 'Hedef web URL *';

  @override
  String get languageCodeLabel => 'Dil kodu (ISO 639-1) *';

  @override
  String get utf8Text => 'UTF-8 metin';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf, boyut: $bytes bayt';
  }

  @override
  String get quickGallerySubtitle => 'Tek dokunuşla hazır';

  @override
  String get quickLibraryTitle => 'Kütüphanem';

  @override
  String get quickLibrarySubtitle => 'Kayıtlı etiketler';

  @override
  String get saveToLibrary => 'Kütüphaneye kaydet';

  @override
  String libraryMatch(String name) {
    return 'Kütüphanede: $name';
  }

  @override
  String tagChipLabel(String chip) {
    return 'Çip: $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return 'Üretici: $name';
  }

  @override
  String get settingsLibrarySubtitle =>
      'İsim, not ve fotoğrafla kayıtlı etiketleriniz';

  @override
  String get showOnboardingAgain => 'Tanıtım rehberini tekrar göster';

  @override
  String get importFromGallery => 'Hazır şablonlardan ekle';

  @override
  String get appearanceTitle => 'Görünüm';

  @override
  String get themeSystem => 'Sistem';

  @override
  String get themeLight => 'Açık';

  @override
  String get themeDark => 'Koyu';

  @override
  String get valuePresentRisky => 'Var (riskli olabilir)';

  @override
  String get supportedValue => 'Destekleniyor';

  @override
  String get notSupportedValue => 'Desteklenmiyor';

  @override
  String get nfcUnsupportedDesc => 'Bu cihazda NFC desteklenmiyor';

  @override
  String get ndefTrailingData => 'NDEF sonunda fazladan veri var';

  @override
  String get ndefMissingEnd => 'NDEF mesaj sonu eksik';

  @override
  String vcardPhoneShort(String value) {
    return 'Tel: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'E-posta: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return 'Kurum: $value';
  }

  @override
  String get pageUidLock => 'UID / Kilit';

  @override
  String get pageData => 'Veri';

  @override
  String get pageLock => 'Kilit';

  @override
  String memoryPageLine(String page) {
    return 'Sayfa $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (telefon)';

  @override
  String get mapApple => 'Apple Haritalar';

  @override
  String get mapGoogle => 'Google Haritalar';

  @override
  String get whatsappMessageHint => 'Merhaba, bilgi almak istiyorum';

  @override
  String get facetimeTargetHint => '+905551112233 veya ad@icloud.com';

  @override
  String get bluetoothMacLabel => 'Bluetooth MAC adresi';

  @override
  String get webAddressUrlLabel => 'Web adresi (URL)';

  @override
  String get latitudeLabel => 'Enlem (Lat)';

  @override
  String get longitudeLabel => 'Boylam (Lng)';

  @override
  String get emailAddressLabel => 'E-posta adresi';

  @override
  String get websiteLabel => 'Web sitesi';

  @override
  String get wifiAuthWpa2Home => 'WPA2 Personal (ev/ofis standardı)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 Personal (karma)';

  @override
  String get hostLabel => 'Sunucu / Host:';

  @override
  String get readOnlyLocked => 'Salt okunur (kilitli)';

  @override
  String get redoTooltip => 'Yinele';

  @override
  String historyFoundCount(String found, String total) {
    return 'Bulunan: $found / $total';
  }

  @override
  String get addToWriteListShort => 'Yazma listesine aktar';

  @override
  String get mimeTypeHint => 'application/json veya text/plain';

  @override
  String get hapticsToggle => 'Titreşim';

  @override
  String get hapticsToggleSubtitle => 'Okuma ve yazma bitince hafif titreşim';

  @override
  String get soundsToggle => 'Ses';

  @override
  String get soundsToggleSubtitle => 'Sonuçta kısa bir sistem sesi çal';

  @override
  String get backupLibraryMustBeList =>
      'Etiket kütüphanesi bir liste olmalıdır.';

  @override
  String get backupInvalidLibraryEntry => 'Geçersiz etiket kütüphanesi kaydı.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'Etiket kütüphanesi en fazla $max kayıt içerebilir.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'Kütüphane: $added eklendi';
  }

  @override
  String backupLibraryCount(String count) {
    return '• Etiket kütüphanesi: $count (fotoğraflar hariç)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return 'Son etiket: $bytes / $max B';
  }

  @override
  String get contentTooLargeForChips =>
      'İçerik yaygın etiketlere sığmıyor; metni kısaltın veya kısa bağlantı kullanın.';

  @override
  String get tagReportTitle => 'Etiket Raporu';

  @override
  String get tagReportSubtitle => 'Çip, kilit, şifre ve doluluk durumu';

  @override
  String get tagReportPrompt => 'Raporu çıkarılacak etiketi yaklaştırın';

  @override
  String get tagReportBusy => 'Etiket inceleniyor...';

  @override
  String tagReportDone(String chip) {
    return 'Rapor hazır: $chip';
  }

  @override
  String get unknownChip => 'Bilinmeyen çip';

  @override
  String get yes => 'Evet';

  @override
  String get reportChip => 'Çip';

  @override
  String get reportNdefFormatted => 'NDEF biçimli';

  @override
  String get reportWritable => 'Yazılabilir';

  @override
  String get reportStaticLock => 'Sabit kilit';

  @override
  String get reportDynamicLock => 'Dinamik kilit';

  @override
  String get reportPassword => 'Şifre koruması';

  @override
  String get reportReadProtected => 'Okuma korumalı';

  @override
  String get reportNdefUsage => 'NDEF doluluk';

  @override
  String get reportVerdictWritable => 'Etiket yazmaya hazır';

  @override
  String get reportVerdictRestricted => 'Etikette kısıtlama var';

  @override
  String get reportCopied => 'Rapor kopyalandı';

  @override
  String get compareTagsTitle => 'İki Etiketi Karşılaştır';

  @override
  String get compareTagsSubtitle =>
      'Kopyanın aslıyla aynı olup olmadığını görün';

  @override
  String get compareStepFirst => 'Önce birinci (asıl) etiketi okutun.';

  @override
  String get compareStepSecond => 'Şimdi ikinci etiketi okutun.';

  @override
  String get compareIdentical => 'İçerikler aynı';

  @override
  String get compareDifferent => 'İçerikler farklı';

  @override
  String get compareSameTag => 'Aynı fiziksel etiket iki kez okutuldu.';

  @override
  String get compareDifferentTags => 'İki farklı fiziksel etiket.';

  @override
  String get compareRecordSame => 'Aynı';

  @override
  String get compareRecordChanged => 'Farklı';

  @override
  String get compareRecordOnlyFirst => 'Sadece A\'da';

  @override
  String get compareRecordOnlySecond => 'Sadece B\'de';

  @override
  String get compareBothEmpty => 'İki etiket de boş.';

  @override
  String capacityExceededShort(String needed, String max) {
    return 'İçerik çok büyük: $needed / $max bayt';
  }

  @override
  String get verifyFailedAfterWrite =>
      'Yazılan veri doğrulanamadı; etiketi daha uzun süre yakın tutun.';

  @override
  String get blankTagTitle => 'Etiket henüz hazır değil';

  @override
  String get blankTagBody =>
      'Bu etiket yeni ve NDEF için biçimlendirilmemiş. Uygulama etiketi hazırlayıp içeriği tek dokunuşta yazabilir (NTAG ve MIFARE Ultralight).';

  @override
  String get blankTagAction => 'Hazırla ve yaz';

  @override
  String get shareTag => 'Paylaş';

  @override
  String get shareAsText => 'Metin olarak paylaş';

  @override
  String get shareAsFile => 'Dosya olarak paylaş (.json)';

  @override
  String get shareAsFileSubtitle =>
      'Kayıtlar başka bir cihazda aynen yazılabilir';

  @override
  String get importFromJsonFile => 'Etiket dosyasından (.json)';

  @override
  String get invalidTagFile => 'Geçersiz etiket dosyası.';

  @override
  String get continuousScanTitle => 'Sürekli tarama';

  @override
  String get continuousScanSubtitle =>
      'Etiketleri art arda okutun; liste CSV olarak paylaşılabilir';

  @override
  String continuousScanCount(String count) {
    return '$count etiket okundu';
  }

  @override
  String get exportCsv => 'CSV olarak paylaş';

  @override
  String get clearList => 'Listeyi temizle';

  @override
  String get csvColumnTime => 'Zaman';

  @override
  String get csvColumnRecords => 'Kayıt';

  @override
  String get csvColumnContent => 'İçerik';

  @override
  String get csvColumnCapacity => 'Kapasite (B)';

  @override
  String get csvColumnUsed => 'Kullanılan (B)';

  @override
  String get batchSerialToggle => 'Seri numara ekle';

  @override
  String batchSerialHint(String token) {
    return 'Bir kayda $token yazarsanız numara oraya gelir; yoksa her etikete numarayı taşıyan ayrı bir metin kaydı eklenir.';
  }

  @override
  String get batchSerialPrefix => 'Ön ek';

  @override
  String get batchSerialStart => 'Başlangıç';

  @override
  String get batchSerialDigits => 'Basamak';

  @override
  String batchSerialPreview(String first, String last) {
    return 'İlk: $first · Son: $last';
  }

  @override
  String get batchFromCsvButton => 'CSV dosyasından (her satır bir etiket)';

  @override
  String get batchCsvTitle => 'CSV ile toplu yazım';

  @override
  String batchCsvSummary(String count) {
    return '$count etiket yazılacak. Her etikete CSV dosyasındaki bir satır yazılır, sırası korunur.';
  }

  @override
  String batchCsvTruncated(String max) {
    return 'Toplu yazımda en fazla $max satır kullanılır; fazlası atlandı.';
  }

  @override
  String get cloneTagTitle => 'Etiket Kopyala';

  @override
  String get cloneTagSubtitle =>
      'Bir etiketi okuyun, içeriğini başka etiketlere yazın';

  @override
  String get cloneSourceStep =>
      '1. adım: Kopyalanacak kaynak etiketi okutun. Yalnızca NDEF içeriği kopyalanır; UID kopyalanamaz.';

  @override
  String get cloneSourceEmpty => 'Kaynak etikette kopyalanacak NDEF kaydı yok.';

  @override
  String get cloneReadyTitle => 'Kaynak okundu';

  @override
  String cloneReadySummary(String count, String bytes) {
    return '$count kayıt ($bytes bayt) kopyalanacak. Şimdi kaç etikete yazılacağını seçin.';
  }

  @override
  String get cloneEditFirst => 'Önce düzenle';

  @override
  String get tapPreviewTitle => 'Telefon dokununca ne olur?';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'Etiket boş; dokununca hiçbir şey olmaz.';

  @override
  String tapIosUrl(String target) {
    return 'Bildirim çıkar; dokununca $target Safari\'de ya da ilgili uygulamada açılır.';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target doğrudan tarayıcıda ya da ilgili uygulamada açılır.';
  }

  @override
  String tapIosApp(String target) {
    return 'Bildirim çıkar; uygulama yüklüyse \"$target\" bağlantısıyla açılır.';
  }

  @override
  String tapAndroidApp(String target) {
    return 'Uygulama yüklüyse \"$target\" bağlantısıyla açılır.';
  }

  @override
  String tapIosCall(String target) {
    return 'Bildirim çıkar; dokununca $target aranır.';
  }

  @override
  String tapAndroidCall(String target) {
    return 'Telefon uygulaması $target numarasıyla açılır.';
  }

  @override
  String tapIosSms(String target) {
    return 'Bildirim çıkar; Mesajlar $target için yeni mesajla açılır.';
  }

  @override
  String tapAndroidSms(String target) {
    return 'Mesajlaşma uygulaması $target için açılır.';
  }

  @override
  String tapIosEmail(String target) {
    return 'Bildirim çıkar; Mail $target adresine yeni e-postayla açılır.';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'E-posta uygulaması $target için açılır.';
  }

  @override
  String get tapIosMap =>
      'iPhone \"geo:\" konumlarını kendiliğinden açmaz. Apple ya da Google Haritalar bağlantısı kullanın (Hızlı bağlantılar).';

  @override
  String get tapAndroidMap => 'Harita uygulaması bu konumda açılır.';

  @override
  String get tapIosNeedsApp =>
      'iPhone bu içerikle kendiliğinden bir şey yapmaz; görmek için bir NFC uygulamasıyla okutulmalı.';

  @override
  String get tapAndroidText =>
      'Çoğu telefonda bir şey olmaz ya da metin sistem ekranında gösterilir.';

  @override
  String get tapAndroidContact => 'Kişiyi rehbere ekleme önerilir.';

  @override
  String get tapAndroidWifi => 'Ağa bağlanma önerilir (Android 10 ve sonrası).';

  @override
  String get tapAndroidCalendar =>
      'Takvim uygulaması destekliyorsa etkinlik eklenmesi önerilir.';

  @override
  String get tapAndroidOther =>
      'Yalnızca bu içeriği tanıyan bir uygulama yüklüyse açılır.';

  @override
  String tapIgnoredRecords(String count) {
    return 'Telefonlar yalnızca ilk kaydı çalıştırır; diğer $count kayıt NFC uygulamalarında görünür.';
  }

  @override
  String get tapIosRequirement =>
      'iPhone XS ve sonrası, ekran kilidi açıkken ve kamera/Cüzdan açık değilken arka planda okur.';

  @override
  String get galleryCatBusiness => 'İş';

  @override
  String get galleryCatSocial => 'Sosyal';

  @override
  String get galleryCatHome => 'Ev';

  @override
  String get galleryCatPersonal => 'Kişisel';

  @override
  String get galleryCatAutomation => 'Otomasyon';

  @override
  String get galleryFavorites => 'Favoriler';

  @override
  String get gallerySearchHint => 'Şablon ara...';

  @override
  String get galleryNoResults => 'Eşleşen şablon yok.';

  @override
  String get galleryAddFavorite => 'Favorilere ekle';

  @override
  String get galleryRemoveFavorite => 'Favorilerden çıkar';

  @override
  String get presetEventTitle => 'Etkinlik Daveti';

  @override
  String get presetEventDesc =>
      'Etkinliği takvim (iCalendar) biçiminde yazar; Android takvime ekleyebilir.';

  @override
  String get eventNameLabel => 'Etkinlik adı';

  @override
  String get eventDateLabel => 'Tarih (YYYY-AA-GG)';

  @override
  String get eventTimeLabel => 'Saat (SS:DD)';

  @override
  String get eventDateTimeInvalid =>
      'Tarih ya da saat geçersiz. Örnek: 2026-12-31 ve 19:00';

  @override
  String get presetLuggageTitle => 'Bavul Etiketi';

  @override
  String get presetLuggageDesc => 'Kaybolursa bulan kişi size kolayca ulaşsın.';

  @override
  String luggageMessage(String name, String contact) {
    return 'Bu bavul $name kişisine aittir. Bulursanız lütfen ulaşın: $contact';
  }

  @override
  String get presetPlaylistTitle => 'Çalma Listesi';

  @override
  String get presetPlaylistDesc =>
      'Spotify, Apple Music ya da YouTube listesini açar.';

  @override
  String get playlistLinkLabel => 'Çalma listesi bağlantısı';

  @override
  String get presetEmailMeTitle => 'Bana E-posta Gönder';

  @override
  String get presetEmailMeDesc => 'Hazır konuyla size yeni bir e-posta açar.';

  @override
  String get presetCallMeTitle => 'Beni Ara';

  @override
  String get presetCallMeDesc => 'Dokunan telefon numaranızı arar.';

  @override
  String get presetRunShortcutTitle => 'Kısayol Çalıştır';

  @override
  String get presetRunShortcutDesc =>
      'iPhone\'da adını verdiğiniz Kısayolu çalıştırır: ışıkları aç, müzik başlat, odak modunu değiştir...';

  @override
  String get shortcutNameLabel => 'Kısayol adı';

  @override
  String get recipesSection => 'Hazır otomasyon tarifleri';

  @override
  String get recipesIntro =>
      'Kısayollar\'da aşağıdaki adla bir kısayol oluşturup eylemleri ekleyin. Sonra NFC otomasyonuna bağlayın ya da \"Etikete ekle\" ile kısayolu çalıştıran bağlantıyı yazın.';

  @override
  String get recipeAddToTag => 'Etikete ekle';

  @override
  String get recipeBedTitle => 'İyi Geceler';

  @override
  String get recipeBedActions =>
      'Komodin: Uyku odağını aç · alarmı kur · ışıkları kapat';

  @override
  String get recipeCarTitle => 'Araba Modu';

  @override
  String get recipeCarActions =>
      'Araç tutucu: Sürüş odağı · eve yol tarifi · müziği başlat';

  @override
  String get recipeDoorTitle => 'Eve Geldim';

  @override
  String get recipeDoorActions =>
      'Kapı girişi: ışıkları aç · Wi-Fi\'yi aç · aileye \"Geldim\" mesajı';

  @override
  String get recipeDeskTitle => 'Çalışma Modu';

  @override
  String get recipeDeskActions =>
      'Masa: İş odağı · 25 dk zamanlayıcı · odak çalma listesi';

  @override
  String get recipeGymTitle => 'Antrenman';

  @override
  String get recipeGymActions =>
      'Spor çantası: antrenmanı başlat · spor çalma listesi · rahatsız etme';

  @override
  String get recipeKitchenTitle => 'Mutfak Zamanlayıcı';

  @override
  String get recipeKitchenActions =>
      'Mutfak: 10 dk zamanlayıcı · alışveriş listesini aç';

  @override
  String get libraryLabelsField => 'Etiketler / klasörler (virgülle ayırın)';

  @override
  String get libraryLabelsHint => 'ofis, 2. kat';

  @override
  String librarySaveFailed(String error) {
    return 'Kaydedilemedi: $error';
  }

  @override
  String get csvColumnLabels => 'Etiketler';

  @override
  String get firstNameLabel => 'Ad';

  @override
  String get lastNameLabel => 'Soyad';

  @override
  String get wifiPasswordMinHint => 'En az 8 karakter';

  @override
  String get emailExampleHint => 'ornek@alanadi.com';

  @override
  String get wifiSsidExampleHint => 'Ev_Interneti_5G';

  @override
  String get nfcErrUnavailable => 'Bu cihazda NFC yok ya da kapalı.';

  @override
  String get nfcErrBusy => 'Devam eden bir NFC işlemi var; bitmesini bekleyin.';

  @override
  String get nfcErrCancelled => 'İşlem iptal edildi.';

  @override
  String get nfcErrAppPaused =>
      'Uygulama arka plana geçtiği için işlem iptal edildi.';

  @override
  String get nfcErrUnsupportedTag => 'Bu etiket türü desteklenmiyor.';

  @override
  String get nfcErrNtagOnly =>
      'Bu araç yalnızca NTAG / MIFARE Ultralight etiketlerde çalışır.';

  @override
  String get nfcErrNotNdefRead => 'Etiket algılandı ama NDEF biçiminde değil.';

  @override
  String get nfcErrNotNdefWrite =>
      'Etiket NDEF biçiminde değil; bu telefon ona doğrudan NDEF yazamıyor.';

  @override
  String get nfcErrReadOnly => 'Etiket salt okunur (kilitli); yazılamaz.';

  @override
  String get nfcErrNoData => 'Yazılacak veri yok.';

  @override
  String nfcErrCapacity(String required, String max) {
    return 'Etiket kapasitesi yetersiz: $required bayt gerekli, en fazla $max bayt.';
  }

  @override
  String get nfcErrCapacityShort => 'Etiket kapasitesi yetersiz.';

  @override
  String get nfcErrVerify =>
      'Doğrulama başarısız: etiketten okunan veri yazılanla eşleşmiyor.';

  @override
  String get nfcErrConnectionLost =>
      'Etiket bağlantısı koptu; etiketi sabit tutup tekrar deneyin.';

  @override
  String get nfcErrAlreadyLocked => 'Etiket zaten kilitli (salt okunur).';

  @override
  String get nfcErrLockNotNdef =>
      'Etiket NDEF biçiminde değil; kilitlemeden önce bir kayıt yazın.';

  @override
  String get nfcErrLockNotSupported =>
      'Bu etiket türü kilitlemeyi desteklemiyor.';

  @override
  String get nfcSheetConnected => 'Etiket bağlandı, işlem yapılıyor...';

  @override
  String get nfcSheetReadOk => 'Etiket okundu!';

  @override
  String get nfcSheetEmptyRead => 'Boş etiket okundu!';

  @override
  String get nfcSheetMultipleTags =>
      'Birden fazla etiket algılandı. Yalnızca bir etiket yaklaştırın.';

  @override
  String get nfcSheetWriteVerified => 'Yazıldı ve doğrulandı!';

  @override
  String get nfcSheetWritten => 'Etikete yazıldı!';

  @override
  String get nfcSheetLocked => 'Etiket kalıcı olarak kilitlendi!';

  @override
  String get nfcWriteDone => 'Etikete başarıyla yazıldı.';

  @override
  String get errorWidgetMessage =>
      'Bu bölüm gösterilemedi. Geri dönüp tekrar deneyin.';

  @override
  String get nfcErrTimeout =>
      'Süre doldu; etiket algılanmadı. Etiketi telefonun üst kısmına yaklaştırıp tekrar deneyin.';

  @override
  String get aboutTitle => 'Hakkında';

  @override
  String aboutVersion(String version) {
    return 'Sürüm $version';
  }

  @override
  String get privacySummary =>
      'Verileriniz yalnızca bu cihazda kalır: hesap yok, sunucu yok, reklam ya da takip yok.';

  @override
  String get whatsNewTitle => 'Yenilikler';

  @override
  String get whatsNew110 =>
      '• 14 dil, koyu mod ve yeni tasarım\n• Hazır şablonlar: kategoriler, arama ve favoriler\n• Toplu yazma: seri numara, CSV ve etiket kopyalama\n• \"Dokununca ne olur?\" önizlemesi ve kapasite uyarıları\n• Etiket kütüphanesi: fotoğraf, not ve etiketler\n• Etiket raporu, karşılaştırma, sürekli tarama ve CSV dışa aktarma\n• Siri, Kısayollar ve hazır otomasyon tarifleri';

  @override
  String lastBackupAt(String date) {
    return 'Son yedek: $date';
  }

  @override
  String get noBackupYet => 'Henüz yedek alınmadı.';

  @override
  String get backupStale =>
      'Son yedek 30 günden eski; yeni bir yedek almanız önerilir.';

  @override
  String get backupICloudTip =>
      'İpucu: Paylaş menüsünde \"Dosyalara Kaydet\" → iCloud Drive seçerek yedeği iCloud\'a saklayabilirsiniz.';

  @override
  String get dragToReorder => 'Sıralamak için sürükleyin';

  @override
  String get modeTitle => 'Mod';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeCompat => 'Uyumluluk';

  @override
  String get modeNormalDesc =>
      'Normal: Tüm özellikler açık; yazılan her etiket geri okunup doğrulanır.';

  @override
  String get modeCompatDesc =>
      'Uyumluluk: Yazdıktan sonra geri okuma yapılmaz. Bazı eski ya da sorunlu etiketlerde yazma daha güvenilir olur.';

  @override
  String get rateApp => 'Uygulamayı değerlendirin';

  @override
  String get rateAppUnavailable =>
      'Değerlendirme penceresi şu an açılamadı (TestFlight\'ta gösterilmez).';

  @override
  String get chipsTitle => 'NFC çipleri';

  @override
  String get chipsSubtitle =>
      'Hangi etiketi almalı? Kapasite ve telefon desteği';

  @override
  String get chipsIntro =>
      'Kullanılabilir bayt, etikete yazılabilecek NDEF içeriğinin üst sınırıdır. Yeni başlayanlar için NTAG215 iyi bir seçimdir.';

  @override
  String chipsUsable(String bytes) {
    return 'Kullanılabilir: $bytes bayt';
  }

  @override
  String get chipsReadWrite => 'Okuma ve yazma';

  @override
  String get chipsReadOnlyNdef => 'Yalnızca NDEF ise';

  @override
  String get chipsNotSupported => 'Desteklenmez';

  @override
  String get chipsNxpOnly => 'Yalnızca NXP çipli telefonlar';

  @override
  String get chipUseSmall => 'Tek bağlantı, kısa metin, Wi-Fi; en ucuzu';

  @override
  String get chipUseMedium => 'Kartvizit, birden çok kayıt; amiibo figürleri';

  @override
  String get chipUseLarge => 'Uzun içerik, ayrıntılı kartvizit';

  @override
  String get chipUseSecure =>
      'Sahteciliğe karşı güvenli doğrulama (ürün, bilet)';

  @override
  String get chipUseTicket => 'Toplu taşıma ve etkinlik biletleri';

  @override
  String get chipUseAccess => 'Kapı / turnike kartları, otel kartları';

  @override
  String get chipUseIndustrial =>
      'Kütüphane, depo ve endüstriyel etiketler; uzun okuma mesafesi';

  @override
  String get chipUseJapan => 'Japonya\'da yaygın (ulaşım, ödeme)';

  @override
  String get chipUseLegacy => 'Eski tip; yeni projeler için önerilmez';

  @override
  String templateVarsHint(String date, String time, String counter) {
    return 'İpucu: Metin ya da bağlantıya $date, $time, $counter yazarsanız yazarken otomatik doldurulur.';
  }

  @override
  String templateVarsPreview(String date, String time, String counter) {
    return 'Yazarken: $date · $time · sayaç $counter';
  }

  @override
  String get libraryWriteToTag => 'Etikete yaz';

  @override
  String libraryWritePrompt(String name) {
    return '\"$name\" içeriğini yazmak için etiketi yaklaştırın';
  }

  @override
  String get presetSmartCardTitle => 'Akıllı Kart';

  @override
  String get presetSmartCardDesc =>
      'Tek etikette web siteniz, kartvizitiniz ve isteğe bağlı Wi-Fi. Telefon önce siteyi açar.';

  @override
  String get presetLostItemTitle => 'Kayıp Eşya';

  @override
  String get presetLostItemDesc =>
      'Bulan kişi dokununca size hazır bir SMS taslağı açılır.';

  @override
  String get lostItemNameLabel => 'Eşya (ör. Anahtar, Cüzdan)';

  @override
  String lostItemSms(String item) {
    return 'Merhaba, $item eşyanızı buldum.';
  }

  @override
  String lostItemText(String item, String name) {
    return 'Bu $item $name kişisine aittir. Bulduysanız lütfen haber verin.';
  }

  @override
  String get presetVoiceTitle => 'Sesli Mesaj';

  @override
  String get presetVoiceDesc =>
      'Hediye ya da kutu üzerine: dokununca sesli notunuz veya şarkınız açılır.';

  @override
  String get voiceLinkLabel =>
      'Ses dosyası bağlantısı (iCloud, Drive, SoundCloud…)';

  @override
  String get logbookTitle => 'Kayıt Defteri';

  @override
  String get logbookSubtitle =>
      'Yoklama, ilaç ve envanter: her okutma saatiyle kaydedilir';

  @override
  String get logbookNew => 'Yeni defter';

  @override
  String get logbookName => 'Defter adı';

  @override
  String get logbookKindAttendance => 'Yoklama';

  @override
  String get logbookKindMedication => 'İlaç takibi';

  @override
  String get logbookKindInventory => 'Envanter sayımı';

  @override
  String get logbookKindCustom => 'Diğer';

  @override
  String get logbookEmpty =>
      'Henüz defter yok. Örneğin \"Sınıf 3A yoklama\" ya da \"Akşam ilacı\" adıyla bir defter açın.';

  @override
  String get logbookScanButton => 'Okut ve kaydet';

  @override
  String logbookEntryAdded(String label) {
    return 'Kaydedildi: $label';
  }

  @override
  String get logbookNoEntries => 'Bu defterde henüz kayıt yok.';

  @override
  String logbookToday(String count, String tags) {
    return 'Bugün: $count kayıt · $tags farklı etiket';
  }

  @override
  String logbookMedTaken(String time) {
    return 'Bugün alındı ✓ (son: $time)';
  }

  @override
  String get logbookMedNotTaken => 'Bugün henüz alınmadı';

  @override
  String logbookInventorySummary(String count) {
    return '$count farklı etiket sayıldı';
  }

  @override
  String logbookDeleteConfirm(String name) {
    return '\"$name\" defteri ve tüm kayıtları silinsin mi?';
  }

  @override
  String logbookEntries(String count) {
    return '$count kayıt';
  }

  @override
  String lastSeenAt(String date) {
    return 'Son görülme: $date';
  }

  @override
  String get neverSeen => 'Henüz okutulmadı';

  @override
  String get sortLongestUnseen => 'En uzun süredir görülmeyen';

  @override
  String get unseen30Days => '30+ gündür görülmedi';

  @override
  String get inventoryCardTitle => 'Bu etiket kütüphanenizde';

  @override
  String scanReportLine(String unique, String dup, String empty) {
    return '$unique farklı etiket · $dup tekrar okunan · $empty boş';
  }

  @override
  String get printSheet => 'Yazdırılabilir etiket sayfası (PDF)';

  @override
  String get phishDangerTitle => 'Dikkat: sahte site olabilir';

  @override
  String get phishCautionTitle => 'Bağlantıyı açmadan önce kontrol edin';

  @override
  String phishLookalike(String brand) {
    return 'Adres $brand sitesine benziyor ama resmi alan adı değil.';
  }

  @override
  String phishBrandInSubdomain(String brand) {
    return '\"$brand\" başka bir sitenin önüne eklenmiş; asıl site farklı.';
  }

  @override
  String phishBrandInName(String brand) {
    return 'Alan adında \"$brand\" geçiyor ama resmi site değil.';
  }

  @override
  String phishShortener(String host) {
    return 'Kısaltılmış bağlantı ($host): gerçek adres gizli.';
  }

  @override
  String phishRiskyTld(String tld) {
    return '\".$tld\" uzantısı oltalama sitelerinde sık kullanılır.';
  }

  @override
  String get phishDisclaimer =>
      'Bu kontrol çevrimdışı ipuçlarına dayanır; bir sitenin güvenli olduğunu garanti etmez.';

  @override
  String get backupEncrypt => 'Parolayla şifrele';

  @override
  String get backupEncryptHint =>
      'Yedek AES-256 ile şifrelenir. Parolayı unutursanız dosya açılamaz.';

  @override
  String get backupPassword => 'Parola';

  @override
  String get backupPasswordRepeat => 'Parola (tekrar)';

  @override
  String backupPasswordTooShort(String min) {
    return 'Parola en az $min karakter olmalı.';
  }

  @override
  String get backupPasswordMismatch => 'Parolalar eşleşmiyor.';

  @override
  String get backupEncryptedPrompt =>
      'Bu yedek parolayla korunuyor. Açmak için parolayı girin.';

  @override
  String get backupWrongPassword => 'Parola yanlış.';

  @override
  String get backupDecryptFailed => 'Yedek çözülemedi; dosya bozuk olabilir.';

  @override
  String get appLockTitle => 'Uygulama kilidi';

  @override
  String get appLockSubtitle =>
      'Açılışta Face ID, Touch ID veya cihaz parolası iste';

  @override
  String get appLockUnavailable =>
      'Bu cihazda ekran kilidi (Face ID / parola) ayarlı değil.';

  @override
  String get appLockLocked => 'Uygulama kilitli';

  @override
  String get appLockUnlock => 'Kilidi aç';

  @override
  String get appLockReason => 'Etiket kütüphanenizi ve geçmişinizi açmak için';

  @override
  String get sigTitle => 'İmzalı etiketler';

  @override
  String get sigSubtitle => 'Etiket içeriği değiştirilirse fark edin';

  @override
  String get sigExplain =>
      'Yazdığınız etiketlere gizli anahtarınızla bir imza kaydı eklenir. Bu uygulamayla okununca içerik değiştirilmişse uyarı verir. Anahtarı ekip arkadaşlarınızla paylaşabilirsiniz; anahtarı olmayan kişi imzayı taklit edemez. Etiketi okumayı engellemez.';

  @override
  String get sigCreateKey => 'Anahtar oluştur';

  @override
  String get sigCopyKey => 'Anahtarı kopyala (ekiple paylaş)';

  @override
  String get sigImportKey => 'Anahtar yapıştır';

  @override
  String get sigImportInvalid => 'Panodaki metin geçerli bir anahtar değil.';

  @override
  String sigKeyReady(String id) {
    return 'Anahtar hazır ($id)';
  }

  @override
  String get sigSignOnWrite => 'Yazdığım etiketleri imzala';

  @override
  String get sigValid => 'İmza geçerli';

  @override
  String get sigInvalid => 'İmza geçersiz: içerik değiştirilmiş';

  @override
  String get sigOtherKey => 'Başka bir anahtarla imzalanmış';

  @override
  String get sigReplaceKeyConfirm =>
      'Mevcut anahtar değiştirilsin mi? Eski anahtarla imzalanan etiketler artık \"başka anahtar\" olarak görünür.';

  @override
  String get amiiboTitle => 'Amiibo bilgisi';

  @override
  String get amiiboSubtitle => 'Figür/kart kimliği ve serisi (yalnızca okuma)';

  @override
  String get amiiboPrompt => 'Amiibo figürünü veya kartını yaklaştırın';

  @override
  String amiiboNotNtag215(String chip) {
    return 'Bu bir amiibo değil ($chip); amiibo\'lar NTAG215 kullanır.';
  }

  @override
  String get amiiboNotFound => 'NTAG215 okundu ama amiibo verisi bulunamadı.';

  @override
  String amiiboSeries(String series) {
    return 'Seri: $series';
  }

  @override
  String amiiboType(String type) {
    return 'Tür: $type';
  }

  @override
  String get amiiboFigure => 'Figür';

  @override
  String get amiiboCard => 'Kart';

  @override
  String get amiiboYarn => 'Örgü';

  @override
  String get amiiboLookup => 'Adını çevrimiçi ara (amiiboapi.com)';

  @override
  String memoryEditPage(String page) {
    return 'Sayfa $page düzenle (4 bayt hex)';
  }

  @override
  String get memoryEditHint =>
      'Kullanıcı sayfalarına dokunup düzenleyebilirsiniz.';

  @override
  String memoryEditPrompt(String page) {
    return 'Sayfa $page için aynı etiketi yaklaştırın';
  }

  @override
  String memoryPageWritten(String page) {
    return 'Sayfa $page yazıldı.';
  }

  @override
  String get memoryUidMismatch => 'Farklı bir etiket algılandı; yazılmadı.';

  @override
  String memoryReadSpeed(String ms, String rate) {
    return 'Okuma süresi: $ms ms ($rate bayt/sn)';
  }

  @override
  String get simpleModeTitle => 'Basit mod';

  @override
  String get simpleModeSubtitle =>
      'Büyük düğmeler; çocuklar ve yaşlılar için tek dokunuşla okuma';

  @override
  String get simpleScan => 'Etiketi Okut';

  @override
  String get simpleHint => 'Etiketi telefonun üst kısmına yaklaştırın.';

  @override
  String get simpleCall => 'Ara';

  @override
  String get simpleMessage => 'Mesaj gönder';

  @override
  String get simpleOpen => 'Aç';

  @override
  String get simpleEmail => 'E-posta yaz';

  @override
  String get simpleMap => 'Haritada aç';

  @override
  String get simpleExit => 'Normal görünüme dönmek için basılı tutun';

  @override
  String get simpleNothing => 'Bu etikette gösterilecek bir şey yok.';

  @override
  String whatsNew120(String date, String time, String counter) {
    return '• Kayıt Defteri: yoklama, ilaç ve envanter takibi\n• Güvenlik: Face ID kilidi, şifreli yedek, imzalı etiket, sahte site uyarısı\n• Şablon değişkenleri ($date, $time, $counter) ve kütüphaneden etikete yazma\n• Yeni şablonlar: Akıllı Kart, Kayıp Eşya, Sesli Mesaj\n• QR kodlu yazdırılabilir etiket sayfası (PDF)\n• Basit mod, amiibo bilgisi, bayt düzenleyici, NFC çipleri rehberi\n• Sürükle-bırak sıralama ve Uyumluluk modu';
  }

  @override
  String get logbookKindTimeClock => 'Giriş / Çıkış (mesai)';

  @override
  String get logbookCheckIn => 'Giriş';

  @override
  String get logbookCheckOut => 'Çıkış';

  @override
  String logbookCheckedIn(String label) {
    return 'Giriş yapıldı: $label';
  }

  @override
  String logbookCheckedOut(String label) {
    return 'Çıkış yapıldı: $label';
  }

  @override
  String logbookPresentNow(String count) {
    return 'Şu an içeride: $count';
  }

  @override
  String logbookWorkedToday(String duration) {
    return 'Bugün toplam süre: $duration';
  }

  @override
  String get logbookWorkedPerPerson => 'Bugünkü süreler';

  @override
  String durationHm(String h, String m) {
    return '$h sa $m dk';
  }

  @override
  String get csvColumnDirection => 'Yön';

  @override
  String get libraryCheckEvery => 'Kontrol aralığı';

  @override
  String get libraryCheckNone => 'Yok';

  @override
  String libraryCheckDays(String days) {
    return '$days günde bir';
  }

  @override
  String get libraryCheckHint =>
      'Etiketi bu sürede bir okutmazsanız \"kontrol zamanı\" uyarısı çıkar (yangın tüpü, filtre, bitki sulama…).';

  @override
  String get libraryCheckDue => 'Kontrol zamanı geldi';

  @override
  String libraryCheckNext(String date) {
    return 'Sonraki kontrol: $date';
  }

  @override
  String libraryDueFilter(String count) {
    return 'Kontrol bekleyenler ($count)';
  }

  @override
  String libraryCheckRecorded(String date) {
    return 'Kontrol kaydedildi · sonraki: $date';
  }

  @override
  String cloneWarning(String name) {
    return 'Bu içerik kütüphanenizde \"$name\" adlı etikette farklı bir UID ile kayıtlı. Bu etiket bir kopya olabilir.';
  }

  @override
  String get doctorTitle => 'NDEF Doktoru';

  @override
  String get doctorButton => 'Sağlık kontrolü';

  @override
  String get doctorTooShort =>
      'Bellek tam okunamadı; etiketi telefona daha uzun süre tutup tekrar deneyin.';

  @override
  String get doctorNoCc =>
      'Etiket NDEF için hazırlanmamış (boş). Araçlar → \"NDEF biçimlendir\" ile hazırlayabilir ya da doğrudan yazabilirsiniz.';

  @override
  String get doctorVersion =>
      'NDEF sürüm baytı alışılmadık; bazı telefonlar etiketi okumayabilir.';

  @override
  String get doctorReadRestricted =>
      'Okuma erişimi kısıtlı olarak işaretli; telefonlar içeriği göstermeyebilir.';

  @override
  String get doctorReadOnly =>
      'Etiket salt okunur (kilitli); içerik değiştirilemez.';

  @override
  String get doctorNoNdef =>
      'Bellekte NDEF bloğu yok. Etikete yeniden yazmak sorunu giderir.';

  @override
  String get doctorEmpty => 'Etiket hazır ama içi boş.';

  @override
  String get doctorOverflow =>
      'Uzunluk alanı belleğin dışına taşıyor; içerik bozuk. Etikete yeniden yazın.';

  @override
  String doctorExceeds(String bytes) {
    return 'Mesaj ($bytes bayt) etiketin bildirdiği kapasiteden büyük; telefonlar kesik okuyabilir.';
  }

  @override
  String get doctorNoTerminator =>
      'Bitiş işareti (FE) yok. Çoğu telefon yine okur; yeniden yazmak düzeltir.';

  @override
  String get doctorUnknownTlv =>
      'Bellekte tanınmayan veri bloğu var; telefonlar okurken takılabilir.';

  @override
  String doctorBadRecord(String n) {
    return '$n. kayıt bozuk (başlık veya uzunluk hatalı). Etikete yeniden yazın.';
  }

  @override
  String doctorHealthy(String count) {
    return 'Her şey yolunda: $count kayıt doğru biçimde yazılmış.';
  }

  @override
  String get libraryImportTitle => 'Tablodan içe aktar';

  @override
  String get libraryImportHint =>
      'Excel, Numbers veya Google E-Tablolar\'dan satırları kopyalayıp buraya yapıştırın. Sütunlar: ad, içerik (bağlantı ya da metin), konum, etiketler, not, UID. Başlık satırı varsa sütunlar adına göre eşleşir.';

  @override
  String libraryImportPreview(String count) {
    return '$count etiket eklenecek';
  }

  @override
  String libraryImportSkipped(String dupes, String invalid) {
    return '$dupes satır zaten kayıtlı UID nedeniyle, $invalid satır adı olmadığı için atlanacak';
  }

  @override
  String get libraryImportPaste => 'Panodan yapıştır';

  @override
  String get libraryImportAdd => 'Ekle';

  @override
  String libraryImportDone(String count) {
    return '$count etiket kütüphaneye eklendi';
  }

  @override
  String get presetGiftTitle => 'Hediye mesajı';

  @override
  String get presetGiftDesc =>
      'Hediyeye yapıştırın: dokununca mesajınız ve isterseniz bir video bağlantısı açılır.';

  @override
  String get giftTo => 'Kime';

  @override
  String get giftFrom => 'Kimden';

  @override
  String get giftVideo => 'Video bağlantısı (isteğe bağlı)';

  @override
  String giftText(String to, String message, String from) {
    return '🎁 $to,\n$message\n— $from';
  }

  @override
  String get presetPlantTitle => 'Bitki bakım kartı';

  @override
  String get presetPlantDesc =>
      'Saksıya yapıştırın: sulama ve ışık bilgisi. Kütüphanede kontrol aralığı vererek sulama hatırlatıcısı da yapabilirsiniz.';

  @override
  String get plantName => 'Bitki adı';

  @override
  String get plantWater => 'Sulama';

  @override
  String get plantLight => 'Işık';

  @override
  String plantText(String plant, String water, String light) {
    return '🌱 $plant\n💧 $water\n☀️ $light';
  }

  @override
  String get presetChildTitle => 'Çocuk güvenlik bilekliği';

  @override
  String get presetChildDesc =>
      'Kalabalık yerlerde: dokunan kişi çocuğun adını görür ve ailesini tek dokunuşla arar.';

  @override
  String get childName => 'Çocuğun adı';

  @override
  String childText(String name, String phone) {
    return 'Merhaba, ben $name. Kaybolduysam lütfen ailemi arayın: $phone';
  }

  @override
  String get presetManualTitle => 'Kullanım talimatı';

  @override
  String get presetManualDesc =>
      'Spor aleti, kahve makinesi, kiralık ev cihazı: kısa talimat ve video/kılavuz bağlantısı.';

  @override
  String get manualItem => 'Cihaz / eşya';

  @override
  String get manualSteps => 'Kısa talimat';

  @override
  String get manualLink => 'Video / kılavuz bağlantısı (isteğe bağlı)';

  @override
  String get libraryAutoLog => 'Okutunca deftere kaydet';

  @override
  String get libraryAutoLogHint =>
      'Bu etiket ana ekrandan okutulduğunda seçilen deftere otomatik kayıt düşülür (ör. kapıdaki etiket → mesai girişi/çıkışı).';

  @override
  String autoLogged(String book) {
    return '\"$book\" defterine kaydedildi';
  }

  @override
  String get whatsNew130 =>
      '• Giriş/Çıkış (mesai) defteri: kim içeride, bugün kaç saat\n• Kütüphane etiketi okutulunca deftere otomatik kayıt\n• Bakım/kontrol hatırlatıcısı ve \"kontrol bekleyenler\" filtresi\n• Kopya etiket uyarısı\n• NDEF Doktoru: bozuk etiketleri teşhis eder\n• Excel/Numbers\'tan kütüphaneye toplu ekleme\n• Yeni şablonlar: Hediye mesajı, Bitki bakımı, Çocuk bilekliği, Kullanım talimatı';

  @override
  String get securityTitle => 'Güvenlik ve gizlilik';

  @override
  String get lockAfterTitle => 'Yeniden kilitleme';

  @override
  String get lockImmediately => 'Hemen';

  @override
  String lockAfterSecondsLabel(String n) {
    return '$n sn';
  }

  @override
  String lockAfterMinutesLabel(String n) {
    return '$n dk';
  }

  @override
  String get hideInSwitcherTitle => 'Uygulama değiştiricide gizle';

  @override
  String get hideInSwitcherSubtitle =>
      'Arka plandayken ekran bulanıklaşır. Android\'de ekran görüntüsü de engellenir.';

  @override
  String get clearClipboardTitle => 'Panoyu otomatik temizle';

  @override
  String get clearClipboardSubtitle =>
      'Kopyalanan anahtar gibi hassas bilgiler 60 saniye sonra panodan silinir.';

  @override
  String get securityConfirmReason => 'Devam etmek için kimliğinizi doğrulayın';

  @override
  String get securityCopiedClears =>
      'Kopyalandı · 60 sn sonra panodan silinecek';

  @override
  String get wipeTitle => 'Tüm verileri sil';

  @override
  String get wipeSubtitle =>
      'Geçmiş, kütüphane, fotoğraflar, defterler, şablonlar, imza anahtarı ve ayarlar';

  @override
  String get wipeConfirm =>
      'Tüm veriler bu cihazdan kalıcı olarak silinsin mi? Bu işlem geri alınamaz; önce yedek almanızı öneririz.';

  @override
  String get wipeDone => 'Tüm veriler silindi';

  @override
  String dataSummary(
      String history, String library, String books, String templates) {
    return '$history geçmiş · $library kütüphane · $books defter · $templates şablon';
  }

  @override
  String get secCheckTitle => 'Güvenlik kontrolü';

  @override
  String secCheckScore(String ok, String total) {
    return '$ok/$total önerilen ayar açık';
  }

  @override
  String get secCheckBackup => 'Son 30 günde yedek alındı';

  @override
  String get secCheckEncryptedNote =>
      'Yedeklerde Wi-Fi şifreleri olabilir; dışa aktarırken parola koruması önerilir.';

  @override
  String get packShare => 'Ekip paketi olarak paylaş';

  @override
  String get packImport => 'Ekip paketini içe aktar';

  @override
  String get packHint =>
      'Görünen etiketler (filtreye göre) tek bir dosyada paylaşılır; ekip arkadaşınız dosyayı Kütüphane → İçe aktar ile ekler. Fotoğraflar paylaşılmaz.';

  @override
  String get packName => 'Paket adı';

  @override
  String packIncludeTemplates(String count) {
    return 'Kayıtlı şablonları da ekle ($count)';
  }

  @override
  String packCount(String count) {
    return '$count etiket paylaşılacak';
  }

  @override
  String get packPassword => 'Parola (isteğe bağlı, en az 6 karakter)';

  @override
  String get packPasswordShort => 'Parola en az 6 karakter olmalı';

  @override
  String packPreview(String name, String tags, String templates) {
    return '\"$name\": $tags etiket, $templates şablon. İçe aktarılsın mı?';
  }

  @override
  String packImported(String tags, String templates, String skipped) {
    return '$tags etiket ve $templates şablon eklendi · $skipped zaten vardı';
  }

  @override
  String packInvalid(String reason) {
    return 'Bu dosya geçerli bir ekip paketi değil ($reason)';
  }

  @override
  String get libraryMoreActions => 'Diğer işlemler';

  @override
  String get appIconTitle => 'Uygulama simgesi';

  @override
  String get appIconFailed => 'Simge değiştirilemedi';

  @override
  String get iconBlue => 'Mavi';

  @override
  String get iconGreen => 'Yeşil';

  @override
  String get iconPurple => 'Mor';

  @override
  String get iconOrange => 'Turuncu';

  @override
  String get iconDark => 'Gece';

  @override
  String get mapTitle => 'Etiket haritası';

  @override
  String get mapEmpty =>
      'Haritada gösterilecek etiket yok. Bir etiketi düzenleyip \"Şu anki konumu ekle\"ye dokunun ya da etikete konum yazın.';

  @override
  String get mapTilesNote => 'Harita görüntüleri OpenStreetMap\'ten yüklenir.';

  @override
  String get mapOpenInMaps => 'Haritalar\'da aç';

  @override
  String get mapAddCurrent => 'Şu anki konumu ekle';

  @override
  String mapPositionSaved(String lat, String lng) {
    return 'Konum: $lat, $lng';
  }

  @override
  String get mapLocationDenied =>
      'Konum izni verilmedi. Ayarlar → Gizlilik → Konum Servisleri\'nden izin verebilirsiniz.';

  @override
  String mapLocationFailed(String error) {
    return 'Konum alınamadı: $error';
  }

  @override
  String get whatsNew140 =>
      '• Güvenlik ve gizlilik bölümü: güvenlik kontrolü, kilit gecikmesi, uygulama değiştiricide gizleme, pano temizleme, tüm verileri sil\n• İmza anahtarı artık Anahtar Zinciri\'nde; hassas işlemler Face ID ister\n• Etiket haritası ve etikete konum kaydetme\n• Ekip paketi: etiket ve şablonları tek dosyayla paylaşın\n• Alternatif uygulama simgeleri\n• Daha sade ayarlar ve kütüphane menüsü';

  @override
  String get ruleAddByScan => 'Etiket okutup not ekle';

  @override
  String get ruleAddLastScan => 'Son okunan etikete not ekle';

  @override
  String get ruleNeedsContent =>
      'Bu etiket boş; not yalnızca içeriği olan etiketlere eklenebilir.';

  @override
  String get simpleWrite => 'Etikete Yaz';

  @override
  String get simpleWriteWhat => 'Ne yazılsın?';

  @override
  String get simpleKindText => 'Yazı';

  @override
  String get simpleKindPhone => 'Telefon';

  @override
  String get simpleKindLink => 'Bağlantı';

  @override
  String get simpleWriteNow => 'Yaz ve etiketi yaklaştır';

  @override
  String get simpleWritten => 'Etikete yazıldı ✓';

  @override
  String get simpleSaved => 'Kayıtlı etiketlerim';

  @override
  String get simpleSavedHint => 'Birine dokunun, aynısını yeni etikete yazın.';

  @override
  String get accentColorTitle => 'Vurgu rengi';

  @override
  String get colorPink => 'Pembe';

  @override
  String get textSizeTitle => 'Yazı boyutu';

  @override
  String get speakTag => 'Sesli oku';

  @override
  String get speakAfterScanTitle => 'Okununca sesli oku';

  @override
  String get speakAfterScanSubtitle =>
      'Etiketin içeriği sesli söylenir; görme güçlüğü olanlar ve basit mod için';

  @override
  String get logbookKindHabit => 'Alışkanlık (seri)';

  @override
  String get logbookKindChores => 'Çocuk görev tablosu';

  @override
  String get logbookKindFeeding => 'Evcil hayvan besleme';

  @override
  String get logbookKindVisitors => 'Ziyaretçi defteri';

  @override
  String habitStreak(String current, String best) {
    return '🔥 $current günlük seri · en uzun $best';
  }

  @override
  String get habitDoneToday => 'Bugün yapıldı ✓';

  @override
  String get habitNotToday => 'Bugün henüz yapılmadı — seriyi bozma!';

  @override
  String choresStars(String count) {
    return 'Bugün ⭐ $count görev tamamlandı';
  }

  @override
  String feedingLast(String ago, String time) {
    return 'Son beslenme: $ago önce ($time)';
  }

  @override
  String get feedingNever => 'Henüz besleme kaydı yok';

  @override
  String visitorsToday(String count) {
    return 'Bugün $count ziyaretçi';
  }

  @override
  String get visitorNamePrompt => 'Ziyaretçi adı';

  @override
  String get visitorNameHint => 'Ad Soyad, firma (isteğe bağlı)';

  @override
  String get reminderBody => 'Etiketi okutmayı unutma 📲';

  @override
  String reminderInspectionTitle(String name) {
    return 'Kontrol zamanı: $name';
  }

  @override
  String get reminderInspectionBody => 'Kontrol ettikten sonra etiketi okutun.';

  @override
  String get reminderTitle => 'Günlük hatırlatma';

  @override
  String get reminderOff => 'Kapalı';

  @override
  String reminderAt(String time) {
    return 'Her gün $time';
  }

  @override
  String get reminderDenied =>
      'Bildirim izni verilmedi. Ayarlar\'dan izin verebilirsiniz.';

  @override
  String get inspectionRemindersNote =>
      'Kontrol tarihi gelen etiketler için saat 10:00\'da bildirim gelir (izin verdiyseniz).';

  @override
  String get presetTableTitle => 'Restoran masası';

  @override
  String get presetTableDesc =>
      'Menü bağlantısı, masa numarası ve tek dokunuşla garson çağırma (SMS).';

  @override
  String get tableNumber => 'Masa numarası';

  @override
  String get menuLink => 'Menü bağlantısı';

  @override
  String get waiterPhone => 'Garson çağrı numarası (isteğe bağlı)';

  @override
  String tableText(String table) {
    return 'Masa $table';
  }

  @override
  String tableSms(String table) {
    return 'Masa $table: garson rica ediyoruz 🙋';
  }

  @override
  String get presetRentalTitle => 'Kiralık ev kartı';

  @override
  String get presetRentalDesc =>
      'Misafirler dokununca Wi-Fi\'ye bağlanır ve ev kurallarını görür.';

  @override
  String get houseRules => 'Ev kuralları';

  @override
  String get checkoutTime => 'Çıkış saati';

  @override
  String rentalText(String rules, String checkout) {
    return '🏠 $rules\nÇıkış: $checkout';
  }

  @override
  String get ideasTitle => 'Fikirler';

  @override
  String get ideasSubtitle => 'Etiketlerle neler yapabileceğinizi keşfedin';

  @override
  String get ideasHome => 'Ev';

  @override
  String get ideasFamily => 'Aile';

  @override
  String get ideasHealth => 'Sağlık ve alışkanlık';

  @override
  String get ideasWork => 'İş';

  @override
  String get ideasAutomation => 'Otomasyon';

  @override
  String get ideaRoutinesTitle => 'Rutinler (Kısayollar)';

  @override
  String get ideaRoutinesDesc =>
      'Yatak başı, araba, kapı, masa: etikete dokununca birden çok işlem.';

  @override
  String get ideaHabitDesc =>
      'Her gün etiketi okut, 🔥 seriyi koru (su, vitamin, spor).';

  @override
  String get ideaChoresDesc => 'Görev etiketlerini okutan çocuk yıldız toplar.';

  @override
  String get ideaFeedingDesc =>
      'Mama kabındaki etiket: \"en son ne zaman beslendi?\"';

  @override
  String get ideaMedicationDesc =>
      'İlaç kutusundaki etiket: bugün alındı mı, kaçta?';

  @override
  String get ideaClockDesc =>
      'Kapıdaki etiket: giriş/çıkış ve günlük çalışma süresi.';

  @override
  String get ideaVisitorsDesc =>
      'Ofis girişinde ziyaretçi kartları; isim ve saat kaydı, CSV.';

  @override
  String get ideaInventoryDesc =>
      'Depo ve demirbaş sayımı: her etiketin son görüldüğü yer.';

  @override
  String get firstTagTitle => 'İlk etiketini yap';

  @override
  String get firstTagSubtitle =>
      'Birini seç, alanları doldur, etiketi telefona yaklaştır. 30 saniye sürer.';

  @override
  String get firstTagMore => 'Daha fazla fikir';

  @override
  String get iconRed => 'Kırmızı';

  @override
  String get iconTeal => 'Turkuaz';

  @override
  String get iconGold => 'Altın';

  @override
  String get iconIndigo => 'Lacivert';

  @override
  String get iconLight => 'Beyaz';

  @override
  String get iconRainbow => 'Gökkuşağı';

  @override
  String get catWebText => 'Web ve metin';

  @override
  String get catContact => 'İletişim ve iş';

  @override
  String get catNetwork => 'Ağ ve konum';

  @override
  String get catSocial => 'Sosyal medya';

  @override
  String get catEmpty => 'Boş';

  @override
  String get analyticsTitle => 'Etiket istatistikleri';

  @override
  String get analyticsSubtitle =>
      'Tarama eğilimleri ve en çok okunan etiketler';

  @override
  String get analyticsTotal => 'Toplam okuma';

  @override
  String get analyticsUnique => 'Farklı etiket';

  @override
  String get analyticsLast14 => 'Son 14 gün';

  @override
  String get analyticsTop => 'En çok okunanlar';

  @override
  String get analyticsByType => 'İçerik türleri';

  @override
  String get analyticsEmpty =>
      'İstatistikler için Ayarlar\'dan tarama geçmişini açın ve birkaç etiket okutun.';

  @override
  String analyticsTimes(String count) {
    return '$count kez';
  }

  @override
  String get codeScannerTitle => 'Kod tarayıcı';

  @override
  String get codeScannerSubtitle =>
      'QR ve barkodları tara; etikete yaz, kaydet veya paylaş';

  @override
  String codeResultTitle(String format) {
    return 'Okunan kod ($format)';
  }

  @override
  String get codeSearchWeb => 'Web\'de ara';

  @override
  String get codeToTag => 'Etikete yaz';

  @override
  String get codeSaveLibrary => 'Kütüphaneye kaydet';

  @override
  String get mergeTitle => 'Kayıtları birleştir';

  @override
  String get mergeSubtitle =>
      'Kütüphane, şablon ve son okunan etiketten seçip tek etikette birleştir';

  @override
  String mergeButton(String count) {
    return 'Birleştir ($count)';
  }

  @override
  String get mergeEmpty =>
      'Birleştirilecek kayıt yok. Önce kütüphaneye etiket ya da şablon kaydedin.';

  @override
  String get mergeLastScan => 'Son okunan etiket';

  @override
  String get locationSearchHint => 'Adres veya yer adı ara';

  @override
  String get locationNotFound => 'Adres bulunamadı';

  @override
  String get cardCall => 'Ara';

  @override
  String get cardEmail => 'E-posta';

  @override
  String get cardWeb => 'Web';

  @override
  String get cardAddContact => 'Rehbere ekle';

  @override
  String get cardTitle => 'Dijital kartvizit';

  @override
  String get templateImportTitle => 'Şablonları tablodan içe aktar';

  @override
  String get templateImportHint =>
      'Her satır: ad, tür, değer, ek. Türler: url, metin, telefon, eposta, sms, konum, wifi. Aynı adlı satırlar tek şablonda birleşir.';

  @override
  String templateImportPreview(String count) {
    return '$count şablon eklenecek';
  }

  @override
  String templateImportSkipped(String rows) {
    return 'Atlanan satırlar: $rows';
  }

  @override
  String templateImportDone(String count) {
    return '$count şablon eklendi';
  }
}
