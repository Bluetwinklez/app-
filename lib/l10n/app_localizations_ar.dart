// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get addRecord => 'إضافة سجل';

  @override
  String get addRule => 'إضافة قاعدة';

  @override
  String get addTag => 'إضافة بطاقة';

  @override
  String get addToComposerList => 'إضافة إلى قائمة الكتابة';

  @override
  String get addToWriteList => 'إضافة إلى قائمة الكتابة';

  @override
  String get addressCannotBeEmpty => 'العنوان لا يمكن أن يكون فارغاً.';

  @override
  String get advancedCommandsDesc =>
      'أمر hex واحد في كل سطر. مثال: 60 = GET_VERSION, 30 04 = قراءة الصفحة 4. الأوامر الخاطئة قد تتلف البطاقة نهائياً.';

  @override
  String get advancedCommandsSubtitle =>
      'إرسال أوامر ست عشرية خام مباشرة إلى البطاقة';

  @override
  String get advancedCommandsTitle => 'أوامر NFC المتقدمة';

  @override
  String get allRulesCleared => 'تم حذف جميع القواعد';

  @override
  String get appLinksDesc =>
      'عند كتابتها على بطاقة، يؤدي لمسها إلى إظهار إشعار وفتح التطبيق في الشاشة المحددة.';

  @override
  String get appLinksSection => 'روابط التطبيق';

  @override
  String get appPackageName => 'اسم حزمة Android';

  @override
  String get appSettings => 'إعدادات التطبيق';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'تشغيل تلقائي عند اللمس';

  @override
  String get backupExportSuccess => 'تم حفظ ملف النسخة الاحتياطية بنجاح';

  @override
  String get backupFileSizeExceeded => 'حجم ملف النسخة يتجاوز 2 ميغابايت.';

  @override
  String get backupHistoryMustBeList => 'يجب أن يكون الحقل \"history\" قائمة.';

  @override
  String backupImportFailed(String error) {
    return 'فشل استيراد النسخة الاحتياطية: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'تم استيراد النسخة بنجاح: تمت إضافة $templates قوالب، $rules قواعد، $history سجلات';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'معرف السجل ليس بتنسيق Base64 صالح: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'حمولة السجل ليست بتنسيق Base64 صالح: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'نوع السجل ليس بتنسيق Base64 صالح: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'تنسيق JSON غير صالح: $error';
  }

  @override
  String get backupInvalidRuleNote => 'ملاحظة القاعدة غير صالحة.';

  @override
  String get backupInvalidRuleSha => 'تجزئة SHA-256 للقاعدة غير صالحة.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'تاريخ إنشاء القالب غير صالح: $date';
  }

  @override
  String get backupInvalidTemplateId => 'معرف القالب غير صالح.';

  @override
  String get backupInvalidTemplateName => 'اسم القالب غير صالح.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'قيمة TNF غير صالحة ($tnf). يجب أن تكون بين 0 و 7.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'عدد السجلات يتجاوز الحد المسموح $max ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'عدد السجلات يتجاوز الحد المسموح $max ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'عدد القواعد يتجاوز الحد المسموح $max ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'عدد القوالب يتجاوز الحد المسموح $max ($count).';
  }

  @override
  String get backupMissingSchemaVersion => 'الحقل \"schemaVersion\" مفقود.';

  @override
  String get backupRecordMustBeObject => 'يجب أن يكون كل سجل NDEF كائن JSON.';

  @override
  String get backupRecordsMustBeList => 'يجب أن تكون السجلات قائمة.';

  @override
  String get backupRestoreSubtitle =>
      'انسخ قوالبك وملاحظاتك وسجلك بتنسيق JSON أو ادمجها مع البيانات الحالية.';

  @override
  String get backupRestoreTitle => 'النسخ الاحتياطي والاستعادة (JSON)';

  @override
  String get backupRootMustBeObject => 'يجب أن يكون جذر النسخة كائن JSON.';

  @override
  String get backupRuleMustBeObject => 'يجب أن تكون كل قاعدة كائن JSON.';

  @override
  String get backupSchemaVersionMustBeInt =>
      'يجب أن يكون الحقل \"schemaVersion\" عدداً صحيحاً.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'بيانات النسخة الاحتياطية تتجاوز الحد المسموح 2 ميغابايت ($bytes بايت).';
  }

  @override
  String get backupTagRulesMustBeList =>
      'يجب أن يكون الحقل \"tagRules\" قائمة.';

  @override
  String get backupTemplateMustBeObject => 'يجب أن يكون كل قالب كائن JSON.';

  @override
  String get backupTemplatesMustBeList =>
      'يجب أن يكون الحقل \"templates\" قائمة.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'إصدار مخطط النسخة غير مدعوم: $version.';
  }

  @override
  String get batchWrite => 'كتابة دفعات';

  @override
  String get bluetoothDeviceName => 'اسم الجهاز (اختياري)';

  @override
  String get bluetoothMac => 'عنوان MAC للبلوتوث';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'البايتات المكتوبة: $bytes | التحقق: $status';
  }

  @override
  String cameraError(String error) {
    return 'تعذر فتح الكاميرا. يرجى منح الإذن من الإعدادات > الخصوصية > الكاميرا.\n($error)';
  }

  @override
  String get cancel => 'إلغاء';

  @override
  String get catBusiness => 'تجاري';

  @override
  String get catCar => 'السيارة';

  @override
  String get catHome => 'المنزل';

  @override
  String get catOther => 'أخرى';

  @override
  String get catPersonal => 'شخصي';

  @override
  String get catWork => 'العمل';

  @override
  String get categoryLabel => 'الفئة';

  @override
  String get chooseFromGallery => 'اختيار من المعرض';

  @override
  String get clear => 'مسح';

  @override
  String get clearAll => 'مسح الكل';

  @override
  String get clearAllRulesConfirm => 'حذف جميع الملاحظات المحلية المحفوظة؟';

  @override
  String get clearConfirmButton => 'نعم، امسح';

  @override
  String get clearConfirmMessage =>
      'ستؤدي هذه العملية إلى مسح جميع السجلات وكتابة سجل فارغ. هل تريد المتابعة؟';

  @override
  String get clearConfirmTitle => 'إعادة ضبط محتوى البطاقة';

  @override
  String get clearHistory => 'مسح السجل';

  @override
  String get clearList => 'مسح القائمة';

  @override
  String get clearTagSubtitle => 'يحذف جميع السجلات ويكتب NDEF فارغاً';

  @override
  String get clearTagTitle => 'مسح البطاقة';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سجلات في الحافظة',
      one: 'سجل واحد جاهز في الحافظة',
    );
    return '$_temp0 ($bytes بايت) · $source';
  }

  @override
  String get close => 'إغلاق';

  @override
  String get commandsEmptyError => 'يرجى إدخال أمر واحد على الأقل.';

  @override
  String get commandsLabel => 'الأوامر';

  @override
  String get composeRecordTitle => 'إضافة سجل جديد';

  @override
  String get confirmClearHistoryContent =>
      'سيتم حذف كل سجل المسح من الجهاز. هل أنت متأكد؟';

  @override
  String get confirmClearHistoryTitle => 'مسح السجل';

  @override
  String get confirmClearTemplatesContent =>
      'سيتم حذف جميع قوالب الكتابة المحفوظة. هل أنت متأكد؟';

  @override
  String get confirmClearTemplatesTitle => 'مسح القوالب';

  @override
  String get contactCompany => 'الشركة / المؤسسة';

  @override
  String get contactEmail => 'البريد الإلكتروني';

  @override
  String get contactFullName => 'الاسم الكامل';

  @override
  String get contactNote => 'ملاحظة';

  @override
  String get contactPhone => 'الهاتف';

  @override
  String get contactTitle => 'المسمى الوظيفي';

  @override
  String get contactWebsite => 'الموقع الإلكتروني';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سجلات',
      one: 'سجل واحد',
    );
    return 'المحتوى: $_temp0 · $content';
  }

  @override
  String get copy => 'نسخ';

  @override
  String get copyAllRecords => 'نسخ جميع السجلات';

  @override
  String get copyTagUid => 'نسخ UID';

  @override
  String get copyToComposer => 'نسخ إلى قائمة الكتابة';

  @override
  String get csvInvalidAddress => 'عنوان غير صالح.';

  @override
  String get csvInvalidEmail => 'بريد إلكتروني غير صالح.';

  @override
  String get csvInvalidLocation =>
      'أدخل خطي العرض والطول (مثال: موقع,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'تم استيراد $max سجل كحد أقصى؛ تم تخطي الأسطر المتبقية.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'السطر $row: القيمة فارغة.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'السطر $row: $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'نوع غير معروف \"$type\".';
  }

  @override
  String get csvWifiPasswordLength =>
      'يجب أن تتراوح كلمة مرور Wi-Fi بين 8 و 63 حرفاً.';

  @override
  String get delete => 'حذف';

  @override
  String deleteTagConfirmContent(String name) {
    return 'حذف \"$name\" من المكتبة؟ لن تتأثر البطاقة الفعلية.';
  }

  @override
  String get deleteTagConfirmTitle => 'حذف البطاقة';

  @override
  String get deleteTemplateTooltip => 'حذف القالب';

  @override
  String get deviceNameTooLong => 'اسم الجهاز طويل جداً.';

  @override
  String get dismiss => 'تجاهل';

  @override
  String get editRecordTitle => 'تعديل السجل';

  @override
  String get editRule => 'تعديل القاعدة';

  @override
  String get editTag => 'تعديل البطاقة';

  @override
  String get emailBody => 'نص الرسالة';

  @override
  String get emailRecipient => 'البريد المستلم';

  @override
  String get emailSubject => 'الموضوع';

  @override
  String get emptyComposerSubtitle =>
      'انقر على \"إضافة سجل\" لإنشاء روابط ويب، نصوص، Wi-Fi، وجهات اتصال.';

  @override
  String get emptyComposerTitle => 'لم تتم إضافة سجلات بعد';

  @override
  String get emptyHistorySubtitle => 'ستظهر البطاقات التي تم مسحها هنا.';

  @override
  String get emptyHistoryTitle => 'لا يوجد سجل مسح بعد';

  @override
  String get emptyLibrary =>
      'لا توجد بطاقات محفوظة بعد.\nامسح بطاقة واحفظها هنا مع اسم وصورة.';

  @override
  String get eventDescription => 'الوصف';

  @override
  String get eventEnd => 'وقت الانتهاء';

  @override
  String get eventLocation => 'المكان / الموقع';

  @override
  String get eventStart => 'وقت البدء';

  @override
  String get eventTitle => 'عنوان الفعالية';

  @override
  String get exportBackup => 'تصدير';

  @override
  String get facetimePrompt => 'أدخل رقم الهاتف أو بريد Apple ID.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" لا يمكن أن يكون فارغاً.';
  }

  @override
  String get fieldTextPrompt => 'النص المراد كتابته على البطاقة';

  @override
  String get fieldUrlPrompt => 'عنوان موقع الويب (https://...)';

  @override
  String get fileUrl => 'رابط الملف';

  @override
  String get filterAll => 'الكل';

  @override
  String get flashlight => 'الكشاف';

  @override
  String get formatConfirmButton => 'تهيئة';

  @override
  String get formatConfirmMessage =>
      'سيتم مسح البيانات وإعداد البطاقة كبطاقة NDEF فارغة. هل تريد المتابعة؟';

  @override
  String get formatMemorySubtitle =>
      'إعداد البطاقة لـ NDEF (البطاقات الفارغة أو التالفة)';

  @override
  String get formatMemoryTitle => 'تهيئة الذاكرة';

  @override
  String get hardwareAvailable => 'عتاد NFC جاهز';

  @override
  String get hardwareDisabled => 'NFC معطل';

  @override
  String get hardwareNotSupported => 'NFC غير مدعوم';

  @override
  String get historyFilteredEmpty => 'لم يتم العثور على نتائج مطابقة في السجل.';

  @override
  String get idTooLarge => 'لا يمكن أن يتجاوز حجم المعرّف 255 بايت';

  @override
  String get importBackup => 'استيراد (دمج)';

  @override
  String get importCsv => 'استيراد CSV';

  @override
  String get inAppTagRules => 'قواعد البطاقات المحلية';

  @override
  String get invalidHexId => 'صيغة Hex غير صالحة للمعرّف';

  @override
  String get invalidHexPayload => 'صيغة Hex غير صالحة للبيانات';

  @override
  String get invalidHexType => 'صيغة Hex غير صالحة للنوع';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get latitude => 'خط العرض (Lat)';

  @override
  String get linkCopied => 'تم نسخ الرابط';

  @override
  String get linkHistoryDesc => 'يفتح سجل المسح';

  @override
  String get linkScanDesc => 'يفتح التطبيق ويبدأ المسح';

  @override
  String get linkToolsDesc => 'يفتح شاشة الأدوات';

  @override
  String get linkWriteDesc => 'يفتح شاشة كتابة البطاقة';

  @override
  String get loadToComposerTooltip => 'تحميل إلى المحرر';

  @override
  String get locationHint => 'مثال: باب الثلاجة';

  @override
  String get locationLabel => 'أين مكانها؟';

  @override
  String get lockAcknowledge => 'أدرك أن هذه العملية لا يمكن التراجع عنها';

  @override
  String get lockButton => 'قفل';

  @override
  String get lockTagSubtitle =>
      'يجعل البطاقة للقراءة فقط بصورة دائمة (لا يمكن التراجع)';

  @override
  String get lockTagTitle => 'قفل البطاقة';

  @override
  String get lockWarning =>
      'البطاقة المقفلة تصبح للقراءة فقط نهائياً: لا يمكن تعديلها أو مسحها أو إلغاء قفلها مطلقاً. تأكد من صحة المحتوى أولاً.';

  @override
  String get longitude => 'خط الطول (Lng)';

  @override
  String get manage => 'إدارة';

  @override
  String get matchedRule => 'الملاحظة المطابقة';

  @override
  String get mimePayloadHex => 'البيانات (Hex / نص)';

  @override
  String get mimeTypeLabel => 'نوع MIME';

  @override
  String get nameRequired => 'يرجى إعطاء اسم للبطاقة.';

  @override
  String get navHistory => 'سجل';

  @override
  String get navHistoryTitle => 'السجل';

  @override
  String get navRead => 'قراءة';

  @override
  String get navReadTitle => 'قراءة البطاقة';

  @override
  String get navSettings => 'إعدادات';

  @override
  String get navSettingsTitle => 'القوالب والإعدادات';

  @override
  String get navTools => 'أدوات';

  @override
  String get navToolsTitle => 'الأدوات';

  @override
  String get navWrite => 'كتابة';

  @override
  String get navWriteTitle => 'كتابة البطاقة';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سجلات',
      one: 'سجل واحد',
    );
    return '$_temp0';
  }

  @override
  String get ndefRecordsTitle => 'سجلات NDEF';

  @override
  String get nfcPromptClear => 'قرّب البطاقة من الجهاز لإعادة ضبطها';

  @override
  String get nfcPromptLock => 'قرّب البطاقة لقفلها بشكل دائم';

  @override
  String get nfcPromptScan => 'قرّب بطاقة NFC من الجهاز لقراءتها';

  @override
  String get nfcPromptWrite => 'قرّب بطاقة NFC لحفظ البيانات';

  @override
  String get no => 'لا';

  @override
  String get noContentInTag => 'لا يوجد محتوى بطاقة في هذا السجل.';

  @override
  String get noLibraryMatches => 'لا توجد بطاقات مطابقة.';

  @override
  String get noRecordsOnTag => 'لم يتم العثور على سجلات NDEF في البطاقة.';

  @override
  String get noTemplates =>
      'لا توجد قوالب محفوظة بعد.\nأنشئ سجلاً في تبويب \"كتابة\" لحفظه كقالب.';

  @override
  String get noteLabel => 'ملاحظة';

  @override
  String get onboardingContinue => 'متابعة';

  @override
  String get onboardingSkip => 'تخطي';

  @override
  String get onboardingStart => 'ابدأ الآن';

  @override
  String get onboardingStep1Body =>
      'المس الزر الأزرق بالأسفل وقرّب الهاتف من البطاقة. سيظهر المحتوى والسعة والرقم التسلسلي فوراً.';

  @override
  String get onboardingStep1Title => 'امسح البطاقة';

  @override
  String get onboardingStep2Body =>
      'في تبويب \"كتابة\"، انقر على \"إضافة سجل\": روابط ويب، Wi-Fi، بطاقات شخصية، والمزيد عبر القوالب الجاهزة.';

  @override
  String get onboardingStep2Title => 'اكتب ما تشاء';

  @override
  String get onboardingStep3Body =>
      'افحص الذاكرة، عيّن كلمات مرور، أو اقفل البطاقات وهيئها. كل ذلك في تبويب \"أدوات\".';

  @override
  String get onboardingStep3Title => 'أدوات الخبراء';

  @override
  String get onboardingStep4Body =>
      'احفظ بطاقاتك بأسماء وملاحظات وصور في مكتبتك الخاصة. يمكنك تغيير اللغة والمظهر من الإعدادات.';

  @override
  String get onboardingStep4Title => 'نظّم بطاقاتك';

  @override
  String optionalField(String label) {
    return '$label (اختياري)';
  }

  @override
  String pageN(int page) {
    return 'الصفحة $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'بيانات';

  @override
  String get pageRoleLock => 'قفل';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / قفل';

  @override
  String get passwordDialogAction => 'تعيين';

  @override
  String get passwordDialogTitle => 'تعيين كلمة مرور';

  @override
  String get passwordDialogWarning =>
      'إذا نسيت كلمة المرور هذه، فلن تتمكن من تعديل محتوى البطاقة مجدداً. تبقى القراءة متاحة للجميع.';

  @override
  String get passwordError => 'يرجى إدخال 4 أحرف بالضبط أو 8 خانات hex.';

  @override
  String get passwordHint => '4 أحرف (مثال: 1234) أو 8 خانات hex';

  @override
  String get passwordLabel => 'كلمة المرور';

  @override
  String get paste => 'لصق';

  @override
  String get phoneNumber => 'رقم الهاتف';

  @override
  String get phoneWithCountryCode =>
      'أدخل رقم الهاتف مع رمز الدولة (مثال: 966555112233).';

  @override
  String get presetAppDownloadDesc =>
      'تفتح تطبيقك أو توجه مستخدمي Android لتثبيته.';

  @override
  String get presetAppDownloadTitle => 'تحميل التطبيق';

  @override
  String get presetBusinessCardDesc =>
      'تضيف جهة اتصالك لدفتر العناوين بمجرد اللمس.';

  @override
  String get presetBusinessCardTitle => 'بطاقة عمل رقمية';

  @override
  String get presetDirectionsDesc => 'تحدد عنواناً أو مكاناً على الخريطة.';

  @override
  String get presetDirectionsTitle => 'الاتجاهات / العنوان';

  @override
  String get presetEmergencyDesc =>
      'فصيلة الدم وجهات اتصال الطوارئ والبيانات الحرجة.';

  @override
  String get presetEmergencyTitle => 'بطاقة الطوارئ (ICE)';

  @override
  String get presetGoogleReviewDesc =>
      'توجه العملاء مباشرة لصفحة تقييماتك في Google.';

  @override
  String get presetGoogleReviewTitle => 'تقييم Google';

  @override
  String get presetGuestWifiDesc =>
      'يتصل الضيوف بالشبكة دون كتابة كلمة المرور.';

  @override
  String get presetGuestWifiTitle => 'بطاقة Wi-Fi للضيوف';

  @override
  String get presetInstagramDesc => 'تفتح حساب Instagram الخاص بك بنقرة واحدة.';

  @override
  String get presetInstagramTitle => 'حساب Instagram';

  @override
  String get presetMenuLinkDesc =>
      'توضع على الطاولة ليفتح العملاء القائمة فوراً.';

  @override
  String get presetMenuLinkTitle => 'قائمة طعام المطعم';

  @override
  String get presetPetTagDesc => 'تمكن من يعثر عليه من الاتصال بك مباشرة.';

  @override
  String get presetPetTagTitle => 'طوق الحيوان الأليف';

  @override
  String get presetShortcutDesc => 'تشغل اختصارات Apple أو إجراءات التطبيق.';

  @override
  String get presetShortcutTitle => 'مشغل الاختصارات';

  @override
  String get presetWebsiteDesc => 'توجه لأي صفحة على الإنترنت.';

  @override
  String get presetWebsiteTitle => 'رابط موقع ويب';

  @override
  String get presetWhatsappDesc =>
      'تبدأ المحادثة دون حفظ الرقم في جهات الاتصال.';

  @override
  String get presetWhatsappTitle => 'محادثة WhatsApp مباشرة';

  @override
  String get qrCode => 'رمز QR';

  @override
  String qrContentChars(int chars) {
    return 'المحتوى ($chars حرفاً):';
  }

  @override
  String get qrContentEmpty => 'المحتوى المطلوب تحويله فارغ.';

  @override
  String qrContentTooLarge(int chars) {
    return 'المحتوى كبير جداً لرمز QR ($chars حرفاً، الحد الأقصى 2048).';
  }

  @override
  String get qrFrameInstructions =>
      'ضع رمز QR داخل الإطار. سيتم تحويل الروابط وشبكات Wi-Fi والنصوص إلى سجلات.';

  @override
  String qrGenerationFailed(String error) {
    return 'فشل إنشاء رمز QR: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'معاينة رمز QR: $title';
  }

  @override
  String get qrScanTitle => 'مسح رمز QR';

  @override
  String get qrSecurityNote =>
      'معاينة QR مدعومة فقط للنصوص الواضحة وروابط الويب.\n\nلا يتم تحويل كلمات مرور Wi-Fi والبيانات الثنائية حفاظاً على الخصوصية.';

  @override
  String get qrUserOnlyNote => 'يفتح بطلب المستخدم فقط.';

  @override
  String get rawInspection => 'فحص تفصيلي';

  @override
  String get rawRecordDetailsTitle => 'تفاصيل السجل (للقراءة فقط)';

  @override
  String get rawRecordEditorTitle => 'تعديل سجل NDEF الخام';

  @override
  String get readHeroButton => 'بدء المسح';

  @override
  String get readHeroEyebrow => 'قارئ NFC';

  @override
  String get readHeroScanning => 'جارٍ المسح...';

  @override
  String get readHeroSubtitle =>
      'قرّب الجزء العلوي من الهاتف من بطاقة NFC لقراءة سجلات NDEF وبيانات الشريحة.';

  @override
  String get readHeroTitle => 'مسح البطاقة';

  @override
  String get readMemorySubtitle =>
      'قراءة الذاكرة صفحة بصفحة؛ نسخ أو حفظ بصيغة .bin';

  @override
  String get readMemoryTitle => 'قراءة الذاكرة';

  @override
  String get readyTemplates => 'قوالب جاهزة';

  @override
  String get recordCopied => 'تم نسخ محتوى السجل';

  @override
  String recordIndex(int index) {
    return 'سجل #$index';
  }

  @override
  String get recordTypeCalendar => 'فعالية تقويم (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'MIME مخصص ($mime)';
  }

  @override
  String get recordTypeEmail => 'سجل بريد إلكتروني';

  @override
  String get recordTypeLocation => 'موقع جغرافي / GPS';

  @override
  String get recordTypePhone => 'رقم هاتف';

  @override
  String get recordTypeSmartPoster => 'ملصق ذكي (Smart Poster)';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'حمولة ملصق ذكي تالفة ($bytes بايت)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'ملصق ذكي (حمولة غير صالحة)';

  @override
  String get recordTypeSms => 'سجل SMS';

  @override
  String get recordTypeText => 'سجل نصي';

  @override
  String get recordTypeUnknown => 'سجل غير معروف';

  @override
  String get recordTypeUrl => 'رابط ويب (URL)';

  @override
  String get recordTypeVCard => 'بطاقة جهة اتصال (vCard)';

  @override
  String get recordTypeWifi => 'إعداد Wi-Fi (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'بيانات WSC تالفة';

  @override
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'تم نسخ $count سجلات',
      one: 'تم نسخ سجل واحد',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'إعادة';

  @override
  String get removePasswordDialogTitle => 'إزالة كلمة المرور';

  @override
  String get removePasswordDialogWarning =>
      'أدخل كلمة المرور الحالية المحددة في البطاقة.';

  @override
  String get removePasswordSubtitle =>
      'إلغاء الحماية باستخدام كلمة المرور المعروفة';

  @override
  String get removePasswordTitle => 'إزالة كلمة المرور';

  @override
  String get removePhoto => 'إزالة';

  @override
  String get rewriteTag => 'إعادة الكتابة';

  @override
  String ruleDeleteConfirm(String note) {
    return 'حذف القاعدة ذات الملاحظة \"$note\"؟';
  }

  @override
  String get ruleDeleted => 'تم حذف القاعدة';

  @override
  String get ruleNoteDialogTitle => 'تعديل ملاحظة البطاقة';

  @override
  String get ruleNoteHint => 'مثال: رف المستودع #4 أو غرفة الاجتماعات';

  @override
  String get ruleNoteLabel => 'الملاحظة المحلية / الوصف';

  @override
  String get ruleSaved => 'تم حفظ القاعدة';

  @override
  String get save => 'حفظ';

  @override
  String get saveAsTemplate => 'حفظ كقالب';

  @override
  String get saveBin => 'حفظ .bin';

  @override
  String get saveLocalHistory => 'حفظ سجل المسح محلياً';

  @override
  String get saveLocalHistorySubtitle =>
      'عند التعطيل لن يتم تخزين المسح. عند التفعيل يتم حفظ عمليات المسح الناجحة محلياً.';

  @override
  String get saveTemplateDialogTitle => 'حفظ كقالب';

  @override
  String get saveToLibrary => 'حفظ في المكتبة';

  @override
  String get scanFabLabel => 'مسح البطاقة';

  @override
  String get scanQrToRecord => 'مسح رمز QR';

  @override
  String get scannedTag => 'البطاقة الممسوحة';

  @override
  String get searchEngine => 'محرك البحث';

  @override
  String get searchHistoryHint => 'بحث في السجل (UID، محتوى، نوع)...';

  @override
  String get searchLibraryHint => 'بحث بالاسم أو الملاحظة أو المكان أو المحتوى';

  @override
  String get searchQuery => 'نص البحث';

  @override
  String get searchQueryCannotBeEmpty => 'نص البحث لا يمكن أن يكون فارغاً.';

  @override
  String get securityRestriction => 'قيود الأمان';

  @override
  String get send => 'إرسال';

  @override
  String get setPasswordSubtitle =>
      'حماية محتوى البطاقة من الكتابة غير المصرح بها';

  @override
  String get setPasswordTitle => 'تعيين كلمة مرور';

  @override
  String get shareRecords => 'مشاركة السجلات';

  @override
  String get shortcutAutomationNote =>
      'ملاحظة: يرتبط التحكم التلقائي بـ UID البطاقة ويعمل حتى لو تغيّر المحتوى.';

  @override
  String get shortcutStep1 =>
      'افتح تطبيق الاختصارات وانقر على \"التحكم التلقائي\" بالأسفل.';

  @override
  String get shortcutStep2 =>
      'انقر على \"تحكم تلقائي جديد\" (+) ← اختر \"NFC\".';

  @override
  String get shortcutStep3 =>
      'انقر على \"مسح\"، قرّب البطاقة من أعلى iPhone وسمّها.';

  @override
  String get shortcutStep4 =>
      'اختر \"تشغيل فوراً\"، ثم أضف الإجراءات المرغوبة.';

  @override
  String get shortcutStep5 =>
      'لفتح التطبيق، اختر \"مسح البطاقة\" أو \"كتابة البطاقة\" كإجراء.';

  @override
  String get shortcutsGuideSubtitle =>
      'شغّل الإجراءات تلقائياً بمجرد لمس البطاقة أو اطلب من Siri المسح صوتياً.';

  @override
  String get shortcutsGuideTitle => 'Siri واختصارات Apple';

  @override
  String get siriPhraseScan =>
      '\"يا Siri، امسح البطاقة باستخدام NFC Tag Master\"';

  @override
  String get siriPhraseWrite =>
      '\"يا Siri، اكتب على البطاقة باستخدام NFC Tag Master\"';

  @override
  String get siriShortcutsNote =>
      'تظهر هذه الأوامر في تطبيق الاختصارات وبحث Spotlight.';

  @override
  String get smsMessage => 'نص الرسالة';

  @override
  String get socialNetwork => 'المنصة';

  @override
  String get socialUsername => 'اسم المستخدم';

  @override
  String get sourceComposer => 'السجلات في قائمة الكتابة';

  @override
  String get sourceEmpty => 'بدون محتوى (ملاحظة فقط)';

  @override
  String get sourceLastScan => 'آخر بطاقة تم مسحها';

  @override
  String get sourceSelectPrompt => 'من أين يتم أخذ محتوى البطاقة؟';

  @override
  String get statusCancelled => 'تم إلغاء العملية.';

  @override
  String statusClearError(String error) {
    return 'خطأ في التهيئة: $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'فشل التصفير: $error';
  }

  @override
  String get statusClearSuccess => 'تم مسح محتوى البطاقة بنجاح.';

  @override
  String get statusClearing => 'وضع التصفير مفعّل. قرّب البطاقة...';

  @override
  String statusLockError(String error) {
    return 'خطأ في القفل: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'فشل القفل: $error';
  }

  @override
  String get statusLockSuccess => 'تم قفل البطاقة نهائياً (للقراءة فقط).';

  @override
  String get statusLocking => 'وضع القفل مفعّل. قرّب البطاقة...';

  @override
  String get statusNfcDisabled => 'NFC معطل. يرجى تفعيله من الإعدادات.';

  @override
  String get statusNfcNotSupported => 'عتاد NFC غير مدعوم على هذا الجهاز.';

  @override
  String get statusNfcUnavailable => 'NFC غير متاح حالياً.';

  @override
  String get statusReady => 'جاهز';

  @override
  String statusScanError(String error) {
    return 'خطأ في المسح: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'تمت قراءة البطاقة بنجاح ($id).';
  }

  @override
  String get statusScanning => 'جارٍ المسح... قرّب الهاتف من البطاقة.';

  @override
  String statusUnexpectedError(String error) {
    return 'خطأ غير متوقع: $error';
  }

  @override
  String statusWriteError(String error) {
    return 'خطأ في الكتابة: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'لم تكتمل الكتابة: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return 'تمت الكتابة والتحقق بنجاح! ($bytes بايت)';
  }

  @override
  String get statusWriting => 'وضع الكتابة مفعّل. قرّب البطاقة الهدف...';

  @override
  String get systemLanguage => 'لغة النظام';

  @override
  String get tabApp => 'تطبيق';

  @override
  String get tabBluetooth => 'بلوتوث';

  @override
  String get tabCalendar => 'تقويم';

  @override
  String get tabContact => 'جهة اتصال (vCard)';

  @override
  String get tabCustomMime => 'MIME مخصص';

  @override
  String get tabEmail => 'بريد إلكتروني';

  @override
  String get tabFile => 'ملف';

  @override
  String get tabLocation => 'موقع جغرافي';

  @override
  String get tabPhone => 'هاتف';

  @override
  String get tabSearch => 'بحث';

  @override
  String get tabSms => 'رسالة SMS';

  @override
  String get tabSocial => 'وسائل التواصل';

  @override
  String get tabText => 'نص';

  @override
  String get tabUrl => 'رابط ويب';

  @override
  String get tabVideo => 'فيديو';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'السعة';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max بايت ($available بايت فارغ)';
  }

  @override
  String get tagInfoTitle => 'معلومات البطاقة';

  @override
  String get tagLibraryTitle => 'مكتبة البطاقات';

  @override
  String get tagNameHint => 'مثال: بطاقة المطبخ';

  @override
  String get tagNameLabel => 'الاسم';

  @override
  String get tagReadOnly => 'للقراءة فقط (مقفلة)';

  @override
  String tagRulesCount(int count) {
    return 'القواعد / الملاحظات المحفوظة: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'تعرض الملاحظة المحفوظة وفق تجزئة SHA-256 لمحتوى NDEF فقط.';

  @override
  String get tagSerialNumber => 'الرقم التسلسلي (UID)';

  @override
  String get tagTechnology => 'التقنية';

  @override
  String get tagType => 'النوع';

  @override
  String get tagUidCopied => 'تم نسخ UID البطاقة';

  @override
  String get tagWritable => 'قابلة للكتابة';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get templateGalleryTitle => 'قوالب جاهزة';

  @override
  String get templateNameHint => 'اسم القالب';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سجلات',
      one: 'سجل واحد',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'تم حفظ القالب بنجاح';

  @override
  String get toolsExpertSection => 'المتقدم';

  @override
  String get toolsFooterNote =>
      'أدوات الذاكرة وكلمة المرور تدعم شرائح NTAG213/215/216 و MIFARE Ultralight EV1. أبقِ البطاقة قريبة من الهاتف.';

  @override
  String get toolsMemorySection => 'الذاكرة';

  @override
  String get toolsSecuritySection => 'الأمان';

  @override
  String get toolsTagSection => 'البطاقة';

  @override
  String get totalBytes => 'الحجم الإجمالي';

  @override
  String get typeTooLarge => 'لا يمكن أن يتجاوز حجم النوع 255 بايت';

  @override
  String get undo => 'تراجع';

  @override
  String get unknownChip16Pages => 'شريحة غير معروفة (أول 16 صفحة)';

  @override
  String get urlSafetyInvalidUrl => 'تنسيق URL غير صالح.';

  @override
  String get urlSafetyIpv4 => 'العنوان الهدف يحتوي على عنوان IPv4 مباشر.';

  @override
  String get urlSafetyIpv6 => 'العنوان الهدف يحتوي على عنوان IPv6 مباشر.';

  @override
  String get urlSafetyMissingScheme => 'مخطط بروتوكول URL مفقود أو غير محدد.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'منفذ شبكة غير قياسي (المنفذ: $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'تم اكتشاف اسم نطاق دولي / Punycode (\"xn--\").';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'مخطط URL غير قياسي: \"$scheme\".';
  }

  @override
  String get urlSafetyUnencrypted => 'اتصال غير مشفر (http://).';

  @override
  String get urlSafetyUserInfo =>
      'يتضمن الرابط بيانات اعتماد (userinfo). مؤشر لاحتمال تصيد احتيالي.';

  @override
  String get usernameCannotBeEmpty => 'اسم المستخدم لا يمكن أن يكون فارغاً.';

  @override
  String get usernameNoSpaces => 'لا يمكن أن يحتوي اسم المستخدم على مسافات.';

  @override
  String get validAndroidPackage =>
      'أدخل اسم حزمة Android صالح (مثال: com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'أدخل عنوان MAC صالح للبلوتوث (مثال: 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'يرجى إدخال رابط فيديو صالح.';

  @override
  String get validWebAddress =>
      'يرجى إدخال عنوان ويب صالح (مثال: https://example.com/file.pdf).';

  @override
  String get verificationNotChecked => 'لم يتم الفحص';

  @override
  String get verificationPassed => 'ناجح';

  @override
  String get videoUrlCannotBeEmpty => 'رابط الفيديو لا يمكن أن يكون فارغاً.';

  @override
  String get videoUrlOrId => 'رابط الفيديو أو معرف YouTube';

  @override
  String get videoUrlOrIdPrompt => 'أدخل رابط الفيديو أو معرف YouTube.';

  @override
  String get wifiAuthOpen => 'مفتوحة (بدون حماية)';

  @override
  String get wifiAuthType => 'نوع الأمان';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'شبكة مخفية';

  @override
  String get wifiPassword => 'كلمة المرور';

  @override
  String get wifiSsid => 'اسم الشبكة (SSID)';

  @override
  String get withSiri => 'باستخدام Siri';

  @override
  String get writeDumpConfirmButton => 'كتابة';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return 'سيتم كتابة \"$name\" ($bytes بايت) إلى الذاكرة. صفحات UID والقفل محمية.';
  }

  @override
  String get writeDumpSubtitle => 'كتابة ملف الذاكرة المحفوظ إلى البطاقة';

  @override
  String get writeDumpTitle => 'كتابة ملف الذاكرة (.bin)';

  @override
  String get writeHeroButton => 'بدء الكتابة';

  @override
  String get writeHeroEyebrow => 'كاتب NDEF';

  @override
  String get writeHeroSubtitle =>
      'جهّز سجلات NDEF متعددة واكتبها على البطاقة دفعة واحدة.';

  @override
  String get writeHeroTitle => 'كتابة البطاقة';

  @override
  String get writeHeroWriting => 'جارٍ الكتابة...';

  @override
  String get writeResultFailed => 'فشلت العملية';

  @override
  String get writeResultSuccess => 'نجحت العملية';

  @override
  String get writeTemplates => 'قوالب الكتابة';

  @override
  String get writeTemplatesSubtitle =>
      'احفظ محتويات NDEF الشائعة كقوالب لتتمكن من كتابتها بنقرة واحدة.';

  @override
  String get yes => 'نعم';
}
