import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_uk.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('nl'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('uk'),
    Locale('zh')
  ];

  /// No description provided for @addRecord.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt Ekle'**
  String get addRecord;

  /// No description provided for @addToComposerList.
  ///
  /// In tr, this message translates to:
  /// **'Yazma Listesine Ekle'**
  String get addToComposerList;

  /// No description provided for @addToWriteList.
  ///
  /// In tr, this message translates to:
  /// **'Yazma listesine ekle'**
  String get addToWriteList;

  /// No description provided for @addressCannotBeEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Adres boş bırakılamaz.'**
  String get addressCannotBeEmpty;

  /// No description provided for @advancedCommandsDesc.
  ///
  /// In tr, this message translates to:
  /// **'Her satıra bir komut yazın (hex). Örn: 60 = GET_VERSION, 30 04 = sayfa 4\'ten oku. Yanlış yazma komutları etiketi kalıcı olarak bozabilir.'**
  String get advancedCommandsDesc;

  /// No description provided for @advancedCommandsSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Etikete ham onaltılık (hex) komut gönderir'**
  String get advancedCommandsSubtitle;

  /// No description provided for @advancedCommandsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Gelişmiş NFC Komutları'**
  String get advancedCommandsTitle;

  /// No description provided for @appLinksDesc.
  ///
  /// In tr, this message translates to:
  /// **'Bu bağlantıları bir etikete yazarsanız, iPhone etikete dokununca bildirim gösterir ve uygulamayı ilgili ekranda açar.'**
  String get appLinksDesc;

  /// No description provided for @appLinksSection.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama bağlantıları'**
  String get appLinksSection;

  /// No description provided for @appPackageName.
  ///
  /// In tr, this message translates to:
  /// **'Android Paket Adı'**
  String get appPackageName;

  /// No description provided for @appSettings.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama Ayarları'**
  String get appSettings;

  /// No description provided for @appTitle.
  ///
  /// In tr, this message translates to:
  /// **'NFC Etiket Yöneticisi'**
  String get appTitle;

  /// No description provided for @autoRunOnTap.
  ///
  /// In tr, this message translates to:
  /// **'Etikete dokununca otomatik çalıştır'**
  String get autoRunOnTap;

  /// No description provided for @backupFileSizeExceeded.
  ///
  /// In tr, this message translates to:
  /// **'Yedek dosyası boyutu 2 MiB sınırını aşıyor.'**
  String get backupFileSizeExceeded;

  /// No description provided for @backupHistoryMustBeList.
  ///
  /// In tr, this message translates to:
  /// **'\"history\" alanı bir dizi olmalıdır.'**
  String get backupHistoryMustBeList;

  /// No description provided for @backupInvalidJson.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz JSON biçimi: {error}'**
  String backupInvalidJson(String error);

  /// No description provided for @backupInvalidRuleNote.
  ///
  /// In tr, this message translates to:
  /// **'Etiket kuralı notu (note) geçerli bir metin olmalıdır.'**
  String get backupInvalidRuleNote;

  /// No description provided for @backupInvalidRuleSha.
  ///
  /// In tr, this message translates to:
  /// **'Etiket kuralı NDEF özeti geçerli bir 64 karakterli SHA-256 onaltılık (hex) dize olmalıdır.'**
  String get backupInvalidRuleSha;

  /// No description provided for @backupInvalidTemplateId.
  ///
  /// In tr, this message translates to:
  /// **'Şablon kimliği (id) geçerli bir metin olmalıdır.'**
  String get backupInvalidTemplateId;

  /// No description provided for @backupInvalidTemplateName.
  ///
  /// In tr, this message translates to:
  /// **'Şablon adı (name) geçerli bir metin olmalıdır.'**
  String get backupInvalidTemplateName;

  /// No description provided for @backupMaxHistoryExceeded.
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş kayıt sayısı izin verilen {max} sınırını aşıyor ({count}).'**
  String backupMaxHistoryExceeded(int count, int max);

  /// No description provided for @backupMaxTagRulesExceeded.
  ///
  /// In tr, this message translates to:
  /// **'Etiket kuralı sayısı izin verilen {max} sınırını aşıyor ({count}).'**
  String backupMaxTagRulesExceeded(int count, int max);

  /// No description provided for @backupMaxTemplatesExceeded.
  ///
  /// In tr, this message translates to:
  /// **'Şablon sayısı izin verilen {max} sınırını aşıyor ({count}).'**
  String backupMaxTemplatesExceeded(int count, int max);

  /// No description provided for @backupMissingSchemaVersion.
  ///
  /// In tr, this message translates to:
  /// **'Yedek dosyasında \"schemaVersion\" alanı eksik.'**
  String get backupMissingSchemaVersion;

  /// No description provided for @backupRecordMustBeObject.
  ///
  /// In tr, this message translates to:
  /// **'Her NDEF kaydı bir JSON nesnesi olmalıdır.'**
  String get backupRecordMustBeObject;

  /// No description provided for @backupRestoreSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Şablonlarınızı, uygulama içi etiket notlarınızı ve isteğe bağlı tarama geçmişinizi sürüm kontrollü JSON formatında yedekleyin veya mevcut verilerinizle birleştirin.'**
  String get backupRestoreSubtitle;

  /// No description provided for @backupRestoreTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yedekleme ve Geri Yükleme (JSON)'**
  String get backupRestoreTitle;

  /// No description provided for @backupRootMustBeObject.
  ///
  /// In tr, this message translates to:
  /// **'Yedek dosyasının kök yapısı bir JSON nesnesi olmalıdır.'**
  String get backupRootMustBeObject;

  /// No description provided for @backupRuleMustBeObject.
  ///
  /// In tr, this message translates to:
  /// **'Her etiket kuralı bir JSON nesnesi olmalıdır.'**
  String get backupRuleMustBeObject;

  /// No description provided for @backupSchemaVersionMustBeInt.
  ///
  /// In tr, this message translates to:
  /// **'\"schemaVersion\" alanı bir tamsayı olmalıdır.'**
  String get backupSchemaVersionMustBeInt;

  /// No description provided for @backupSizeExceeded.
  ///
  /// In tr, this message translates to:
  /// **'Yedekleme verisi izin verilen 2 MiB sınırını aşıyor ({bytes} bayt).'**
  String backupSizeExceeded(int bytes);

  /// No description provided for @backupTagRulesMustBeList.
  ///
  /// In tr, this message translates to:
  /// **'\"tagRules\" alanı bir dizi olmalıdır.'**
  String get backupTagRulesMustBeList;

  /// No description provided for @backupTemplateMustBeObject.
  ///
  /// In tr, this message translates to:
  /// **'Her şablon bir JSON nesnesi olmalıdır.'**
  String get backupTemplateMustBeObject;

  /// No description provided for @backupTemplatesMustBeList.
  ///
  /// In tr, this message translates to:
  /// **'\"templates\" alanı bir dizi (list) olmalıdır.'**
  String get backupTemplatesMustBeList;

  /// No description provided for @backupUnsupportedSchemaVersion.
  ///
  /// In tr, this message translates to:
  /// **'Desteklenmeyen yedek şema sürümü: {version}.'**
  String backupUnsupportedSchemaVersion(String version);

  /// No description provided for @cameraError.
  ///
  /// In tr, this message translates to:
  /// **'Kamera açılamadı. Ayarlar > Gizlilik > Kamera bölümünden izin verin.\n({error})'**
  String cameraError(String error);

  /// No description provided for @cancel.
  ///
  /// In tr, this message translates to:
  /// **'İptal'**
  String get cancel;

  /// No description provided for @catBusiness.
  ///
  /// In tr, this message translates to:
  /// **'İşletme'**
  String get catBusiness;

  /// No description provided for @catCar.
  ///
  /// In tr, this message translates to:
  /// **'Araba'**
  String get catCar;

  /// No description provided for @catHome.
  ///
  /// In tr, this message translates to:
  /// **'Ev'**
  String get catHome;

  /// No description provided for @catOther.
  ///
  /// In tr, this message translates to:
  /// **'Diğer'**
  String get catOther;

  /// No description provided for @catPersonal.
  ///
  /// In tr, this message translates to:
  /// **'Kişisel'**
  String get catPersonal;

  /// No description provided for @catWork.
  ///
  /// In tr, this message translates to:
  /// **'İş'**
  String get catWork;

  /// No description provided for @categoryLabel.
  ///
  /// In tr, this message translates to:
  /// **'Kategori'**
  String get categoryLabel;

  /// No description provided for @chooseFromGallery.
  ///
  /// In tr, this message translates to:
  /// **'Galeriden seç'**
  String get chooseFromGallery;

  /// No description provided for @clear.
  ///
  /// In tr, this message translates to:
  /// **'Temizle'**
  String get clear;

  /// No description provided for @clearAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü Sil'**
  String get clearAll;

  /// No description provided for @clearConfirmMessage.
  ///
  /// In tr, this message translates to:
  /// **'Bu işlem etiket üzerindeki tüm NDEF kayıtlarını silecek ve boş bir kayıt yazacaktır. Devam etmek istiyor musunuz?'**
  String get clearConfirmMessage;

  /// No description provided for @clearConfirmTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket İçeriğini Sıfırla'**
  String get clearConfirmTitle;

  /// No description provided for @clearHistory.
  ///
  /// In tr, this message translates to:
  /// **'Geçmişi Temizle'**
  String get clearHistory;

  /// No description provided for @clearTagSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Tüm kayıtları silip boş NDEF yazar'**
  String get clearTagSubtitle;

  /// No description provided for @clearTagTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Sil'**
  String get clearTagTitle;

  /// No description provided for @close.
  ///
  /// In tr, this message translates to:
  /// **'Kapat'**
  String get close;

  /// No description provided for @commandsEmptyError.
  ///
  /// In tr, this message translates to:
  /// **'En az bir komut giriniz.'**
  String get commandsEmptyError;

  /// No description provided for @commandsLabel.
  ///
  /// In tr, this message translates to:
  /// **'Komutlar'**
  String get commandsLabel;

  /// No description provided for @confirmClearHistoryContent.
  ///
  /// In tr, this message translates to:
  /// **'Cihazda kayıtlı tüm tarama geçmişi silinecektir. Onaylıyor musunuz?'**
  String get confirmClearHistoryContent;

  /// No description provided for @confirmClearHistoryTitle.
  ///
  /// In tr, this message translates to:
  /// **'Tarama Geçmişini Temizle'**
  String get confirmClearHistoryTitle;

  /// No description provided for @confirmClearTemplatesContent.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı tüm yazma şablonları silinecektir. Onaylıyor musunuz?'**
  String get confirmClearTemplatesContent;

  /// No description provided for @confirmClearTemplatesTitle.
  ///
  /// In tr, this message translates to:
  /// **'Şablonları Temizle'**
  String get confirmClearTemplatesTitle;

  /// No description provided for @contactCompany.
  ///
  /// In tr, this message translates to:
  /// **'Şirket / Kurum'**
  String get contactCompany;

  /// No description provided for @contactEmail.
  ///
  /// In tr, this message translates to:
  /// **'E-posta'**
  String get contactEmail;

  /// No description provided for @contactFullName.
  ///
  /// In tr, this message translates to:
  /// **'Ad Soyad'**
  String get contactFullName;

  /// No description provided for @contactPhone.
  ///
  /// In tr, this message translates to:
  /// **'Telefon'**
  String get contactPhone;

  /// No description provided for @contactTitle.
  ///
  /// In tr, this message translates to:
  /// **'Unvan'**
  String get contactTitle;

  /// No description provided for @contactWebsite.
  ///
  /// In tr, this message translates to:
  /// **'Web Sitesi'**
  String get contactWebsite;

  /// No description provided for @copy.
  ///
  /// In tr, this message translates to:
  /// **'Kopyala'**
  String get copy;

  /// No description provided for @copyTagUid.
  ///
  /// In tr, this message translates to:
  /// **'UID Kopyala'**
  String get copyTagUid;

  /// No description provided for @copyToComposer.
  ///
  /// In tr, this message translates to:
  /// **'Yazma listesine kopyala'**
  String get copyToComposer;

  /// No description provided for @csvInvalidAddress.
  ///
  /// In tr, this message translates to:
  /// **'geçersiz adres.'**
  String get csvInvalidAddress;

  /// No description provided for @csvInvalidEmail.
  ///
  /// In tr, this message translates to:
  /// **'geçersiz e-posta adresi.'**
  String get csvInvalidEmail;

  /// No description provided for @csvInvalidLocation.
  ///
  /// In tr, this message translates to:
  /// **'konum için enlem ve boylam giriniz (Örn: konum,41.0082,28.9784).'**
  String get csvInvalidLocation;

  /// No description provided for @csvMaxRowsExceeded.
  ///
  /// In tr, this message translates to:
  /// **'En fazla {max} kayıt içe aktarılabilir; kalan satırlar atlandı.'**
  String csvMaxRowsExceeded(int max);

  /// No description provided for @csvRowEmptyValue.
  ///
  /// In tr, this message translates to:
  /// **'Satır {row}: değer boş.'**
  String csvRowEmptyValue(int row);

  /// No description provided for @csvRowError.
  ///
  /// In tr, this message translates to:
  /// **'Satır {row}: {error}'**
  String csvRowError(String error, int row);

  /// No description provided for @csvUnknownType.
  ///
  /// In tr, this message translates to:
  /// **'bilinmeyen tür \"{type}\".'**
  String csvUnknownType(String type);

  /// No description provided for @csvWifiPasswordLength.
  ///
  /// In tr, this message translates to:
  /// **'Wi-Fi şifresi 8-63 karakter olmalı.'**
  String get csvWifiPasswordLength;

  /// No description provided for @delete.
  ///
  /// In tr, this message translates to:
  /// **'Sil'**
  String get delete;

  /// No description provided for @deleteTemplateTooltip.
  ///
  /// In tr, this message translates to:
  /// **'Şablonu Sil'**
  String get deleteTemplateTooltip;

  /// No description provided for @deviceNameTooLong.
  ///
  /// In tr, this message translates to:
  /// **'Cihaz adı çok uzun.'**
  String get deviceNameTooLong;

  /// No description provided for @dismiss.
  ///
  /// In tr, this message translates to:
  /// **'Vazgeç'**
  String get dismiss;

  /// No description provided for @editRecordTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kaydı Düzenle'**
  String get editRecordTitle;

  /// No description provided for @emailRecipient.
  ///
  /// In tr, this message translates to:
  /// **'Alıcı E-posta'**
  String get emailRecipient;

  /// No description provided for @exportBackup.
  ///
  /// In tr, this message translates to:
  /// **'Dışa Aktar'**
  String get exportBackup;

  /// No description provided for @facetimePrompt.
  ///
  /// In tr, this message translates to:
  /// **'Telefon numarası veya Apple kimliği e-posta adresi giriniz.'**
  String get facetimePrompt;

  /// No description provided for @fieldCannotBeEmpty.
  ///
  /// In tr, this message translates to:
  /// **'\"{field}\" boş bırakılamaz.'**
  String fieldCannotBeEmpty(String field);

  /// No description provided for @flashlight.
  ///
  /// In tr, this message translates to:
  /// **'Fener'**
  String get flashlight;

  /// No description provided for @formatMemorySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'NDEF için hazırlar (boş veya bozuk etiketler)'**
  String get formatMemorySubtitle;

  /// No description provided for @formatMemoryTitle.
  ///
  /// In tr, this message translates to:
  /// **'Belleği Biçimlendir'**
  String get formatMemoryTitle;

  /// No description provided for @idTooLarge.
  ///
  /// In tr, this message translates to:
  /// **'Kimlik (ID) boyutu 255 baytı aşamaz'**
  String get idTooLarge;

  /// No description provided for @importBackup.
  ///
  /// In tr, this message translates to:
  /// **'İçe Aktar (Birleştir)'**
  String get importBackup;

  /// No description provided for @inAppTagRules.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama İçi Etiket Kuralları'**
  String get inAppTagRules;

  /// No description provided for @invalidHexId.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz Hex ID dizesi'**
  String get invalidHexId;

  /// No description provided for @invalidHexPayload.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz Hex yük (payload) dizesi'**
  String get invalidHexPayload;

  /// No description provided for @invalidHexType.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz Hex tür dizesi'**
  String get invalidHexType;

  /// No description provided for @languageTitle.
  ///
  /// In tr, this message translates to:
  /// **'Dil / Language'**
  String get languageTitle;

  /// No description provided for @linkCopied.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı kopyalandı'**
  String get linkCopied;

  /// No description provided for @linkHistoryDesc.
  ///
  /// In tr, this message translates to:
  /// **'Geçmişi açar'**
  String get linkHistoryDesc;

  /// No description provided for @linkScanDesc.
  ///
  /// In tr, this message translates to:
  /// **'Uygulamayı açıp taramayı başlatır'**
  String get linkScanDesc;

  /// No description provided for @linkToolsDesc.
  ///
  /// In tr, this message translates to:
  /// **'Araçlar ekranını açar'**
  String get linkToolsDesc;

  /// No description provided for @linkWriteDesc.
  ///
  /// In tr, this message translates to:
  /// **'Yazma ekranını açar'**
  String get linkWriteDesc;

  /// No description provided for @locationLabel.
  ///
  /// In tr, this message translates to:
  /// **'Nerede?'**
  String get locationLabel;

  /// No description provided for @lockAcknowledge.
  ///
  /// In tr, this message translates to:
  /// **'Bu işlemin geri alınamayacağını anlıyorum'**
  String get lockAcknowledge;

  /// No description provided for @lockTagSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Kalıcı olarak salt okunur yapar (geri alınamaz)'**
  String get lockTagSubtitle;

  /// No description provided for @lockTagTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Kilitle'**
  String get lockTagTitle;

  /// No description provided for @manage.
  ///
  /// In tr, this message translates to:
  /// **'Yönet'**
  String get manage;

  /// No description provided for @navHistory.
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş'**
  String get navHistory;

  /// No description provided for @navHistoryTitle.
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş'**
  String get navHistoryTitle;

  /// No description provided for @navRead.
  ///
  /// In tr, this message translates to:
  /// **'Oku'**
  String get navRead;

  /// No description provided for @navReadTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Oku'**
  String get navReadTitle;

  /// No description provided for @navSettings.
  ///
  /// In tr, this message translates to:
  /// **'Ayarlar'**
  String get navSettings;

  /// No description provided for @navSettingsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Şablonlar & Ayarlar'**
  String get navSettingsTitle;

  /// No description provided for @navTools.
  ///
  /// In tr, this message translates to:
  /// **'Araçlar'**
  String get navTools;

  /// No description provided for @navToolsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Araçlar'**
  String get navToolsTitle;

  /// No description provided for @navWrite.
  ///
  /// In tr, this message translates to:
  /// **'Yaz'**
  String get navWrite;

  /// No description provided for @navWriteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Yaz'**
  String get navWriteTitle;

  /// No description provided for @ndefRecordsCount.
  ///
  /// In tr, this message translates to:
  /// **'{count, plural, =1{1 Kayıt} other{{count} Kayıt}}'**
  String ndefRecordsCount(int count);

  /// No description provided for @nfcPromptClear.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi sıfırlamak için cihazınıza yaklaştırın'**
  String get nfcPromptClear;

  /// No description provided for @nfcPromptLock.
  ///
  /// In tr, this message translates to:
  /// **'Kalıcı olarak kilitlenecek etiketi yaklaştırın'**
  String get nfcPromptLock;

  /// No description provided for @nfcPromptScan.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi telefonunuza yaklaştırın'**
  String get nfcPromptScan;

  /// No description provided for @nfcPromptWrite.
  ///
  /// In tr, this message translates to:
  /// **'Verileri kaydetmek için NFC etiketini yaklaştırın'**
  String get nfcPromptWrite;

  /// No description provided for @no.
  ///
  /// In tr, this message translates to:
  /// **'Hayır'**
  String get no;

  /// No description provided for @noTemplates.
  ///
  /// In tr, this message translates to:
  /// **'Henüz kayıtlı bir yazma şablonu yok.\n\"Etiket Yaz\" sekmesinden kayıt oluşturup şablon olarak kaydedebilirsiniz.'**
  String get noTemplates;

  /// No description provided for @noteLabel.
  ///
  /// In tr, this message translates to:
  /// **'Not'**
  String get noteLabel;

  /// No description provided for @onboardingContinue.
  ///
  /// In tr, this message translates to:
  /// **'Devam'**
  String get onboardingContinue;

  /// No description provided for @onboardingSkip.
  ///
  /// In tr, this message translates to:
  /// **'Geç'**
  String get onboardingSkip;

  /// No description provided for @onboardingStart.
  ///
  /// In tr, this message translates to:
  /// **'Başla'**
  String get onboardingStart;

  /// No description provided for @onboardingStep1Body.
  ///
  /// In tr, this message translates to:
  /// **'Alttaki mavi butona dokunun ve etiketi telefonun üst kısmına yaklaştırın. İçerik, kapasite ve seri numarası anında görünür.'**
  String get onboardingStep1Body;

  /// No description provided for @onboardingStep1Title.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi okut'**
  String get onboardingStep1Title;

  /// No description provided for @onboardingStep2Body.
  ///
  /// In tr, this message translates to:
  /// **'\"Yaz\" bölümünde \"Kayıt Ekle\"ye dokunun: web adresi, Wi-Fi, kartvizit, sosyal medya ve daha fazlası. Hazır şablonlarla saniyeler içinde hazırlayın.'**
  String get onboardingStep2Body;

  /// No description provided for @onboardingStep2Title.
  ///
  /// In tr, this message translates to:
  /// **'İstediğini yaz'**
  String get onboardingStep2Title;

  /// No description provided for @onboardingStep3Body.
  ///
  /// In tr, this message translates to:
  /// **'Belleği okuyun, şifre koyun, etiketi kilitleyin veya biçimlendirin. Hepsi \"Araçlar\" bölümünde.'**
  String get onboardingStep3Body;

  /// No description provided for @onboardingStep3Title.
  ///
  /// In tr, this message translates to:
  /// **'Uzman araçlar'**
  String get onboardingStep3Title;

  /// No description provided for @onboardingStep4Body.
  ///
  /// In tr, this message translates to:
  /// **'Yazdığınız etiketlere isim, not ve fotoğraf ekleyip kütüphanenizde saklayın. Dili ve görünümü Ayarlar\'dan değiştirebilirsiniz.'**
  String get onboardingStep4Body;

  /// No description provided for @onboardingStep4Title.
  ///
  /// In tr, this message translates to:
  /// **'Etiketlerini düzenle'**
  String get onboardingStep4Title;

  /// No description provided for @optionalField.
  ///
  /// In tr, this message translates to:
  /// **'{label} (isteğe bağlı)'**
  String optionalField(String label);

  /// No description provided for @passwordError.
  ///
  /// In tr, this message translates to:
  /// **'Tam 4 karakter veya 8 hex rakam giriniz.'**
  String get passwordError;

  /// No description provided for @passwordHint.
  ///
  /// In tr, this message translates to:
  /// **'4 karakter (Örn: 1234) veya 8 hex'**
  String get passwordHint;

  /// No description provided for @passwordLabel.
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get passwordLabel;

  /// No description provided for @paste.
  ///
  /// In tr, this message translates to:
  /// **'Yapıştır'**
  String get paste;

  /// No description provided for @phoneNumber.
  ///
  /// In tr, this message translates to:
  /// **'Telefon Numarası'**
  String get phoneNumber;

  /// No description provided for @phoneWithCountryCode.
  ///
  /// In tr, this message translates to:
  /// **'Ülke koduyla birlikte telefon numarası giriniz (Örn: 905551112233).'**
  String get phoneWithCountryCode;

  /// No description provided for @presetAppDownloadDesc.
  ///
  /// In tr, this message translates to:
  /// **'Android kullanıcılarına uygulamanızı açar veya yükletir.'**
  String get presetAppDownloadDesc;

  /// No description provided for @presetAppDownloadTitle.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama İndirme'**
  String get presetAppDownloadTitle;

  /// No description provided for @presetBusinessCardDesc.
  ///
  /// In tr, this message translates to:
  /// **'Telefona dokununca kişi kartınız rehbere eklenir.'**
  String get presetBusinessCardDesc;

  /// No description provided for @presetBusinessCardTitle.
  ///
  /// In tr, this message translates to:
  /// **'Dijital Kartvizit'**
  String get presetBusinessCardTitle;

  /// No description provided for @presetDirectionsDesc.
  ///
  /// In tr, this message translates to:
  /// **'Haritada adres veya mekan gösterir.'**
  String get presetDirectionsDesc;

  /// No description provided for @presetDirectionsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Konum / Yol Tarifi'**
  String get presetDirectionsTitle;

  /// No description provided for @presetEmergencyDesc.
  ///
  /// In tr, this message translates to:
  /// **'Kan grubu, acil durum irtibatı ve kritik bilgiler.'**
  String get presetEmergencyDesc;

  /// No description provided for @presetEmergencyTitle.
  ///
  /// In tr, this message translates to:
  /// **'Acil Durum Kartı'**
  String get presetEmergencyTitle;

  /// No description provided for @presetGoogleReviewDesc.
  ///
  /// In tr, this message translates to:
  /// **'İşletmenizin Google yorum sayfasına yönlendirir.'**
  String get presetGoogleReviewDesc;

  /// No description provided for @presetGoogleReviewTitle.
  ///
  /// In tr, this message translates to:
  /// **'Google Harita / Yorum'**
  String get presetGoogleReviewTitle;

  /// No description provided for @presetGuestWifiDesc.
  ///
  /// In tr, this message translates to:
  /// **'Misafirler şifre yazmadan ağa bağlanır.'**
  String get presetGuestWifiDesc;

  /// No description provided for @presetGuestWifiTitle.
  ///
  /// In tr, this message translates to:
  /// **'Misafir Wi-Fi Kartı'**
  String get presetGuestWifiTitle;

  /// No description provided for @presetInstagramDesc.
  ///
  /// In tr, this message translates to:
  /// **'Dokunan kişi doğrudan Instagram profilinizi açar.'**
  String get presetInstagramDesc;

  /// No description provided for @presetInstagramTitle.
  ///
  /// In tr, this message translates to:
  /// **'Instagram Profili'**
  String get presetInstagramTitle;

  /// No description provided for @presetMenuLinkDesc.
  ///
  /// In tr, this message translates to:
  /// **'Masaya yapıştırın, müşteriler menüyü anında görsün.'**
  String get presetMenuLinkDesc;

  /// No description provided for @presetMenuLinkTitle.
  ///
  /// In tr, this message translates to:
  /// **'Restoran Menüsü'**
  String get presetMenuLinkTitle;

  /// No description provided for @presetPetTagDesc.
  ///
  /// In tr, this message translates to:
  /// **'Kayıp durumunda bulan kişinin sizi aramasını sağlar.'**
  String get presetPetTagDesc;

  /// No description provided for @presetPetTagTitle.
  ///
  /// In tr, this message translates to:
  /// **'Evcil Hayvan Tasması'**
  String get presetPetTagTitle;

  /// No description provided for @presetShortcutDesc.
  ///
  /// In tr, this message translates to:
  /// **'iPhone Kısayollar ve uygulama içi eylemleri başlatır.'**
  String get presetShortcutDesc;

  /// No description provided for @presetShortcutTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kısayol Tetikleyici'**
  String get presetShortcutTitle;

  /// No description provided for @presetWebsiteDesc.
  ///
  /// In tr, this message translates to:
  /// **'Herhangi bir web sayfasına yönlendirir.'**
  String get presetWebsiteDesc;

  /// No description provided for @presetWebsiteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Web Sitesi'**
  String get presetWebsiteTitle;

  /// No description provided for @presetWhatsappDesc.
  ///
  /// In tr, this message translates to:
  /// **'Numara kaydetmeden doğrudan sohbet başlatır.'**
  String get presetWhatsappDesc;

  /// No description provided for @presetWhatsappTitle.
  ///
  /// In tr, this message translates to:
  /// **'WhatsApp ile İletişim'**
  String get presetWhatsappTitle;

  /// No description provided for @qrCode.
  ///
  /// In tr, this message translates to:
  /// **'QR Kod'**
  String get qrCode;

  /// No description provided for @qrContentChars.
  ///
  /// In tr, this message translates to:
  /// **'İçerik ({chars} Karakter):'**
  String qrContentChars(int chars);

  /// No description provided for @qrContentEmpty.
  ///
  /// In tr, this message translates to:
  /// **'QR koda dönüştürülecek içerik boş.'**
  String get qrContentEmpty;

  /// No description provided for @qrContentTooLarge.
  ///
  /// In tr, this message translates to:
  /// **'İçerik boyutu QR kod için çok büyük ({chars} karakter, maksimum 2048 karakter desteklenir).'**
  String qrContentTooLarge(int chars);

  /// No description provided for @qrFrameInstructions.
  ///
  /// In tr, this message translates to:
  /// **'QR kodu çerçevenin içine getirin. Web adresi, Wi-Fi ve metin QR kodları kayda dönüştürülür.'**
  String get qrFrameInstructions;

  /// No description provided for @qrGenerationFailed.
  ///
  /// In tr, this message translates to:
  /// **'QR kod oluşturulamadı: {error}'**
  String qrGenerationFailed(String error);

  /// No description provided for @qrPreviewTitle.
  ///
  /// In tr, this message translates to:
  /// **'QR Kod Önizleme: {title}'**
  String qrPreviewTitle(String title);

  /// No description provided for @qrScanTitle.
  ///
  /// In tr, this message translates to:
  /// **'QR Kodu Tara'**
  String get qrScanTitle;

  /// No description provided for @qrSecurityNote.
  ///
  /// In tr, this message translates to:
  /// **'QR kod önizlemesi yalnızca okunabilir Düz Metin (Text) ve Web URL kayıtları için desteklenir.\n\nWi-Fi parolaları, vCard veya ikili yükler gizlilik ve güvenlik nedeniyle otomatik olarak QR koduna dönüştürülmez.'**
  String get qrSecurityNote;

  /// No description provided for @qrUserOnlyNote.
  ///
  /// In tr, this message translates to:
  /// **'Sadece kullanıcı isteğiyle açılır. Otomatik işlem yürütülmez.'**
  String get qrUserOnlyNote;

  /// No description provided for @rawRecordDetailsTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt Ayrıntıları (Salt Okunur)'**
  String get rawRecordDetailsTitle;

  /// No description provided for @rawRecordEditorTitle.
  ///
  /// In tr, this message translates to:
  /// **'Ham NDEF Kaydı Düzenle'**
  String get rawRecordEditorTitle;

  /// No description provided for @readHeroButton.
  ///
  /// In tr, this message translates to:
  /// **'Taramayı Başlat'**
  String get readHeroButton;

  /// No description provided for @readMemorySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Sayfa sayfa ham bellek; kopyala veya .bin olarak kaydet'**
  String get readMemorySubtitle;

  /// No description provided for @readMemoryTitle.
  ///
  /// In tr, this message translates to:
  /// **'Belleği Oku'**
  String get readMemoryTitle;

  /// No description provided for @readyTemplates.
  ///
  /// In tr, this message translates to:
  /// **'Hazır Şablonlar'**
  String get readyTemplates;

  /// No description provided for @recordTypeCalendar.
  ///
  /// In tr, this message translates to:
  /// **'Takvim Etkinliği (iCal)'**
  String get recordTypeCalendar;

  /// No description provided for @recordTypeCustomMime.
  ///
  /// In tr, this message translates to:
  /// **'Özel MIME ({mime})'**
  String recordTypeCustomMime(String mime);

  /// No description provided for @recordTypeEmail.
  ///
  /// In tr, this message translates to:
  /// **'E-posta Kaydı'**
  String get recordTypeEmail;

  /// No description provided for @recordTypeLocation.
  ///
  /// In tr, this message translates to:
  /// **'Konum / GPS'**
  String get recordTypeLocation;

  /// No description provided for @recordTypePhone.
  ///
  /// In tr, this message translates to:
  /// **'Telefon Numarası'**
  String get recordTypePhone;

  /// No description provided for @recordTypeSmartPoster.
  ///
  /// In tr, this message translates to:
  /// **'Akıllı Poster (Smart Poster)'**
  String get recordTypeSmartPoster;

  /// No description provided for @recordTypeSmartPosterCorrupt.
  ///
  /// In tr, this message translates to:
  /// **'Bozuk veya eksik akıllı poster yükü ({bytes} bayt)'**
  String recordTypeSmartPosterCorrupt(int bytes);

  /// No description provided for @recordTypeSmartPosterInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Akıllı Poster (Geçersiz Yük)'**
  String get recordTypeSmartPosterInvalid;

  /// No description provided for @recordTypeSms.
  ///
  /// In tr, this message translates to:
  /// **'SMS Kaydı'**
  String get recordTypeSms;

  /// No description provided for @recordTypeText.
  ///
  /// In tr, this message translates to:
  /// **'Metin Kaydı'**
  String get recordTypeText;

  /// No description provided for @recordTypeUnknown.
  ///
  /// In tr, this message translates to:
  /// **'Bilinmeyen Kayıt'**
  String get recordTypeUnknown;

  /// No description provided for @recordTypeUrl.
  ///
  /// In tr, this message translates to:
  /// **'Web Bağlantısı (URL)'**
  String get recordTypeUrl;

  /// No description provided for @recordTypeVCard.
  ///
  /// In tr, this message translates to:
  /// **'Kişi Kartı (vCard)'**
  String get recordTypeVCard;

  /// No description provided for @recordTypeWifi.
  ///
  /// In tr, this message translates to:
  /// **'Wi-Fi Yapılandırması (WSC)'**
  String get recordTypeWifi;

  /// No description provided for @recordTypeWifiCorrupt.
  ///
  /// In tr, this message translates to:
  /// **'Bozuk veya tanınmayan WSC yükü'**
  String get recordTypeWifiCorrupt;

  /// No description provided for @redo.
  ///
  /// In tr, this message translates to:
  /// **'Yinele'**
  String get redo;

  /// No description provided for @removePasswordSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Bilinen şifreyle korumayı kaldırır'**
  String get removePasswordSubtitle;

  /// No description provided for @removePasswordTitle.
  ///
  /// In tr, this message translates to:
  /// **'Şifreyi Kaldır'**
  String get removePasswordTitle;

  /// No description provided for @rewriteTag.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden Yaz'**
  String get rewriteTag;

  /// No description provided for @ruleDeleteConfirm.
  ///
  /// In tr, this message translates to:
  /// **'\"{note}\" açıklamalı etiket kuralı silinecektir. Devam edilsin mi?'**
  String ruleDeleteConfirm(String note);

  /// No description provided for @ruleNoteDialogTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Notunu Düzenle'**
  String get ruleNoteDialogTitle;

  /// No description provided for @ruleNoteLabel.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama İçi Not / Açıklama'**
  String get ruleNoteLabel;

  /// No description provided for @save.
  ///
  /// In tr, this message translates to:
  /// **'Kaydet'**
  String get save;

  /// No description provided for @saveAsTemplate.
  ///
  /// In tr, this message translates to:
  /// **'Şablon Olarak Kaydet'**
  String get saveAsTemplate;

  /// No description provided for @saveBin.
  ///
  /// In tr, this message translates to:
  /// **'.bin Kaydet'**
  String get saveBin;

  /// No description provided for @saveLocalHistory.
  ///
  /// In tr, this message translates to:
  /// **'Yerel Tarama Geçmişini Kaydet'**
  String get saveLocalHistory;

  /// No description provided for @saveLocalHistorySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Kapalıyken taramalar cihazda tutulmaz. Açıldığında başarılı taramalar yerel belleğe kaydedilir. Hatalı taramalar asla kaydedilmez.'**
  String get saveLocalHistorySubtitle;

  /// No description provided for @scanFabLabel.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi tara'**
  String get scanFabLabel;

  /// No description provided for @scannedTag.
  ///
  /// In tr, this message translates to:
  /// **'Taranan Etiket'**
  String get scannedTag;

  /// No description provided for @searchQueryCannotBeEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Arama metni boş bırakılamaz.'**
  String get searchQueryCannotBeEmpty;

  /// No description provided for @securityRestriction.
  ///
  /// In tr, this message translates to:
  /// **'Güvenlik Kısıtlaması'**
  String get securityRestriction;

  /// No description provided for @send.
  ///
  /// In tr, this message translates to:
  /// **'Gönder'**
  String get send;

  /// No description provided for @setPasswordSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket içeriğini yazmaya karşı şifreyle korur'**
  String get setPasswordSubtitle;

  /// No description provided for @setPasswordTitle.
  ///
  /// In tr, this message translates to:
  /// **'Şifre Belirle'**
  String get setPasswordTitle;

  /// No description provided for @shortcutAutomationNote.
  ///
  /// In tr, this message translates to:
  /// **'Not: Otomasyon etiketin seri numarasına bağlanır; etiketin içeriği değişse de çalışır.'**
  String get shortcutAutomationNote;

  /// No description provided for @shortcutStep1.
  ///
  /// In tr, this message translates to:
  /// **'Kısayollar uygulamasını açın ve alttan \"Otomasyon\"a dokunun.'**
  String get shortcutStep1;

  /// No description provided for @shortcutStep2.
  ///
  /// In tr, this message translates to:
  /// **'\"Yeni Otomasyon\" (+) → \"NFC\" seçin.'**
  String get shortcutStep2;

  /// No description provided for @shortcutStep3.
  ///
  /// In tr, this message translates to:
  /// **'\"Tara\"ya dokunun, etiketi iPhone\'un üst kısmına yaklaştırın ve bir isim verin.'**
  String get shortcutStep3;

  /// No description provided for @shortcutStep4.
  ///
  /// In tr, this message translates to:
  /// **'\"Hemen Çalıştır\"ı seçin, sonra istediğiniz eylemi ekleyin (ışıkları aç, müzik çal, mesaj gönder…).'**
  String get shortcutStep4;

  /// No description provided for @shortcutStep5.
  ///
  /// In tr, this message translates to:
  /// **'Bu uygulamayı açtırmak için eylem olarak \"Etiketi Tara\" veya \"Etikete Yaz\"ı seçin.'**
  String get shortcutStep5;

  /// No description provided for @shortcutsGuideSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Etikete dokununca bir işlemi otomatik çalıştırabilir veya Siri\'ye sesle tarama yaptırabilirsiniz.'**
  String get shortcutsGuideSubtitle;

  /// No description provided for @shortcutsGuideTitle.
  ///
  /// In tr, this message translates to:
  /// **'Siri ve Kısayollar'**
  String get shortcutsGuideTitle;

  /// No description provided for @siriPhraseScan.
  ///
  /// In tr, this message translates to:
  /// **'\"Hey Siri, NFC Etiket Yöneticisi ile etiket tara\"'**
  String get siriPhraseScan;

  /// No description provided for @siriPhraseWrite.
  ///
  /// In tr, this message translates to:
  /// **'\"Hey Siri, NFC Etiket Yöneticisi ile etikete yaz\"'**
  String get siriPhraseWrite;

  /// No description provided for @siriShortcutsNote.
  ///
  /// In tr, this message translates to:
  /// **'Aynı komutlar Kısayollar uygulamasında ve Spotlight aramasında da görünür.'**
  String get siriShortcutsNote;

  /// No description provided for @smsMessage.
  ///
  /// In tr, this message translates to:
  /// **'Mesaj Metni'**
  String get smsMessage;

  /// No description provided for @socialUsername.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı Adı'**
  String get socialUsername;

  /// No description provided for @sourceSelectPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Etiketin içeriği nereden alınsın?'**
  String get sourceSelectPrompt;

  /// No description provided for @statusCancelled.
  ///
  /// In tr, this message translates to:
  /// **'İptal Edildi'**
  String get statusCancelled;

  /// No description provided for @statusClearError.
  ///
  /// In tr, this message translates to:
  /// **'Sıfırlama hatası: {error}'**
  String statusClearError(String error);

  /// No description provided for @statusClearFailed.
  ///
  /// In tr, this message translates to:
  /// **'Sıfırlama başarısız: {error}'**
  String statusClearFailed(String error);

  /// No description provided for @statusClearSuccess.
  ///
  /// In tr, this message translates to:
  /// **'Etiket içeriği başarıyla temizlendi.'**
  String get statusClearSuccess;

  /// No description provided for @statusClearing.
  ///
  /// In tr, this message translates to:
  /// **'Sıfırlama modu aktif. Etiketi yaklaştırın...'**
  String get statusClearing;

  /// No description provided for @statusLockError.
  ///
  /// In tr, this message translates to:
  /// **'Kilitleme hatası: {error}'**
  String statusLockError(String error);

  /// No description provided for @statusLockFailed.
  ///
  /// In tr, this message translates to:
  /// **'Kilitleme başarısız: {error}'**
  String statusLockFailed(String error);

  /// No description provided for @statusLockSuccess.
  ///
  /// In tr, this message translates to:
  /// **'Etiket kalıcı olarak kilitlendi (salt okunur).'**
  String get statusLockSuccess;

  /// No description provided for @statusLocking.
  ///
  /// In tr, this message translates to:
  /// **'Kilitleme modu aktif. Etiketi yaklaştırın...'**
  String get statusLocking;

  /// No description provided for @statusNfcDisabled.
  ///
  /// In tr, this message translates to:
  /// **'NFC kapalı. Lütfen cihaz ayarlarından NFC özelliğini açın.'**
  String get statusNfcDisabled;

  /// No description provided for @statusNfcNotSupported.
  ///
  /// In tr, this message translates to:
  /// **'Bu cihazda NFC donanımı bulunmuyor veya desteklenmiyor.'**
  String get statusNfcNotSupported;

  /// No description provided for @statusNfcUnavailable.
  ///
  /// In tr, this message translates to:
  /// **'NFC şu anda kullanılamaz durumda.'**
  String get statusNfcUnavailable;

  /// No description provided for @statusReady.
  ///
  /// In tr, this message translates to:
  /// **'Hazır'**
  String get statusReady;

  /// No description provided for @statusScanError.
  ///
  /// In tr, this message translates to:
  /// **'Tarama Hatası: {error}'**
  String statusScanError(String error);

  /// No description provided for @statusScanSuccess.
  ///
  /// In tr, this message translates to:
  /// **'Etiket başarıyla okundu ({id}).'**
  String statusScanSuccess(String id);

  /// No description provided for @statusScanning.
  ///
  /// In tr, this message translates to:
  /// **'Etiket taranıyor... Telefonunuzu etikete yaklaştırın.'**
  String get statusScanning;

  /// No description provided for @statusUnexpectedError.
  ///
  /// In tr, this message translates to:
  /// **'Beklenmeyen hata: {error}'**
  String statusUnexpectedError(String error);

  /// No description provided for @statusWriteError.
  ///
  /// In tr, this message translates to:
  /// **'Yazma hatası: {error}'**
  String statusWriteError(String error);

  /// No description provided for @statusWriteFailed.
  ///
  /// In tr, this message translates to:
  /// **'Yazma işlemi tamamlanamadı: {error}'**
  String statusWriteFailed(String error);

  /// No description provided for @statusWriteSuccess.
  ///
  /// In tr, this message translates to:
  /// **'Yazma ve doğrulama başarılı! ({bytes} bayt)'**
  String statusWriteSuccess(int bytes);

  /// No description provided for @statusWriting.
  ///
  /// In tr, this message translates to:
  /// **'Yazma modu aktif. Hedef NFC etiketini yaklaştırın...'**
  String get statusWriting;

  /// No description provided for @systemLanguage.
  ///
  /// In tr, this message translates to:
  /// **'Sistem Dili'**
  String get systemLanguage;

  /// No description provided for @tabContact.
  ///
  /// In tr, this message translates to:
  /// **'Kişi (vCard)'**
  String get tabContact;

  /// No description provided for @tabCustomMime.
  ///
  /// In tr, this message translates to:
  /// **'Özel MIME'**
  String get tabCustomMime;

  /// No description provided for @tabEmail.
  ///
  /// In tr, this message translates to:
  /// **'E-posta'**
  String get tabEmail;

  /// No description provided for @tabPhone.
  ///
  /// In tr, this message translates to:
  /// **'Telefon'**
  String get tabPhone;

  /// No description provided for @tabSms.
  ///
  /// In tr, this message translates to:
  /// **'SMS'**
  String get tabSms;

  /// No description provided for @tabText.
  ///
  /// In tr, this message translates to:
  /// **'Metin'**
  String get tabText;

  /// No description provided for @tabUrl.
  ///
  /// In tr, this message translates to:
  /// **'Web URL'**
  String get tabUrl;

  /// No description provided for @tabWifi.
  ///
  /// In tr, this message translates to:
  /// **'Wi-Fi'**
  String get tabWifi;

  /// No description provided for @tagInfoTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Bilgileri'**
  String get tagInfoTitle;

  /// No description provided for @tagLibraryTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Kütüphanem'**
  String get tagLibraryTitle;

  /// No description provided for @tagRulesCount.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı Kural / Not Sayısı: {count}'**
  String tagRulesCount(int count);

  /// No description provided for @tagRulesSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'NDEF içerik baytlarının SHA-256 özetine göre eşleşen etiketlerde yalnızca kaydedilen not gösterilir. Harici işlem başlatmaz.'**
  String get tagRulesSubtitle;

  /// No description provided for @tagWritable.
  ///
  /// In tr, this message translates to:
  /// **'Yazılabilir'**
  String get tagWritable;

  /// No description provided for @takePhoto.
  ///
  /// In tr, this message translates to:
  /// **'Fotoğraf çek'**
  String get takePhoto;

  /// No description provided for @templateNameHint.
  ///
  /// In tr, this message translates to:
  /// **'Şablon Adı'**
  String get templateNameHint;

  /// No description provided for @toolsExpertSection.
  ///
  /// In tr, this message translates to:
  /// **'Uzman'**
  String get toolsExpertSection;

  /// No description provided for @toolsFooterNote.
  ///
  /// In tr, this message translates to:
  /// **'Bellek, şifre ve komut araçları NTAG213/215/216 ve MIFARE Ultralight EV1 etiketlerde çalışır. Etiketi işlem bitene kadar telefona yakın tutun.'**
  String get toolsFooterNote;

  /// No description provided for @toolsMemorySection.
  ///
  /// In tr, this message translates to:
  /// **'Bellek'**
  String get toolsMemorySection;

  /// No description provided for @toolsSecuritySection.
  ///
  /// In tr, this message translates to:
  /// **'Güvenlik'**
  String get toolsSecuritySection;

  /// No description provided for @toolsTagSection.
  ///
  /// In tr, this message translates to:
  /// **'Etiket'**
  String get toolsTagSection;

  /// No description provided for @typeTooLarge.
  ///
  /// In tr, this message translates to:
  /// **'Tür boyutu 255 baytı aşamaz'**
  String get typeTooLarge;

  /// No description provided for @undo.
  ///
  /// In tr, this message translates to:
  /// **'Geri Al'**
  String get undo;

  /// No description provided for @unknownChip16Pages.
  ///
  /// In tr, this message translates to:
  /// **'Bilinmeyen çip (ilk 16 sayfa)'**
  String get unknownChip16Pages;

  /// No description provided for @urlSafetyInvalidUrl.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz veya ayrıştırılamayan URL biçimi.'**
  String get urlSafetyInvalidUrl;

  /// No description provided for @urlSafetyIpv4.
  ///
  /// In tr, this message translates to:
  /// **'Hedef adres doğrudan IPv4 adresi içeriyor. Standart alan adı yerine IP kullanımı dikkat gerektirir.'**
  String get urlSafetyIpv4;

  /// No description provided for @urlSafetyIpv6.
  ///
  /// In tr, this message translates to:
  /// **'Hedef adres IPv6 adresi içeriyor.'**
  String get urlSafetyIpv6;

  /// No description provided for @urlSafetyMissingScheme.
  ///
  /// In tr, this message translates to:
  /// **'URL protokol şeması (http/https vb.) eksik veya tanımsız.'**
  String get urlSafetyMissingScheme;

  /// No description provided for @urlSafetyNonStandardPort.
  ///
  /// In tr, this message translates to:
  /// **'Standart dışı ağ bağlantı noktası (Port: {port}).'**
  String urlSafetyNonStandardPort(String port);

  /// No description provided for @urlSafetyPunycode.
  ///
  /// In tr, this message translates to:
  /// **'Uluslararası alan adı / Punycode tespit edildi (\"xn--\"). Benzer harflerle yanıltma (homoglif saldırısı) olabilir.'**
  String get urlSafetyPunycode;

  /// No description provided for @urlSafetySuspiciousScheme.
  ///
  /// In tr, this message translates to:
  /// **'Standart dışı URL şeması: \"{scheme}\". Cihazda beklenmeyen bir uygulamayı tetikleyebilir.'**
  String urlSafetySuspiciousScheme(String scheme);

  /// No description provided for @urlSafetyUnencrypted.
  ///
  /// In tr, this message translates to:
  /// **'Şifrelenmemiş bağlantı (http://). Veriler ağ üzerinde açık iletilir.'**
  String get urlSafetyUnencrypted;

  /// No description provided for @urlSafetyUserInfo.
  ///
  /// In tr, this message translates to:
  /// **'URL kimlik doğrulama/kullanıcı bilgisi içeriyor (userinfo). Oltalama/yanıltma amaçlı olabilir.'**
  String get urlSafetyUserInfo;

  /// No description provided for @usernameCannotBeEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adı boş bırakılamaz.'**
  String get usernameCannotBeEmpty;

  /// No description provided for @usernameNoSpaces.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı adı boşluk içeremez.'**
  String get usernameNoSpaces;

  /// No description provided for @validAndroidPackage.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir Android paket adı giriniz (Örn: com.whatsapp).'**
  String get validAndroidPackage;

  /// No description provided for @validBluetoothMac.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir Bluetooth MAC adresi giriniz (Örn: 00:11:22:AA:BB:CC).'**
  String get validBluetoothMac;

  /// No description provided for @validVideoUrl.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir video bağlantısı giriniz.'**
  String get validVideoUrl;

  /// No description provided for @validWebAddress.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir web adresi giriniz (Örn: https://example.com/dosya.pdf).'**
  String get validWebAddress;

  /// No description provided for @verificationNotChecked.
  ///
  /// In tr, this message translates to:
  /// **'Kontrol edilmedi'**
  String get verificationNotChecked;

  /// No description provided for @verificationPassed.
  ///
  /// In tr, this message translates to:
  /// **'Geçti'**
  String get verificationPassed;

  /// No description provided for @videoUrlCannotBeEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Video bağlantısı boş bırakılamaz.'**
  String get videoUrlCannotBeEmpty;

  /// No description provided for @videoUrlOrIdPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Video bağlantısı (https://...) veya YouTube video kimliği giriniz.'**
  String get videoUrlOrIdPrompt;

  /// No description provided for @wifiAuthOpen.
  ///
  /// In tr, this message translates to:
  /// **'Açık (Şifresiz)'**
  String get wifiAuthOpen;

  /// No description provided for @wifiPassword.
  ///
  /// In tr, this message translates to:
  /// **'Şifre'**
  String get wifiPassword;

  /// No description provided for @wifiSsid.
  ///
  /// In tr, this message translates to:
  /// **'Ağ Adı (SSID)'**
  String get wifiSsid;

  /// No description provided for @withSiri.
  ///
  /// In tr, this message translates to:
  /// **'Siri ile'**
  String get withSiri;

  /// No description provided for @writeDumpConfirmMessage.
  ///
  /// In tr, this message translates to:
  /// **'\"{name}\" ({bytes} bayt) etiketin kullanıcı belleğine yazılacak. UID, kilit ve ayar sayfalarına dokunulmaz. Etiketteki mevcut veri silinir.'**
  String writeDumpConfirmMessage(int bytes, String name);

  /// No description provided for @writeDumpSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı bellek dosyasını etikete yazar'**
  String get writeDumpSubtitle;

  /// No description provided for @writeDumpTitle.
  ///
  /// In tr, this message translates to:
  /// **'Dump Yaz (.bin)'**
  String get writeDumpTitle;

  /// No description provided for @writeHeroTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etikete Yaz'**
  String get writeHeroTitle;

  /// No description provided for @writeHeroWriting.
  ///
  /// In tr, this message translates to:
  /// **'Yazılıyor...'**
  String get writeHeroWriting;

  /// No description provided for @writeResultFailed.
  ///
  /// In tr, this message translates to:
  /// **'İşlem Başarısız'**
  String get writeResultFailed;

  /// No description provided for @writeResultSuccess.
  ///
  /// In tr, this message translates to:
  /// **'İşlem Başarılı'**
  String get writeResultSuccess;

  /// No description provided for @writeTemplates.
  ///
  /// In tr, this message translates to:
  /// **'Yazma Şablonları'**
  String get writeTemplates;

  /// No description provided for @writeTemplatesSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Sık kullandığınız NDEF içeriklerini şablon olarak kaydedip dilediğiniz zaman etiketlere tek dokunuşla yazabilirsiniz.'**
  String get writeTemplatesSubtitle;

  /// No description provided for @unknown.
  ///
  /// In tr, this message translates to:
  /// **'Bilinmiyor'**
  String get unknown;

  /// No description provided for @error.
  ///
  /// In tr, this message translates to:
  /// **'Hata'**
  String get error;

  /// No description provided for @nfcPromptReady.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi yaklaştırın'**
  String get nfcPromptReady;

  /// No description provided for @invalidResponseFormat.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz yanıt formatı alındı'**
  String get invalidResponseFormat;

  /// No description provided for @nfcReadError.
  ///
  /// In tr, this message translates to:
  /// **'NFC okuma hatası'**
  String get nfcReadError;

  /// No description provided for @invalidPlatformResponse.
  ///
  /// In tr, this message translates to:
  /// **'Platformdan geçersiz yanıt alındı'**
  String get invalidPlatformResponse;

  /// No description provided for @writeFailed.
  ///
  /// In tr, this message translates to:
  /// **'Yazma başarısız oldu'**
  String get writeFailed;

  /// No description provided for @lockFailed.
  ///
  /// In tr, this message translates to:
  /// **'Kilitleme başarısız oldu'**
  String get lockFailed;

  /// No description provided for @failedToConnectTag.
  ///
  /// In tr, this message translates to:
  /// **'Etikete bağlanılamadı'**
  String get failedToConnectTag;

  /// No description provided for @invalidTagResponse.
  ///
  /// In tr, this message translates to:
  /// **'Etiketten geçersiz yanıt alındı'**
  String get invalidTagResponse;

  /// No description provided for @commandFailed.
  ///
  /// In tr, this message translates to:
  /// **'Komut başarısız'**
  String get commandFailed;

  /// No description provided for @ndefTypeOrIdTooLong.
  ///
  /// In tr, this message translates to:
  /// **'NDEF türü veya kimliği 255 baytı aşıyor'**
  String get ndefTypeOrIdTooLong;

  /// No description provided for @ndefUnsupportedOrInvalidRecord.
  ///
  /// In tr, this message translates to:
  /// **'Desteklenmeyen veya geçersiz NDEF kaydı'**
  String get ndefUnsupportedOrInvalidRecord;

  /// No description provided for @ndefMissingTypeLength.
  ///
  /// In tr, this message translates to:
  /// **'Eksik NDEF tür uzunluğu'**
  String get ndefMissingTypeLength;

  /// No description provided for @ndefMissingPayloadLength.
  ///
  /// In tr, this message translates to:
  /// **'Eksik NDEF yük uzunluğu'**
  String get ndefMissingPayloadLength;

  /// No description provided for @ndefMissingIdLength.
  ///
  /// In tr, this message translates to:
  /// **'Eksik NDEF kimlik uzunluğu'**
  String get ndefMissingIdLength;

  /// No description provided for @ndefMissingType.
  ///
  /// In tr, this message translates to:
  /// **'Eksik NDEF türü'**
  String get ndefMissingType;

  /// No description provided for @ndefMissingId.
  ///
  /// In tr, this message translates to:
  /// **'Eksik NDEF kimliği'**
  String get ndefMissingId;

  /// No description provided for @ndefMissingPayload.
  ///
  /// In tr, this message translates to:
  /// **'Eksik NDEF yükü'**
  String get ndefMissingPayload;

  /// No description provided for @unprotected.
  ///
  /// In tr, this message translates to:
  /// **'(Şifresiz)'**
  String get unprotected;

  /// No description provided for @binaryDataPreview.
  ///
  /// In tr, this message translates to:
  /// **'(İkili/Binary Veri)'**
  String get binaryDataPreview;

  /// No description provided for @emptyValue.
  ///
  /// In tr, this message translates to:
  /// **'(Boş)'**
  String get emptyValue;

  /// No description provided for @tnfEmpty.
  ///
  /// In tr, this message translates to:
  /// **'0: Empty (Boş)'**
  String get tnfEmpty;

  /// No description provided for @tnfWellKnown.
  ///
  /// In tr, this message translates to:
  /// **'1: NFC Forum Well-Known (NFC Forum Standart RTD)'**
  String get tnfWellKnown;

  /// No description provided for @tnfMedia.
  ///
  /// In tr, this message translates to:
  /// **'2: Media-Type (RFC 2046 MIME Türü)'**
  String get tnfMedia;

  /// No description provided for @tnfAbsoluteUri.
  ///
  /// In tr, this message translates to:
  /// **'3: Absolute URI (RFC 3986 Mutlak URI)'**
  String get tnfAbsoluteUri;

  /// No description provided for @tnfExternal.
  ///
  /// In tr, this message translates to:
  /// **'4: NFC Forum External (Harici Tür)'**
  String get tnfExternal;

  /// No description provided for @tnfUnknown.
  ///
  /// In tr, this message translates to:
  /// **'5: Unknown (Bilinmeyen İçerik)'**
  String get tnfUnknown;

  /// No description provided for @tnfUnchanged.
  ///
  /// In tr, this message translates to:
  /// **'6: Unchanged (Değişmemiş - Parçalı NDEF)'**
  String get tnfUnchanged;

  /// No description provided for @tnfReserved.
  ///
  /// In tr, this message translates to:
  /// **'7: Reserved (Ayrılmış)'**
  String get tnfReserved;

  /// No description provided for @ntagUnsupportedChip.
  ///
  /// In tr, this message translates to:
  /// **'Bu işlem yalnızca NTAG213/215/216 ve MIFARE Ultralight EV1 etiketlerde destekleniyor.'**
  String get ntagUnsupportedChip;

  /// No description provided for @ntagPageReadFailed.
  ///
  /// In tr, this message translates to:
  /// **'Sayfa {page} okunamadı (etiket yanıt vermedi veya alan korumalı).'**
  String ntagPageReadFailed(String page);

  /// No description provided for @ntagPageWriteFailedError.
  ///
  /// In tr, this message translates to:
  /// **'Sayfa {page} yazılamadı: {error}'**
  String ntagPageWriteFailedError(String page, String error);

  /// No description provided for @ntagPageWriteFailed.
  ///
  /// In tr, this message translates to:
  /// **'Sayfa {page} yazılamadı (etiket reddetti; kilitli veya şifreli olabilir).'**
  String ntagPageWriteFailed(String page);

  /// No description provided for @ntagProtectedArea.
  ///
  /// In tr, this message translates to:
  /// **'Sayfa {page} sonrası okunamadı; bu alan şifre ile korunuyor olabilir.'**
  String ntagProtectedArea(String page);

  /// No description provided for @ntagPasswordPackSize.
  ///
  /// In tr, this message translates to:
  /// **'Şifre 4 bayt, PACK 2 bayt olmalıdır.'**
  String get ntagPasswordPackSize;

  /// No description provided for @ntagPasswordSize.
  ///
  /// In tr, this message translates to:
  /// **'Şifre 4 bayt olmalıdır.'**
  String get ntagPasswordSize;

  /// No description provided for @ntagPasswordWrongOrAuthFailed.
  ///
  /// In tr, this message translates to:
  /// **'Şifre yanlış veya etiket şifre doğrulamasını reddetti.'**
  String get ntagPasswordWrongOrAuthFailed;

  /// No description provided for @ntagPasswordWrong.
  ///
  /// In tr, this message translates to:
  /// **'Şifre yanlış.'**
  String get ntagPasswordWrong;

  /// No description provided for @ntagCcInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Etiketin CC alanı NDEF dışı bir değerle yazılmış; bu alan tek seferlik olduğu için biçimlendirilemez.'**
  String get ntagCcInvalid;

  /// No description provided for @ntagDumpTooShort.
  ///
  /// In tr, this message translates to:
  /// **'Dump dosyası çok kısa; kullanıcı verisi içermiyor.'**
  String get ntagDumpTooShort;

  /// No description provided for @ntagInvalidHex.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir onaltılık (hex) değer giriniz (Örn: 30 04).'**
  String get ntagInvalidHex;

  /// No description provided for @googleReviewFieldLabel.
  ///
  /// In tr, this message translates to:
  /// **'Yorum Bağlantısı veya Place ID'**
  String get googleReviewFieldLabel;

  /// No description provided for @menuLinkFieldLabel.
  ///
  /// In tr, this message translates to:
  /// **'Menü Bağlantısı'**
  String get menuLinkFieldLabel;

  /// No description provided for @menuTitleHint.
  ///
  /// In tr, this message translates to:
  /// **'Menümüz'**
  String get menuTitleHint;

  /// No description provided for @petName.
  ///
  /// In tr, this message translates to:
  /// **'Hayvanın Adı'**
  String get petName;

  /// No description provided for @ownerPhone.
  ///
  /// In tr, this message translates to:
  /// **'Sahibinin Telefonu'**
  String get ownerPhone;

  /// No description provided for @petTagMessage.
  ///
  /// In tr, this message translates to:
  /// **'Merhaba, ben {pet}! Sahibimi arar mısınız: {phone}{note}'**
  String petTagMessage(String pet, String phone, String note);

  /// No description provided for @bloodType.
  ///
  /// In tr, this message translates to:
  /// **'Kan Grubu'**
  String get bloodType;

  /// No description provided for @allergies.
  ///
  /// In tr, this message translates to:
  /// **'Alerjiler / İlaçlar'**
  String get allergies;

  /// No description provided for @emergencyContact.
  ///
  /// In tr, this message translates to:
  /// **'Acil Durumda Aranacak'**
  String get emergencyContact;

  /// No description provided for @emergencyInfo.
  ///
  /// In tr, this message translates to:
  /// **'ACİL DURUM BİLGİSİ'**
  String get emergencyInfo;

  /// No description provided for @emergencyBlood.
  ///
  /// In tr, this message translates to:
  /// **'Kan grubu: {blood}'**
  String emergencyBlood(String blood);

  /// No description provided for @emergencyAllergies.
  ///
  /// In tr, this message translates to:
  /// **'Alerjiler: {allergies}'**
  String emergencyAllergies(String allergies);

  /// No description provided for @emergencyCall.
  ///
  /// In tr, this message translates to:
  /// **'Acil durumda arayın: {contact}'**
  String emergencyCall(String contact);

  /// No description provided for @storeLink.
  ///
  /// In tr, this message translates to:
  /// **'Mağaza Bağlantısı'**
  String get storeLink;

  /// No description provided for @link.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı'**
  String get link;

  /// No description provided for @title.
  ///
  /// In tr, this message translates to:
  /// **'Başlık'**
  String get title;

  /// No description provided for @webAddress.
  ///
  /// In tr, this message translates to:
  /// **'Web adresi'**
  String get webAddress;

  /// No description provided for @address.
  ///
  /// In tr, this message translates to:
  /// **'Adres'**
  String get address;

  /// No description provided for @backupSummaryTemplates.
  ///
  /// In tr, this message translates to:
  /// **'Şablonlar: {added} eklendi, {updated} güncellendi'**
  String backupSummaryTemplates(String added, String updated);

  /// No description provided for @backupSummaryRules.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Notları/Kuralları: {added} eklendi, {updated} güncellendi'**
  String backupSummaryRules(String added, String updated);

  /// No description provided for @backupSummaryHistoryDisabled.
  ///
  /// In tr, this message translates to:
  /// **'Tarama geçmişi cihazda kapalı olduğu için {skipped}atlandı'**
  String backupSummaryHistoryDisabled(String skipped);

  /// No description provided for @backupSummaryHistory.
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş: {added} eklendi, {skipped} mevcut/atlandı'**
  String backupSummaryHistory(String added, String skipped);

  /// No description provided for @backupSummaryNoNewData.
  ///
  /// In tr, this message translates to:
  /// **'İçe aktarılacak yeni veri bulunamadı (mevcut kayıtlarla eşleşti).'**
  String get backupSummaryNoNewData;

  /// No description provided for @backupFieldMustBeString.
  ///
  /// In tr, this message translates to:
  /// **'{field} bir metin olmalıdır.'**
  String backupFieldMustBeString(String field);

  /// No description provided for @backupFieldMustBeDate.
  ///
  /// In tr, this message translates to:
  /// **'{field} geçerli bir tarih olmalıdır.'**
  String backupFieldMustBeDate(String field);

  /// No description provided for @rawTypeHexLabel.
  ///
  /// In tr, this message translates to:
  /// **'Tür / Type (Hex Baytları)'**
  String get rawTypeHexLabel;

  /// No description provided for @rawIdHexLabel.
  ///
  /// In tr, this message translates to:
  /// **'Kimlik / ID (Hex Baytları, isteğe bağlı)'**
  String get rawIdHexLabel;

  /// No description provided for @rawPayloadHexLabel.
  ///
  /// In tr, this message translates to:
  /// **'Yük / Payload (Hex Baytları)'**
  String get rawPayloadHexLabel;

  /// No description provided for @rawOptionalHexHint.
  ///
  /// In tr, this message translates to:
  /// **'İsteğe bağlı hex baytları'**
  String get rawOptionalHexHint;

  /// No description provided for @saveChanges.
  ///
  /// In tr, this message translates to:
  /// **'Değişikliği Kaydet'**
  String get saveChanges;

  /// No description provided for @edit.
  ///
  /// In tr, this message translates to:
  /// **'Düzenle'**
  String get edit;

  /// No description provided for @clearAllButton.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü Temizle'**
  String get clearAllButton;

  /// No description provided for @ntagPagesRead.
  ///
  /// In tr, this message translates to:
  /// **'{chip}: {count} sayfa okundu'**
  String ntagPagesRead(String chip, int count);

  /// No description provided for @ntagFormatted.
  ///
  /// In tr, this message translates to:
  /// **'{chip} biçimlendirildi'**
  String ntagFormatted(String chip);

  /// No description provided for @ntagInvalidDumpFile.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz dump dosyası (4 baytın katı, 32–1024 bayt olmalı).'**
  String get ntagInvalidDumpFile;

  /// No description provided for @ntagPagesWritten.
  ///
  /// In tr, this message translates to:
  /// **'{count} sayfa yazıldı'**
  String ntagPagesWritten(int count);

  /// No description provided for @ntagPasswordSet.
  ///
  /// In tr, this message translates to:
  /// **'{chip}: şifre koruması etkin'**
  String ntagPasswordSet(String chip);

  /// No description provided for @ntagPasswordRemoved.
  ///
  /// In tr, this message translates to:
  /// **'{chip}: şifre kaldırıldı'**
  String ntagPasswordRemoved(String chip);

  /// No description provided for @memoryDumpCopied.
  ///
  /// In tr, this message translates to:
  /// **'Bellek dökümü kopyalandı'**
  String get memoryDumpCopied;

  /// No description provided for @ntagCommandsSent.
  ///
  /// In tr, this message translates to:
  /// **'{count} komut gönderildi'**
  String ntagCommandsSent(int count);

  /// No description provided for @emptyResponse.
  ///
  /// In tr, this message translates to:
  /// **'(boş yanıt)'**
  String get emptyResponse;

  /// No description provided for @pagesAndBytes.
  ///
  /// In tr, this message translates to:
  /// **'{pages} sayfa · {bytes} bayt'**
  String pagesAndBytes(int pages, int bytes);

  /// No description provided for @composeTextEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Metin içeriği boş bırakılamaz.'**
  String get composeTextEmpty;

  /// No description provided for @composeTextTooLong.
  ///
  /// In tr, this message translates to:
  /// **'Metin çok uzun (en fazla 5000 karakter).'**
  String get composeTextTooLong;

  /// No description provided for @composeUrlInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir adres giriniz (Örn: https://example.com veya uygulama:// bağlantısı).'**
  String get composeUrlInvalid;

  /// No description provided for @composeUrlTooLong.
  ///
  /// In tr, this message translates to:
  /// **'URL çok uzun (en fazla 2000 karakter).'**
  String get composeUrlTooLong;

  /// No description provided for @composeEmailInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir e-posta adresi giriniz (Örn: ad@alanadi.com).'**
  String get composeEmailInvalid;

  /// No description provided for @composePhoneInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir telefon numarası giriniz (Örn: +905551234567).'**
  String get composePhoneInvalid;

  /// No description provided for @composeSmsPhoneInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir alıcı telefon numarası giriniz.'**
  String get composeSmsPhoneInvalid;

  /// No description provided for @composeLatInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Enlem -90 ile +90 arasında olmalıdır.'**
  String get composeLatInvalid;

  /// No description provided for @composeLngInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Boylam -180 ile +180 arasında olmalıdır.'**
  String get composeLngInvalid;

  /// No description provided for @composeVcardNameEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Kişi adı veya tam ad boş bırakılamaz.'**
  String get composeVcardNameEmpty;

  /// No description provided for @composeVcardNameTooLong.
  ///
  /// In tr, this message translates to:
  /// **'Kişi adı çok uzun (en fazla 200 karakter).'**
  String get composeVcardNameTooLong;

  /// No description provided for @composeVcardEmailInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir e-posta adresi giriniz.'**
  String get composeVcardEmailInvalid;

  /// No description provided for @composeVcardPhoneInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir telefon numarası giriniz.'**
  String get composeVcardPhoneInvalid;

  /// No description provided for @composeVcardUrlInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir web adresi giriniz (Örn: https://...).'**
  String get composeVcardUrlInvalid;

  /// No description provided for @composeCalSummaryEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Etkinlik başlığı boş bırakılamaz.'**
  String get composeCalSummaryEmpty;

  /// No description provided for @composeCalSummaryTooLong.
  ///
  /// In tr, this message translates to:
  /// **'Etkinlik başlığı çok uzun (en fazla 250 karakter).'**
  String get composeCalSummaryTooLong;

  /// No description provided for @composeCalDateInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Bitiş zamanı, başlangıç zamanından sonra olmalıdır.'**
  String get composeCalDateInvalid;

  /// No description provided for @composeSpUriInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir hedef URL giriniz (Örn: https://...).'**
  String get composeSpUriInvalid;

  /// No description provided for @composeSpLangInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir ISO dil kodu giriniz (Örn: tr, en).'**
  String get composeSpLangInvalid;

  /// No description provided for @composeMimeTypeInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir MIME türü giriniz (Örn: application/json, text/plain).'**
  String get composeMimeTypeInvalid;

  /// No description provided for @composeMimeHexInvalid.
  ///
  /// In tr, this message translates to:
  /// **'Geçerli bir onaltılık (hex) dize giriniz (çift sayıda hex karakter).'**
  String get composeMimeHexInvalid;

  /// No description provided for @composeMimePayloadTooLarge.
  ///
  /// In tr, this message translates to:
  /// **'Yük boyutu çok büyük (en fazla 10 KB).'**
  String get composeMimePayloadTooLarge;

  /// No description provided for @composeWifiSsidEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Ağ adı (SSID) boş bırakılamaz.'**
  String get composeWifiSsidEmpty;

  /// No description provided for @composeWifiPasswordRequired.
  ///
  /// In tr, this message translates to:
  /// **'Şifreli ağlar için Wi-Fi şifresi zorunludur.'**
  String get composeWifiPasswordRequired;

  /// No description provided for @composeWifiPasswordLength.
  ///
  /// In tr, this message translates to:
  /// **'WPA/WPA2 şifresi 8 ile 63 karakter arasında olmalıdır.'**
  String get composeWifiPasswordLength;

  /// No description provided for @composeEditNdefRecord.
  ///
  /// In tr, this message translates to:
  /// **'NDEF Kaydını Düzenle'**
  String get composeEditNdefRecord;

  /// No description provided for @composeNewNdefRecord.
  ///
  /// In tr, this message translates to:
  /// **'Yeni NDEF Kaydı Oluştur'**
  String get composeNewNdefRecord;

  /// No description provided for @quickLinksHeader.
  ///
  /// In tr, this message translates to:
  /// **'Hazır Bağlantılar'**
  String get quickLinksHeader;

  /// No description provided for @quickLinkCustomUri.
  ///
  /// In tr, this message translates to:
  /// **'Özel URI'**
  String get quickLinkCustomUri;

  /// No description provided for @quickLinkSocial.
  ///
  /// In tr, this message translates to:
  /// **'Sosyal Ağlar'**
  String get quickLinkSocial;

  /// No description provided for @quickLinkVideo.
  ///
  /// In tr, this message translates to:
  /// **'Video'**
  String get quickLinkVideo;

  /// No description provided for @quickLinkSearch.
  ///
  /// In tr, this message translates to:
  /// **'Arama'**
  String get quickLinkSearch;

  /// No description provided for @quickLinkFile.
  ///
  /// In tr, this message translates to:
  /// **'Dosya'**
  String get quickLinkFile;

  /// No description provided for @quickLinkFacetimeAudio.
  ///
  /// In tr, this message translates to:
  /// **'FaceTime Ses'**
  String get quickLinkFacetimeAudio;

  /// No description provided for @quickLinkAddress.
  ///
  /// In tr, this message translates to:
  /// **'Adres'**
  String get quickLinkAddress;

  /// No description provided for @quickLinkPayment.
  ///
  /// In tr, this message translates to:
  /// **'Ödeme Bağlantısı'**
  String get quickLinkPayment;

  /// No description provided for @quickLinkApp.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama (Android)'**
  String get quickLinkApp;

  /// No description provided for @updateRecord.
  ///
  /// In tr, this message translates to:
  /// **'Kaydı Güncelle'**
  String get updateRecord;

  /// No description provided for @addToList.
  ///
  /// In tr, this message translates to:
  /// **'Listeye Ekle'**
  String get addToList;

  /// No description provided for @quickCustomUriError.
  ///
  /// In tr, this message translates to:
  /// **'Şema içeren bir adres giriniz (Örn: spotify:track:... veya myapp://sayfa).'**
  String get quickCustomUriError;

  /// No description provided for @quickFileEmptyMessage.
  ///
  /// In tr, this message translates to:
  /// **'Dosyanın bağlantısını giriniz.'**
  String get quickFileEmptyMessage;

  /// No description provided for @quickPaymentEmptyMessage.
  ///
  /// In tr, this message translates to:
  /// **'Ödeme bağlantısını giriniz.'**
  String get quickPaymentEmptyMessage;

  /// No description provided for @quickCustomUriDesc.
  ///
  /// In tr, this message translates to:
  /// **'Herhangi bir şemayla başlayan adres yazılabilir; telefon bu adresi destekleyen uygulamayı açar.'**
  String get quickCustomUriDesc;

  /// No description provided for @quickSocialLabel.
  ///
  /// In tr, this message translates to:
  /// **'Sosyal Ağ'**
  String get quickSocialLabel;

  /// No description provided for @quickVideoLabel.
  ///
  /// In tr, this message translates to:
  /// **'Video Bağlantısı'**
  String get quickVideoLabel;

  /// No description provided for @quickVideoHint.
  ///
  /// In tr, this message translates to:
  /// **'https://youtu.be/... veya video kimliği'**
  String get quickVideoHint;

  /// No description provided for @quickVideoDesc.
  ///
  /// In tr, this message translates to:
  /// **'YouTube, Vimeo vb. bağlantı ya da yalnızca YouTube video kimliği yazılabilir.'**
  String get quickVideoDesc;

  /// No description provided for @quickSearchHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: İstanbul hava durumu'**
  String get quickSearchHint;

  /// No description provided for @quickFileLabel.
  ///
  /// In tr, this message translates to:
  /// **'Dosya Bağlantısı'**
  String get quickFileLabel;

  /// No description provided for @quickFileDesc.
  ///
  /// In tr, this message translates to:
  /// **'Etiketlerin kapasitesi küçük olduğu için dosyanın kendisi değil, internetteki bağlantısı yazılır (Google Drive, Dropbox vb.).'**
  String get quickFileDesc;

  /// No description provided for @quickPhoneOrAppleId.
  ///
  /// In tr, this message translates to:
  /// **'Telefon veya Apple Kimliği'**
  String get quickPhoneOrAppleId;

  /// No description provided for @quickFacetimeVideoDesc.
  ///
  /// In tr, this message translates to:
  /// **'Etikete dokunan iPhone görüntülü FaceTime araması başlatır.'**
  String get quickFacetimeVideoDesc;

  /// No description provided for @quickFacetimeAudioDesc.
  ///
  /// In tr, this message translates to:
  /// **'Etikete dokunan iPhone yalnızca sesli FaceTime araması başlatır.'**
  String get quickFacetimeAudioDesc;

  /// No description provided for @quickMapProvider.
  ///
  /// In tr, this message translates to:
  /// **'Harita Uygulaması'**
  String get quickMapProvider;

  /// No description provided for @quickAddressHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: Bağdat Cad. No:1 Kadıköy İstanbul'**
  String get quickAddressHint;

  /// No description provided for @quickPaymentDesc.
  ///
  /// In tr, this message translates to:
  /// **'PayPal.me, Papara, iyzico, Stripe gibi ödeme sayfası bağlantıları kullanılabilir. Kart bilgisi asla etikete yazılmaz.'**
  String get quickPaymentDesc;

  /// No description provided for @quickAppDesc.
  ///
  /// In tr, this message translates to:
  /// **'Android telefonlar etikete dokununca bu uygulamayı açar (yüklü değilse Play Store\'u açar). iPhone bu kayıt türünü yok sayar; iPhone için App Store bağlantısını URL olarak ekleyin.'**
  String get quickAppDesc;

  /// No description provided for @quickDeviceNameOptional.
  ///
  /// In tr, this message translates to:
  /// **'Cihaz Adı (isteğe bağlı)'**
  String get quickDeviceNameOptional;

  /// No description provided for @quickSpeakerHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: Hoparlör'**
  String get quickSpeakerHint;

  /// No description provided for @quickBluetoothDesc.
  ///
  /// In tr, this message translates to:
  /// **'Android telefonlar etikete dokununca bu cihazla eşleşmeyi önerir. iPhone Bluetooth eşleştirme etiketlerini desteklemez.'**
  String get quickBluetoothDesc;

  /// No description provided for @composeTextContent.
  ///
  /// In tr, this message translates to:
  /// **'Metin İçeriği'**
  String get composeTextContent;

  /// No description provided for @composeTextHint.
  ///
  /// In tr, this message translates to:
  /// **'Yazmak istediğiniz metni giriniz'**
  String get composeTextHint;

  /// No description provided for @composeEmailSubjectOptional.
  ///
  /// In tr, this message translates to:
  /// **'Konu (İsteğe bağlı)'**
  String get composeEmailSubjectOptional;

  /// No description provided for @composeEmailBodyOptional.
  ///
  /// In tr, this message translates to:
  /// **'Mesaj Gövdesi (İsteğe bağlı)'**
  String get composeEmailBodyOptional;

  /// No description provided for @composeSmsRecipient.
  ///
  /// In tr, this message translates to:
  /// **'Alıcı Telefon Numarası'**
  String get composeSmsRecipient;

  /// No description provided for @composeSmsHint.
  ///
  /// In tr, this message translates to:
  /// **'Gönderilecek kısa mesaj...'**
  String get composeSmsHint;

  /// No description provided for @composeVcardFullName.
  ///
  /// In tr, this message translates to:
  /// **'Tam Ad (Görünen İsim) *'**
  String get composeVcardFullName;

  /// No description provided for @composeVcardNameHint.
  ///
  /// In tr, this message translates to:
  /// **'Ahmet Yılmaz'**
  String get composeVcardNameHint;

  /// No description provided for @composeVcardNote.
  ///
  /// In tr, this message translates to:
  /// **'Not / Açıklama'**
  String get composeVcardNote;

  /// No description provided for @composeCalTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etkinlik Başlığı *'**
  String get composeCalTitle;

  /// No description provided for @composeCalTitleHint.
  ///
  /// In tr, this message translates to:
  /// **'Proje Toplantısı'**
  String get composeCalTitleHint;

  /// No description provided for @composeCalLocationHint.
  ///
  /// In tr, this message translates to:
  /// **'Toplantı Odası 2 veya Online'**
  String get composeCalLocationHint;

  /// No description provided for @composeCalDesc.
  ///
  /// In tr, this message translates to:
  /// **'Etkinlik Açıklaması'**
  String get composeCalDesc;

  /// No description provided for @composeCalStartEndTime.
  ///
  /// In tr, this message translates to:
  /// **'Başlangıç ve Bitiş Zamanı:'**
  String get composeCalStartEndTime;

  /// No description provided for @composeSpTitleLabel.
  ///
  /// In tr, this message translates to:
  /// **'Başlık (Görünen Metin)'**
  String get composeSpTitleLabel;

  /// No description provided for @composeSpTitleHint.
  ///
  /// In tr, this message translates to:
  /// **'Şirket Tanıtım Broşürü'**
  String get composeSpTitleHint;

  /// No description provided for @composeMimeTypeLabel.
  ///
  /// In tr, this message translates to:
  /// **'MIME Türü *'**
  String get composeMimeTypeLabel;

  /// No description provided for @composeDataFormat.
  ///
  /// In tr, this message translates to:
  /// **'Veri Formatı: '**
  String get composeDataFormat;

  /// No description provided for @composeFormatHex.
  ///
  /// In tr, this message translates to:
  /// **'Hex (Onaltılık)'**
  String get composeFormatHex;

  /// No description provided for @composeMimeHexBytes.
  ///
  /// In tr, this message translates to:
  /// **'Hex Baytları *'**
  String get composeMimeHexBytes;

  /// No description provided for @composeMimeTextPayload.
  ///
  /// In tr, this message translates to:
  /// **'Yük Metni (UTF-8) *'**
  String get composeMimeTextPayload;

  /// No description provided for @composeWifiWarningTitle.
  ///
  /// In tr, this message translates to:
  /// **'Güvenlik ve Platform Uyarısı:'**
  String get composeWifiWarningTitle;

  /// No description provided for @composeWifiWarningBody.
  ///
  /// In tr, this message translates to:
  /// **'• Etikete yazılan Wi-Fi parolası şifresiz/düz metin olarak saklanır ve etiketi okuyan herhangi biri tarafından kolayca okunabilir.\n• iPhone veya Android cihazların etikete dokunulduğunda ağa otomatik olarak katılması garanti edilmez; işletim sistemi ve cihaz desteğine göre kullanıcı onayı veya ağ seçimi gerektirebilir.'**
  String get composeWifiWarningBody;

  /// No description provided for @composeWifiSsidLabel.
  ///
  /// In tr, this message translates to:
  /// **'Ağ Adı (SSID) *'**
  String get composeWifiSsidLabel;

  /// No description provided for @composeWifiAuthTypeLabel.
  ///
  /// In tr, this message translates to:
  /// **'Güvenlik Türü (Kimlik Doğrulama)'**
  String get composeWifiAuthTypeLabel;

  /// No description provided for @composeWifiOpenNetwork.
  ///
  /// In tr, this message translates to:
  /// **'Açık Ağ (Şifresiz)'**
  String get composeWifiOpenNetwork;

  /// No description provided for @composeWifiPasswordLabel.
  ///
  /// In tr, this message translates to:
  /// **'Wi-Fi Şifresi *'**
  String get composeWifiPasswordLabel;

  /// No description provided for @composeWifiEncryptionLabel.
  ///
  /// In tr, this message translates to:
  /// **'Şifreleme Türü'**
  String get composeWifiEncryptionLabel;

  /// No description provided for @composeWifiAesRecommended.
  ///
  /// In tr, this message translates to:
  /// **'AES (Önerilen)'**
  String get composeWifiAesRecommended;

  /// No description provided for @quickSearchTextLabel.
  ///
  /// In tr, this message translates to:
  /// **'Aranacak Metin'**
  String get quickSearchTextLabel;

  /// No description provided for @readTagMemoryPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Okunacak etiketi telefona yaklaştırın'**
  String get readTagMemoryPrompt;

  /// No description provided for @readingTagMemoryStatus.
  ///
  /// In tr, this message translates to:
  /// **'Bellek okunuyor...'**
  String get readingTagMemoryStatus;

  /// No description provided for @formatTagConfirmTitle.
  ///
  /// In tr, this message translates to:
  /// **'Belleği Biçimlendir'**
  String get formatTagConfirmTitle;

  /// No description provided for @formatTagConfirmMessage.
  ///
  /// In tr, this message translates to:
  /// **'Etiketteki veriler silinir ve etiket boş bir NDEF etiketi olarak hazırlanır. Devam edilsin mi?'**
  String get formatTagConfirmMessage;

  /// No description provided for @formatButton.
  ///
  /// In tr, this message translates to:
  /// **'Biçimlendir'**
  String get formatButton;

  /// No description provided for @formatTagPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Biçimlendirilecek etiketi yaklaştırın'**
  String get formatTagPrompt;

  /// No description provided for @formattingStatus.
  ///
  /// In tr, this message translates to:
  /// **'Biçimlendiriliyor...'**
  String get formattingStatus;

  /// No description provided for @filePickerFailed.
  ///
  /// In tr, this message translates to:
  /// **'Dosya seçici açılamadı: {error}'**
  String filePickerFailed(String error);

  /// No description provided for @writeButton.
  ///
  /// In tr, this message translates to:
  /// **'Yaz'**
  String get writeButton;

  /// No description provided for @writeDumpPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Yazılacak etiketi yaklaştırın'**
  String get writeDumpPrompt;

  /// No description provided for @writingDumpStatus.
  ///
  /// In tr, this message translates to:
  /// **'Dump yazılıyor...'**
  String get writingDumpStatus;

  /// No description provided for @setPasswordWarning.
  ///
  /// In tr, this message translates to:
  /// **'Şifreyi unutursanız etiketin içeriğini bir daha değiştiremezsiniz. Okuma herkese açık kalır.'**
  String get setPasswordWarning;

  /// No description provided for @setPasswordAction.
  ///
  /// In tr, this message translates to:
  /// **'Şifreyi Ayarla'**
  String get setPasswordAction;

  /// No description provided for @setPasswordPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Şifrelenecek etiketi yaklaştırın'**
  String get setPasswordPrompt;

  /// No description provided for @settingPasswordStatus.
  ///
  /// In tr, this message translates to:
  /// **'Şifre ayarlanıyor...'**
  String get settingPasswordStatus;

  /// No description provided for @removePasswordPromptMessage.
  ///
  /// In tr, this message translates to:
  /// **'Etikete daha önce koyduğunuz şifreyi girin.'**
  String get removePasswordPromptMessage;

  /// No description provided for @remove.
  ///
  /// In tr, this message translates to:
  /// **'Kaldır'**
  String get remove;

  /// No description provided for @removePasswordPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Şifresi kaldırılacak etiketi yaklaştırın'**
  String get removePasswordPrompt;

  /// No description provided for @removingPasswordStatus.
  ///
  /// In tr, this message translates to:
  /// **'Şifre kaldırılıyor...'**
  String get removingPasswordStatus;

  /// No description provided for @sendCommandsPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Komut gönderilecek etiketi yaklaştırın'**
  String get sendCommandsPrompt;

  /// No description provided for @sendingCommandsStatus.
  ///
  /// In tr, this message translates to:
  /// **'Komutlar gönderiliyor...'**
  String get sendingCommandsStatus;

  /// No description provided for @sendButton.
  ///
  /// In tr, this message translates to:
  /// **'Gönder'**
  String get sendButton;

  /// No description provided for @tagNoteEditTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Notunu Düzenle'**
  String get tagNoteEditTitle;

  /// No description provided for @tagNoteInputLabel.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama İçi Not / Açıklama'**
  String get tagNoteInputLabel;

  /// No description provided for @tagNoteInputHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: Toplantı Odası Bilgisi veya Depo Rafı #12'**
  String get tagNoteInputHint;

  /// No description provided for @tagNoteDeleteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Notunu Sil'**
  String get tagNoteDeleteTitle;

  /// No description provided for @clearAllTagRulesTitle.
  ///
  /// In tr, this message translates to:
  /// **'Tüm Notları Sil'**
  String get clearAllTagRulesTitle;

  /// No description provided for @clearAllTagRulesConfirm.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı tüm uygulama içi etiket notları silinecektir. Onaylıyor musunuz?'**
  String get clearAllTagRulesConfirm;

  /// No description provided for @deleteAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümünü Sil'**
  String get deleteAll;

  /// No description provided for @tagRulesExplanation.
  ///
  /// In tr, this message translates to:
  /// **'NDEF içerik baytlarının SHA-256 özetine göre eşleşen etiketlerde yalnızca kaydedilen not gösterilir. Harici işlem başlatmaz.'**
  String get tagRulesExplanation;

  /// No description provided for @noTagRulesDefined.
  ///
  /// In tr, this message translates to:
  /// **'Henüz tanımlanmış bir etiket notu yok.'**
  String get noTagRulesDefined;

  /// No description provided for @lastUpdated.
  ///
  /// In tr, this message translates to:
  /// **'Son güncelleme: {time}'**
  String lastUpdated(String time);

  /// No description provided for @tagLibraryNoMatch.
  ///
  /// In tr, this message translates to:
  /// **'Aramanızla eşleşen etiket bulunamadı.'**
  String get tagLibraryNoMatch;

  /// No description provided for @tagLibraryAddToLibrary.
  ///
  /// In tr, this message translates to:
  /// **'Kütüphaneye Ekle'**
  String get tagLibraryAddToLibrary;

  /// No description provided for @name.
  ///
  /// In tr, this message translates to:
  /// **'İsim'**
  String get name;

  /// No description provided for @tagLibraryAddTag.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Ekle'**
  String get tagLibraryAddTag;

  /// No description provided for @all.
  ///
  /// In tr, this message translates to:
  /// **'Tümü'**
  String get all;

  /// No description provided for @tagLibraryPhotoError.
  ///
  /// In tr, this message translates to:
  /// **'Fotoğraf seçilemedi: {error}'**
  String tagLibraryPhotoError(String error);

  /// No description provided for @tagLibraryDeleteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Sil'**
  String get tagLibraryDeleteTitle;

  /// No description provided for @tagLibraryNameHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: Ofis Anahtarlığı'**
  String get tagLibraryNameHint;

  /// No description provided for @tagLibraryNoTagContent.
  ///
  /// In tr, this message translates to:
  /// **'Bu kayıtta etiket içeriği yok.'**
  String get tagLibraryNoTagContent;

  /// No description provided for @tagLibrarySourceLastScanned.
  ///
  /// In tr, this message translates to:
  /// **'Son Taranan'**
  String get tagLibrarySourceLastScanned;

  /// No description provided for @tagLibraryEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Henüz kayıtlı etiket yok.'**
  String get tagLibraryEmpty;

  /// No description provided for @tagLibrarySourceEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Boş Kayıt'**
  String get tagLibrarySourceEmpty;

  /// No description provided for @tagLibraryNamePrompt.
  ///
  /// In tr, this message translates to:
  /// **'Lütfen bir etiket ismi girin'**
  String get tagLibraryNamePrompt;

  /// No description provided for @tagLibrarySearchHint.
  ///
  /// In tr, this message translates to:
  /// **'İsim, kategori veya konum ile ara...'**
  String get tagLibrarySearchHint;

  /// No description provided for @tagLibrarySourceWriteList.
  ///
  /// In tr, this message translates to:
  /// **'Yazma Listesi'**
  String get tagLibrarySourceWriteList;

  /// No description provided for @tagLibraryLocationHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: Masaüstü, Giriş Kapısı'**
  String get tagLibraryLocationHint;

  /// No description provided for @tagLibraryDeleteConfirm.
  ///
  /// In tr, this message translates to:
  /// **'\"{name}\" etiketini kütüphaneden silmek istediğinize emin misiniz?'**
  String tagLibraryDeleteConfirm(String name);

  /// No description provided for @noContent.
  ///
  /// In tr, this message translates to:
  /// **'İçerik yok'**
  String get noContent;

  /// No description provided for @tagLibraryRecordSummary.
  ///
  /// In tr, this message translates to:
  /// **'{count, plural, =1{1 NDEF kaydı} other{{count} NDEF kaydı}}'**
  String tagLibraryRecordSummary(num count);

  /// No description provided for @tagLibraryEditTag.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Düzenle'**
  String get tagLibraryEditTag;

  /// No description provided for @rawTypeHexHint.
  ///
  /// In tr, this message translates to:
  /// **'41 (A) veya 55 (U) vb.'**
  String get rawTypeHexHint;

  /// No description provided for @backupContextRecordsMustBeList.
  ///
  /// In tr, this message translates to:
  /// **'{context}: \"records\" alanı bir liste olmalıdır.'**
  String backupContextRecordsMustBeList(String context);

  /// No description provided for @backupContextMaxRecords.
  ///
  /// In tr, this message translates to:
  /// **'{context}: Bir öğede en fazla {max} NDEF kaydı bulunabilir.'**
  String backupContextMaxRecords(String context, num max);

  /// No description provided for @backupContextRecordMustBeObject.
  ///
  /// In tr, this message translates to:
  /// **'{context} - Kayıt #{index} geçerli bir nesne değil.'**
  String backupContextRecordMustBeObject(String context, num index);

  /// No description provided for @backupContextInvalidTnf.
  ///
  /// In tr, this message translates to:
  /// **'{context} - Kayıt #{index}: Geçersiz TNF değeri ({tnf}).'**
  String backupContextInvalidTnf(String context, num index, String tnf);

  /// No description provided for @backupContextTypeMustBeString.
  ///
  /// In tr, this message translates to:
  /// **'{context} - Kayıt #{index}: \"type\" Base64 dizesi olmalıdır.'**
  String backupContextTypeMustBeString(String context, num index);

  /// No description provided for @backupContextInvalidTypeBase64.
  ///
  /// In tr, this message translates to:
  /// **'{context} - Kayıt #{index}: \"type\" geçerli Base64 verisi değil ({error}).'**
  String backupContextInvalidTypeBase64(
      String context, num index, String error);

  /// No description provided for @backupContextIdMustBeString.
  ///
  /// In tr, this message translates to:
  /// **'{context} - Kayıt #{index}: \"id\" Base64 dizesi olmalıdır.'**
  String backupContextIdMustBeString(String context, num index);

  /// No description provided for @backupContextInvalidIdBase64.
  ///
  /// In tr, this message translates to:
  /// **'{context} - Kayıt #{index}: \"id\" geçerli Base64 verisi değil ({error}).'**
  String backupContextInvalidIdBase64(String context, num index, String error);

  /// No description provided for @backupContextPayloadMustBeString.
  ///
  /// In tr, this message translates to:
  /// **'{context} - Kayıt #{index}: \"payload\" Base64 dizesi olmalıdır.'**
  String backupContextPayloadMustBeString(String context, num index);

  /// No description provided for @backupContextInvalidPayloadBase64.
  ///
  /// In tr, this message translates to:
  /// **'{context} - Kayıt #{index}: \"payload\" geçerli Base64 verisi değil ({error}).'**
  String backupContextInvalidPayloadBase64(
      String context, num index, String error);

  /// No description provided for @composerUndoSnack.
  ///
  /// In tr, this message translates to:
  /// **'Son beste değişikliği geri alındı.'**
  String get composerUndoSnack;

  /// No description provided for @composerRedoSnack.
  ///
  /// In tr, this message translates to:
  /// **'Beste değişikliği yinelendi.'**
  String get composerRedoSnack;

  /// No description provided for @noRecordsToCopy.
  ///
  /// In tr, this message translates to:
  /// **'Kopyalanacak NDEF kaydı bulunmuyor.'**
  String get noRecordsToCopy;

  /// No description provided for @recordsCopiedToClipboardDetails.
  ///
  /// In tr, this message translates to:
  /// **'{count} adet NDEF kaydı ({bytes} Bayt) panoya kopyalandı.\n(Yalnızca NDEF içerik baytları kopyalanır; UID veya şifreli sektörler asla klonlanamaz)'**
  String recordsCopiedToClipboardDetails(num count, num bytes);

  /// No description provided for @recordsAddedFromSource.
  ///
  /// In tr, this message translates to:
  /// **'{source}: {count} kayıt eklendi.'**
  String recordsAddedFromSource(String source, num count);

  /// No description provided for @tagEmptyNoRecordsToImport.
  ///
  /// In tr, this message translates to:
  /// **'Etiket boş; içe aktarılacak kayıt yok.'**
  String get tagEmptyNoRecordsToImport;

  /// No description provided for @sourceTag.
  ///
  /// In tr, this message translates to:
  /// **'Etiketten'**
  String get sourceTag;

  /// No description provided for @sourceQr.
  ///
  /// In tr, this message translates to:
  /// **'QR koddan'**
  String get sourceQr;

  /// No description provided for @filePickerError.
  ///
  /// In tr, this message translates to:
  /// **'Dosya seçici açılamadı: {error}'**
  String filePickerError(String error);

  /// No description provided for @csvFileTooLarge.
  ///
  /// In tr, this message translates to:
  /// **'CSV dosyası çok büyük (en fazla 512 KB).'**
  String get csvFileTooLarge;

  /// No description provided for @noRecordsFound.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt bulunamadı'**
  String get noRecordsFound;

  /// No description provided for @someRowsSkipped.
  ///
  /// In tr, this message translates to:
  /// **'Bazı satırlar atlandı'**
  String get someRowsSkipped;

  /// No description provided for @expectedFormat.
  ///
  /// In tr, this message translates to:
  /// **'Beklenen biçim:'**
  String get expectedFormat;

  /// No description provided for @noClipboardContent.
  ///
  /// In tr, this message translates to:
  /// **'Panoda kopyalanmış NDEF içeriği bulunmuyor.'**
  String get noClipboardContent;

  /// No description provided for @pasteFromClipboardTitle.
  ///
  /// In tr, this message translates to:
  /// **'NDEF Panosundan Yapıştır'**
  String get pasteFromClipboardTitle;

  /// No description provided for @clipboardDataSummary.
  ///
  /// In tr, this message translates to:
  /// **'Panodaki Veri: {count} kayıt, {bytes} bayt ({source})'**
  String clipboardDataSummary(num count, num bytes, String source);

  /// No description provided for @clipboardPastePrompt.
  ///
  /// In tr, this message translates to:
  /// **'Mevcut beste kayıtlarını tamamen değiştirmek mi yoksa sonuna eklemek mi istiyorsunuz?'**
  String get clipboardPastePrompt;

  /// No description provided for @pasteOverwriteOption.
  ///
  /// In tr, this message translates to:
  /// **'Üzerine Yaz (Değiştir)'**
  String get pasteOverwriteOption;

  /// No description provided for @pasteOverwriteSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Mevcut {count} kayıt silinip pano içeriğiyle değiştirilir (onay istenir).'**
  String pasteOverwriteSubtitle(num count);

  /// No description provided for @pasteEmptySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Pano içeriği besteye yerleştirilir.'**
  String get pasteEmptySubtitle;

  /// No description provided for @pasteAppendOption.
  ///
  /// In tr, this message translates to:
  /// **'Sonuna Ekle (Append)'**
  String get pasteAppendOption;

  /// No description provided for @pasteAppendSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Mevcut kayıtlar korunur, panodaki kayıtlar listenin sonuna ilave edilir.'**
  String get pasteAppendSubtitle;

  /// No description provided for @recordsAddedToComposer.
  ///
  /// In tr, this message translates to:
  /// **'{count} adet kayıt besteye eklendi.'**
  String recordsAddedToComposer(num count);

  /// No description provided for @confirmOverwriteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtların Üzerine Yazılsın mı?'**
  String get confirmOverwriteTitle;

  /// No description provided for @confirmOverwriteMessage.
  ///
  /// In tr, this message translates to:
  /// **'Mevcut bestede {currentCount} adet kayıt bulunuyor. Bu kayıtlar silinecek ve yerlerine panodaki {newCount} adet kayıt getirilecektir. Devam edilsin mi?'**
  String confirmOverwriteMessage(num currentCount, num newCount);

  /// No description provided for @recordsReplacedInComposer.
  ///
  /// In tr, this message translates to:
  /// **'{count} adet kayıt ile bestedeki kayıtlar değiştirildi.'**
  String recordsReplacedInComposer(num count);

  /// No description provided for @yesReplace.
  ///
  /// In tr, this message translates to:
  /// **'Evet, Değiştir'**
  String get yesReplace;

  /// No description provided for @recordsImportedToComposer.
  ///
  /// In tr, this message translates to:
  /// **'{count} adet kayıt besteye aktarıldı.'**
  String recordsImportedToComposer(num count);

  /// No description provided for @noContentToCopy.
  ///
  /// In tr, this message translates to:
  /// **'Kopyalanacak NDEF içeriği bulunamadı.'**
  String get noContentToCopy;

  /// No description provided for @recordsCopiedAndStaged.
  ///
  /// In tr, this message translates to:
  /// **'{count} adet NDEF kaydı panoya alındı ve besteye eklendi (İçerik kopyalandı, UID kopyalanmaz).'**
  String recordsCopiedAndStaged(num count);

  /// No description provided for @noContentToRewrite.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden yazılacak NDEF içeriği bulunamadı.'**
  String get noContentToRewrite;

  /// No description provided for @rewriteTagTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Yeniden Yaz'**
  String get rewriteTagTitle;

  /// No description provided for @importantNotice.
  ///
  /// In tr, this message translates to:
  /// **'ÖNEMLİ BİLGİLENDİRME:'**
  String get importantNotice;

  /// No description provided for @rewriteNotice1.
  ///
  /// In tr, this message translates to:
  /// **'• Bu işlem hedef etiketin mevcut NDEF içeriğini TAMAMEN DEĞİŞTİRİR (üzerine yazar), sonuna eklemez.\n'**
  String get rewriteNotice1;

  /// No description provided for @rewriteNotice2.
  ///
  /// In tr, this message translates to:
  /// **'• Hedef etiketin yazılabilir (kilitsiz) bir NDEF etiketi olması şarttır.\n'**
  String get rewriteNotice2;

  /// No description provided for @rewriteNotice3.
  ///
  /// In tr, this message translates to:
  /// **'• İşlem önceki etikete sessizce yazmaz; yeni bir NFC dokunuşu beklenir.'**
  String get rewriteNotice3;

  /// No description provided for @rewriteInstruction.
  ///
  /// In tr, this message translates to:
  /// **'Hedef etiketi hazırlayın ve \"Dokun ve Yaz\" butonuna bastıktan sonra etiketi telefonun arkasına yaklaştırın.'**
  String get rewriteInstruction;

  /// No description provided for @tapAndWrite.
  ///
  /// In tr, this message translates to:
  /// **'Dokun ve Yaz'**
  String get tapAndWrite;

  /// No description provided for @rewritePromptMessage.
  ///
  /// In tr, this message translates to:
  /// **'Hedef etiketi cihazınıza yaklaştırın (İçerik tamamen yenilenecektir)'**
  String get rewritePromptMessage;

  /// No description provided for @writeVerifiedTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yazma Doğrulandı'**
  String get writeVerifiedTitle;

  /// No description provided for @writeVerifiedDesc.
  ///
  /// In tr, this message translates to:
  /// **'NDEF içeriği hedef etikete başarıyla yazıldı ve doğrulandı.'**
  String get writeVerifiedDesc;

  /// No description provided for @writeVerifiedHint.
  ///
  /// In tr, this message translates to:
  /// **'Yazılan veriyi doğrulamak veya karşılaştırmak için sonraki taramayı başlatabilirsiniz.'**
  String get writeVerifiedHint;

  /// No description provided for @scanAndCompareNow.
  ///
  /// In tr, this message translates to:
  /// **'Şimdi Tara ve Karşılaştır'**
  String get scanAndCompareNow;

  /// No description provided for @contentMatchesExactly.
  ///
  /// In tr, this message translates to:
  /// **'İçerik Birebir Eşleşiyor'**
  String get contentMatchesExactly;

  /// No description provided for @differenceDetected.
  ///
  /// In tr, this message translates to:
  /// **'Farklılık Tespit Edildi'**
  String get differenceDetected;

  /// No description provided for @compareMatchDesc.
  ///
  /// In tr, this message translates to:
  /// **'Hedef etiketteki NDEF mesajı ile yazılan kaynak NDEF mesajı bayt bayt tamamen aynıdır.'**
  String get compareMatchDesc;

  /// No description provided for @compareDiffDesc.
  ///
  /// In tr, this message translates to:
  /// **'Hedef etiketten okunan veriler ile yazılmak istenen veri arasında farklılık var. Etiketin kilitli veya farklı bir etiket olup olmadığını kontrol ediniz.'**
  String get compareDiffDesc;

  /// No description provided for @batchEmptyComposerError.
  ///
  /// In tr, this message translates to:
  /// **'Toplu yazım başlatmak için önce beste sekmesine en az bir kayıt ekleyiniz.'**
  String get batchEmptyComposerError;

  /// No description provided for @batchWriteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Toplu Etiket Yazımı (Batch)'**
  String get batchWriteTitle;

  /// No description provided for @batchWriteSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Aynı NDEF içeriğini birden fazla etikete sırayla yazabilirsiniz.'**
  String get batchWriteSubtitle;

  /// No description provided for @attention.
  ///
  /// In tr, this message translates to:
  /// **'DİKKAT:'**
  String get attention;

  /// No description provided for @batchNotice1.
  ///
  /// In tr, this message translates to:
  /// **'• Yanlışlıkla aynı etikete iki kez yazılmasını engellemek için her yazım kullanıcı tarafından açıkça \"Sıradakini Yaz\" butonu ile başlatılır.\n'**
  String get batchNotice1;

  /// No description provided for @batchNotice2.
  ///
  /// In tr, this message translates to:
  /// **'• Otomatik arka arkaya tarama yapılmaz; her etiket fiziksel olarak değiştirilmelidir.'**
  String get batchNotice2;

  /// No description provided for @batchStartButton.
  ///
  /// In tr, this message translates to:
  /// **'Toplu Yazımı Başlat'**
  String get batchStartButton;

  /// No description provided for @batchControlPanelTitle.
  ///
  /// In tr, this message translates to:
  /// **'Toplu Yazım Kontrol Paneli'**
  String get batchControlPanelTitle;

  /// No description provided for @batchCancelOrClose.
  ///
  /// In tr, this message translates to:
  /// **'İptal Et / Kapat'**
  String get batchCancelOrClose;

  /// No description provided for @batchAllCompleted.
  ///
  /// In tr, this message translates to:
  /// **'Tüm etiket denemeleri tamamlandı!'**
  String get batchAllCompleted;

  /// No description provided for @batchStats.
  ///
  /// In tr, this message translates to:
  /// **'Başarılı: {ok} | Hatalı: {failed} | Kalan: {left}'**
  String batchStats(String ok, String failed, String left);

  /// No description provided for @waitingForTag.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Bekleniyor...'**
  String get waitingForTag;

  /// No description provided for @batchFinishButton.
  ///
  /// In tr, this message translates to:
  /// **'Toplu Yazımı Bitir'**
  String get batchFinishButton;

  /// No description provided for @writeError.
  ///
  /// In tr, this message translates to:
  /// **'Yazma hatası'**
  String get writeError;

  /// No description provided for @batchConfirmCancelTitle.
  ///
  /// In tr, this message translates to:
  /// **'Toplu Yazımı İptal Et'**
  String get batchConfirmCancelTitle;

  /// No description provided for @batchConfirmCancelMessage.
  ///
  /// In tr, this message translates to:
  /// **'Toplu yazım oturumu sonlandırılsın mı? Şimdiye kadar yazılmış olan etiketlerdeki veriler korunur; kalan etiketler yazılmaz.'**
  String get batchConfirmCancelMessage;

  /// No description provided for @cancelled.
  ///
  /// In tr, this message translates to:
  /// **'İptal edildi'**
  String get cancelled;

  /// No description provided for @batchCancelledSnack.
  ///
  /// In tr, this message translates to:
  /// **'Toplu yazım işlemi iptal edildi. Besteniz korundu.'**
  String get batchCancelledSnack;

  /// No description provided for @cancelAndClose.
  ///
  /// In tr, this message translates to:
  /// **'İptal Et ve Kapat'**
  String get cancelAndClose;

  /// No description provided for @urlSafetyOfflineAnalysisTitle.
  ///
  /// In tr, this message translates to:
  /// **'Çevrimdışı URL İncelemesi'**
  String get urlSafetyOfflineAnalysisTitle;

  /// No description provided for @urlSafetyScheme.
  ///
  /// In tr, this message translates to:
  /// **'Şema (Protokol):'**
  String get urlSafetyScheme;

  /// No description provided for @urlSafetyPort.
  ///
  /// In tr, this message translates to:
  /// **'Bağlantı Noktası (Port):'**
  String get urlSafetyPort;

  /// No description provided for @urlSafetyUserInfoLabel.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı Bilgisi (UserInfo):'**
  String get urlSafetyUserInfoLabel;

  /// No description provided for @urlSafetyIpLiteral.
  ///
  /// In tr, this message translates to:
  /// **'Doğrudan IP Adresi (IP Literal):'**
  String get urlSafetyIpLiteral;

  /// No description provided for @urlSafetyDomain.
  ///
  /// In tr, this message translates to:
  /// **'Hayır (Alan adı)'**
  String get urlSafetyDomain;

  /// No description provided for @urlSafetyPunycodeLabel.
  ///
  /// In tr, this message translates to:
  /// **'Uluslararası / Punycode (xn--):'**
  String get urlSafetyPunycodeLabel;

  /// No description provided for @urlSafetyHomoglyphRisk.
  ///
  /// In tr, this message translates to:
  /// **'Evet (Homoglif şüphesi)'**
  String get urlSafetyHomoglyphRisk;

  /// No description provided for @urlSafetyWarningsHeader.
  ///
  /// In tr, this message translates to:
  /// **'Güvenlik / Dikkat Uyarıları:'**
  String get urlSafetyWarningsHeader;

  /// No description provided for @urlSafetyDisclaimer.
  ///
  /// In tr, this message translates to:
  /// **'NOT: Bu analiz tamamen yerel/çevrimdışı kurallarla yapılmıştır. Ağ üzerinden zararlı yazılım veya antivirüs kontrolü iddiasında bulunmaz. URL otomatik olarak açılmaz.'**
  String get urlSafetyDisclaimer;

  /// No description provided for @templateSaveEmptyError.
  ///
  /// In tr, this message translates to:
  /// **'Şablon olarak kaydetmek için önce kayıt ekleyiniz.'**
  String get templateSaveEmptyError;

  /// No description provided for @templateDefaultName.
  ///
  /// In tr, this message translates to:
  /// **'Şablon {n}'**
  String templateDefaultName(String n);

  /// No description provided for @templateNameSample.
  ///
  /// In tr, this message translates to:
  /// **'Örn: Şirket Web Sitesi & İletişim'**
  String get templateNameSample;

  /// No description provided for @templateSavedSnack.
  ///
  /// In tr, this message translates to:
  /// **'Şablon kaydedildi.'**
  String get templateSavedSnack;

  /// No description provided for @ruleNoteRequiresNdef.
  ///
  /// In tr, this message translates to:
  /// **'Not eklemek için etikette en az bir NDEF kaydı bulunmalıdır.'**
  String get ruleNoteRequiresNdef;

  /// No description provided for @ruleNoteAddTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etikete Özel Not Ekle'**
  String get ruleNoteAddTitle;

  /// No description provided for @ruleNoteDigestExplanation.
  ///
  /// In tr, this message translates to:
  /// **'Bu not, etiketin NDEF içerik SHA-256 özetine bağlanır. Etiket tekrar tarandığında sadece bu açıklama gösterilir; harici eylem başlatmaz veya sistem ayarlarını değiştirmez.'**
  String get ruleNoteDigestExplanation;

  /// No description provided for @ruleNoteSavedSnack.
  ///
  /// In tr, this message translates to:
  /// **'Etiket notu kaydedildi.'**
  String get ruleNoteSavedSnack;

  /// No description provided for @ruleNoteDeleteConfirm.
  ///
  /// In tr, this message translates to:
  /// **'Bu etikete ait kayıtlı uygulama içi not silinecektir. Devam edilsin mi?'**
  String get ruleNoteDeleteConfirm;

  /// No description provided for @ruleNoteDeletedSnack.
  ///
  /// In tr, this message translates to:
  /// **'Etiket notu silindi.'**
  String get ruleNoteDeletedSnack;

  /// No description provided for @backupExportTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yedek Dışa Aktar'**
  String get backupExportTitle;

  /// No description provided for @backupExportWarningTitle.
  ///
  /// In tr, this message translates to:
  /// **'GİZLİLİK VE GÜVENLİK UYARISI'**
  String get backupExportWarningTitle;

  /// No description provided for @backupExportWarningBody.
  ///
  /// In tr, this message translates to:
  /// **'Dışa aktarılan yedek dosyası (JSON) düz metin biçimindedir. Kayıtlarınız içerisinde Wi-Fi parolaları, iletişim (vCard) veya e-posta gibi hassas veriler bulunabilir. Dosyayı güvenli bir konumda saklayınız ve üçüncü şahıslarla paylaşırken dikkatli olunuz.'**
  String get backupExportWarningBody;

  /// No description provided for @backupIncludedItems.
  ///
  /// In tr, this message translates to:
  /// **'Dahil Edilecek Öğeler:'**
  String get backupIncludedItems;

  /// No description provided for @backupTemplatesCount.
  ///
  /// In tr, this message translates to:
  /// **'• Şablonlar: {count}'**
  String backupTemplatesCount(String count);

  /// No description provided for @backupRulesCount.
  ///
  /// In tr, this message translates to:
  /// **'• Uygulama içi etiket notları/kuralları: {count}'**
  String backupRulesCount(String count);

  /// No description provided for @backupIncludeHistoryOptional.
  ///
  /// In tr, this message translates to:
  /// **'Tarama Geçmişini Dahil Et (İsteğe Bağlı)'**
  String get backupIncludeHistoryOptional;

  /// No description provided for @backupHistoryCount.
  ///
  /// In tr, this message translates to:
  /// **'{count} geçmiş kaydı'**
  String backupHistoryCount(String count);

  /// No description provided for @backupHistoryDisabled.
  ///
  /// In tr, this message translates to:
  /// **'Tarama geçmişi bu cihazda kapalıdır'**
  String get backupHistoryDisabled;

  /// No description provided for @backupExportAndShare.
  ///
  /// In tr, this message translates to:
  /// **'Dışa Aktar ve Paylaş'**
  String get backupExportAndShare;

  /// No description provided for @backupFileNameLabel.
  ///
  /// In tr, this message translates to:
  /// **'NFC Etiket Yöneticisi Yedek Dosyası'**
  String get backupFileNameLabel;

  /// No description provided for @backupFileShareSubject.
  ///
  /// In tr, this message translates to:
  /// **'NFC Etiket Yöneticisi şablon ve veri yedeği (JSON)'**
  String get backupFileShareSubject;

  /// No description provided for @backupExportSuccessSnack.
  ///
  /// In tr, this message translates to:
  /// **'Yedek dosyası başarıyla dışa aktarıldı ve paylaşıldı.'**
  String get backupExportSuccessSnack;

  /// No description provided for @backupExportCancelled.
  ///
  /// In tr, this message translates to:
  /// **'Dışa aktarma paylaşımı iptal edildi.'**
  String get backupExportCancelled;

  /// No description provided for @backupImportTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yedek İçe Aktar'**
  String get backupImportTitle;

  /// No description provided for @backupMergeRuleTitle.
  ///
  /// In tr, this message translates to:
  /// **'GÜVENLİK VE BİRLEŞTİRME KURALI'**
  String get backupMergeRuleTitle;

  /// No description provided for @backupMergeRule1.
  ///
  /// In tr, this message translates to:
  /// **'• İçe aktarma BİRLEŞTİRME (merge) mantığıyla çalışır; mevcut kayıtlarınız ASLA silinmez.\n'**
  String get backupMergeRule1;

  /// No description provided for @backupMergeRule2.
  ///
  /// In tr, this message translates to:
  /// **'• Yedek dosyasında Wi-Fi parolaları veya kişisel veriler bulunabilir; yalnızca güvendiğiniz kaynaklardan gelen yedekleri yükleyiniz.\n'**
  String get backupMergeRule2;

  /// No description provided for @backupMergeRule3.
  ///
  /// In tr, this message translates to:
  /// **'• Dosya boyutu sınırı: 2 MiB. Veriler yüklenmeden önce katı şema ve Base64 doğrulamasına tabi tutulur.'**
  String get backupMergeRule3;

  /// No description provided for @backupSelectFilePrompt.
  ///
  /// In tr, this message translates to:
  /// **'Birleştirmek istediğiniz geçerli bir .json yedek dosyasını seçiniz.'**
  String get backupSelectFilePrompt;

  /// No description provided for @selectFileButton.
  ///
  /// In tr, this message translates to:
  /// **'Dosya Seç'**
  String get selectFileButton;

  /// No description provided for @fileSelectionCancelled.
  ///
  /// In tr, this message translates to:
  /// **'Dosya seçimi iptal edildi.'**
  String get fileSelectionCancelled;

  /// No description provided for @backupFileExceedsLimit.
  ///
  /// In tr, this message translates to:
  /// **'Seçilen dosya izin verilen 2 MiB sınırını aşıyor.'**
  String get backupFileExceedsLimit;

  /// No description provided for @fileReadError.
  ///
  /// In tr, this message translates to:
  /// **'Dosya okuma hatası: {error}'**
  String fileReadError(String error);

  /// No description provided for @backupValidationError.
  ///
  /// In tr, this message translates to:
  /// **'Yedek doğrulama hatası: {error}'**
  String backupValidationError(String error);

  /// No description provided for @backupHistoryDetectedTitle.
  ///
  /// In tr, this message translates to:
  /// **'Tarama Geçmişi Algılandı'**
  String get backupHistoryDetectedTitle;

  /// No description provided for @backupHistoryDetectedPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Geçmişi de içe aktarıp tarama geçmişini etkinleştirmek istiyor musunuz? Yoksa geçmiş kayıtları atlanıp yalnızca şablonlar ve etiket notları mı içe aktarılsın?'**
  String get backupHistoryDetectedPrompt;

  /// No description provided for @backupSkipHistoryOption.
  ///
  /// In tr, this message translates to:
  /// **'Geçmişi Atla (Yalnızca Şablon ve Notları Yükle)'**
  String get backupSkipHistoryOption;

  /// No description provided for @backupEnableHistoryOption.
  ///
  /// In tr, this message translates to:
  /// **'Geçmişi Etkinleştir ve Yükle'**
  String get backupEnableHistoryOption;

  /// No description provided for @nfcReadyStatus.
  ///
  /// In tr, this message translates to:
  /// **'NFC Hazır'**
  String get nfcReadyStatus;

  /// No description provided for @nfcReadyDesc.
  ///
  /// In tr, this message translates to:
  /// **'NFC donanımı aktif ve kullanıma hazır'**
  String get nfcReadyDesc;

  /// No description provided for @nfcDisabledStatus.
  ///
  /// In tr, this message translates to:
  /// **'NFC Kapalı'**
  String get nfcDisabledStatus;

  /// No description provided for @nfcDisabledDesc.
  ///
  /// In tr, this message translates to:
  /// **'NFC kapalı. Lütfen cihaz ayarlarından açın.'**
  String get nfcDisabledDesc;

  /// No description provided for @template.
  ///
  /// In tr, this message translates to:
  /// **'Şablon'**
  String get template;

  /// No description provided for @nfcScannerTitle.
  ///
  /// In tr, this message translates to:
  /// **'NFC Tarayıcı'**
  String get nfcScannerTitle;

  /// No description provided for @composeRecord.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt oluştur'**
  String get composeRecord;

  /// No description provided for @protectOrRemove.
  ///
  /// In tr, this message translates to:
  /// **'Koru / kaldır'**
  String get protectOrRemove;

  /// No description provided for @previousScans.
  ///
  /// In tr, this message translates to:
  /// **'Önceki taramalar'**
  String get previousScans;

  /// No description provided for @noScannedTagYet.
  ///
  /// In tr, this message translates to:
  /// **'Henüz taranmış bir NFC etiketi yok'**
  String get noScannedTagYet;

  /// No description provided for @tapScanPrompt.
  ///
  /// In tr, this message translates to:
  /// **'\"Taramayı Başlat\" butonuna dokunun ve etiketi telefona yaklaştırın.'**
  String get tapScanPrompt;

  /// No description provided for @ndefCopyAndRewriteTitle.
  ///
  /// In tr, this message translates to:
  /// **'NDEF İçerik Kopyalama ve Yeniden Yazım'**
  String get ndefCopyAndRewriteTitle;

  /// No description provided for @savedTagNoteHeader.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı Etiket Notu (Uygulama İçi Kural)'**
  String get savedTagNoteHeader;

  /// No description provided for @tagNoteOrRule.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Notu / Kuralı'**
  String get tagNoteOrRule;

  /// No description provided for @editNote.
  ///
  /// In tr, this message translates to:
  /// **'Notu Düzenle'**
  String get editNote;

  /// No description provided for @deleteNote.
  ///
  /// In tr, this message translates to:
  /// **'Notu Sil'**
  String get deleteNote;

  /// No description provided for @tagNoteDigestNotice.
  ///
  /// In tr, this message translates to:
  /// **'Bu not tam NDEF baytlarının SHA-256 özetiyle eşleştirilmiştir. Harici işlem başlatmaz.'**
  String get tagNoteDigestNotice;

  /// No description provided for @addCustomTagNotePrompt.
  ///
  /// In tr, this message translates to:
  /// **'Bu NDEF içeriğine özel yerel bir not veya açıklama ekleyebilirsiniz.'**
  String get addCustomTagNotePrompt;

  /// No description provided for @addNoteToThisTag.
  ///
  /// In tr, this message translates to:
  /// **'Bu Etikete Not Ekle'**
  String get addNoteToThisTag;

  /// No description provided for @ndefSupport.
  ///
  /// In tr, this message translates to:
  /// **'NDEF Desteği:'**
  String get ndefSupport;

  /// No description provided for @usedSpace.
  ///
  /// In tr, this message translates to:
  /// **'Kullanılan Alan:'**
  String get usedSpace;

  /// No description provided for @freeSpace.
  ///
  /// In tr, this message translates to:
  /// **'Boş Alan:'**
  String get freeSpace;

  /// No description provided for @noNdefMessageOnTag.
  ///
  /// In tr, this message translates to:
  /// **'Etikette kayıtlı NDEF mesajı bulunamadı.'**
  String get noNdefMessageOnTag;

  /// No description provided for @hideDetails.
  ///
  /// In tr, this message translates to:
  /// **'Ayrıntıları Gizle'**
  String get hideDetails;

  /// No description provided for @advancedRecordInspector.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt Denetçisi (Gelişmiş)'**
  String get advancedRecordInspector;

  /// No description provided for @ndefRecordInspectorTitle.
  ///
  /// In tr, this message translates to:
  /// **'Gelişmiş Kayıt Denetçisi (NDEF Record Inspector)'**
  String get ndefRecordInspectorTitle;

  /// No description provided for @inspectorType.
  ///
  /// In tr, this message translates to:
  /// **'Tür (Type):'**
  String get inspectorType;

  /// No description provided for @inspectorPayloadLength.
  ///
  /// In tr, this message translates to:
  /// **'Yük Uzunluğu (Payload):'**
  String get inspectorPayloadLength;

  /// No description provided for @inspectorRawHexPreview.
  ///
  /// In tr, this message translates to:
  /// **'Ham Hex Önizleme (Sınırlandırılmış):'**
  String get inspectorRawHexPreview;

  /// No description provided for @ndefRecordsToWriteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yazılacak NDEF Kayıtları'**
  String get ndefRecordsToWriteTitle;

  /// No description provided for @pasteFromClipboardAction.
  ///
  /// In tr, this message translates to:
  /// **'Panodan Yapıştır (Değiştir / Ekle)'**
  String get pasteFromClipboardAction;

  /// No description provided for @importAction.
  ///
  /// In tr, this message translates to:
  /// **'İçe Aktar'**
  String get importAction;

  /// No description provided for @importFromTagAction.
  ///
  /// In tr, this message translates to:
  /// **'NFC etiketten içe aktar'**
  String get importFromTagAction;

  /// No description provided for @importFromQrAction.
  ///
  /// In tr, this message translates to:
  /// **'QR koddan içe aktar'**
  String get importFromQrAction;

  /// No description provided for @importFromCsvAction.
  ///
  /// In tr, this message translates to:
  /// **'CSV dosyasından içe aktar'**
  String get importFromCsvAction;

  /// No description provided for @composerEmptyDescription.
  ///
  /// In tr, this message translates to:
  /// **'Etikete metin, web adresi, Wi-Fi, telefon, e-posta, kişi kartı ve daha fazlasını yazabilirsiniz.'**
  String get composerEmptyDescription;

  /// No description provided for @urlSafetyReview.
  ///
  /// In tr, this message translates to:
  /// **'URL İncelemesi'**
  String get urlSafetyReview;

  /// No description provided for @inspector.
  ///
  /// In tr, this message translates to:
  /// **'Denetçi'**
  String get inspector;

  /// No description provided for @typeLabel.
  ///
  /// In tr, this message translates to:
  /// **'Tür:'**
  String get typeLabel;

  /// No description provided for @payloadLabel.
  ///
  /// In tr, this message translates to:
  /// **'Yük:'**
  String get payloadLabel;

  /// No description provided for @writeAndVerify.
  ///
  /// In tr, this message translates to:
  /// **'Etikete Yaz ve Doğrula'**
  String get writeAndVerify;

  /// No description provided for @batchWriteButtonLabel.
  ///
  /// In tr, this message translates to:
  /// **'Toplu Etiket Yazımı (2..100 Etiket)'**
  String get batchWriteButtonLabel;

  /// No description provided for @clearTagButtonLabel.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Sıfırla (İçeriği Temizle)'**
  String get clearTagButtonLabel;

  /// No description provided for @confirmWriteTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etikete Yazmayı Onayla'**
  String get confirmWriteTitle;

  /// No description provided for @confirmWriteMessage1.
  ///
  /// In tr, this message translates to:
  /// **'Bu işlem hedef etiketin mevcut NDEF içeriğini tamamen DEĞİŞTİRİR (üzerine yazar).'**
  String get confirmWriteMessage1;

  /// No description provided for @confirmWriteMessage2.
  ///
  /// In tr, this message translates to:
  /// **'Hedef etiketin yazılabilir (kilitsiz) olduğundan emin olun. Yazdıktan sonra etiket içeriği otomatik olarak doğrulanacaktır.'**
  String get confirmWriteMessage2;

  /// No description provided for @yesWrite.
  ///
  /// In tr, this message translates to:
  /// **'Evet, Yaz'**
  String get yesWrite;

  /// No description provided for @scanHistoryDisabledTitle.
  ///
  /// In tr, this message translates to:
  /// **'Tarama Geçmişi Kapalı'**
  String get scanHistoryDisabledTitle;

  /// No description provided for @scanHistoryDisabledDesc.
  ///
  /// In tr, this message translates to:
  /// **'Gizlilik nedeniyle tarama geçmişi varsayılan olarak kaydedilmez. Geçmişi tutmak için ayarlar sekmesinden etkinleştirebilirsiniz.'**
  String get scanHistoryDisabledDesc;

  /// No description provided for @enableHistory.
  ///
  /// In tr, this message translates to:
  /// **'Geçmişi Etkinleştir'**
  String get enableHistory;

  /// No description provided for @historySearchHint.
  ///
  /// In tr, this message translates to:
  /// **'UID, metin veya tür ile ara (Örn: URL, Wi-Fi, 04A1...)'**
  String get historySearchHint;

  /// No description provided for @noHistoryYet.
  ///
  /// In tr, this message translates to:
  /// **'Henüz kayıtlı tarama geçmişi bulunmuyor.'**
  String get noHistoryYet;

  /// No description provided for @tryDifferentQuery.
  ///
  /// In tr, this message translates to:
  /// **'Farklı bir UID, metin içeriği veya kayıt türü deneyiniz.'**
  String get tryDifferentQuery;

  /// No description provided for @clearSearch.
  ///
  /// In tr, this message translates to:
  /// **'Aramayı Temizle'**
  String get clearSearch;

  /// No description provided for @deleteThisRecord.
  ///
  /// In tr, this message translates to:
  /// **'Bu kaydı sil'**
  String get deleteThisRecord;

  /// No description provided for @qrPreview.
  ///
  /// In tr, this message translates to:
  /// **'QR Önizleme'**
  String get qrPreview;

  /// No description provided for @lockTagConfirmTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Kalıcı Olarak Kilitle'**
  String get lockTagConfirmTitle;

  /// No description provided for @lockTagWarning2.
  ///
  /// In tr, this message translates to:
  /// **'Önce doğru içeriği yazdığınızdan emin olun.'**
  String get lockTagWarning2;

  /// No description provided for @langTr.
  ///
  /// In tr, this message translates to:
  /// **'Türkçe'**
  String get langTr;

  /// No description provided for @langFr.
  ///
  /// In tr, this message translates to:
  /// **'Français'**
  String get langFr;

  /// No description provided for @qrPreviewTooltip.
  ///
  /// In tr, this message translates to:
  /// **'QR Kod Önizleme'**
  String get qrPreviewTooltip;

  /// No description provided for @unknownParentheses.
  ///
  /// In tr, this message translates to:
  /// **'(Bilinmiyor)'**
  String get unknownParentheses;

  /// No description provided for @ok.
  ///
  /// In tr, this message translates to:
  /// **'Tamam'**
  String get ok;

  /// No description provided for @rewriteSourceUid.
  ///
  /// In tr, this message translates to:
  /// **'Kaynak UID: {uid}'**
  String rewriteSourceUid(String uid);

  /// No description provided for @recordsToWriteCount.
  ///
  /// In tr, this message translates to:
  /// **'Yazılacak kayıt: {count}'**
  String recordsToWriteCount(String count);

  /// No description provided for @rewriteFailed.
  ///
  /// In tr, this message translates to:
  /// **'Yeniden yazma başarısız: {message}'**
  String rewriteFailed(String message);

  /// No description provided for @writtenRecordsCount.
  ///
  /// In tr, this message translates to:
  /// **'Yazılan kayıt: {count}'**
  String writtenRecordsCount(String count);

  /// No description provided for @scannedTagUid.
  ///
  /// In tr, this message translates to:
  /// **'Taranan etiket UID: {uid}'**
  String scannedTagUid(String uid);

  /// No description provided for @writtenDataSummary.
  ///
  /// In tr, this message translates to:
  /// **'Yazılan veri: {count} kayıt ({bytes} bayt)'**
  String writtenDataSummary(String count, String bytes);

  /// No description provided for @scannedDataSummary.
  ///
  /// In tr, this message translates to:
  /// **'Taranan veri: {count} kayıt ({bytes} bayt)'**
  String scannedDataSummary(String count, String bytes);

  /// No description provided for @batchTargetCount.
  ///
  /// In tr, this message translates to:
  /// **'Hedef etiket sayısı: {count}'**
  String batchTargetCount(String count);

  /// No description provided for @composerRecordsSummary.
  ///
  /// In tr, this message translates to:
  /// **'Yazma listesi: {count} kayıt ({bytes} bayt)'**
  String composerRecordsSummary(String count, String bytes);

  /// No description provided for @batchNext.
  ///
  /// In tr, this message translates to:
  /// **'Sıradaki: Etiket #{current} / {total}'**
  String batchNext(String current, String total);

  /// No description provided for @batchAttemptOk.
  ///
  /// In tr, this message translates to:
  /// **'Başarılı ({message})'**
  String batchAttemptOk(String message);

  /// No description provided for @batchAttemptFailed.
  ///
  /// In tr, this message translates to:
  /// **'Başarısız: {message}'**
  String batchAttemptFailed(String message);

  /// No description provided for @batchAttemptLabel.
  ///
  /// In tr, this message translates to:
  /// **'Etiket #{n}: '**
  String batchAttemptLabel(String n);

  /// No description provided for @batchTapToWrite.
  ///
  /// In tr, this message translates to:
  /// **'Etiket #{n} için dokun ve yaz'**
  String batchTapToWrite(String n);

  /// No description provided for @batchPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Toplu yazım: #{current} / {total} etiketi cihaza yaklaştırın'**
  String batchPrompt(String current, String total);

  /// No description provided for @batchWrittenVerified.
  ///
  /// In tr, this message translates to:
  /// **'{count} kayıt yazıldı ve doğrulandı'**
  String batchWrittenVerified(String count);

  /// No description provided for @templateLoaded.
  ///
  /// In tr, this message translates to:
  /// **'\"{name}\" şablonundaki kayıtlar yazma listesine aktarıldı.'**
  String templateLoaded(String name);

  /// No description provided for @ndefSha256Summary.
  ///
  /// In tr, this message translates to:
  /// **'NDEF içerik özeti (SHA-256):\n{sha}'**
  String ndefSha256Summary(String sha);

  /// No description provided for @exportError.
  ///
  /// In tr, this message translates to:
  /// **'Dışa aktarma hatası: {error}'**
  String exportError(String error);

  /// No description provided for @backupHistoryDetected.
  ///
  /// In tr, this message translates to:
  /// **'Yedek dosyasında {count} tarama geçmişi kaydı var, ancak bu cihazda tarama geçmişi kapalı.\n\n{prompt}'**
  String backupHistoryDetected(String count, String prompt);

  /// No description provided for @importSucceeded.
  ///
  /// In tr, this message translates to:
  /// **'İçe aktarma başarılı:\n{summary}'**
  String importSucceeded(String summary);

  /// No description provided for @mergeError.
  ///
  /// In tr, this message translates to:
  /// **'Birleştirme hatası: {error}'**
  String mergeError(String error);

  /// No description provided for @clipboardBannerText.
  ///
  /// In tr, this message translates to:
  /// **'NDEF panosu: {count} kayıt ({bytes} B) - {source}'**
  String clipboardBannerText(String count, String bytes, String source);

  /// No description provided for @heroScanSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi telefonun üst kısmına yaklaştırın; içerik, kapasite ve seri numarası anında görünür.'**
  String get heroScanSubtitle;

  /// No description provided for @lastTagLabel.
  ///
  /// In tr, this message translates to:
  /// **'Son etiket: {uid}'**
  String lastTagLabel(String uid);

  /// No description provided for @scanErrorWithMessage.
  ///
  /// In tr, this message translates to:
  /// **'Tarama hatası: {message}'**
  String scanErrorWithMessage(String message);

  /// No description provided for @copyContentSummary.
  ///
  /// In tr, this message translates to:
  /// **'{count} kayıt ({bytes} bayt) - Yalnızca NDEF verisi işlenir, UID kopyalanmaz.'**
  String copyContentSummary(String count, String bytes);

  /// No description provided for @tagSourceLabel.
  ///
  /// In tr, this message translates to:
  /// **'Etiket {uid}'**
  String tagSourceLabel(String uid);

  /// No description provided for @errorWithMessage.
  ///
  /// In tr, this message translates to:
  /// **'Hata: {message}'**
  String errorWithMessage(String message);

  /// No description provided for @readRecordsHeader.
  ///
  /// In tr, this message translates to:
  /// **'Okunan NDEF kayıtları ({count})'**
  String readRecordsHeader(String count);

  /// No description provided for @composedRecordsHeader.
  ///
  /// In tr, this message translates to:
  /// **'Yazılacak NDEF kayıtları ({count})'**
  String composedRecordsHeader(String count);

  /// No description provided for @payloadTruncatedNote.
  ///
  /// In tr, this message translates to:
  /// **'Not: Yük {bytes} bayt olduğu için ilk 64 baytı gösteriliyor.'**
  String payloadTruncatedNote(String bytes);

  /// No description provided for @composerTotals.
  ///
  /// In tr, this message translates to:
  /// **'Toplam boyut: {bytes} bayt | Kayıt sayısı: {count}'**
  String composerTotals(String bytes, String count);

  /// No description provided for @writeAndVerifyWithSize.
  ///
  /// In tr, this message translates to:
  /// **'Etikete yaz ve doğrula ({bytes} bayt)'**
  String writeAndVerifyWithSize(String bytes);

  /// No description provided for @savedScansCount.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı taramalar: {count}'**
  String savedScansCount(String count);

  /// No description provided for @historyNoResults.
  ///
  /// In tr, this message translates to:
  /// **'\"{query}\" için sonuç bulunamadı.'**
  String historyNoResults(String query);

  /// No description provided for @historyItemMeta.
  ///
  /// In tr, this message translates to:
  /// **'{date} | {count} kayıt'**
  String historyItemMeta(String date, String count);

  /// No description provided for @historyCapacity.
  ///
  /// In tr, this message translates to:
  /// **'Kapasite: {max} B | Kullanılan: {used} B'**
  String historyCapacity(String max, String used);

  /// No description provided for @historySourceLabel.
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş UID {uid}'**
  String historySourceLabel(String uid);

  /// No description provided for @templateMeta.
  ///
  /// In tr, this message translates to:
  /// **'{count} kayıt | {date}'**
  String templateMeta(String count, String date);

  /// No description provided for @rulesCountLabel.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı kural / not sayısı: {count}'**
  String rulesCountLabel(String count);

  /// No description provided for @writeResultDetails.
  ///
  /// In tr, this message translates to:
  /// **'Yazılan bayt: {bytes} | Doğrulama: {verification}'**
  String writeResultDetails(String bytes, String verification);

  /// No description provided for @lockTagWarningFull.
  ///
  /// In tr, this message translates to:
  /// **'Kilitlenen etiket salt okunur olur: içeriği bir daha DEĞİŞTİRİLEMEZ, silinemez ve kilit KALDIRILAMAZ. {more}'**
  String lockTagWarningFull(String more);

  /// No description provided for @messageSizeBytes.
  ///
  /// In tr, this message translates to:
  /// **'Mesaj boyutu: {bytes} bayt'**
  String messageSizeBytes(String bytes);

  /// No description provided for @bytesShort.
  ///
  /// In tr, this message translates to:
  /// **'Bayt: {bytes} B'**
  String bytesShort(String bytes);

  /// No description provided for @bytesValue.
  ///
  /// In tr, this message translates to:
  /// **'{bytes} bayt'**
  String bytesValue(String bytes);

  /// No description provided for @bytesOfCapacity.
  ///
  /// In tr, this message translates to:
  /// **'{bytes} / {max} bayt'**
  String bytesOfCapacity(String bytes, String max);

  /// No description provided for @valueNone.
  ///
  /// In tr, this message translates to:
  /// **'Yok'**
  String get valueNone;

  /// No description provided for @valueYesIp.
  ///
  /// In tr, this message translates to:
  /// **'Evet (IP adresi)'**
  String get valueYesIp;

  /// No description provided for @nfcMissingShort.
  ///
  /// In tr, this message translates to:
  /// **'NFC Yok'**
  String get nfcMissingShort;

  /// No description provided for @clearClipboard.
  ///
  /// In tr, this message translates to:
  /// **'Panoyu temizle'**
  String get clearClipboard;

  /// No description provided for @statLibrary.
  ///
  /// In tr, this message translates to:
  /// **'Kütüphane'**
  String get statLibrary;

  /// No description provided for @scanTagTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Tara'**
  String get scanTagTitle;

  /// No description provided for @readingInProgress.
  ///
  /// In tr, this message translates to:
  /// **'Okunuyor...'**
  String get readingInProgress;

  /// No description provided for @rawMemorySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Ham bellek'**
  String get rawMemorySubtitle;

  /// No description provided for @copyToClipboard.
  ///
  /// In tr, this message translates to:
  /// **'Panoya kopyala'**
  String get copyToClipboard;

  /// No description provided for @serialUidLabel.
  ///
  /// In tr, this message translates to:
  /// **'Seri No (UID):'**
  String get serialUidLabel;

  /// No description provided for @totalCapacityLabel.
  ///
  /// In tr, this message translates to:
  /// **'Toplam kapasite:'**
  String get totalCapacityLabel;

  /// No description provided for @technologiesLabel.
  ///
  /// In tr, this message translates to:
  /// **'Teknolojiler:'**
  String get technologiesLabel;

  /// No description provided for @idLabel.
  ///
  /// In tr, this message translates to:
  /// **'Kimlik (ID):'**
  String get idLabel;

  /// No description provided for @undoTooltip.
  ///
  /// In tr, this message translates to:
  /// **'Geri al'**
  String get undoTooltip;

  /// No description provided for @clearComposer.
  ///
  /// In tr, this message translates to:
  /// **'Listeyi temizle'**
  String get clearComposer;

  /// No description provided for @composerTotalSize.
  ///
  /// In tr, this message translates to:
  /// **'Toplam boyut: {bytes} bayt'**
  String composerTotalSize(String bytes);

  /// No description provided for @yesClear.
  ///
  /// In tr, this message translates to:
  /// **'Evet, temizle'**
  String get yesClear;

  /// No description provided for @ssidTooLong.
  ///
  /// In tr, this message translates to:
  /// **'SSID en fazla 32 bayt olabilir.'**
  String get ssidTooLong;

  /// No description provided for @locationPlace.
  ///
  /// In tr, this message translates to:
  /// **'Konum / Yer'**
  String get locationPlace;

  /// No description provided for @targetWebUrl.
  ///
  /// In tr, this message translates to:
  /// **'Hedef web URL *'**
  String get targetWebUrl;

  /// No description provided for @languageCodeLabel.
  ///
  /// In tr, this message translates to:
  /// **'Dil kodu (ISO 639-1) *'**
  String get languageCodeLabel;

  /// No description provided for @utf8Text.
  ///
  /// In tr, this message translates to:
  /// **'UTF-8 metin'**
  String get utf8Text;

  /// No description provided for @recordDebugSummary.
  ///
  /// In tr, this message translates to:
  /// **'TNF: {tnf}, boyut: {bytes} bayt'**
  String recordDebugSummary(String tnf, String bytes);

  /// No description provided for @quickGallerySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Tek dokunuşla hazır'**
  String get quickGallerySubtitle;

  /// No description provided for @quickLibraryTitle.
  ///
  /// In tr, this message translates to:
  /// **'Kütüphanem'**
  String get quickLibraryTitle;

  /// No description provided for @quickLibrarySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı etiketler'**
  String get quickLibrarySubtitle;

  /// No description provided for @saveToLibrary.
  ///
  /// In tr, this message translates to:
  /// **'Kütüphaneye kaydet'**
  String get saveToLibrary;

  /// No description provided for @libraryMatch.
  ///
  /// In tr, this message translates to:
  /// **'Kütüphanede: {name}'**
  String libraryMatch(String name);

  /// No description provided for @tagChipLabel.
  ///
  /// In tr, this message translates to:
  /// **'Çip: {chip}'**
  String tagChipLabel(String chip);

  /// No description provided for @tagManufacturerLabel.
  ///
  /// In tr, this message translates to:
  /// **'Üretici: {name}'**
  String tagManufacturerLabel(String name);

  /// No description provided for @settingsLibrarySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'İsim, not ve fotoğrafla kayıtlı etiketleriniz'**
  String get settingsLibrarySubtitle;

  /// No description provided for @showOnboardingAgain.
  ///
  /// In tr, this message translates to:
  /// **'Tanıtım rehberini tekrar göster'**
  String get showOnboardingAgain;

  /// No description provided for @importFromGallery.
  ///
  /// In tr, this message translates to:
  /// **'Hazır şablonlardan ekle'**
  String get importFromGallery;

  /// No description provided for @appearanceTitle.
  ///
  /// In tr, this message translates to:
  /// **'Görünüm'**
  String get appearanceTitle;

  /// No description provided for @themeSystem.
  ///
  /// In tr, this message translates to:
  /// **'Sistem'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In tr, this message translates to:
  /// **'Açık'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In tr, this message translates to:
  /// **'Koyu'**
  String get themeDark;

  /// No description provided for @valuePresentRisky.
  ///
  /// In tr, this message translates to:
  /// **'Var (riskli olabilir)'**
  String get valuePresentRisky;

  /// No description provided for @supportedValue.
  ///
  /// In tr, this message translates to:
  /// **'Destekleniyor'**
  String get supportedValue;

  /// No description provided for @notSupportedValue.
  ///
  /// In tr, this message translates to:
  /// **'Desteklenmiyor'**
  String get notSupportedValue;

  /// No description provided for @nfcUnsupportedDesc.
  ///
  /// In tr, this message translates to:
  /// **'Bu cihazda NFC desteklenmiyor'**
  String get nfcUnsupportedDesc;

  /// No description provided for @ndefTrailingData.
  ///
  /// In tr, this message translates to:
  /// **'NDEF sonunda fazladan veri var'**
  String get ndefTrailingData;

  /// No description provided for @ndefMissingEnd.
  ///
  /// In tr, this message translates to:
  /// **'NDEF mesaj sonu eksik'**
  String get ndefMissingEnd;

  /// No description provided for @vcardPhoneShort.
  ///
  /// In tr, this message translates to:
  /// **'Tel: {value}'**
  String vcardPhoneShort(String value);

  /// No description provided for @vcardEmailShort.
  ///
  /// In tr, this message translates to:
  /// **'E-posta: {value}'**
  String vcardEmailShort(String value);

  /// No description provided for @vcardOrgShort.
  ///
  /// In tr, this message translates to:
  /// **'Kurum: {value}'**
  String vcardOrgShort(String value);

  /// No description provided for @pageUidLock.
  ///
  /// In tr, this message translates to:
  /// **'UID / Kilit'**
  String get pageUidLock;

  /// No description provided for @pageData.
  ///
  /// In tr, this message translates to:
  /// **'Veri'**
  String get pageData;

  /// No description provided for @pageLock.
  ///
  /// In tr, this message translates to:
  /// **'Kilit'**
  String get pageLock;

  /// No description provided for @memoryPageLine.
  ///
  /// In tr, this message translates to:
  /// **'Sayfa {page}'**
  String memoryPageLine(String page);

  /// No description provided for @socialWhatsappPhone.
  ///
  /// In tr, this message translates to:
  /// **'WhatsApp (telefon)'**
  String get socialWhatsappPhone;

  /// No description provided for @mapApple.
  ///
  /// In tr, this message translates to:
  /// **'Apple Haritalar'**
  String get mapApple;

  /// No description provided for @mapGoogle.
  ///
  /// In tr, this message translates to:
  /// **'Google Haritalar'**
  String get mapGoogle;

  /// No description provided for @whatsappMessageHint.
  ///
  /// In tr, this message translates to:
  /// **'Merhaba, bilgi almak istiyorum'**
  String get whatsappMessageHint;

  /// No description provided for @facetimeTargetHint.
  ///
  /// In tr, this message translates to:
  /// **'+905551112233 veya ad@icloud.com'**
  String get facetimeTargetHint;

  /// No description provided for @bluetoothMacLabel.
  ///
  /// In tr, this message translates to:
  /// **'Bluetooth MAC adresi'**
  String get bluetoothMacLabel;

  /// No description provided for @webAddressUrlLabel.
  ///
  /// In tr, this message translates to:
  /// **'Web adresi (URL)'**
  String get webAddressUrlLabel;

  /// No description provided for @latitudeLabel.
  ///
  /// In tr, this message translates to:
  /// **'Enlem (Lat)'**
  String get latitudeLabel;

  /// No description provided for @longitudeLabel.
  ///
  /// In tr, this message translates to:
  /// **'Boylam (Lng)'**
  String get longitudeLabel;

  /// No description provided for @emailAddressLabel.
  ///
  /// In tr, this message translates to:
  /// **'E-posta adresi'**
  String get emailAddressLabel;

  /// No description provided for @websiteLabel.
  ///
  /// In tr, this message translates to:
  /// **'Web sitesi'**
  String get websiteLabel;

  /// No description provided for @wifiAuthWpa2Home.
  ///
  /// In tr, this message translates to:
  /// **'WPA2 Personal (ev/ofis standardı)'**
  String get wifiAuthWpa2Home;

  /// No description provided for @wifiAuthMixed.
  ///
  /// In tr, this message translates to:
  /// **'WPA/WPA2 Personal (karma)'**
  String get wifiAuthMixed;

  /// No description provided for @hostLabel.
  ///
  /// In tr, this message translates to:
  /// **'Sunucu / Host:'**
  String get hostLabel;

  /// No description provided for @readOnlyLocked.
  ///
  /// In tr, this message translates to:
  /// **'Salt okunur (kilitli)'**
  String get readOnlyLocked;

  /// No description provided for @redoTooltip.
  ///
  /// In tr, this message translates to:
  /// **'Yinele'**
  String get redoTooltip;

  /// No description provided for @historyFoundCount.
  ///
  /// In tr, this message translates to:
  /// **'Bulunan: {found} / {total}'**
  String historyFoundCount(String found, String total);

  /// No description provided for @addToWriteListShort.
  ///
  /// In tr, this message translates to:
  /// **'Yazma listesine aktar'**
  String get addToWriteListShort;

  /// No description provided for @mimeTypeHint.
  ///
  /// In tr, this message translates to:
  /// **'application/json veya text/plain'**
  String get mimeTypeHint;

  /// No description provided for @hapticsToggle.
  ///
  /// In tr, this message translates to:
  /// **'Titreşim'**
  String get hapticsToggle;

  /// No description provided for @hapticsToggleSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Okuma ve yazma bitince hafif titreşim'**
  String get hapticsToggleSubtitle;

  /// No description provided for @soundsToggle.
  ///
  /// In tr, this message translates to:
  /// **'Ses'**
  String get soundsToggle;

  /// No description provided for @soundsToggleSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Sonuçta kısa bir sistem sesi çal'**
  String get soundsToggleSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'en',
        'es',
        'fr',
        'it',
        'ja',
        'ko',
        'nl',
        'pt',
        'ru',
        'tr',
        'uk',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
