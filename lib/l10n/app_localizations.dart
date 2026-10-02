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

  /// No description provided for @addRule.
  ///
  /// In tr, this message translates to:
  /// **'Kural Ekle'**
  String get addRule;

  /// No description provided for @addTag.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Ekle'**
  String get addTag;

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

  /// No description provided for @allRulesCleared.
  ///
  /// In tr, this message translates to:
  /// **'Tüm kurallar silindi'**
  String get allRulesCleared;

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

  /// No description provided for @backupExportSuccess.
  ///
  /// In tr, this message translates to:
  /// **'Yedek dosyası başarıyla kaydedildi'**
  String get backupExportSuccess;

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

  /// No description provided for @backupImportFailed.
  ///
  /// In tr, this message translates to:
  /// **'Yedek içe aktarılamadı: {error}'**
  String backupImportFailed(String error);

  /// No description provided for @backupImportSuccess.
  ///
  /// In tr, this message translates to:
  /// **'Yedek başarıyla içe aktarıldı: {templates} şablon, {rules} kural, {history} geçmiş eklendi'**
  String backupImportSuccess(int history, int rules, int templates);

  /// No description provided for @backupInvalidBase64Id.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt kimliği geçerli Base64 verisi değil: {id}'**
  String backupInvalidBase64Id(String id);

  /// No description provided for @backupInvalidBase64Payload.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt yükü geçerli Base64 verisi değil: {payload}'**
  String backupInvalidBase64Payload(String payload);

  /// No description provided for @backupInvalidBase64Type.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt türü geçerli Base64 verisi değil: {type}'**
  String backupInvalidBase64Type(String type);

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

  /// No description provided for @backupInvalidTemplateCreatedAt.
  ///
  /// In tr, this message translates to:
  /// **'Şablon oluşturulma tarihi (createdAt) ISO-8601 olmalıdır: {date}'**
  String backupInvalidTemplateCreatedAt(String date);

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

  /// No description provided for @backupInvalidTnf.
  ///
  /// In tr, this message translates to:
  /// **'Geçersiz TNF değeri ({tnf}). 0-7 arasında bir tamsayı olmalıdır.'**
  String backupInvalidTnf(String tnf);

  /// No description provided for @backupMaxHistoryExceeded.
  ///
  /// In tr, this message translates to:
  /// **'Geçmiş kayıt sayısı izin verilen {max} sınırını aşıyor ({count}).'**
  String backupMaxHistoryExceeded(int count, int max);

  /// No description provided for @backupMaxRecordsExceeded.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt sayısı izin verilen {max} sınırını aşıyor ({count}).'**
  String backupMaxRecordsExceeded(int count, int max);

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

  /// No description provided for @backupRecordsMustBeList.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt listesi (records) bir dizi olmalıdır.'**
  String get backupRecordsMustBeList;

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

  /// No description provided for @batchWrite.
  ///
  /// In tr, this message translates to:
  /// **'Toplu Yazma'**
  String get batchWrite;

  /// No description provided for @bluetoothDeviceName.
  ///
  /// In tr, this message translates to:
  /// **'Cihaz Adı (İsteğe bağlı)'**
  String get bluetoothDeviceName;

  /// No description provided for @bluetoothMac.
  ///
  /// In tr, this message translates to:
  /// **'Bluetooth MAC Adresi'**
  String get bluetoothMac;

  /// No description provided for @bytesWrittenWithVerification.
  ///
  /// In tr, this message translates to:
  /// **'Yazılan Bayt: {bytes} | Doğrulama: {status}'**
  String bytesWrittenWithVerification(int bytes, String status);

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

  /// No description provided for @clearAllRulesConfirm.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtlı tüm uygulama içi etiket notları silinecektir. Onaylıyor musunuz?'**
  String get clearAllRulesConfirm;

  /// No description provided for @clearConfirmButton.
  ///
  /// In tr, this message translates to:
  /// **'Evet, Temizle'**
  String get clearConfirmButton;

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

  /// No description provided for @clearList.
  ///
  /// In tr, this message translates to:
  /// **'Listeyi Temizle'**
  String get clearList;

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

  /// No description provided for @clipboardBanner.
  ///
  /// In tr, this message translates to:
  /// **'{count, plural, =1{Panoda 1 kayıt hazır} other{Panoda {count} kayıt hazır}} ({bytes} B) · {source}'**
  String clipboardBanner(int bytes, int count, String source);

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

  /// No description provided for @composeRecordTitle.
  ///
  /// In tr, this message translates to:
  /// **'Yeni Kayıt Ekle'**
  String get composeRecordTitle;

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

  /// No description provided for @contactNote.
  ///
  /// In tr, this message translates to:
  /// **'Not'**
  String get contactNote;

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

  /// No description provided for @contentSummary.
  ///
  /// In tr, this message translates to:
  /// **'İçerik: {count, plural, =1{1 kayıt} other{{count} kayıt}} · {content}'**
  String contentSummary(String content, int count);

  /// No description provided for @copy.
  ///
  /// In tr, this message translates to:
  /// **'Kopyala'**
  String get copy;

  /// No description provided for @copyAllRecords.
  ///
  /// In tr, this message translates to:
  /// **'Tüm Kayıtları Kopyala'**
  String get copyAllRecords;

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

  /// No description provided for @deleteTagConfirmContent.
  ///
  /// In tr, this message translates to:
  /// **'\"{name}\" kütüphaneden silinsin mi? Fiziksel etiket değişmez.'**
  String deleteTagConfirmContent(String name);

  /// No description provided for @deleteTagConfirmTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Sil'**
  String get deleteTagConfirmTitle;

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

  /// No description provided for @editRule.
  ///
  /// In tr, this message translates to:
  /// **'Kuralı Düzenle'**
  String get editRule;

  /// No description provided for @editTag.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Düzenle'**
  String get editTag;

  /// No description provided for @emailBody.
  ///
  /// In tr, this message translates to:
  /// **'E-posta Metni'**
  String get emailBody;

  /// No description provided for @emailRecipient.
  ///
  /// In tr, this message translates to:
  /// **'Alıcı E-posta'**
  String get emailRecipient;

  /// No description provided for @emailSubject.
  ///
  /// In tr, this message translates to:
  /// **'Konu'**
  String get emailSubject;

  /// No description provided for @emptyComposerSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'\"Kayıt Ekle\" butonuna dokunarak Web URL, Metin, Wi-Fi, Kişi Kartı ve daha fazlasını oluşturun.'**
  String get emptyComposerSubtitle;

  /// No description provided for @emptyComposerTitle.
  ///
  /// In tr, this message translates to:
  /// **'Henüz kayıt eklenmedi'**
  String get emptyComposerTitle;

  /// No description provided for @emptyHistorySubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket taradığınızda geçmiş kayıtları burada listelenir.'**
  String get emptyHistorySubtitle;

  /// No description provided for @emptyHistoryTitle.
  ///
  /// In tr, this message translates to:
  /// **'Henüz tarama geçmişi yok'**
  String get emptyHistoryTitle;

  /// No description provided for @emptyLibrary.
  ///
  /// In tr, this message translates to:
  /// **'Henüz kayıtlı etiket yok.\nBir etiketi okuttuktan sonra buraya isim ve fotoğrafla kaydedin.'**
  String get emptyLibrary;

  /// No description provided for @eventDescription.
  ///
  /// In tr, this message translates to:
  /// **'Açıklama'**
  String get eventDescription;

  /// No description provided for @eventEnd.
  ///
  /// In tr, this message translates to:
  /// **'Bitiş Zamanı'**
  String get eventEnd;

  /// No description provided for @eventLocation.
  ///
  /// In tr, this message translates to:
  /// **'Konum / Yer'**
  String get eventLocation;

  /// No description provided for @eventStart.
  ///
  /// In tr, this message translates to:
  /// **'Başlangıç Zamanı'**
  String get eventStart;

  /// No description provided for @eventTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etkinlik Başlığı'**
  String get eventTitle;

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

  /// No description provided for @fieldTextPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Etikete yazılacak metin'**
  String get fieldTextPrompt;

  /// No description provided for @fieldUrlPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Web sitesi adresi (https://...)'**
  String get fieldUrlPrompt;

  /// No description provided for @fileUrl.
  ///
  /// In tr, this message translates to:
  /// **'Dosya Bağlantısı (URL)'**
  String get fileUrl;

  /// No description provided for @filterAll.
  ///
  /// In tr, this message translates to:
  /// **'Tümü'**
  String get filterAll;

  /// No description provided for @flashlight.
  ///
  /// In tr, this message translates to:
  /// **'Fener'**
  String get flashlight;

  /// No description provided for @formatConfirmButton.
  ///
  /// In tr, this message translates to:
  /// **'Biçimlendir'**
  String get formatConfirmButton;

  /// No description provided for @formatConfirmMessage.
  ///
  /// In tr, this message translates to:
  /// **'Etiketteki veriler silinir ve etiket boş bir NDEF etiketi olarak hazırlanır. Devam edilsin mi?'**
  String get formatConfirmMessage;

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

  /// No description provided for @hardwareAvailable.
  ///
  /// In tr, this message translates to:
  /// **'NFC Donanımı Hazır'**
  String get hardwareAvailable;

  /// No description provided for @hardwareDisabled.
  ///
  /// In tr, this message translates to:
  /// **'NFC Devre Dışı'**
  String get hardwareDisabled;

  /// No description provided for @hardwareNotSupported.
  ///
  /// In tr, this message translates to:
  /// **'NFC Desteklenmiyor'**
  String get hardwareNotSupported;

  /// No description provided for @historyFilteredEmpty.
  ///
  /// In tr, this message translates to:
  /// **'Aramayla eşleşen geçmiş kaydı bulunamadı.'**
  String get historyFilteredEmpty;

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

  /// No description provided for @importCsv.
  ///
  /// In tr, this message translates to:
  /// **'CSV İçe Aktar'**
  String get importCsv;

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

  /// No description provided for @latitude.
  ///
  /// In tr, this message translates to:
  /// **'Enlem (Lat)'**
  String get latitude;

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

  /// No description provided for @loadToComposerTooltip.
  ///
  /// In tr, this message translates to:
  /// **'Yazma Bestesine Aktar'**
  String get loadToComposerTooltip;

  /// No description provided for @locationHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: Buzdolabının kapağı'**
  String get locationHint;

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

  /// No description provided for @lockButton.
  ///
  /// In tr, this message translates to:
  /// **'Kilitle'**
  String get lockButton;

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

  /// No description provided for @lockWarning.
  ///
  /// In tr, this message translates to:
  /// **'Kilitlenen etiket salt okunur olur: içeriği bir daha DEĞİŞTİRİLEMEZ, silinemez ve kilit KALDIRILAMAZ. Önce doğru içeriği yazdığınızdan emin olun.'**
  String get lockWarning;

  /// No description provided for @longitude.
  ///
  /// In tr, this message translates to:
  /// **'Boylam (Lng)'**
  String get longitude;

  /// No description provided for @manage.
  ///
  /// In tr, this message translates to:
  /// **'Yönet'**
  String get manage;

  /// No description provided for @matchedRule.
  ///
  /// In tr, this message translates to:
  /// **'Eşleşen Kural / Not'**
  String get matchedRule;

  /// No description provided for @mimePayloadHex.
  ///
  /// In tr, this message translates to:
  /// **'Yük (Payload) Hex / Metin'**
  String get mimePayloadHex;

  /// No description provided for @mimeTypeLabel.
  ///
  /// In tr, this message translates to:
  /// **'MIME Türü'**
  String get mimeTypeLabel;

  /// No description provided for @nameRequired.
  ///
  /// In tr, this message translates to:
  /// **'Etikete bir isim verin.'**
  String get nameRequired;

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

  /// No description provided for @ndefRecordsTitle.
  ///
  /// In tr, this message translates to:
  /// **'NDEF Kayıtları'**
  String get ndefRecordsTitle;

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
  /// **'NFC etiketini okumak için cihazınızın arkasına dokundurun'**
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

  /// No description provided for @noContentInTag.
  ///
  /// In tr, this message translates to:
  /// **'Bu kayıtta etiket içeriği yok.'**
  String get noContentInTag;

  /// No description provided for @noLibraryMatches.
  ///
  /// In tr, this message translates to:
  /// **'Aramayla eşleşen etiket yok.'**
  String get noLibraryMatches;

  /// No description provided for @noRecordsOnTag.
  ///
  /// In tr, this message translates to:
  /// **'Etikette NDEF kaydı bulunamadı.'**
  String get noRecordsOnTag;

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

  /// No description provided for @pageN.
  ///
  /// In tr, this message translates to:
  /// **'Sayfa {page}'**
  String pageN(int page);

  /// No description provided for @pageRoleCc.
  ///
  /// In tr, this message translates to:
  /// **'CC'**
  String get pageRoleCc;

  /// No description provided for @pageRoleData.
  ///
  /// In tr, this message translates to:
  /// **'Veri'**
  String get pageRoleData;

  /// No description provided for @pageRoleLock.
  ///
  /// In tr, this message translates to:
  /// **'Kilit'**
  String get pageRoleLock;

  /// No description provided for @pageRoleUid.
  ///
  /// In tr, this message translates to:
  /// **'UID'**
  String get pageRoleUid;

  /// No description provided for @pageRoleUidLock.
  ///
  /// In tr, this message translates to:
  /// **'UID / Kilit'**
  String get pageRoleUidLock;

  /// No description provided for @passwordDialogAction.
  ///
  /// In tr, this message translates to:
  /// **'Şifreyi Ayarla'**
  String get passwordDialogAction;

  /// No description provided for @passwordDialogTitle.
  ///
  /// In tr, this message translates to:
  /// **'Şifre Belirle'**
  String get passwordDialogTitle;

  /// No description provided for @passwordDialogWarning.
  ///
  /// In tr, this message translates to:
  /// **'Şifreyi unutursanız etiketin içeriğini bir daha değiştiremezsiniz. Okuma herkese açık kalır.'**
  String get passwordDialogWarning;

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

  /// No description provided for @rawInspection.
  ///
  /// In tr, this message translates to:
  /// **'Ayrıntılı İnceleme'**
  String get rawInspection;

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

  /// No description provided for @readHeroEyebrow.
  ///
  /// In tr, this message translates to:
  /// **'NFC OKUYUCU'**
  String get readHeroEyebrow;

  /// No description provided for @readHeroScanning.
  ///
  /// In tr, this message translates to:
  /// **'Taranıyor...'**
  String get readHeroScanning;

  /// No description provided for @readHeroSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Telefonunuzun üst kısmını bir NFC etiketine yaklaştırarak içindeki tüm NDEF kayıtlarını ve donanım bilgilerini okuyun.'**
  String get readHeroSubtitle;

  /// No description provided for @readHeroTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi Tara'**
  String get readHeroTitle;

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

  /// No description provided for @recordCopied.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt içeriği kopyalandı'**
  String get recordCopied;

  /// No description provided for @recordIndex.
  ///
  /// In tr, this message translates to:
  /// **'Kayıt #{index}'**
  String recordIndex(int index);

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

  /// No description provided for @recordsCopiedToClipboard.
  ///
  /// In tr, this message translates to:
  /// **'{count, plural, =1{1 kayıt panoya kopyalandı} other{{count} kayıt panoya kopyalandı}}'**
  String recordsCopiedToClipboard(int count);

  /// No description provided for @redo.
  ///
  /// In tr, this message translates to:
  /// **'Yinele'**
  String get redo;

  /// No description provided for @removePasswordDialogTitle.
  ///
  /// In tr, this message translates to:
  /// **'Şifreyi Kaldır'**
  String get removePasswordDialogTitle;

  /// No description provided for @removePasswordDialogWarning.
  ///
  /// In tr, this message translates to:
  /// **'Etikete daha önce koyduğunuz şifreyi girin.'**
  String get removePasswordDialogWarning;

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

  /// No description provided for @removePhoto.
  ///
  /// In tr, this message translates to:
  /// **'Kaldır'**
  String get removePhoto;

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

  /// No description provided for @ruleDeleted.
  ///
  /// In tr, this message translates to:
  /// **'Kural silindi'**
  String get ruleDeleted;

  /// No description provided for @ruleNoteDialogTitle.
  ///
  /// In tr, this message translates to:
  /// **'Etiket Notunu Düzenle'**
  String get ruleNoteDialogTitle;

  /// No description provided for @ruleNoteHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: Depo Rafı #4 veya Toplantı Odası'**
  String get ruleNoteHint;

  /// No description provided for @ruleNoteLabel.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama İçi Not / Açıklama'**
  String get ruleNoteLabel;

  /// No description provided for @ruleSaved.
  ///
  /// In tr, this message translates to:
  /// **'Kural kaydedildi'**
  String get ruleSaved;

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

  /// No description provided for @saveTemplateDialogTitle.
  ///
  /// In tr, this message translates to:
  /// **'Şablon Olarak Kaydet'**
  String get saveTemplateDialogTitle;

  /// No description provided for @saveToLibrary.
  ///
  /// In tr, this message translates to:
  /// **'Kütüphaneye Kaydet'**
  String get saveToLibrary;

  /// No description provided for @scanFabLabel.
  ///
  /// In tr, this message translates to:
  /// **'Etiketi tara'**
  String get scanFabLabel;

  /// No description provided for @scanQrToRecord.
  ///
  /// In tr, this message translates to:
  /// **'QR Kod Tara'**
  String get scanQrToRecord;

  /// No description provided for @scannedTag.
  ///
  /// In tr, this message translates to:
  /// **'Taranan Etiket'**
  String get scannedTag;

  /// No description provided for @searchEngine.
  ///
  /// In tr, this message translates to:
  /// **'Arama Motoru'**
  String get searchEngine;

  /// No description provided for @searchHistoryHint.
  ///
  /// In tr, this message translates to:
  /// **'Geçmişte ara (UID, içerik, tür)...'**
  String get searchHistoryHint;

  /// No description provided for @searchLibraryHint.
  ///
  /// In tr, this message translates to:
  /// **'İsim, not, konum veya içerikte ara'**
  String get searchLibraryHint;

  /// No description provided for @searchQuery.
  ///
  /// In tr, this message translates to:
  /// **'Arama Metni'**
  String get searchQuery;

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

  /// No description provided for @shareRecords.
  ///
  /// In tr, this message translates to:
  /// **'Kayıtları Paylaş'**
  String get shareRecords;

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

  /// No description provided for @socialNetwork.
  ///
  /// In tr, this message translates to:
  /// **'Platform'**
  String get socialNetwork;

  /// No description provided for @socialUsername.
  ///
  /// In tr, this message translates to:
  /// **'Kullanıcı Adı'**
  String get socialUsername;

  /// No description provided for @sourceComposer.
  ///
  /// In tr, this message translates to:
  /// **'Yazma listesindeki kayıtlar'**
  String get sourceComposer;

  /// No description provided for @sourceEmpty.
  ///
  /// In tr, this message translates to:
  /// **'İçeriksiz (sadece not)'**
  String get sourceEmpty;

  /// No description provided for @sourceLastScan.
  ///
  /// In tr, this message translates to:
  /// **'Son taranan etiket'**
  String get sourceLastScan;

  /// No description provided for @sourceSelectPrompt.
  ///
  /// In tr, this message translates to:
  /// **'Etiketin içeriği nereden alınsın?'**
  String get sourceSelectPrompt;

  /// No description provided for @statusCancelled.
  ///
  /// In tr, this message translates to:
  /// **'İşlem iptal edildi.'**
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

  /// No description provided for @tabApp.
  ///
  /// In tr, this message translates to:
  /// **'Uygulama'**
  String get tabApp;

  /// No description provided for @tabBluetooth.
  ///
  /// In tr, this message translates to:
  /// **'Bluetooth'**
  String get tabBluetooth;

  /// No description provided for @tabCalendar.
  ///
  /// In tr, this message translates to:
  /// **'Takvim'**
  String get tabCalendar;

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

  /// No description provided for @tabFile.
  ///
  /// In tr, this message translates to:
  /// **'Dosya'**
  String get tabFile;

  /// No description provided for @tabLocation.
  ///
  /// In tr, this message translates to:
  /// **'Konum'**
  String get tabLocation;

  /// No description provided for @tabPhone.
  ///
  /// In tr, this message translates to:
  /// **'Telefon'**
  String get tabPhone;

  /// No description provided for @tabSearch.
  ///
  /// In tr, this message translates to:
  /// **'Arama'**
  String get tabSearch;

  /// No description provided for @tabSms.
  ///
  /// In tr, this message translates to:
  /// **'SMS'**
  String get tabSms;

  /// No description provided for @tabSocial.
  ///
  /// In tr, this message translates to:
  /// **'Sosyal Medya'**
  String get tabSocial;

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

  /// No description provided for @tabVideo.
  ///
  /// In tr, this message translates to:
  /// **'Video'**
  String get tabVideo;

  /// No description provided for @tabWifi.
  ///
  /// In tr, this message translates to:
  /// **'Wi-Fi'**
  String get tabWifi;

  /// No description provided for @tagCapacity.
  ///
  /// In tr, this message translates to:
  /// **'Kapasite'**
  String get tagCapacity;

  /// No description provided for @tagCapacityValue.
  ///
  /// In tr, this message translates to:
  /// **'{used} / {max} bayt ({available} bayt boş)'**
  String tagCapacityValue(int available, int max, int used);

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

  /// No description provided for @tagNameHint.
  ///
  /// In tr, this message translates to:
  /// **'Örn: Mutfak etiketi'**
  String get tagNameHint;

  /// No description provided for @tagNameLabel.
  ///
  /// In tr, this message translates to:
  /// **'İsim'**
  String get tagNameLabel;

  /// No description provided for @tagReadOnly.
  ///
  /// In tr, this message translates to:
  /// **'Salt Okunur (Kilitli)'**
  String get tagReadOnly;

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

  /// No description provided for @tagSerialNumber.
  ///
  /// In tr, this message translates to:
  /// **'Seri Numarası (UID)'**
  String get tagSerialNumber;

  /// No description provided for @tagTechnology.
  ///
  /// In tr, this message translates to:
  /// **'Teknoloji'**
  String get tagTechnology;

  /// No description provided for @tagType.
  ///
  /// In tr, this message translates to:
  /// **'Tür'**
  String get tagType;

  /// No description provided for @tagUidCopied.
  ///
  /// In tr, this message translates to:
  /// **'Etiket UID kopyalandı'**
  String get tagUidCopied;

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

  /// No description provided for @templateGalleryTitle.
  ///
  /// In tr, this message translates to:
  /// **'Hazır Şablonlar'**
  String get templateGalleryTitle;

  /// No description provided for @templateNameHint.
  ///
  /// In tr, this message translates to:
  /// **'Şablon Adı'**
  String get templateNameHint;

  /// No description provided for @templateRecordCount.
  ///
  /// In tr, this message translates to:
  /// **'{count, plural, =1{1 Kayıt} other{{count} Kayıt}} | {date}'**
  String templateRecordCount(int count, String date);

  /// No description provided for @templateSaved.
  ///
  /// In tr, this message translates to:
  /// **'Şablon başarıyla kaydedildi'**
  String get templateSaved;

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

  /// No description provided for @totalBytes.
  ///
  /// In tr, this message translates to:
  /// **'Toplam Boyut'**
  String get totalBytes;

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

  /// No description provided for @videoUrlOrId.
  ///
  /// In tr, this message translates to:
  /// **'Video Bağlantısı veya YouTube ID'**
  String get videoUrlOrId;

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

  /// No description provided for @wifiAuthType.
  ///
  /// In tr, this message translates to:
  /// **'Güvenlik Türü'**
  String get wifiAuthType;

  /// No description provided for @wifiAuthWpa.
  ///
  /// In tr, this message translates to:
  /// **'WPA Personal'**
  String get wifiAuthWpa;

  /// No description provided for @wifiAuthWpa2.
  ///
  /// In tr, this message translates to:
  /// **'WPA2 Personal'**
  String get wifiAuthWpa2;

  /// No description provided for @wifiAuthWpaWpa2.
  ///
  /// In tr, this message translates to:
  /// **'WPA/WPA2 Personal'**
  String get wifiAuthWpaWpa2;

  /// No description provided for @wifiHidden.
  ///
  /// In tr, this message translates to:
  /// **'Gizli Ağ'**
  String get wifiHidden;

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

  /// No description provided for @writeDumpConfirmButton.
  ///
  /// In tr, this message translates to:
  /// **'Yaz'**
  String get writeDumpConfirmButton;

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

  /// No description provided for @writeHeroButton.
  ///
  /// In tr, this message translates to:
  /// **'Yazmayı Başlat'**
  String get writeHeroButton;

  /// No description provided for @writeHeroEyebrow.
  ///
  /// In tr, this message translates to:
  /// **'NDEF YAZICI'**
  String get writeHeroEyebrow;

  /// No description provided for @writeHeroSubtitle.
  ///
  /// In tr, this message translates to:
  /// **'Birden fazla NDEF kaydı hazırlayın ve hedef NFC etiketine tek seferde yazın.'**
  String get writeHeroSubtitle;

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

  /// No description provided for @yes.
  ///
  /// In tr, this message translates to:
  /// **'Evet'**
  String get yes;
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
