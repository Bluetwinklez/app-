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
  String get appLinksDesc =>
      'عند كتابتها على بطاقة، يؤدي لمسها إلى إظهار إشعار وفتح التطبيق في الشاشة المحددة.';

  @override
  String get appLinksSection => 'روابط التطبيق';

  @override
  String get appPackageName => 'اسم حزمة Android';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'تشغيل تلقائي عند اللمس';

  @override
  String get backupFileSizeExceeded => 'حجم ملف النسخة يتجاوز 2 ميغابايت.';

  @override
  String get backupHistoryMustBeList => 'يجب أن يكون الحقل \"history\" قائمة.';

  @override
  String backupInvalidJson(String error) {
    return 'تنسيق JSON غير صالح: $error';
  }

  @override
  String get backupInvalidRuleNote => 'ملاحظة القاعدة غير صالحة.';

  @override
  String get backupInvalidRuleSha => 'تجزئة SHA-256 للقاعدة غير صالحة.';

  @override
  String get backupInvalidTemplateId => 'معرف القالب غير صالح.';

  @override
  String get backupInvalidTemplateName => 'اسم القالب غير صالح.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
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
  String get clearConfirmMessage =>
      'ستؤدي هذه العملية إلى مسح جميع السجلات وكتابة سجل فارغ. هل تريد المتابعة؟';

  @override
  String get clearConfirmTitle => 'إعادة ضبط محتوى البطاقة';

  @override
  String get clearHistory => 'مسح السجل';

  @override
  String get clearTagSubtitle => 'يحذف جميع السجلات ويكتب NDEF فارغاً';

  @override
  String get clearTagTitle => 'مسح البطاقة';

  @override
  String get close => 'إغلاق';

  @override
  String get commandsEmptyError => 'يرجى إدخال أمر واحد على الأقل.';

  @override
  String get commandsLabel => 'الأوامر';

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
  String get contactPhone => 'الهاتف';

  @override
  String get contactTitle => 'المسمى الوظيفي';

  @override
  String get contactWebsite => 'الموقع الإلكتروني';

  @override
  String get copy => 'نسخ';

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
  String get deleteTemplateTooltip => 'حذف القالب';

  @override
  String get deviceNameTooLong => 'اسم الجهاز طويل جداً.';

  @override
  String get dismiss => 'تجاهل';

  @override
  String get editRecordTitle => 'تعديل السجل';

  @override
  String get emailRecipient => 'البريد المستلم';

  @override
  String get exportBackup => 'تصدير';

  @override
  String get facetimePrompt => 'أدخل رقم الهاتف أو بريد Apple ID.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" لا يمكن أن يكون فارغاً.';
  }

  @override
  String get flashlight => 'الكشاف';

  @override
  String get formatMemorySubtitle =>
      'إعداد البطاقة لـ NDEF (البطاقات الفارغة أو التالفة)';

  @override
  String get formatMemoryTitle => 'تهيئة الذاكرة';

  @override
  String get idTooLarge => 'لا يمكن أن يتجاوز حجم المعرّف 255 بايت';

  @override
  String get importBackup => 'استيراد (دمج)';

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
  String get locationLabel => 'أين مكانها؟';

  @override
  String get lockAcknowledge => 'أدرك أن هذه العملية لا يمكن التراجع عنها';

  @override
  String get lockTagSubtitle =>
      'يجعل البطاقة للقراءة فقط بصورة دائمة (لا يمكن التراجع)';

  @override
  String get lockTagTitle => 'قفل البطاقة';

  @override
  String get manage => 'إدارة';

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
  String get nfcPromptClear => 'قرّب البطاقة من الجهاز لإعادة ضبطها';

  @override
  String get nfcPromptLock => 'قرّب البطاقة لقفلها بشكل دائم';

  @override
  String get nfcPromptScan => 'قرب البطاقة من أعلى الهاتف';

  @override
  String get nfcPromptWrite => 'قرّب بطاقة NFC لحفظ البيانات';

  @override
  String get no => 'لا';

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
      'يشارك بطاقة الاتصال؛ يعرض Android حفظها، وعلى iPhone تُفتح عبر تطبيق NFC.';

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
      'تتصل هواتف Android بالشبكة بلمسة؛ وعلى iPhone تظهر البيانات عبر تطبيق NFC.';

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
  String get rawRecordDetailsTitle => 'تفاصيل السجل (للقراءة فقط)';

  @override
  String get rawRecordEditorTitle => 'تعديل سجل NDEF الخام';

  @override
  String get readHeroButton => 'بدء المسح';

  @override
  String get readMemorySubtitle =>
      'قراءة الذاكرة صفحة بصفحة؛ نسخ أو حفظ بصيغة .bin';

  @override
  String get readMemoryTitle => 'قراءة الذاكرة';

  @override
  String get readyTemplates => 'قوالب جاهزة';

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
  String get redo => 'إعادة';

  @override
  String get removePasswordSubtitle =>
      'إلغاء الحماية باستخدام كلمة المرور المعروفة';

  @override
  String get removePasswordTitle => 'إزالة كلمة المرور';

  @override
  String get rewriteTag => 'إعادة الكتابة';

  @override
  String ruleDeleteConfirm(String note) {
    return 'حذف القاعدة ذات الملاحظة \"$note\"؟';
  }

  @override
  String get ruleNoteDialogTitle => 'تعديل ملاحظة البطاقة';

  @override
  String get ruleNoteLabel => 'الملاحظة المحلية / الوصف';

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
  String get scanFabLabel => 'مسح البطاقة';

  @override
  String get scannedTag => 'البطاقة الممسوحة';

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
  String get socialUsername => 'اسم المستخدم';

  @override
  String get sourceSelectPrompt => 'من أين يتم أخذ محتوى البطاقة؟';

  @override
  String get statusCancelled => 'تم الإلغاء';

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
  String get tabContact => 'جهة اتصال (vCard)';

  @override
  String get tabCustomMime => 'MIME مخصص';

  @override
  String get tabEmail => 'بريد إلكتروني';

  @override
  String get tabPhone => 'هاتف';

  @override
  String get tabSms => 'رسالة SMS';

  @override
  String get tabText => 'نص';

  @override
  String get tabUrl => 'رابط ويب';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => 'معلومات البطاقة';

  @override
  String get tagLibraryTitle => 'مكتبة البطاقات';

  @override
  String tagRulesCount(int count) {
    return 'القواعد / الملاحظات المحفوظة: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'تعرض الملاحظة المحفوظة وفق تجزئة SHA-256 لمحتوى NDEF فقط.';

  @override
  String get tagWritable => 'قابلة للكتابة';

  @override
  String get takePhoto => 'التقاط صورة';

  @override
  String get templateNameHint => 'اسم القالب';

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
  String get verificationNotChecked => 'لم يتم التحقق';

  @override
  String get verificationPassed => 'ناجح';

  @override
  String get videoUrlCannotBeEmpty => 'رابط الفيديو لا يمكن أن يكون فارغاً.';

  @override
  String get videoUrlOrIdPrompt => 'أدخل رابط الفيديو أو معرف YouTube.';

  @override
  String get wifiAuthOpen => 'مفتوحة (بدون حماية)';

  @override
  String get wifiPassword => 'كلمة المرور';

  @override
  String get wifiSsid => 'اسم الشبكة (SSID)';

  @override
  String get withSiri => 'باستخدام Siri';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return 'سيتم كتابة \"$name\" ($bytes بايت) إلى الذاكرة. صفحات UID والقفل محمية.';
  }

  @override
  String get writeDumpSubtitle => 'كتابة ملف الذاكرة المحفوظ إلى البطاقة';

  @override
  String get writeDumpTitle => 'كتابة ملف الذاكرة (.bin)';

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
  String get unknown => 'غير معروف';

  @override
  String get error => 'خطأ';

  @override
  String get nfcPromptReady => 'قرب البطاقة';

  @override
  String get invalidResponseFormat => 'تم استلام تنسيق استجابة غير صالح';

  @override
  String get nfcReadError => 'خطأ في قراءة NFC';

  @override
  String get invalidPlatformResponse => 'تم استلام استجابة غير صالحة من المنصة';

  @override
  String get writeFailed => 'فشلت الكتابة';

  @override
  String get lockFailed => 'فشل القفل';

  @override
  String get failedToConnectTag => 'تعذر الاتصال بالبطاقة';

  @override
  String get invalidTagResponse => 'استجابة غير صالحة من البطاقة';

  @override
  String get commandFailed => 'فشل الأمر';

  @override
  String get ndefTypeOrIdTooLong => 'نوع أو معرف NDEF يتجاوز 255 بايت';

  @override
  String get ndefUnsupportedOrInvalidRecord => 'سجل NDEF غير مدعوم أو غير صالح';

  @override
  String get ndefMissingTypeLength => 'طول نوع NDEF مفقود';

  @override
  String get ndefMissingPayloadLength => 'طول حمولة NDEF مفقود';

  @override
  String get ndefMissingIdLength => 'طول معرف NDEF مفقود';

  @override
  String get ndefMissingType => 'نوع NDEF مفقود';

  @override
  String get ndefMissingId => 'معرف NDEF مفقود';

  @override
  String get ndefMissingPayload => 'حمولة NDEF مفقودة';

  @override
  String get unprotected => '(بدون كلمة مرور)';

  @override
  String get binaryDataPreview => '(بيانات ثنائية)';

  @override
  String get emptyValue => '(فارغ)';

  @override
  String get tnfEmpty => '0: Empty (فارغ)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (غير معروف)';

  @override
  String get tnfUnchanged => '6: Unchanged (مجزأ NDEF)';

  @override
  String get tnfReserved => '7: Reserved (محجوز)';

  @override
  String get ntagUnsupportedChip =>
      'هذه العملية مدعومة فقط على بطاقات NTAG213/215/216 وMIFARE Ultralight EV1.';

  @override
  String ntagPageReadFailed(String page) {
    return 'تعذرت قراءة الصفحة $page (لم تستجب البطاقة أو المنطقة محمية).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'تعذرت كتابة الصفحة $page: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'تعذرت كتابة الصفحة $page (تم الرفض؛ قد تكون مقفلة أو محمية).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'تعذرت القراءة بعد الصفحة $page؛ قد تكون هذه المنطقة محمية بكلمة مرور.';
  }

  @override
  String get ntagPasswordPackSize =>
      'يجب أن تكون كلمة المرور 4 بايت و PACK 2 بايت.';

  @override
  String get ntagPasswordSize => 'يجب أن تكون كلمة المرور 4 بايت.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'كلمة المرور غير صحيحة أو رفضت البطاقة المصادقة.';

  @override
  String get ntagPasswordWrong => 'كلمة المرور غير صحيحة.';

  @override
  String get ntagCcInvalid =>
      'تحتوي منطقة CC على قيمة غير NDEF؛ لا يمكن تهيئة هذه المنطقة.';

  @override
  String get ntagDumpTooShort =>
      'ملف التفريغ قصير جداً؛ لا يحتوي على بيانات المستخدم.';

  @override
  String get ntagInvalidHex => 'أدخل قيمة سداسية عشرية صالحة (مثال: 30 04).';

  @override
  String get googleReviewFieldLabel => 'رابط التقييم أو Place ID';

  @override
  String get menuLinkFieldLabel => 'رابط القائمة';

  @override
  String get menuTitleHint => 'قائمتنا';

  @override
  String get petName => 'اسم الحيوان الأليف';

  @override
  String get ownerPhone => 'هاتف المالك';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'مرحباً، أنا $pet! يرجى الاتصال بمالكي: $phone$note';
  }

  @override
  String get bloodType => 'فصيلة الدم';

  @override
  String get allergies => 'الحساسية / الأدوية';

  @override
  String get emergencyContact => 'جهة اتصال للطوارئ';

  @override
  String get emergencyInfo => 'معلومات الطوارئ';

  @override
  String emergencyBlood(String blood) {
    return 'فصيلة الدم: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'الحساسية: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'في حالة الطوارئ اتصل بـ: $contact';
  }

  @override
  String get storeLink => 'رابط المتجر';

  @override
  String get link => 'رابط';

  @override
  String get title => 'العنوان';

  @override
  String get webAddress => 'عنوان الويب';

  @override
  String get address => 'العنوان';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'القوالب: تمت إضافة $added وتحديث $updated';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'ملاحظات/قواعد البطاقات: تمت إضافة $added وتحديث $updated';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'تم تخطي السجل لأنه معطل على الجهاز: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'السجل: تمت إضافة $added، وتخطي $skipped';
  }

  @override
  String get backupSummaryNoNewData =>
      'لم يتم العثور على بيانات جديدة للاستيراد (متطابقة مع السجلات الحالية).';

  @override
  String backupFieldMustBeString(String field) {
    return 'يجب أن يكون $field نصاً.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return 'يجب أن يكون $field تاريخاً صالحاً.';
  }

  @override
  String get rawTypeHexLabel => 'النوع (بايتات سداسية عشرية)';

  @override
  String get rawIdHexLabel => 'المعرف (بايتات سداسية عشرية، اختياري)';

  @override
  String get rawPayloadHexLabel => 'الحمولة (بايتات سداسية عشرية)';

  @override
  String get rawOptionalHexHint => 'بايتات سداسية عشرية اختيارية';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get edit => 'تعديل';

  @override
  String get clearAllButton => 'مسح الكل';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: تمت قراءة $count من الصفحات';
  }

  @override
  String ntagFormatted(String chip) {
    return 'تمت تهيئة $chip';
  }

  @override
  String get ntagInvalidDumpFile =>
      'ملف تفريغ غير صالح (يجب أن يكون من مضاعفات 4 بايت، 32-1024 بايت).';

  @override
  String ntagPagesWritten(int count) {
    return 'تمت كتابة $count من الصفحات';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: تم تفعيل الحماية بكلمة المرور';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: تمت إزالة كلمة المرور';
  }

  @override
  String get memoryDumpCopied => 'تم نسخ تفريغ الذاكرة';

  @override
  String ntagCommandsSent(int count) {
    return 'تم إرسال $count من الأوامر';
  }

  @override
  String get emptyResponse => '(رد فارغ)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages صفحة · $bytes بايت';
  }

  @override
  String get composeTextEmpty => 'لا يمكن أن يكون محتوى النص فارغاً.';

  @override
  String get composeTextTooLong => 'النص طويل جداً (بحد أقصى 5000 حرف).';

  @override
  String get composeUrlInvalid =>
      'أدخل عنواناً صالحاً (مثال: https://example.com أو رابط app://).';

  @override
  String get composeUrlTooLong => 'الرابط طويل جداً (بحد أقصى 2000 حرف).';

  @override
  String get composeEmailInvalid =>
      'أدخل عنوان بريد إلكتروني صالح (مثال: name@domain.com).';

  @override
  String get composePhoneInvalid => 'أدخل رقم هاتف صالح (مثال: +905551234567).';

  @override
  String get composeSmsPhoneInvalid => 'أدخل رقم هاتف مستلم صالح.';

  @override
  String get composeLatInvalid => 'يجب أن يكون خط العرض بين -90 و +90.';

  @override
  String get composeLngInvalid => 'يجب أن يكون خط الطول بين -180 و +180.';

  @override
  String get composeVcardNameEmpty => 'لا يمكن أن يكون اسم جهة الاتصال فارغاً.';

  @override
  String get composeVcardNameTooLong =>
      'اسم جهة الاتصال طويل جداً (بحد أقصى 200 حرف).';

  @override
  String get composeVcardEmailInvalid => 'أدخل عنوان بريد إلكتروني صالح.';

  @override
  String get composeVcardPhoneInvalid => 'أدخل رقم هاتف صالح.';

  @override
  String get composeVcardUrlInvalid =>
      'أدخل عنوان موقع صالح (مثال: https://...).';

  @override
  String get composeCalSummaryEmpty => 'لا يمكن أن يكون عنوان الفعالية فارغاً.';

  @override
  String get composeCalSummaryTooLong =>
      'عنوان الفعالية طويل جداً (بحد أقصى 250 حرف).';

  @override
  String get composeCalDateInvalid => 'يجب أن يكون وقت الانتهاء بعد وقت البدء.';

  @override
  String get composeSpUriInvalid => 'أدخل رابط وجهة صالح (مثال: https://...).';

  @override
  String get composeSpLangInvalid => 'أدخل رمز لغة ISO صالح (مثال: ar, en).';

  @override
  String get composeMimeTypeInvalid =>
      'أدخل نوع MIME صالح (مثال: application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'أدخل سلسلة سداسية عشرية صالحة (عدد زوجي من الأحرف السداسية عشرية).';

  @override
  String get composeMimePayloadTooLarge =>
      'حجم الحمولة كبير جداً (بحد أقصى 10 كيلوبايت).';

  @override
  String get composeWifiSsidEmpty =>
      'لا يمكن أن يكون اسم الشبكة (SSID) فارغاً.';

  @override
  String get composeWifiPasswordRequired =>
      'كلمة مرور Wi-Fi مطلوبة للشبكات المشفرة.';

  @override
  String get composeWifiPasswordLength =>
      'يجب أن تكون كلمة مرور WPA/WPA2 بين 8 و 63 حرفاً.';

  @override
  String get composeEditNdefRecord => 'تعديل سجل NDEF';

  @override
  String get composeNewNdefRecord => 'إنشاء سجل NDEF جديد';

  @override
  String get quickLinksHeader => 'روابط سريعة';

  @override
  String get quickLinkCustomUri => 'URI مخصص';

  @override
  String get quickLinkSocial => 'شبكات التواصل';

  @override
  String get quickLinkVideo => 'فيديو';

  @override
  String get quickLinkSearch => 'بحث';

  @override
  String get quickLinkFile => 'ملف';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime صوتي';

  @override
  String get quickLinkAddress => 'عنوان';

  @override
  String get quickLinkPayment => 'رابط الدفع';

  @override
  String get quickLinkApp => 'تطبيق (Android)';

  @override
  String get updateRecord => 'تحديث السجل';

  @override
  String get addToList => 'إضافة إلى القائمة';

  @override
  String get quickCustomUriError =>
      'أدخل عنواناً يحتوي على مخطط (مثال: spotify:track:... أو myapp://page).';

  @override
  String get quickFileEmptyMessage => 'أدخل رابط الملف.';

  @override
  String get quickPaymentEmptyMessage => 'أدخل رابط الدفع.';

  @override
  String get quickCustomUriDesc =>
      'يمكن كتابة أي عنوان يبدأ بمخطط؛ سيفتح الهاتف التطبيق الداعم له.';

  @override
  String get quickSocialLabel => 'شبكة التواصل';

  @override
  String get quickVideoLabel => 'رابط الفيديو';

  @override
  String get quickVideoHint => 'https://youtu.be/... أو معرّف الفيديو';

  @override
  String get quickVideoDesc =>
      'رابط YouTube أو Vimeo إلخ، أو معرّف فيديو YouTube فقط.';

  @override
  String get quickSearchHint => 'مثال: طقس القاهرة';

  @override
  String get quickFileLabel => 'رابط الملف';

  @override
  String get quickFileDesc =>
      'نظراً لصغر سعة الشريحة، تتم كتابة رابط الإنترنت بدلاً من الملف نفسه (Google Drive, Dropbox إلخ).';

  @override
  String get quickPhoneOrAppleId => 'الهاتف أو حساب Apple';

  @override
  String get quickFacetimeVideoDesc =>
      'سيبدأ هاتف iPhone يلمس الشريحة مكالمة فيديو عبر FaceTime.';

  @override
  String get quickFacetimeAudioDesc =>
      'سيبدأ هاتف iPhone يلمس الشريحة مكالمة صوتية فقط عبر FaceTime.';

  @override
  String get quickMapProvider => 'تطبيق الخرائط';

  @override
  String get quickAddressHint => 'مثال: شارع التحرير، القاهرة';

  @override
  String get quickPaymentDesc =>
      'يمكن استخدام روابط الدفع مثل PayPal.me و Stripe. لا يتم مطلقاً تخزين معلومات البطاقة على الشريحة.';

  @override
  String get quickAppDesc =>
      'ستفتح هواتف Android هذا التطبيق عند لمسها (أو متجر Play إن لم يكن مثبتاً). يتجاهل iPhone هذا النوع؛ أضف رابط App Store كـ URL.';

  @override
  String get quickDeviceNameOptional => 'اسم الجهاز (اختياري)';

  @override
  String get quickSpeakerHint => 'مثال: مكبر صوت';

  @override
  String get quickBluetoothDesc =>
      'تقترح هواتف Android الاقتران بهذا الجهاز عند لمسها. لا يدعم iPhone شرائح اقتران Bluetooth.';

  @override
  String get composeTextContent => 'محتوى النص';

  @override
  String get composeTextHint => 'أدخل النص الذي ترغب في كتابته';

  @override
  String get composeEmailSubjectOptional => 'الموضوع (اختياري)';

  @override
  String get composeEmailBodyOptional => 'نص الرسالة (اختياري)';

  @override
  String get composeSmsRecipient => 'رقم هاتف المستلم';

  @override
  String get composeSmsHint => 'رسالة SMS للإرسال...';

  @override
  String get composeVcardFullName => 'الاسم الكامل (الاسم المعروض) *';

  @override
  String get composeVcardNameHint => 'أحمد محمد';

  @override
  String get composeVcardNote => 'ملاحظة / وصف';

  @override
  String get composeCalTitle => 'عنوان الفعالية *';

  @override
  String get composeCalTitleHint => 'اجتماع المشروع';

  @override
  String get composeCalLocationHint => 'غرفة الاجتماعات 2 أو عبر الإنترنت';

  @override
  String get composeCalDesc => 'وصف الفعالية';

  @override
  String get composeCalStartEndTime => 'وقت البدء والانتهاء:';

  @override
  String get composeSpTitleLabel => 'العنوان (النص المعروض)';

  @override
  String get composeSpTitleHint => 'كتيب الشركة';

  @override
  String get composeMimeTypeLabel => 'نوع MIME *';

  @override
  String get composeDataFormat => 'تنسيق البيانات: ';

  @override
  String get composeFormatHex => 'سداسي عشري (Hex)';

  @override
  String get composeMimeHexBytes => 'بايتات سداسية عشرية *';

  @override
  String get composeMimeTextPayload => 'نص الحمولة (UTF-8) *';

  @override
  String get composeWifiWarningTitle => 'تنبيه الأمان والمنصة:';

  @override
  String get composeWifiWarningBody =>
      '• يتم تخزين كلمة مرور Wi-Fi كنص عادي غير مشفر ويمكن قراءتها بسهولة من أي شخص.\n• لا يُضمن الاتصال التلقائي بالشبكة عند لمس الشريحة؛ قد يتطلب الأمر تأكيد المستخدم.';

  @override
  String get composeWifiSsidLabel => 'اسم الشبكة (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'نوع الأمان (المصادقة)';

  @override
  String get composeWifiOpenNetwork => 'شبكة مفتوحة (بدون كلمة مرور)';

  @override
  String get composeWifiPasswordLabel => 'كلمة مرور Wi-Fi *';

  @override
  String get composeWifiEncryptionLabel => 'نوع التشفير';

  @override
  String get composeWifiAesRecommended => 'AES (موصى به)';

  @override
  String get quickSearchTextLabel => 'نص البحث';

  @override
  String get readTagMemoryPrompt => 'قرب الشريحة من الهاتف لقراءة الذاكرة';

  @override
  String get readingTagMemoryStatus => 'جارٍ قراءة الذاكرة...';

  @override
  String get formatTagConfirmTitle => 'تهيئة الذاكرة';

  @override
  String get formatTagConfirmMessage =>
      'سيتم مسح بيانات الشريحة وتجهيزها كـ NDEF فارغ. هل تريد المتابعة؟';

  @override
  String get formatButton => 'تهيئة';

  @override
  String get formatTagPrompt => 'قرب الشريحة المراد تهيئتها';

  @override
  String get formattingStatus => 'جارٍ التهيئة...';

  @override
  String filePickerFailed(String error) {
    return 'فشل منتقي الملفات: $error';
  }

  @override
  String get writeButton => 'كتابة';

  @override
  String get writeDumpPrompt => 'قرب الشريحة لكتابة ملف التفريغ';

  @override
  String get writingDumpStatus => 'جارٍ كتابة ملف التفريغ...';

  @override
  String get setPasswordWarning =>
      'إذا نسيت كلمة المرور، فلن تتمكن من تعديل محتوى الشريحة مرة أخرى. تظل القراءة متاحة للجميع.';

  @override
  String get setPasswordAction => 'تعيين كلمة المرور';

  @override
  String get setPasswordPrompt => 'قرب الشريحة لتعيين كلمة المرور';

  @override
  String get settingPasswordStatus => 'جارٍ ضبط كلمة المرور...';

  @override
  String get removePasswordPromptMessage =>
      'أدخل كلمة المرور التي تم تعيينها مسبقاً على الشريحة.';

  @override
  String get remove => 'إزالة';

  @override
  String get removePasswordPrompt => 'قرب الشريحة لإزالة كلمة المرور';

  @override
  String get removingPasswordStatus => 'جارٍ إزالة كلمة المرور...';

  @override
  String get sendCommandsPrompt => 'قرب الشريحة لإرسال الأوامر';

  @override
  String get sendingCommandsStatus => 'جارٍ إرسال الأوامر...';

  @override
  String get sendButton => 'إرسال';

  @override
  String get tagNoteEditTitle => 'تعديل ملاحظة الشريحة';

  @override
  String get tagNoteInputLabel => 'ملاحظة / وصف داخل التطبيق';

  @override
  String get tagNoteInputHint =>
      'مثال: معلومات غرفة الاجتماعات أو رف المستودع #12';

  @override
  String get tagNoteDeleteTitle => 'حذف ملاحظة الشريحة';

  @override
  String get clearAllTagRulesTitle => 'حذف جميع الملاحظات';

  @override
  String get clearAllTagRulesConfirm =>
      'سيتم حذف جميع ملاحظات الشرائح المحفوظة. هل تؤكد ذلك؟';

  @override
  String get deleteAll => 'حذف الكل';

  @override
  String get tagRulesExplanation =>
      'يتم عرض الملاحظة المحفوظة فقط للشرائح المتطابقة مع خلاصة SHA-256. لا يتم إطلاق إجراءات خارجية.';

  @override
  String get noTagRulesDefined => 'لا توجد ملاحظات شرائح محددة بعد.';

  @override
  String lastUpdated(String time) {
    return 'آخر تحديث: $time';
  }

  @override
  String get tagLibraryNoMatch => 'لم يتم العثور على شرائح مطابقة لبحثك.';

  @override
  String get tagLibraryAddToLibrary => 'إضافة إلى المكتبة';

  @override
  String get name => 'الاسم';

  @override
  String get tagLibraryAddTag => 'إضافة شريحة';

  @override
  String get all => 'الكل';

  @override
  String tagLibraryPhotoError(String error) {
    return 'تعذر اختيار الصورة: $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'حذف الشريحة';

  @override
  String get tagLibraryNameHint => 'مثال: ميدالية مفاتيح المكتب';

  @override
  String get tagLibraryNoTagContent => 'لا يوجد محتوى شريحة في هذا السجل.';

  @override
  String get tagLibrarySourceLastScanned => 'آخر مسح';

  @override
  String get tagLibraryEmpty => 'لا توجد شرائح محفوظة بعد.';

  @override
  String get tagLibrarySourceEmpty => 'سجل فارغ';

  @override
  String get tagLibraryNamePrompt => 'يرجى إدخال اسم للشريحة';

  @override
  String get tagLibrarySearchHint => 'البحث بالاسم أو الفئة أو الموقع...';

  @override
  String get tagLibrarySourceWriteList => 'قائمة الكتابة';

  @override
  String get tagLibraryLocationHint => 'مثال: المكتب، الباب الأمامي';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return 'هل أنت متأكد من حذف الشريحة \"$name\" من المكتبة؟';
  }

  @override
  String get noContent => 'لا يوجد محتوى';

  @override
  String tagLibraryRecordSummary(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count سجلات NDEF',
      one: 'سجل NDEF واحد',
    );
    return '$_temp0';
  }

  @override
  String get tagLibraryEditTag => 'تعديل الشريحة';

  @override
  String get rawTypeHexHint => '41 (A) أو 55 (U) إلخ.';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: يجب أن يكون حقل \"records\" قائمة.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: يمكن للعنصر أن يحتوي على $max سجلات NDEF كحد أقصى.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - السجل #$index ليس كائناً صالحاً.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - السجل #$index: قيمة TNF غير صالحة ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - السجل #$index: يجب أن يكون \"type\" نصاً مشفراً بـ Base64.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - السجل #$index: \"type\" ليس بيانات Base64 صالحة ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - السجل #$index: يجب أن يكون \"id\" نصاً مشفراً بـ Base64.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - السجل #$index: \"id\" ليس بيانات Base64 صالحة ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - السجل #$index: يجب أن يكون \"payload\" نصاً مشفراً بـ Base64.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - السجل #$index: \"payload\" ليس بيانات Base64 صالحة ($error).';
  }

  @override
  String get composerUndoSnack => 'تم التراجع عن التغيير الأخير.';

  @override
  String get composerRedoSnack => 'تمت إعادة تطبيق التغيير.';

  @override
  String get noRecordsToCopy => 'لا توجد سجلات NDEF للنسخ.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return 'تم نسخ $count سجلات NDEF ($bytes بايت) إلى الحافظة.\n(يتم نسخ محتوى NDEF فقط؛ لا يتم استنساخ المعرّف أو القطاعات المشفرة)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: تمت إضافة $count سجلات.';
  }

  @override
  String get tagEmptyNoRecordsToImport =>
      'الشريحة فارغة؛ لا توجد سجلات للاستيراد.';

  @override
  String get sourceTag => 'من الشريحة';

  @override
  String get sourceQr => 'من رمز QR';

  @override
  String filePickerError(String error) {
    return 'تعذّر فتح منتقي الملفات: $error';
  }

  @override
  String get csvFileTooLarge => 'ملف CSV كبير جداً (بحد أقصى 512 كيلوبايت).';

  @override
  String get noRecordsFound => 'لم يتم العثور على سجلات';

  @override
  String get someRowsSkipped => 'تم تخطي بعض الصفوف';

  @override
  String get expectedFormat => 'التنسيق المتوقع:';

  @override
  String get noClipboardContent => 'لا يوجد محتوى NDEF منسوخ في الحافظة.';

  @override
  String get pasteFromClipboardTitle => 'لصق من حافظة NDEF';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'بيانات الحافظة: $count سجلات، $bytes بايت ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      'هل ترغب في استبدال السجلات الحالية أم إضافتها في النهاية؟';

  @override
  String get pasteOverwriteOption => 'الكتابة فوق السجلات (استبدال)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'سيتم حذف السجلات الحالية البالغ عددها $count واستبدالها بمحتوى الحافظة (يتطلب تأكيداً).';
  }

  @override
  String get pasteEmptySubtitle => 'يتم وضع محتوى الحافظة في المنشئ.';

  @override
  String get pasteAppendOption => 'إضافة إلى النهاية';

  @override
  String get pasteAppendSubtitle =>
      'يتم الاحتفاظ بالسجلات الحالية، وتتم إضافة سجلات الحافظة إلى نهاية القائمة.';

  @override
  String recordsAddedToComposer(num count) {
    return 'تمت إضافة $count سجلات.';
  }

  @override
  String get confirmOverwriteTitle => 'هل تريد الكتابة فوق السجلات؟';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'يوجد $currentCount سجلات حالياً. سيتم استبدالها بـ $newCount سجلات من الحافظة. متابعة؟';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'تم استبدال السجلات بـ $count سجلات.';
  }

  @override
  String get yesReplace => 'نعم، استبدل';

  @override
  String recordsImportedToComposer(num count) {
    return 'تم استيراد $count سجلات.';
  }

  @override
  String get noContentToCopy => 'لم يتم العثور على محتوى NDEF للنسخ.';

  @override
  String recordsCopiedAndStaged(num count) {
    return 'تم نسخ $count سجلات وإضافتها (تم نسخ المحتوى، لا يتم استنساخ المعرّف).';
  }

  @override
  String get noContentToRewrite =>
      'لم يتم العثور على محتوى NDEF لإعادة كتابته.';

  @override
  String get rewriteTagTitle => 'إعادة كتابة الشريحة';

  @override
  String get importantNotice => 'تنبيه هام:';

  @override
  String get rewriteNotice1 =>
      '• هذه العملية تكتب فوق محتوى NDEF الحالي بالكامل؛ لا تضيف في النهاية.\n';

  @override
  String get rewriteNotice2 =>
      '• يجب أن تكون الشريحة المستهدفة قابلة للكتابة (غير مقفلة).\n';

  @override
  String get rewriteNotice3 =>
      '• لا تتم الكتابة تلقائياً على الشريحة السابقة؛ يلزم لمس NFC جديد.';

  @override
  String get rewriteInstruction =>
      'جهز الشريحة واضغط على \"المس واكتب\" ثم قرب الشريحة من الهاتف.';

  @override
  String get tapAndWrite => 'المس واكتب';

  @override
  String get rewritePromptMessage =>
      'قرب الشريحة المستهدفة من الجهاز (سيتم تجديد المحتوى بالكامل)';

  @override
  String get writeVerifiedTitle => 'تم التحقق من الكتابة';

  @override
  String get writeVerifiedDesc =>
      'تمت كتابة محتوى NDEF والتحقق منه بنجاح على الشريحة.';

  @override
  String get writeVerifiedHint =>
      'يمكنك بدء المسح التالي للتحقق من البيانات المكتوبة أو مقارنتها.';

  @override
  String get scanAndCompareNow => 'امسح وقارن الآن';

  @override
  String get contentMatchesExactly => 'المحتوى متطابق تماماً';

  @override
  String get differenceDetected => 'تم اكتشاف اختلاف';

  @override
  String get compareMatchDesc =>
      'رسالة NDEF على الشريحة المستهدفة تطابق رسالة المصدر بايت ببايت تماماً.';

  @override
  String get compareDiffDesc =>
      'توجد فروق بين البيانات المقروءة والبيانات المراد كتابتها. تحقق مما إذا كانت الشريحة مقفلة.';

  @override
  String get batchEmptyComposerError =>
      'أضف سجلاً واحداً على الأقل قبل بدء الكتابة المجمعة.';

  @override
  String get batchWriteTitle => 'كتابة الشرائح المجمعة';

  @override
  String get batchWriteSubtitle =>
      'اكتب محتوى NDEF نفسه على عدة شرائح بالتتابع.';

  @override
  String get attention => 'انتباه:';

  @override
  String get batchNotice1 =>
      '• لمنع الكتابة المزدوجة بالخطأ، يجب تشغيل كل كتابة يدوياً بالضغط على \"اكتب التالي\".\n';

  @override
  String get batchNotice2 =>
      '• لا يتم المسح المتتالي تلقائياً؛ يجب استبدال كل شريحة يدوياً.';

  @override
  String get batchStartButton => 'بدء الكتابة المجمعة';

  @override
  String get batchControlPanelTitle => 'لوحة تحكم الكتابة المجمعة';

  @override
  String get batchCancelOrClose => 'إلغاء / إغلاق';

  @override
  String get batchAllCompleted => 'اكتملت جميع محاولات الشرائح!';

  @override
  String batchStats(String ok, String failed, String left) {
    return 'ناجح: $ok | فاشل: $failed | متبقٍ: $left';
  }

  @override
  String get waitingForTag => 'في انتظار الشريحة...';

  @override
  String get batchFinishButton => 'إنهاء الكتابة المجمعة';

  @override
  String get writeError => 'خطأ في الكتابة';

  @override
  String get batchConfirmCancelTitle => 'إلغاء الكتابة المجمعة';

  @override
  String get batchConfirmCancelMessage =>
      'هل تريد إنهاء جلسة الكتابة المجمعة؟ يتم الاحتفاظ بالشرائح المكتوبة؛ ولن تُكتب الشرائح المتبقية.';

  @override
  String get cancelled => 'ملغى';

  @override
  String get batchCancelledSnack =>
      'تم إلغاء الكتابة المجمعة. تم الاحتفاظ بمحتواك.';

  @override
  String get cancelAndClose => 'إلغاء وإغلاق';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'فحص الروابط دون اتصال';

  @override
  String get urlSafetyScheme => 'المخطط (البروتوكول):';

  @override
  String get urlSafetyPort => 'المنفذ:';

  @override
  String get urlSafetyUserInfoLabel => 'معلومات المستخدم:';

  @override
  String get urlSafetyIpLiteral => 'عنوان IP مباشر:';

  @override
  String get urlSafetyDomain => 'لا (اسم النطاق)';

  @override
  String get urlSafetyPunycodeLabel => 'دولي / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => 'نعم (اشتباه تشابه حروف)';

  @override
  String get urlSafetyWarningsHeader => 'تنبيهات الأمان والتحذير:';

  @override
  String get urlSafetyDisclaimer =>
      'ملاحظة: هذا التحليل محلي تماماً دون اتصال. لا يدعي فحص البرامج الضارة عبر الشبكة. لا يفتح الرابط تلقائياً.';

  @override
  String get templateSaveEmptyError => 'أضف سجلات قبل الحفظ كقالب.';

  @override
  String templateDefaultName(String n) {
    return 'قالب $n';
  }

  @override
  String get templateNameSample => 'مثال: موقع الشركة وجهات الاتصال';

  @override
  String get templateSavedSnack => 'تم حفظ القالب.';

  @override
  String get ruleNoteRequiresNdef =>
      'يجب أن تحتوي الشريحة على سجل NDEF واحد على الأقل لإضافة ملاحظة.';

  @override
  String get ruleNoteAddTitle => 'إضافة ملاحظة مخصصة للشريحة';

  @override
  String get ruleNoteDigestExplanation =>
      'ترتبط هذه الملاحظة بملخص SHA-256 لمحتوى NDEF. يظهر هذا الوصف فقط عند المسح.';

  @override
  String get ruleNoteSavedSnack => 'تم حفظ ملاحظة الشريحة.';

  @override
  String get ruleNoteDeleteConfirm =>
      'سيتم حذف الملاحظة المسجلة لهذه الشريحة. متابعة؟';

  @override
  String get ruleNoteDeletedSnack => 'تم حذف ملاحظة الشريحة.';

  @override
  String get backupExportTitle => 'تصدير النسخة الاحتياطية';

  @override
  String get backupExportWarningTitle => 'تحذير الخصوصية والأمان';

  @override
  String get backupExportWarningBody =>
      'ملف النسخ الاحتياطي (JSON) هو نص عادي. قد يحتوي على بيانات حساسة ككلمات مرور Wi-Fi أو جهات الاتصال. احفظه بأمان.';

  @override
  String get backupIncludedItems => 'العناصر المضمنة:';

  @override
  String backupTemplatesCount(String count) {
    return '• القوالب: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• ملاحظات/قواعد الوسوم: $count';
  }

  @override
  String get backupIncludeHistoryOptional => 'تضمين سجل المسح (اختياري)';

  @override
  String backupHistoryCount(String count) {
    return '$count من سجلات السجل';
  }

  @override
  String get backupHistoryDisabled => 'سجل المسح معطل على هذا الجهاز';

  @override
  String get backupExportAndShare => 'تصدير ومشاركة';

  @override
  String get backupFileNameLabel => 'ملف النسخ الاحتياطي لـ NFC Tag Master';

  @override
  String get backupFileShareSubject =>
      'نسخ احتياطي لقوالب وبيانات NFC Tag Master (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'تم تصدير ملف النسخة الاحتياطية ومشاركته بنجاح.';

  @override
  String get backupExportCancelled => 'تم إلغاء مشاركة التصدير.';

  @override
  String get backupImportTitle => 'استيراد النسخة الاحتياطية';

  @override
  String get backupMergeRuleTitle => 'قاعدة الأمان والدمج';

  @override
  String get backupMergeRule1 =>
      '• يعمل الاستيراد بأسلوب الدمج (MERGE)؛ ولا يتم حذف سجلاتك الحالية أبداً.\n';

  @override
  String get backupMergeRule2 =>
      '• قد يحتوي الملف على كلمات مرور Wi-Fi أو بيانات شخصية؛ قم بالتحميل من مصادر موثوقة فقط.\n';

  @override
  String get backupMergeRule3 =>
      '• الحد الأقصى للحجم: 2 ميجابايت. تخضع البيانات للتحقق الصارم من المخطط و Base64 قبل التحميل.';

  @override
  String get backupSelectFilePrompt => 'حدد ملف نسخ احتياطي .json صالح لدمجه.';

  @override
  String get selectFileButton => 'اختيار ملف';

  @override
  String get fileSelectionCancelled => 'تم إلغاء اختيار الملف.';

  @override
  String get backupFileExceedsLimit =>
      'يتجاوز الملف المحدد الحد المسموح به وهو 2 ميجابايت.';

  @override
  String fileReadError(String error) {
    return 'خطأ في قراءة الملف: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'خطأ في التحقق من النسخة: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'تم اكتشاف سجل المسح';

  @override
  String get backupHistoryDetectedPrompt =>
      'هل ترغب في استيراد السجل وتفعيله؟ أم تخطيه واستيراد القوالب والملاحظات فقط؟';

  @override
  String get backupSkipHistoryOption =>
      'تخطي السجل (تحميل القوالب والملاحظات فقط)';

  @override
  String get backupEnableHistoryOption => 'تفعيل السجل وتحميله';

  @override
  String get nfcReadyStatus => 'NFC جاهز';

  @override
  String get nfcReadyDesc => 'شريحة NFC نشطة وجاهزة للاستخدام';

  @override
  String get nfcDisabledStatus => 'NFC معطل';

  @override
  String get nfcDisabledDesc => 'NFC مغلق. يرجى تفعيله من إعدادات الجهاز.';

  @override
  String get template => 'قالب';

  @override
  String get nfcScannerTitle => 'ماسح NFC';

  @override
  String get composeRecord => 'إنشاء سجل';

  @override
  String get protectOrRemove => 'حماية / إزالة';

  @override
  String get previousScans => 'عمليات المسح السابقة';

  @override
  String get noScannedTagYet => 'لم يتم مسح أي شريحة NFC بعد';

  @override
  String get tapScanPrompt => 'اضغط على \"بدء المسح\" وقرب الشريحة من الهاتف.';

  @override
  String get ndefCopyAndRewriteTitle => 'نسخ محتوى NDEF وإعادة كتابته';

  @override
  String get savedTagNoteHeader => 'ملاحظة الشريحة المحفوظة (قاعدة في التطبيق)';

  @override
  String get tagNoteOrRule => 'ملاحظة / قاعدة الشريحة';

  @override
  String get editNote => 'تعديل الملاحظة';

  @override
  String get deleteNote => 'حذف الملاحظة';

  @override
  String get tagNoteDigestNotice =>
      'تتطابق هذه الملاحظة مع ملخص SHA-256 لبايتات NDEF بالضبط. لا تطلق إجراءات خارجية.';

  @override
  String get addCustomTagNotePrompt =>
      'يمكنك إضافة ملاحظة محلية مخصصة أو وصف لمحتوى NDEF هذا.';

  @override
  String get addNoteToThisTag => 'إضافة ملاحظة إلى هذه الشريحة';

  @override
  String get ndefSupport => 'دعم NDEF:';

  @override
  String get usedSpace => 'المساحة المستخدمة:';

  @override
  String get freeSpace => 'المساحة المتبقية:';

  @override
  String get noNdefMessageOnTag => 'لم يتم العثور على رسالة NDEF على الشريحة.';

  @override
  String get hideDetails => 'إخفاء التفاصيل';

  @override
  String get advancedRecordInspector => 'فاحص السجلات (متقدم)';

  @override
  String get ndefRecordInspectorTitle => 'فاحص سجلات NDEF المتقدم';

  @override
  String get inspectorType => 'النوع:';

  @override
  String get inspectorPayloadLength => 'طول الحمولة:';

  @override
  String get inspectorRawHexPreview => 'معاينة Hex الأولية (محدودة):';

  @override
  String get ndefRecordsToWriteTitle => 'سجلات NDEF المراد كتابتها';

  @override
  String get pasteFromClipboardAction => 'لصق من الحافظة (استبدال / إضافة)';

  @override
  String get importAction => 'استيراد';

  @override
  String get importFromTagAction => 'استيراد من شريحة NFC';

  @override
  String get importFromQrAction => 'استيراد من رمز QR';

  @override
  String get importFromCsvAction => 'استيراد من ملف CSV';

  @override
  String get composerEmptyDescription =>
      'يمكنك كتابة النصوص والروابط و Wi-Fi والهاتف والبريد وبطاقات الاتصال والمزيد على الشرائح.';

  @override
  String get urlSafetyReview => 'فحص الرابط';

  @override
  String get inspector => 'الفاحص';

  @override
  String get typeLabel => 'النوع:';

  @override
  String get payloadLabel => 'الحمولة:';

  @override
  String get writeAndVerify => 'الكتابة على الشريحة والتحقق';

  @override
  String get batchWriteButtonLabel => 'كتابة مجمعة للشرائح (2..100 شريحة)';

  @override
  String get clearTagButtonLabel => 'إعادة ضبط الشريحة (مسح المحتوى)';

  @override
  String get confirmWriteTitle => 'تأكيد الكتابة على الشريحة';

  @override
  String get confirmWriteMessage1 =>
      'ستقوم هذه العملية بالكتابة فوق محتوى NDEF الحالي بالكامل على الشريحة.';

  @override
  String get confirmWriteMessage2 =>
      'تأكد من أن الشريحة قابلة للكتابة. سيتم التحقق من المحتوى تلقائياً بعد الكتابة.';

  @override
  String get yesWrite => 'نعم، اكتب';

  @override
  String get scanHistoryDisabledTitle => 'سجل المسح معطل';

  @override
  String get scanHistoryDisabledDesc =>
      'للخصوصية، لا يتم حفظ سجل المسح افتراضياً. يمكنك تفعيله من تبويب الإعدادات.';

  @override
  String get enableHistory => 'تفعيل السجل';

  @override
  String get historySearchHint =>
      'البحث بالمعرّف أو النص أو النوع (مثال: URL, Wi-Fi, 04A1...)';

  @override
  String get noHistoryYet => 'لا يوجد سجل مسح محفوظ بعد.';

  @override
  String get tryDifferentQuery => 'جرب معرّفاً أو نصاً أو نوع سجل مختلفاً.';

  @override
  String get clearSearch => 'مسح البحث';

  @override
  String get deleteThisRecord => 'حذف هذا السجل';

  @override
  String get qrPreview => 'معاينة QR';

  @override
  String get lockTagConfirmTitle => 'قفل الشريحة بشكل دائم';

  @override
  String get lockTagWarning2 => 'تأكد من كتابة المحتوى الصحيح أولاً.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'معاينة رمز QR';

  @override
  String get unknownParentheses => '(غير معروف)';

  @override
  String get ok => 'موافق';

  @override
  String rewriteSourceUid(String uid) {
    return 'معرّف المصدر UID: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return 'السجلات المراد كتابتها: $count';
  }

  @override
  String rewriteFailed(String message) {
    return 'فشلت إعادة الكتابة: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return 'السجلات المكتوبة: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'UID الوسم الممسوح: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return 'البيانات المكتوبة: $count سجلات ($bytes بايت)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'البيانات الممسوحة: $count سجلات ($bytes بايت)';
  }

  @override
  String batchTargetCount(String count) {
    return 'عدد الوسوم المستهدفة: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return 'قائمة الكتابة: $count سجلات ($bytes بايت)';
  }

  @override
  String batchNext(String current, String total) {
    return 'التالي: الوسم #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return 'نجح ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return 'فشل: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'الوسم #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'المس واكتب الوسم #$n';
  }

  @override
  String batchPrompt(String current, String total) {
    return 'كتابة دفعية: قرّب الوسم #$current / $total';
  }

  @override
  String batchWrittenVerified(String count) {
    return 'تمت كتابة $count سجلات والتحقق منها';
  }

  @override
  String templateLoaded(String name) {
    return 'تمت إضافة سجلات \"$name\" إلى قائمة الكتابة.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'بصمة محتوى NDEF (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return 'خطأ في التصدير: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'تحتوي النسخة على $count من سجلات المسح، لكن السجل متوقف على هذا الجهاز.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'نجح الاستيراد:\n$summary';
  }

  @override
  String mergeError(String error) {
    return 'خطأ في الدمج: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'حافظة NDEF: $count سجلات ($bytes ب) - $source';
  }

  @override
  String get heroScanSubtitle =>
      'قرّب الوسم من أعلى الهاتف؛ يظهر المحتوى والسعة والرقم التسلسلي فورًا.';

  @override
  String lastTagLabel(String uid) {
    return 'آخر وسم: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'خطأ في المسح: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count سجلات ($bytes بايت) - تُنسخ بيانات NDEF فقط دون UID.';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'الوسم $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'خطأ: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return 'سجلات NDEF المقروءة ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return 'سجلات NDEF المراد كتابتها ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return 'ملاحظة: الحمولة $bytes بايت، لذا تُعرض أول 64 بايت فقط.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return 'الحجم الإجمالي: $bytes بايت | السجلات: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return 'اكتب وتحقق ($bytes بايت)';
  }

  @override
  String savedScansCount(String count) {
    return 'عمليات المسح المحفوظة: $count';
  }

  @override
  String historyNoResults(String query) {
    return 'لا توجد نتائج لـ \"$query\".';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count سجلات';
  }

  @override
  String historyCapacity(String max, String used) {
    return 'السعة: $max ب | المستخدم: $used ب';
  }

  @override
  String historySourceLabel(String uid) {
    return 'السجل UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count سجلات | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return 'القواعد/الملاحظات المحفوظة: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return 'البايتات المكتوبة: $bytes | التحقق: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'يصبح الوسم المقفل للقراءة فقط: لا يمكن أبدًا تغيير محتواه أو مسحه، ولا يمكن إزالة القفل. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'حجم الرسالة: $bytes بايت';
  }

  @override
  String bytesShort(String bytes) {
    return 'البايتات: $bytes ب';
  }

  @override
  String bytesValue(String bytes) {
    return '$bytes بايت';
  }

  @override
  String bytesOfCapacity(String bytes, String max) {
    return '$bytes / $max بايت';
  }

  @override
  String get valueNone => 'لا يوجد';

  @override
  String get valueYesIp => 'نعم (عنوان IP)';

  @override
  String get nfcMissingShort => 'لا NFC';

  @override
  String get clearClipboard => 'مسح الحافظة';

  @override
  String get statLibrary => 'المكتبة';

  @override
  String get scanTagTitle => 'مسح الوسم';

  @override
  String get readingInProgress => 'جارٍ القراءة...';

  @override
  String get rawMemorySubtitle => 'الذاكرة الخام';

  @override
  String get copyToClipboard => 'نسخ إلى الحافظة';

  @override
  String get serialUidLabel => 'الرقم التسلسلي (UID):';

  @override
  String get totalCapacityLabel => 'السعة الإجمالية:';

  @override
  String get technologiesLabel => 'التقنيات:';

  @override
  String get idLabel => 'المعرّف (ID):';

  @override
  String get undoTooltip => 'تراجع';

  @override
  String get clearComposer => 'مسح القائمة';

  @override
  String composerTotalSize(String bytes) {
    return 'الحجم الإجمالي: $bytes بايت';
  }

  @override
  String get yesClear => 'نعم، امسح';

  @override
  String get ssidTooLong => 'لا يمكن أن يتجاوز SSID ‏32 بايت.';

  @override
  String get locationPlace => 'الموقع / المكان';

  @override
  String get targetWebUrl => 'عنوان URL الهدف *';

  @override
  String get languageCodeLabel => 'رمز اللغة (ISO 639-1) *';

  @override
  String get utf8Text => 'نص UTF-8';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf، الحجم: $bytes بايت';
  }

  @override
  String get quickGallerySubtitle => 'جاهز بلمسة واحدة';

  @override
  String get quickLibraryTitle => 'مكتبتي';

  @override
  String get quickLibrarySubtitle => 'الوسوم المحفوظة';

  @override
  String get saveToLibrary => 'حفظ في المكتبة';

  @override
  String libraryMatch(String name) {
    return 'في مكتبتك: $name';
  }

  @override
  String tagChipLabel(String chip) {
    return 'الشريحة: $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return 'الشركة المصنّعة: $name';
  }

  @override
  String get settingsLibrarySubtitle => 'وسومك مع الأسماء والملاحظات والصور';

  @override
  String get showOnboardingAgain => 'عرض المقدمة مرة أخرى';

  @override
  String get importFromGallery => 'إضافة من القوالب الجاهزة';

  @override
  String get appearanceTitle => 'المظهر';

  @override
  String get themeSystem => 'النظام';

  @override
  String get themeLight => 'فاتح';

  @override
  String get themeDark => 'داكن';

  @override
  String get valuePresentRisky => 'موجود (قد يكون خطرًا)';

  @override
  String get supportedValue => 'مدعوم';

  @override
  String get notSupportedValue => 'غير مدعوم';

  @override
  String get nfcUnsupportedDesc => 'هذا الجهاز لا يدعم NFC';

  @override
  String get ndefTrailingData => 'بيانات زائدة بعد رسالة NDEF';

  @override
  String get ndefMissingEnd => 'نهاية رسالة NDEF مفقودة';

  @override
  String vcardPhoneShort(String value) {
    return 'الهاتف: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'البريد: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return 'الشركة: $value';
  }

  @override
  String get pageUidLock => 'UID / قفل';

  @override
  String get pageData => 'بيانات';

  @override
  String get pageLock => 'قفل';

  @override
  String memoryPageLine(String page) {
    return 'صفحة $page';
  }

  @override
  String get socialWhatsappPhone => 'واتساب (هاتف)';

  @override
  String get mapApple => 'خرائط Apple';

  @override
  String get mapGoogle => 'خرائط Google';

  @override
  String get whatsappMessageHint => 'مرحبًا، أود الحصول على معلومات';

  @override
  String get facetimeTargetHint => '‎+9665xxxxxxxx أو name@icloud.com';

  @override
  String get bluetoothMacLabel => 'عنوان MAC للبلوتوث';

  @override
  String get webAddressUrlLabel => 'عنوان الويب (URL)';

  @override
  String get latitudeLabel => 'خط العرض (Lat)';

  @override
  String get longitudeLabel => 'خط الطول (Lng)';

  @override
  String get emailAddressLabel => 'عنوان البريد';

  @override
  String get websiteLabel => 'الموقع الإلكتروني';

  @override
  String get wifiAuthWpa2Home => 'WPA2 Personal (معيار المنزل/المكتب)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 Personal (مختلط)';

  @override
  String get hostLabel => 'المضيف:';

  @override
  String get readOnlyLocked => 'للقراءة فقط (مقفل)';

  @override
  String get redoTooltip => 'إعادة';

  @override
  String historyFoundCount(String found, String total) {
    return 'تم العثور: $found / $total';
  }

  @override
  String get addToWriteListShort => 'إضافة إلى القائمة';

  @override
  String get mimeTypeHint => 'application/json أو text/plain';

  @override
  String get hapticsToggle => 'الاهتزاز';

  @override
  String get hapticsToggleSubtitle =>
      'اهتزاز قصير عند انتهاء القراءة أو الكتابة';

  @override
  String get soundsToggle => 'الأصوات';

  @override
  String get soundsToggleSubtitle => 'تشغيل صوت نظام قصير عند النتيجة';

  @override
  String get backupLibraryMustBeList => 'يجب أن تكون مكتبة الوسوم قائمة.';

  @override
  String get backupInvalidLibraryEntry => 'إدخال مكتبة غير صالح.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'يمكن أن تحتوي المكتبة على $max إدخال كحد أقصى.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'المكتبة: أضيف $added';
  }

  @override
  String backupLibraryCount(String count) {
    return '• المكتبة: $count (بدون صور)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return 'آخر وسم: $bytes / $max ب';
  }

  @override
  String get contentTooLargeForChips =>
      'كبير جدًا على الوسوم الشائعة؛ اختصر النص أو استخدم رابطًا قصيرًا.';

  @override
  String get tagReportTitle => 'تقرير الوسم';

  @override
  String get tagReportSubtitle => 'الشريحة والأقفال وكلمة المرور والاستخدام';

  @override
  String get tagReportPrompt => 'قرّب الوسم لفحصه';

  @override
  String get tagReportBusy => 'جارٍ فحص الوسم...';

  @override
  String tagReportDone(String chip) {
    return 'التقرير جاهز: $chip';
  }

  @override
  String get unknownChip => 'شريحة غير معروفة';

  @override
  String get yes => 'نعم';

  @override
  String get reportChip => 'الشريحة';

  @override
  String get reportNdefFormatted => 'بتنسيق NDEF';

  @override
  String get reportWritable => 'قابل للكتابة';

  @override
  String get reportStaticLock => 'قفل ثابت';

  @override
  String get reportDynamicLock => 'قفل ديناميكي';

  @override
  String get reportPassword => 'حماية بكلمة مرور';

  @override
  String get reportReadProtected => 'محمي من القراءة';

  @override
  String get reportNdefUsage => 'استخدام NDEF';

  @override
  String get reportVerdictWritable => 'الوسم جاهز للكتابة';

  @override
  String get reportVerdictRestricted => 'الوسم مقيّد';

  @override
  String get reportCopied => 'تم نسخ التقرير';

  @override
  String get compareTagsTitle => 'مقارنة وسمين';

  @override
  String get compareTagsSubtitle => 'تحقّق من تطابق النسخة مع الأصل';

  @override
  String get compareStepFirst => 'امسح أولًا الوسم الأول (الأصلي).';

  @override
  String get compareStepSecond => 'امسح الآن الوسم الثاني.';

  @override
  String get compareIdentical => 'المحتوى متطابق';

  @override
  String get compareDifferent => 'المحتوى مختلف';

  @override
  String get compareSameTag => 'تم مسح الوسم نفسه مرتين.';

  @override
  String get compareDifferentTags => 'وسمان مختلفان.';

  @override
  String get compareRecordSame => 'متطابق';

  @override
  String get compareRecordChanged => 'مختلف';

  @override
  String get compareRecordOnlyFirst => 'في A فقط';

  @override
  String get compareRecordOnlySecond => 'في B فقط';

  @override
  String get compareBothEmpty => 'الوسمان فارغان.';

  @override
  String capacityExceededShort(String needed, String max) {
    return 'المحتوى كبير جدًا: $needed / $max بايت';
  }

  @override
  String get verifyFailedAfterWrite =>
      'تعذّر التحقق من البيانات؛ أبقِ الوسم مدة أطول.';

  @override
  String get blankTagTitle => 'الوسم غير جاهز بعد';

  @override
  String get blankTagBody =>
      'هذا الوسم جديد وغير مهيأ لـ NDEF. يمكن للتطبيق تجهيزه وكتابة المحتوى بلمسة واحدة (NTAG وMIFARE Ultralight).';

  @override
  String get blankTagAction => 'جهّز واكتب';

  @override
  String get shareTag => 'مشاركة';

  @override
  String get shareAsText => 'مشاركة كنص';

  @override
  String get shareAsFile => 'مشاركة كملف (.json)';

  @override
  String get shareAsFileSubtitle => 'يمكن كتابة السجلات كما هي على جهاز آخر';

  @override
  String get importFromJsonFile => 'من ملف وسم (.json)';

  @override
  String get invalidTagFile => 'ملف وسم غير صالح.';

  @override
  String get continuousScanTitle => 'مسح مستمر';

  @override
  String get continuousScanSubtitle =>
      'امسح الوسوم تباعًا وشارك القائمة بصيغة CSV';

  @override
  String continuousScanCount(String count) {
    return 'تم مسح $count وسم';
  }

  @override
  String get exportCsv => 'مشاركة بصيغة CSV';

  @override
  String get clearList => 'مسح القائمة';

  @override
  String get csvColumnTime => 'الوقت';

  @override
  String get csvColumnRecords => 'السجلات';

  @override
  String get csvColumnContent => 'المحتوى';

  @override
  String get csvColumnCapacity => 'السعة (ب)';

  @override
  String get csvColumnUsed => 'المستخدم (ب)';

  @override
  String get batchSerialToggle => 'إضافة أرقام تسلسلية';

  @override
  String batchSerialHint(String token) {
    return 'اكتب $token في سجل لوضع الرقم فيه؛ وإلا يُضاف إلى كل وسم سجل نصي منفصل يحمل الرقم.';
  }

  @override
  String get batchSerialPrefix => 'البادئة';

  @override
  String get batchSerialStart => 'البداية';

  @override
  String get batchSerialDigits => 'الخانات';

  @override
  String batchSerialPreview(String first, String last) {
    return 'الأول: $first · الأخير: $last';
  }

  @override
  String get batchFromCsvButton => 'من ملف CSV (سطر لكل وسم)';

  @override
  String get batchCsvTitle => 'كتابة دفعية من CSV';

  @override
  String batchCsvSummary(String count) {
    return 'ستتم كتابة $count وسمًا. يحصل كل وسم على سطر من ملف CSV بالترتيب.';
  }

  @override
  String batchCsvTruncated(String max) {
    return 'تستخدم الكتابة الدفعية $max سطرًا كحد أقصى؛ وتم تخطي الباقي.';
  }

  @override
  String get cloneTagTitle => 'نسخ وسم';

  @override
  String get cloneTagSubtitle => 'اقرأ وسمًا واكتب محتواه على وسوم أخرى';

  @override
  String get cloneSourceStep =>
      'الخطوة 1: امسح الوسم المصدر. يُنسخ محتوى NDEF فقط؛ ولا يمكن نسخ UID.';

  @override
  String get cloneSourceEmpty => 'لا يحتوي الوسم المصدر على سجلات NDEF للنسخ.';

  @override
  String get cloneReadyTitle => 'تمت قراءة المصدر';

  @override
  String cloneReadySummary(String count, String bytes) {
    return 'سيتم نسخ $count سجل ($bytes بايت). اختر عدد الوسوم.';
  }

  @override
  String get cloneEditFirst => 'عدّل أولاً';

  @override
  String get tapPreviewTitle => 'ماذا يحدث عند لمس الهاتف؟';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'الوسم فارغ؛ لن يحدث شيء.';

  @override
  String tapIosUrl(String target) {
    return 'يظهر إشعار؛ وعند لمسه يُفتح $target في Safari أو التطبيق المناسب.';
  }

  @override
  String tapAndroidUrl(String target) {
    return 'يُفتح $target مباشرة في المتصفح أو التطبيق المناسب.';
  }

  @override
  String tapIosApp(String target) {
    return 'يظهر إشعار؛ ويُفتح التطبيق عبر \"$target\" إن كان مثبتًا.';
  }

  @override
  String tapAndroidApp(String target) {
    return 'يُفتح التطبيق عبر \"$target\" إن كان مثبتًا.';
  }

  @override
  String tapIosCall(String target) {
    return 'يظهر إشعار؛ وعند لمسه يتم الاتصال بـ $target.';
  }

  @override
  String tapAndroidCall(String target) {
    return 'يُفتح تطبيق الهاتف بالرقم $target.';
  }

  @override
  String tapIosSms(String target) {
    return 'يظهر إشعار؛ ويفتح تطبيق الرسائل رسالة جديدة إلى $target.';
  }

  @override
  String tapAndroidSms(String target) {
    return 'يُفتح تطبيق الرسائل إلى $target.';
  }

  @override
  String tapIosEmail(String target) {
    return 'يظهر إشعار؛ ويفتح Mail رسالة جديدة إلى $target.';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'يُفتح تطبيق البريد إلى $target.';
  }

  @override
  String get tapIosMap =>
      'لا يفتح iPhone مواقع \"geo:\" تلقائيًا. استخدم رابط خرائط Apple أو Google (الروابط السريعة).';

  @override
  String get tapAndroidMap => 'يُفتح تطبيق الخرائط على هذا الموقع.';

  @override
  String get tapIosNeedsApp =>
      'لا يفعل iPhone شيئًا بهذا المحتوى تلقائيًا؛ يجب قراءته بتطبيق NFC.';

  @override
  String get tapAndroidText =>
      'في معظم الهواتف لا يحدث شيء أو يظهر النص في شاشة النظام.';

  @override
  String get tapAndroidContact => 'يعرض إضافة جهة الاتصال.';

  @override
  String get tapAndroidWifi => 'يعرض الانضمام إلى الشبكة (Android 10 والأحدث).';

  @override
  String get tapAndroidCalendar =>
      'إذا كان تطبيق التقويم يدعم ذلك، فسيعرض إضافة الحدث.';

  @override
  String get tapAndroidOther => 'لا يُفتح إلا إذا كان هناك تطبيق متوافق مثبت.';

  @override
  String tapIgnoredRecords(String count) {
    return 'تنفّذ الهواتف السجل الأول فقط؛ وتظهر السجلات الأخرى ($count) في تطبيقات NFC.';
  }

  @override
  String get tapIosRequirement =>
      'يقرأ iPhone XS والأحدث في الخلفية عند فتح القفل وعدم فتح الكاميرا/المحفظة.';

  @override
  String get galleryCatBusiness => 'الأعمال';

  @override
  String get galleryCatSocial => 'اجتماعي';

  @override
  String get galleryCatHome => 'المنزل';

  @override
  String get galleryCatPersonal => 'شخصي';

  @override
  String get galleryCatAutomation => 'الأتمتة';

  @override
  String get galleryFavorites => 'المفضلة';

  @override
  String get gallerySearchHint => 'ابحث في القوالب...';

  @override
  String get galleryNoResults => 'لا توجد قوالب مطابقة.';

  @override
  String get galleryAddFavorite => 'إضافة إلى المفضلة';

  @override
  String get galleryRemoveFavorite => 'إزالة من المفضلة';

  @override
  String get presetEventTitle => 'دعوة لحدث';

  @override
  String get presetEventDesc =>
      'يكتب الحدث بتنسيق iCalendar؛ ويمكن لـ Android إضافته إلى التقويم.';

  @override
  String get eventNameLabel => 'اسم الحدث';

  @override
  String get eventDateLabel => 'التاريخ (YYYY-MM-DD)';

  @override
  String get eventTimeLabel => 'الوقت (HH:MM)';

  @override
  String get eventDateTimeInvalid =>
      'تاريخ أو وقت غير صالح. مثال: 2026-12-31 و 19:00';

  @override
  String get presetLuggageTitle => 'بطاقة الأمتعة';

  @override
  String get presetLuggageDesc =>
      'إذا ضاعت، يمكن لمن يجدها التواصل معك بسهولة.';

  @override
  String luggageMessage(String name, String contact) {
    return 'هذه الأمتعة تخص $name. إذا وجدتها فيرجى التواصل: $contact';
  }

  @override
  String get presetPlaylistTitle => 'قائمة تشغيل';

  @override
  String get presetPlaylistDesc =>
      'يفتح قائمة تشغيل Spotify أو Apple Music أو YouTube.';

  @override
  String get playlistLinkLabel => 'رابط قائمة التشغيل';

  @override
  String get presetEmailMeTitle => 'راسلني';

  @override
  String get presetEmailMeDesc => 'يفتح رسالة بريد جديدة إليك بموضوع جاهز.';

  @override
  String get presetCallMeTitle => 'اتصل بي';

  @override
  String get presetCallMeDesc => 'يتصل الهاتف برقمك.';

  @override
  String get presetRunShortcutTitle => 'تشغيل اختصار';

  @override
  String get presetRunShortcutDesc =>
      'يشغّل اختصار iPhone الذي تسمّيه: تشغيل الأضواء، الموسيقى، تغيير التركيز...';

  @override
  String get shortcutNameLabel => 'اسم الاختصار';

  @override
  String get recipesSection => 'وصفات أتمتة جاهزة';

  @override
  String get recipesIntro =>
      'أنشئ في تطبيق الاختصارات اختصارًا بالاسم أدناه وأضف الإجراءات. ثم اربطه بأتمتة NFC أو استخدم \"إضافة إلى الوسم\" لكتابة رابط يشغّله.';

  @override
  String get recipeAddToTag => 'إضافة إلى الوسم';

  @override
  String get recipeBedTitle => 'تصبح على خير';

  @override
  String get recipeBedActions =>
      'بجانب السرير: تشغيل تركيز النوم · ضبط منبّه · إطفاء الأضواء';

  @override
  String get recipeCarTitle => 'وضع السيارة';

  @override
  String get recipeCarActions =>
      'حامل السيارة: تركيز القيادة · الاتجاهات إلى المنزل · تشغيل الموسيقى';

  @override
  String get recipeDoorTitle => 'وصلت إلى المنزل';

  @override
  String get recipeDoorActions =>
      'الباب الأمامي: تشغيل الأضواء · تفعيل Wi-Fi · رسالة \"وصلت\" للعائلة';

  @override
  String get recipeDeskTitle => 'وقت التركيز';

  @override
  String get recipeDeskActions =>
      'المكتب: تركيز العمل · مؤقت 25 دقيقة · قائمة تشغيل';

  @override
  String get recipeGymTitle => 'تمرين';

  @override
  String get recipeGymActions =>
      'حقيبة الرياضة: بدء تمرين · قائمة تشغيل · عدم الإزعاج';

  @override
  String get recipeKitchenTitle => 'مؤقت المطبخ';

  @override
  String get recipeKitchenActions => 'المطبخ: مؤقت 10 دقائق · فتح قائمة التسوق';

  @override
  String get libraryLabelsField => 'التسميات / المجلدات (مفصولة بفواصل)';

  @override
  String get libraryLabelsHint => 'المكتب، الطابق 2';

  @override
  String librarySaveFailed(String error) {
    return 'تعذّر الحفظ: $error';
  }

  @override
  String get csvColumnLabels => 'التسميات';

  @override
  String get firstNameLabel => 'الاسم الأول';

  @override
  String get lastNameLabel => 'اسم العائلة';

  @override
  String get wifiPasswordMinHint => '8 أحرف على الأقل';

  @override
  String get emailExampleHint => 'name@example.com';

  @override
  String get wifiSsidExampleHint => 'Home_WiFi_5G';

  @override
  String get nfcErrUnavailable => 'NFC غير متاح أو متوقف على هذا الجهاز.';

  @override
  String get nfcErrBusy => 'هناك عملية NFC أخرى جارية؛ انتظر حتى تنتهي.';

  @override
  String get nfcErrCancelled => 'تم إلغاء العملية.';

  @override
  String get nfcErrAppPaused => 'أُلغيت العملية لأن التطبيق انتقل إلى الخلفية.';

  @override
  String get nfcErrUnsupportedTag => 'نوع الوسم هذا غير مدعوم.';

  @override
  String get nfcErrNtagOnly =>
      'تعمل هذه الأداة مع وسوم NTAG / MIFARE Ultralight فقط.';

  @override
  String get nfcErrNotNdefRead => 'تم اكتشاف الوسم لكنه غير منسّق بتنسيق NDEF.';

  @override
  String get nfcErrNotNdefWrite =>
      'الوسم غير منسّق بتنسيق NDEF؛ ولا يستطيع هذا الهاتف الكتابة عليه مباشرة.';

  @override
  String get nfcErrReadOnly =>
      'الوسم للقراءة فقط (مقفل) ولا يمكن الكتابة عليه.';

  @override
  String get nfcErrNoData => 'لا توجد بيانات للكتابة.';

  @override
  String nfcErrCapacity(String required, String max) {
    return 'المساحة غير كافية: يلزم $required بايت والمتاح $max.';
  }

  @override
  String get nfcErrCapacityShort => 'المساحة على الوسم غير كافية.';

  @override
  String get nfcErrVerify => 'فشل التحقق: البيانات المقروءة لا تطابق ما كُتب.';

  @override
  String get nfcErrConnectionLost =>
      'انقطع الاتصال بالوسم؛ ثبّته وحاول مجددًا.';

  @override
  String get nfcErrAlreadyLocked => 'الوسم مقفل بالفعل (للقراءة فقط).';

  @override
  String get nfcErrLockNotNdef =>
      'الوسم غير منسّق بتنسيق NDEF؛ اكتب سجلًا قبل قفله.';

  @override
  String get nfcErrLockNotSupported => 'نوع الوسم هذا لا يدعم القفل.';

  @override
  String get nfcSheetConnected => 'تم توصيل الوسم، جارٍ العمل...';

  @override
  String get nfcSheetReadOk => 'تمت قراءة الوسم!';

  @override
  String get nfcSheetEmptyRead => 'تمت قراءة وسم فارغ!';

  @override
  String get nfcSheetMultipleTags =>
      'تم اكتشاف أكثر من وسم. قرّب وسمًا واحدًا فقط.';

  @override
  String get nfcSheetWriteVerified => 'تمت الكتابة والتحقق!';

  @override
  String get nfcSheetWritten => 'تمت الكتابة على الوسم!';

  @override
  String get nfcSheetLocked => 'تم قفل الوسم نهائيًا!';

  @override
  String get nfcWriteDone => 'تمت الكتابة على الوسم بنجاح.';

  @override
  String get errorWidgetMessage => 'تعذّر عرض هذا الجزء. ارجع وحاول مجددًا.';

  @override
  String get nfcErrTimeout =>
      'انتهى الوقت دون اكتشاف وسم. قرّب الوسم من أعلى الهاتف وحاول مجددًا.';

  @override
  String get aboutTitle => 'حول';

  @override
  String aboutVersion(String version) {
    return 'الإصدار $version';
  }

  @override
  String get privacySummary =>
      'تبقى بياناتك على هذا الجهاز: لا حساب ولا خادم ولا إعلانات أو تتبّع.';

  @override
  String get whatsNewTitle => 'الجديد';

  @override
  String get whatsNew110 =>
      '• 14 لغة ووضع داكن وتصميم جديد\n• قوالب جاهزة مع فئات وبحث ومفضلة\n• كتابة دفعية بأرقام تسلسلية وCSV ونسخ الوسوم\n• معاينة \"ماذا يحدث عند اللمس؟\" وتحذيرات السعة\n• مكتبة وسوم بالصور والملاحظات والتسميات\n• تقرير الوسم والمقارنة والمسح المستمر وتصدير CSV\n• Siri والاختصارات ووصفات أتمتة جاهزة';

  @override
  String lastBackupAt(String date) {
    return 'آخر نسخة احتياطية: $date';
  }

  @override
  String get noBackupYet => 'لا توجد نسخة احتياطية بعد.';

  @override
  String get backupStale =>
      'مضى على آخر نسخة أكثر من 30 يومًا؛ يُنصح بعمل نسخة جديدة.';

  @override
  String get backupICloudTip =>
      'نصيحة: اختر \"حفظ في الملفات\" ← iCloud Drive من قائمة المشاركة.';

  @override
  String get dragToReorder => 'اسحب لإعادة الترتيب';

  @override
  String get modeTitle => 'الوضع';

  @override
  String get modeNormal => 'عادي';

  @override
  String get modeCompat => 'التوافق';

  @override
  String get modeNormalDesc =>
      'عادي: كل الميزات مفعّلة؛ ويُعاد قراءة كل وسم مكتوب للتحقق.';

  @override
  String get modeCompatDesc =>
      'التوافق: لا تُعاد القراءة بعد الكتابة. تصبح الكتابة أكثر موثوقية مع بعض الوسوم القديمة أو المتعبة.';

  @override
  String get rateApp => 'قيّم التطبيق';

  @override
  String get rateAppUnavailable =>
      'تعذّر عرض نافذة التقييم الآن (لا تظهر في TestFlight).';

  @override
  String get chipsTitle => 'شرائح NFC';

  @override
  String get chipsSubtitle => 'أي وسم تشتري؟ السعة ودعم الهاتف';

  @override
  String get chipsIntro =>
      'البايتات القابلة للاستخدام هي أقصى محتوى NDEF. ‏NTAG215 خيار جيد للمبتدئين.';

  @override
  String chipsUsable(String bytes) {
    return 'قابل للاستخدام: $bytes بايت';
  }

  @override
  String get chipsReadWrite => 'قراءة وكتابة';

  @override
  String get chipsReadOnlyNdef => 'فقط إن كان NDEF';

  @override
  String get chipsNotSupported => 'غير مدعوم';

  @override
  String get chipsNxpOnly => 'الهواتف ذات شريحة NXP فقط';

  @override
  String get chipUseSmall => 'رابط واحد، نص قصير، Wi-Fi؛ الأرخص';

  @override
  String get chipUseMedium => 'بطاقات الاتصال، سجلات متعددة؛ مجسمات amiibo';

  @override
  String get chipUseLarge => 'محتوى طويل، بطاقات اتصال مفصلة';

  @override
  String get chipUseSecure => 'مصادقة ضد التزوير (منتجات، تذاكر)';

  @override
  String get chipUseTicket => 'تذاكر النقل والفعاليات';

  @override
  String get chipUseAccess => 'بطاقات الأبواب والفنادق';

  @override
  String get chipUseIndustrial =>
      'المكتبات والمستودعات والصناعة؛ مدى قراءة أطول';

  @override
  String get chipUseJapan => 'شائع في اليابان (النقل، الدفع)';

  @override
  String get chipUseLegacy => 'نوع قديم؛ غير مستحسن للمشاريع الجديدة';

  @override
  String templateVarsHint(String date, String time, String counter) {
    return 'نصيحة: ضع $date أو $time أو $counter في نص أو رابط لتُملأ عند الكتابة.';
  }

  @override
  String templateVarsPreview(String date, String time, String counter) {
    return 'عند الكتابة: $date · $time · العداد $counter';
  }

  @override
  String get libraryWriteToTag => 'اكتب على وسم';

  @override
  String libraryWritePrompt(String name) {
    return 'قرّب وسمًا لكتابة \"$name\"';
  }

  @override
  String get presetSmartCardTitle => 'بطاقة ذكية';

  @override
  String get presetSmartCardDesc =>
      'موقعك وبطاقة الاتصال وWi-Fi اختياري في وسم واحد. يفتح الهاتف الموقع أولاً.';

  @override
  String get presetLostItemTitle => 'مفقودات';

  @override
  String get presetLostItemDesc =>
      'عند اللمس يفتح لمن يجده رسالة SMS جاهزة إليك.';

  @override
  String get lostItemNameLabel => 'الغرض (مثل المفاتيح، المحفظة)';

  @override
  String lostItemSms(String item) {
    return 'مرحبًا، وجدت $item الخاص بك.';
  }

  @override
  String lostItemText(String item, String name) {
    return 'هذا $item يخص $name. إذا وجدته فيرجى التواصل.';
  }

  @override
  String get presetVoiceTitle => 'رسالة صوتية';

  @override
  String get presetVoiceDesc =>
      'على هدية أو علبة: لمسة تشغّل ملاحظتك الصوتية أو أغنيتك.';

  @override
  String get voiceLinkLabel => 'رابط الصوت (iCloud وDrive وSoundCloud…)';

  @override
  String get logbookTitle => 'السجل';

  @override
  String get logbookSubtitle => 'الحضور والأدوية والجرد: كل لمسة تُحفظ بوقتها';

  @override
  String get logbookNew => 'سجل جديد';

  @override
  String get logbookName => 'اسم السجل';

  @override
  String get logbookKindAttendance => 'الحضور';

  @override
  String get logbookKindMedication => 'الأدوية';

  @override
  String get logbookKindInventory => 'الجرد';

  @override
  String get logbookKindCustom => 'أخرى';

  @override
  String get logbookEmpty =>
      'لا توجد سجلات بعد. أنشئ سجلًا مثل \"حضور الصف 3أ\" أو \"دواء المساء\".';

  @override
  String get logbookScanButton => 'امسح وسجّل';

  @override
  String logbookEntryAdded(String label) {
    return 'تم التسجيل: $label';
  }

  @override
  String get logbookNoEntries => 'لا توجد إدخالات بعد.';

  @override
  String logbookToday(String count, String tags) {
    return 'اليوم: $count إدخال · $tags وسوم مختلفة';
  }

  @override
  String logbookMedTaken(String time) {
    return 'تم تناوله اليوم ✓ (آخر مرة: $time)';
  }

  @override
  String get logbookMedNotTaken => 'لم يُتناول اليوم بعد';

  @override
  String logbookInventorySummary(String count) {
    return 'تم عدّ $count وسومًا مختلفة';
  }

  @override
  String logbookDeleteConfirm(String name) {
    return 'حذف السجل \"$name\" وكل إدخالاته؟';
  }

  @override
  String logbookEntries(String count) {
    return '$count إدخال';
  }

  @override
  String lastSeenAt(String date) {
    return 'آخر ظهور: $date';
  }

  @override
  String get neverSeen => 'لم يُمسح بعد';

  @override
  String get sortLongestUnseen => 'الأطول دون مسح';

  @override
  String get unseen30Days => 'لم يُرَ منذ 30+ يومًا';

  @override
  String get inventoryCardTitle => 'هذا الوسم في مكتبتك';

  @override
  String scanReportLine(String unique, String dup, String empty) {
    return '$unique وسوم مختلفة · $dup مكررة · $empty فارغة';
  }

  @override
  String get printSheet => 'ورقة ملصقات للطباعة (PDF)';

  @override
  String get phishDangerTitle => 'تحذير: قد يكون موقعًا مزيفًا';

  @override
  String get phishCautionTitle => 'تحقق من الرابط قبل فتحه';

  @override
  String phishLookalike(String brand) {
    return 'العنوان يشبه $brand لكنه ليس النطاق الرسمي.';
  }

  @override
  String phishBrandInSubdomain(String brand) {
    return 'وُضع \"$brand\" أمام نطاق آخر؛ والموقع الحقيقي مختلف.';
  }

  @override
  String phishBrandInName(String brand) {
    return 'يحتوي النطاق على \"$brand\" لكنه ليس الموقع الرسمي.';
  }

  @override
  String phishShortener(String host) {
    return 'رابط مختصر ($host): العنوان الحقيقي مخفي.';
  }

  @override
  String phishRiskyTld(String tld) {
    return 'يُستخدم الامتداد \".$tld\" كثيرًا في التصيّد.';
  }

  @override
  String get phishDisclaimer =>
      'يعتمد هذا الفحص على مؤشرات دون اتصال ولا يضمن أمان الموقع.';

  @override
  String get backupEncrypt => 'حماية بكلمة مرور';

  @override
  String get backupEncryptHint =>
      'تُشفّر النسخة بـ AES-256. إذا نسيت كلمة المرور فلن تُفتح.';

  @override
  String get backupPassword => 'كلمة المرور';

  @override
  String get backupPasswordRepeat => 'كلمة المرور (مرة أخرى)';

  @override
  String backupPasswordTooShort(String min) {
    return 'يجب ألا تقل كلمة المرور عن $min أحرف.';
  }

  @override
  String get backupPasswordMismatch => 'كلمتا المرور غير متطابقتين.';

  @override
  String get backupEncryptedPrompt =>
      'هذه النسخة محمية بكلمة مرور. أدخلها لفتحها.';

  @override
  String get backupWrongPassword => 'كلمة مرور خاطئة.';

  @override
  String get backupDecryptFailed => 'تعذّر فك التشفير؛ قد يكون الملف تالفًا.';

  @override
  String get appLockTitle => 'قفل التطبيق';

  @override
  String get appLockSubtitle =>
      'طلب Face ID أو Touch ID أو رمز الجهاز عند الفتح';

  @override
  String get appLockUnavailable => 'لا يوجد قفل شاشة مُعد على هذا الجهاز.';

  @override
  String get appLockLocked => 'التطبيق مقفل';

  @override
  String get appLockUnlock => 'فتح القفل';

  @override
  String get appLockReason => 'لفتح مكتبة الوسوم والسجل';

  @override
  String get sigTitle => 'وسوم موقّعة';

  @override
  String get sigSubtitle => 'اعرف إن غيّر أحد محتوى الوسم';

  @override
  String get sigExplain =>
      'يُضاف إلى الوسوم التي تكتبها سجل توقيع بمفتاحك السري. عند قراءتها بهذا التطبيق يُكشف أي تغيير. يمكنك مشاركة المفتاح مع فريقك؛ ولا يمكن تزوير التوقيع بدونه. لا يمنع ذلك قراءة الوسم.';

  @override
  String get sigCreateKey => 'إنشاء مفتاح';

  @override
  String get sigCopyKey => 'نسخ المفتاح (مشاركة)';

  @override
  String get sigImportKey => 'لصق مفتاح';

  @override
  String get sigImportInvalid => 'لا تحتوي الحافظة على مفتاح صالح.';

  @override
  String sigKeyReady(String id) {
    return 'المفتاح جاهز ($id)';
  }

  @override
  String get sigSignOnWrite => 'توقيع الوسوم التي أكتبها';

  @override
  String get sigValid => 'التوقيع صالح';

  @override
  String get sigInvalid => 'التوقيع غير صالح: تم تغيير المحتوى';

  @override
  String get sigOtherKey => 'موقّع بمفتاح آخر';

  @override
  String get sigReplaceKeyConfirm =>
      'استبدال المفتاح الحالي؟ ستظهر الوسوم الموقّعة بالقديم كـ\"مفتاح آخر\".';

  @override
  String get amiiboTitle => 'معلومات amiibo';

  @override
  String get amiiboSubtitle => 'معرّف المجسم/البطاقة وسلسلته (قراءة فقط)';

  @override
  String get amiiboPrompt => 'قرّب مجسم أو بطاقة amiibo';

  @override
  String amiiboNotNtag215(String chip) {
    return 'هذا ليس amiibo ‏($chip)؛ تستخدم amiibo شريحة NTAG215.';
  }

  @override
  String get amiiboNotFound => 'تمت قراءة NTAG215 لكن لم توجد بيانات amiibo.';

  @override
  String amiiboSeries(String series) {
    return 'السلسلة: $series';
  }

  @override
  String amiiboType(String type) {
    return 'النوع: $type';
  }

  @override
  String get amiiboFigure => 'مجسم';

  @override
  String get amiiboCard => 'بطاقة';

  @override
  String get amiiboYarn => 'صوف';

  @override
  String get amiiboLookup => 'ابحث عن اسمه عبر الإنترنت (amiiboapi.com)';

  @override
  String memoryEditPage(String page) {
    return 'تعديل الصفحة $page ‏(4 بايت hex)';
  }

  @override
  String get memoryEditHint => 'المس صفحة مستخدم لتعديلها.';

  @override
  String memoryEditPrompt(String page) {
    return 'قرّب الوسم نفسه لكتابة الصفحة $page';
  }

  @override
  String memoryPageWritten(String page) {
    return 'تمت كتابة الصفحة $page.';
  }

  @override
  String get memoryUidMismatch => 'تم اكتشاف وسم مختلف؛ لم يُكتب شيء.';

  @override
  String memoryReadSpeed(String ms, String rate) {
    return 'زمن القراءة: $ms مللي ث ($rate بايت/ث)';
  }

  @override
  String get simpleModeTitle => 'الوضع البسيط';

  @override
  String get simpleModeSubtitle =>
      'أزرار كبيرة؛ قراءة بلمسة واحدة للأطفال وكبار السن';

  @override
  String get simpleScan => 'اقرأ الوسم';

  @override
  String get simpleHint => 'قرّب الوسم من أعلى الهاتف.';

  @override
  String get simpleCall => 'اتصال';

  @override
  String get simpleMessage => 'إرسال رسالة';

  @override
  String get simpleOpen => 'فتح';

  @override
  String get simpleEmail => 'كتابة بريد';

  @override
  String get simpleMap => 'فتح في الخرائط';

  @override
  String get simpleExit => 'اضغط مطولًا للعودة إلى العرض العادي';

  @override
  String get simpleNothing => 'لا يوجد ما يُعرض في هذا الوسم.';

  @override
  String whatsNew120(String date, String time, String counter) {
    return '• السجل: الحضور والأدوية والجرد\n• الأمان: قفل Face ID، نسخ احتياطية مشفّرة، وسوم موقّعة، تحذير من المواقع المزيفة\n• متغيرات القوالب ($date و$time و$counter) والكتابة من المكتبة\n• قوالب جديدة: بطاقة ذكية، مفقودات، رسالة صوتية\n• ورقة ملصقات للطباعة مع رموز QR ‏(PDF)\n• الوضع البسيط، معلومات amiibo، محرر البايتات، دليل شرائح NFC\n• الترتيب بالسحب ووضع التوافق';
  }

  @override
  String get logbookKindTimeClock => 'دخول / خروج (الدوام)';

  @override
  String get logbookCheckIn => 'دخول';

  @override
  String get logbookCheckOut => 'خروج';

  @override
  String logbookCheckedIn(String label) {
    return 'تم الدخول: $label';
  }

  @override
  String logbookCheckedOut(String label) {
    return 'تم الخروج: $label';
  }

  @override
  String logbookPresentNow(String count) {
    return 'بالداخل الآن: $count';
  }

  @override
  String logbookWorkedToday(String duration) {
    return 'المجموع اليوم: $duration';
  }

  @override
  String get logbookWorkedPerPerson => 'وقت اليوم';

  @override
  String durationHm(String h, String m) {
    return '$h س $m د';
  }

  @override
  String get csvColumnDirection => 'الاتجاه';

  @override
  String get libraryCheckEvery => 'فترة الفحص';

  @override
  String get libraryCheckNone => 'لا يوجد';

  @override
  String libraryCheckDays(String days) {
    return 'كل $days يوم';
  }

  @override
  String get libraryCheckHint =>
      'إذا لم يُمسح الوسم خلال هذه المدة يُعلَّم كمستحق للفحص (طفاية، فلتر، ري النباتات…).';

  @override
  String get libraryCheckDue => 'حان وقت الفحص';

  @override
  String libraryCheckNext(String date) {
    return 'الفحص التالي: $date';
  }

  @override
  String libraryDueFilter(String count) {
    return 'بانتظار الفحص ($count)';
  }

  @override
  String libraryCheckRecorded(String date) {
    return 'تم تسجيل الفحص · التالي: $date';
  }

  @override
  String cloneWarning(String name) {
    return 'هذا المحتوى محفوظ في مكتبتك على \"$name\" بمعرّف UID مختلف. قد يكون هذا الوسم نسخة.';
  }

  @override
  String get doctorTitle => 'طبيب NDEF';

  @override
  String get doctorButton => 'فحص';

  @override
  String get doctorTooShort =>
      'لم تُقرأ الذاكرة كاملة؛ أبقِ الوسم مدة أطول وحاول مجددًا.';

  @override
  String get doctorNoCc =>
      'الوسم غير مهيأ لـ NDEF (فارغ). استخدم الأدوات ← \"تهيئة NDEF\" أو اكتب عليه مباشرة.';

  @override
  String get doctorVersion =>
      'بايت إصدار NDEF غير مألوف؛ قد لا تقرأ بعض الهواتف الوسم.';

  @override
  String get doctorReadRestricted =>
      'الوصول للقراءة مقيَّد؛ قد لا تعرض الهواتف المحتوى.';

  @override
  String get doctorReadOnly =>
      'الوسم للقراءة فقط (مقفل)؛ لا يمكن تغيير محتواه.';

  @override
  String get doctorNoNdef =>
      'لا توجد كتلة NDEF في الذاكرة. إعادة الكتابة على الوسم تحل المشكلة.';

  @override
  String get doctorEmpty => 'الوسم مهيأ لكنه فارغ.';

  @override
  String get doctorOverflow =>
      'حقل الطول يتجاوز الذاكرة؛ المحتوى تالف. أعد الكتابة على الوسم.';

  @override
  String doctorExceeds(String bytes) {
    return 'الرسالة ($bytes بايت) أكبر من السعة المعلنة؛ قد تُقرأ مقطوعة.';
  }

  @override
  String get doctorNoTerminator =>
      'علامة النهاية (FE) مفقودة. معظم الهواتف تقرؤه رغم ذلك؛ إعادة الكتابة تصلحه.';

  @override
  String get doctorUnknownTlv =>
      'كتلة بيانات غير معروفة في الذاكرة؛ قد تتوقف القراءة عندها.';

  @override
  String doctorBadRecord(String n) {
    return 'السجل $n تالف (رأس أو طول خاطئ). أعد الكتابة على الوسم.';
  }

  @override
  String doctorHealthy(String count) {
    return 'كل شيء سليم: $count سجل مكتوب بشكل صحيح.';
  }

  @override
  String get libraryImportTitle => 'استيراد من جدول';

  @override
  String get libraryImportHint =>
      'انسخ صفوفًا من Excel أو Numbers أو جداول Google والصقها هنا. الأعمدة: الاسم، المحتوى (رابط أو نص)، الموقع، التصنيفات، ملاحظة، UID. مع صف عناوين تُطابق الأعمدة بالاسم.';

  @override
  String libraryImportPreview(String count) {
    return 'ستُضاف $count وسوم';
  }

  @override
  String libraryImportSkipped(String dupes, String invalid) {
    return 'تخطي $dupes صفوف (UID محفوظ مسبقًا) و$invalid بلا اسم';
  }

  @override
  String get libraryImportPaste => 'لصق من الحافظة';

  @override
  String get libraryImportAdd => 'إضافة';

  @override
  String libraryImportDone(String count) {
    return 'تمت إضافة $count وسوم إلى المكتبة';
  }

  @override
  String get presetGiftTitle => 'رسالة هدية';

  @override
  String get presetGiftDesc =>
      'ألصقه على الهدية: لمسة تعرض رسالتك ورابط فيديو اختياريًا.';

  @override
  String get giftTo => 'إلى';

  @override
  String get giftFrom => 'من';

  @override
  String get giftVideo => 'رابط فيديو (اختياري)';

  @override
  String giftText(String to, String message, String from) {
    return '🎁 $to،\n$message\n— $from';
  }

  @override
  String get presetPlantTitle => 'بطاقة العناية بالنبات';

  @override
  String get presetPlantDesc =>
      'على الأصيص: الري والإضاءة. مع فترة فحص في المكتبة يصبح تذكيرًا بالري.';

  @override
  String get plantName => 'اسم النبات';

  @override
  String get plantWater => 'الري';

  @override
  String get plantLight => 'الإضاءة';

  @override
  String plantText(String plant, String water, String light) {
    return '🌱 $plant\n💧 $water\n☀️ $light';
  }

  @override
  String get presetChildTitle => 'سوار أمان للطفل';

  @override
  String get presetChildDesc =>
      'في الأماكن المزدحمة: من يلمسه يرى اسم الطفل ويتصل بالوالدين بلمسة.';

  @override
  String get childName => 'اسم الطفل';

  @override
  String childText(String name, String phone) {
    return 'مرحبًا، أنا $name. إذا كنت تائهًا فاتصل بعائلتي: $phone';
  }

  @override
  String get presetManualTitle => 'بطاقة إرشادات';

  @override
  String get presetManualDesc =>
      'جهاز رياضي، آلة قهوة، جهاز في سكن مؤجر: تعليمات قصيرة ورابط فيديو أو دليل.';

  @override
  String get manualItem => 'الجهاز / الغرض';

  @override
  String get manualSteps => 'تعليمات قصيرة';

  @override
  String get manualLink => 'رابط فيديو / دليل (اختياري)';

  @override
  String get libraryAutoLog => 'التسجيل في دفتر عند المسح';

  @override
  String get libraryAutoLogHint =>
      'عند مسح هذا الوسم من الشاشة الرئيسية تُضاف تلقائيًا قيد إلى الدفتر المختار (مثل وسم الباب ← الدوام).';

  @override
  String autoLogged(String book) {
    return 'سُجِّل في \"$book\"';
  }

  @override
  String get whatsNew130 =>
      '• دفتر الدخول/الخروج (الدوام): من بالداخل وساعات اليوم\n• يمكن لوسوم المكتبة التسجيل تلقائيًا في دفتر عند المسح\n• تذكيرات الفحص وفلتر \"بانتظار الفحص\"\n• تحذير الوسم المنسوخ\n• طبيب NDEF: يشخّص الوسوم التالفة\n• إضافة جماعية إلى المكتبة من Excel/Numbers\n• قوالب جديدة: رسالة هدية، العناية بالنبات، سوار الطفل، بطاقة إرشادات';

  @override
  String get securityTitle => 'الأمان والخصوصية';

  @override
  String get lockAfterTitle => 'إعادة القفل بعد';

  @override
  String get lockImmediately => 'فورًا';

  @override
  String lockAfterSecondsLabel(String n) {
    return '$n ث';
  }

  @override
  String lockAfterMinutesLabel(String n) {
    return '$n د';
  }

  @override
  String get hideInSwitcherTitle => 'إخفاء في مبدّل التطبيقات';

  @override
  String get hideInSwitcherSubtitle =>
      'تُموَّه الشاشة في الخلفية. وعلى Android تُمنع لقطات الشاشة أيضًا.';

  @override
  String get clearClipboardTitle => 'مسح الحافظة تلقائيًا';

  @override
  String get clearClipboardSubtitle =>
      'تُحذف القيم الحساسة مثل المفاتيح المنسوخة من الحافظة بعد 60 ثانية.';

  @override
  String get securityConfirmReason => 'أكّد هويتك للمتابعة';

  @override
  String get securityCopiedClears => 'تم النسخ · سيُمسح بعد 60 ث';

  @override
  String get wipeTitle => 'مسح كل البيانات';

  @override
  String get wipeSubtitle =>
      'السجل والمكتبة والصور والدفاتر والقوالب ومفتاح التوقيع والإعدادات';

  @override
  String get wipeConfirm =>
      'مسح كل البيانات نهائيًا من هذا الجهاز؟ لا يمكن التراجع؛ ننصح بأخذ نسخة احتياطية أولًا.';

  @override
  String get wipeDone => 'تم مسح كل البيانات';

  @override
  String dataSummary(
      String history, String library, String books, String templates) {
    return '$history السجل · $library المكتبة · $books الدفاتر · $templates القوالب';
  }

  @override
  String get secCheckTitle => 'فحص الأمان';

  @override
  String secCheckScore(String ok, String total) {
    return '$ok/$total من الإعدادات الموصى بها مفعّلة';
  }

  @override
  String get secCheckBackup => 'نسخة احتياطية خلال آخر 30 يومًا';

  @override
  String get secCheckEncryptedNote =>
      'قد تحتوي النسخ الاحتياطية على كلمات مرور Wi-Fi؛ يُنصح بحمايتها بكلمة مرور.';

  @override
  String get packShare => 'مشاركة كحزمة فريق';

  @override
  String get packImport => 'استيراد حزمة فريق';

  @override
  String get packHint =>
      'تُشارك الوسوم الظاهرة (حسب الفلتر) في ملف واحد؛ يضيفه زملاؤك عبر المكتبة ← استيراد. لا تُشارك الصور.';

  @override
  String get packName => 'اسم الحزمة';

  @override
  String packIncludeTemplates(String count) {
    return 'تضمين القوالب المحفوظة ($count)';
  }

  @override
  String packCount(String count) {
    return 'ستُشارك $count وسوم';
  }

  @override
  String get packPassword => 'كلمة مرور (اختيارية، 6 أحرف على الأقل)';

  @override
  String get packPasswordShort => 'يجب ألا تقل كلمة المرور عن 6 أحرف';

  @override
  String packPreview(String name, String tags, String templates) {
    return '\"$name\": $tags وسوم، $templates قوالب. استيراد؟';
  }

  @override
  String packImported(String tags, String templates, String skipped) {
    return 'أُضيفت $tags وسوم و$templates قوالب · $skipped موجودة مسبقًا';
  }

  @override
  String packInvalid(String reason) {
    return 'هذا الملف ليس حزمة فريق صالحة ($reason)';
  }

  @override
  String get libraryMoreActions => 'إجراءات أخرى';

  @override
  String get appIconTitle => 'أيقونة التطبيق';

  @override
  String get appIconFailed => 'تعذر تغيير الأيقونة';

  @override
  String get iconBlue => 'أزرق';

  @override
  String get iconGreen => 'أخضر';

  @override
  String get iconPurple => 'بنفسجي';

  @override
  String get iconOrange => 'برتقالي';

  @override
  String get iconDark => 'ليلي';

  @override
  String get mapTitle => 'خريطة الوسوم';

  @override
  String get mapEmpty =>
      'لا توجد وسوم لعرضها. عدّل وسمًا واضغط \"إضافة الموقع الحالي\" أو اكتب موقعًا على الوسم.';

  @override
  String get mapTilesNote => 'تُحمَّل صور الخريطة من OpenStreetMap.';

  @override
  String get mapOpenInMaps => 'فتح في الخرائط';

  @override
  String get mapAddCurrent => 'إضافة الموقع الحالي';

  @override
  String mapPositionSaved(String lat, String lng) {
    return 'الموقع: $lat، $lng';
  }

  @override
  String get mapLocationDenied =>
      'لم يُمنح إذن الموقع. يمكنك السماح به من الإعدادات ← الخصوصية ← خدمات الموقع.';

  @override
  String mapLocationFailed(String error) {
    return 'تعذر الحصول على الموقع: $error';
  }

  @override
  String get whatsNew140 =>
      '• قسم الأمان والخصوصية: فحص الأمان، تأخير القفل، الإخفاء في مبدّل التطبيقات، مسح الحافظة، مسح كل البيانات\n• مفتاح التوقيع الآن في سلسلة المفاتيح؛ الإجراءات الحساسة تطلب Face ID\n• خريطة الوسوم وحفظ موقع الوسم\n• حزم الفريق: الوسوم والقوالب في ملف واحد\n• أيقونات بديلة للتطبيق\n• إعدادات وقائمة مكتبة أبسط';

  @override
  String get ruleAddByScan => 'امسح وسمًا وأضف ملاحظة';

  @override
  String get ruleAddLastScan => 'إضافة ملاحظة لآخر وسم ممسوح';

  @override
  String get ruleNeedsContent =>
      'هذا الوسم فارغ؛ تُضاف الملاحظات فقط للوسوم التي تحوي محتوى.';

  @override
  String get simpleWrite => 'اكتب على وسم';

  @override
  String get simpleWriteWhat => 'ماذا تريد أن تكتب؟';

  @override
  String get simpleKindText => 'نص';

  @override
  String get simpleKindPhone => 'هاتف';

  @override
  String get simpleKindLink => 'رابط';

  @override
  String get simpleWriteNow => 'اكتب – قرّب الوسم';

  @override
  String get simpleWritten => 'تمت الكتابة على الوسم ✓';

  @override
  String get simpleSaved => 'وسومي المحفوظة';

  @override
  String get simpleSavedHint => 'اضغط على أحدها لكتابته على وسم جديد.';

  @override
  String get accentColorTitle => 'لون التمييز';

  @override
  String get colorPink => 'وردي';

  @override
  String get textSizeTitle => 'حجم النص';

  @override
  String get speakTag => 'قراءة بصوت عالٍ';

  @override
  String get speakAfterScanTitle => 'القراءة بصوت عالٍ بعد المسح';

  @override
  String get speakAfterScanSubtitle =>
      'يُقرأ المحتوى بصوت عالٍ؛ مفيد لضعاف البصر والوضع البسيط';

  @override
  String get logbookKindHabit => 'عادة (سلسلة)';

  @override
  String get logbookKindChores => 'جدول مهام الأطفال';

  @override
  String get logbookKindFeeding => 'إطعام الحيوان الأليف';

  @override
  String get logbookKindVisitors => 'سجل الزوار';

  @override
  String habitStreak(String current, String best) {
    return '🔥 سلسلة $current يوم · الأفضل $best';
  }

  @override
  String get habitDoneToday => 'تم اليوم ✓';

  @override
  String get habitNotToday => 'لم يُنجز اليوم بعد — حافظ على السلسلة!';

  @override
  String choresStars(String count) {
    return '⭐ أُنجزت $count مهام اليوم';
  }

  @override
  String feedingLast(String ago, String time) {
    return 'آخر إطعام قبل $ago ($time)';
  }

  @override
  String get feedingNever => 'لا يوجد إطعام مسجل بعد';

  @override
  String visitorsToday(String count) {
    return '$count زائر اليوم';
  }

  @override
  String get visitorNamePrompt => 'اسم الزائر';

  @override
  String get visitorNameHint => 'الاسم، الشركة (اختياري)';

  @override
  String get reminderBody => 'لا تنسَ مسح الوسم 📲';

  @override
  String reminderInspectionTitle(String name) {
    return 'حان وقت الفحص: $name';
  }

  @override
  String get reminderInspectionBody => 'امسح الوسم بعد فحصه.';

  @override
  String get reminderTitle => 'تذكير يومي';

  @override
  String get reminderOff => 'متوقف';

  @override
  String reminderAt(String time) {
    return 'كل يوم الساعة $time';
  }

  @override
  String get reminderDenied =>
      'الإشعارات غير مسموح بها. يمكنك السماح بها من الإعدادات.';

  @override
  String get inspectionRemindersNote =>
      'تنبّهك الوسوم المستحقة للفحص الساعة 10:00 في يوم الاستحقاق (إن سُمح).';

  @override
  String get presetTableTitle => 'طاولة مطعم';

  @override
  String get presetTableDesc =>
      'رابط القائمة ورقم الطاولة واستدعاء النادل برسالة SMS.';

  @override
  String get tableNumber => 'رقم الطاولة';

  @override
  String get menuLink => 'رابط القائمة';

  @override
  String get waiterPhone => 'رقم استدعاء النادل (اختياري)';

  @override
  String tableText(String table) {
    return 'الطاولة $table';
  }

  @override
  String tableSms(String table) {
    return 'الطاولة $table: نرجو حضور النادل 🙋';
  }

  @override
  String get presetRentalTitle => 'بطاقة سكن مؤجر';

  @override
  String get presetRentalDesc =>
      'يلمس الضيوف للاتصال بالواي فاي ورؤية قواعد المنزل.';

  @override
  String get houseRules => 'قواعد المنزل';

  @override
  String get checkoutTime => 'وقت المغادرة';

  @override
  String rentalText(String rules, String checkout) {
    return '🏠 $rules\nالمغادرة: $checkout';
  }

  @override
  String get ideasTitle => 'أفكار';

  @override
  String get ideasSubtitle => 'اكتشف ما يمكنك فعله بالوسوم';

  @override
  String get ideasHome => 'المنزل';

  @override
  String get ideasFamily => 'العائلة';

  @override
  String get ideasHealth => 'الصحة والعادات';

  @override
  String get ideasWork => 'العمل';

  @override
  String get ideasAutomation => 'الأتمتة';

  @override
  String get ideaRoutinesTitle => 'الروتين (الاختصارات)';

  @override
  String get ideaRoutinesDesc =>
      'بجانب السرير، السيارة، الباب، المكتب: عدة إجراءات بلمسة واحدة.';

  @override
  String get ideaHabitDesc =>
      'امسح يوميًا وحافظ على 🔥 السلسلة (ماء، فيتامينات، رياضة).';

  @override
  String get ideaChoresDesc => 'يجمع الأطفال النجوم بمسح وسوم المهام.';

  @override
  String get ideaFeedingDesc => 'وسم على الوعاء: \"متى أُطعم آخر مرة؟\"';

  @override
  String get ideaMedicationDesc => 'وسم على علبة الدواء: هل أُخذ اليوم ومتى؟';

  @override
  String get ideaClockDesc => 'وسم الباب: الدخول/الخروج وساعات العمل اليومية.';

  @override
  String get ideaVisitorsDesc =>
      'بطاقات الزوار في الاستقبال: الأسماء والأوقات وCSV.';

  @override
  String get ideaInventoryDesc => 'الجرد: أين شوهد كل وسم آخر مرة.';

  @override
  String get firstTagTitle => 'اصنع وسمك الأول';

  @override
  String get firstTagSubtitle =>
      'اختر واحدًا واملأ الحقول وقرّب الوسم. 30 ثانية فقط.';

  @override
  String get firstTagMore => 'أفكار أكثر';

  @override
  String get iconRed => 'أحمر';

  @override
  String get iconTeal => 'فيروزي';

  @override
  String get iconGold => 'ذهبي';

  @override
  String get iconIndigo => 'نيلي';

  @override
  String get iconLight => 'أبيض';

  @override
  String get iconRainbow => 'قوس قزح';

  @override
  String get catWebText => 'الويب والنص';

  @override
  String get catContact => 'الاتصال والأعمال';

  @override
  String get catNetwork => 'الشبكة والموقع';

  @override
  String get catSocial => 'وسائل التواصل';

  @override
  String get catEmpty => 'فارغ';

  @override
  String get analyticsTitle => 'إحصاءات الوسوم';

  @override
  String get analyticsSubtitle => 'اتجاهات المسح والوسوم الأكثر قراءة';

  @override
  String get analyticsTotal => 'إجمالي المسح';

  @override
  String get analyticsUnique => 'وسوم مختلفة';

  @override
  String get analyticsLast14 => 'آخر 14 يومًا';

  @override
  String get analyticsTop => 'الأكثر مسحًا';

  @override
  String get analyticsByType => 'أنواع المحتوى';

  @override
  String get analyticsEmpty => 'فعّل سجل المسح من الإعدادات وامسح بعض الوسوم.';

  @override
  String analyticsTimes(String count) {
    return '$count×';
  }

  @override
  String get codeScannerTitle => 'ماسح الرموز';

  @override
  String get codeScannerSubtitle =>
      'امسح رموز QR والباركود؛ اكتب أو احفظ أو شارك';

  @override
  String codeResultTitle(String format) {
    return 'الرمز الممسوح ($format)';
  }

  @override
  String get codeSearchWeb => 'ابحث في الويب';

  @override
  String get codeToTag => 'اكتب على وسم';

  @override
  String get codeSaveLibrary => 'حفظ في المكتبة';

  @override
  String get mergeTitle => 'دمج السجلات';

  @override
  String get mergeSubtitle =>
      'اختر سجلات من المكتبة والقوالب وآخر مسح لوسم واحد';

  @override
  String mergeButton(String count) {
    return 'دمج ($count)';
  }

  @override
  String get mergeEmpty => 'لا يوجد ما يُدمج. احفظ وسومًا أو قوالب أولًا.';

  @override
  String get mergeLastScan => 'آخر وسم ممسوح';

  @override
  String get locationSearchHint => 'ابحث عن عنوان أو مكان';

  @override
  String get locationNotFound => 'لم يُعثر على العنوان';

  @override
  String get cardCall => 'اتصال';

  @override
  String get cardEmail => 'بريد';

  @override
  String get cardWeb => 'الموقع';

  @override
  String get cardAddContact => 'إضافة إلى جهات الاتصال';

  @override
  String get cardTitle => 'بطاقة عمل رقمية';

  @override
  String get templateImportTitle => 'استيراد القوالب من جدول';

  @override
  String get templateImportHint =>
      'كل صف: الاسم، النوع، القيمة، إضافي. الأنواع: url وtext وphone وemail وsms وlocation وwifi. الصفوف ذات الاسم نفسه تصبح قالبًا واحدًا.';

  @override
  String templateImportPreview(String count) {
    return 'ستُضاف $count قوالب';
  }

  @override
  String templateImportSkipped(String rows) {
    return 'صفوف متخطاة: $rows';
  }

  @override
  String templateImportDone(String count) {
    return 'أُضيفت $count قوالب';
  }

  @override
  String get assetSection => 'بيانات الأصل';

  @override
  String get assetSerialLabel => 'الرقم التسلسلي / رقم الأصل';

  @override
  String get assigneeLabel => 'مُسند إلى';

  @override
  String get warrantyLabel => 'الضمان حتى';

  @override
  String get warrantyExpired => 'انتهى الضمان';

  @override
  String warrantyUntilText(String date) {
    return 'الضمان: $date';
  }

  @override
  String assigneeText(String name) {
    return 'مُسند: $name';
  }

  @override
  String reminderWarrantyTitle(String name) {
    return 'ينتهي الضمان: $name';
  }

  @override
  String get reminderWarrantyBody => 'ينتهي الضمان اليوم.';

  @override
  String get templateShareQr => 'مشاركة كرمز QR';

  @override
  String templateReceived(String name) {
    return 'أُضيف القالب: $name';
  }

  @override
  String get templateCodeInvalid => 'تعذرت قراءة القالب من رمز QR هذا';

  @override
  String get madeWithTitle => 'إضافة ملاحظة \"صُنع بـ\"';

  @override
  String get madeWithSubtitle =>
      'يُضاف نص قصير في النهاية ليتعرف القرّاء على التطبيق (نحو 30 بايت).';

  @override
  String get madeWithText => 'صُنع باستخدام NFC Tag Master';

  @override
  String get recipeMorningTitle => 'صباح الخير';

  @override
  String get recipeMorningActions =>
      'بجانب السرير: إيقاف المنبه · قراءة الطقس · قائمة الصباح';

  @override
  String get recipeLeaveTitle => 'مغادرة المنزل';

  @override
  String get recipeLeaveActions =>
      'الباب: إطفاء الأنوار · خفض الحرارة · مشاركة وقت الوصول';

  @override
  String get recipeFocusTitle => 'دراسة / تركيز';

  @override
  String get recipeFocusActions =>
      'المكتب: وضع التركيز · مؤقت 25 دقيقة · موسيقى هادئة';

  @override
  String get recipeTravelTitle => 'السفر';

  @override
  String get recipeTravelActions =>
      'الحقيبة: بطاقة الصعود · الاتجاهات للمطار · رسالة \"أنا في الطريق\"';

  @override
  String get whatsNew150 =>
      '• صفحة أفكار وبطاقة \"اصنع وسمك الأول\"\n• إحصاءات الوسوم وتصنيفات تلقائية وماسح QR/باركود\n• دمج السجلات وبطاقة عمل رقمية والموقع بالعنوان\n• سلاسل العادات ومهام الأطفال وإطعام الحيوان وسجل الزوار\n• تذكيرات وقراءة صوتية وتتبع الأصول والضمان\n• مشاركة القوالب عبر QR واستيرادها من جدول؛ قوالب للمطعم والسكن المؤجر\n• 12 أيقونة و9 ألوان وحجم النص';

  @override
  String get ocrTitle => 'نص من صورة (OCR)';

  @override
  String get ocrSubtitle => 'اقرأ نص مستند أو لافتة أو بطاقة واكتبه على وسم';

  @override
  String get ocrNothing => 'لم يُعثر على نص مقروء (تعمل على iPhone).';

  @override
  String get iCloudTitle => 'نسخ احتياطي على iCloud';

  @override
  String get iCloudSubtitle =>
      'يتم نسخ القوالب والقواعد ومكتبة الوسوم إلى حساب iCloud ويمكن استعادتها على iPhone جديد. لا يشمل ذلك سجل القراءات.';

  @override
  String get iCloudAuto => 'نسخ تلقائي';

  @override
  String get iCloudAutoHint => 'ينسخ عند مغادرة التطبيق';

  @override
  String get iCloudBackupNow => 'انسخ الآن';

  @override
  String get iCloudRestore => 'استعادة';

  @override
  String iCloudLastBackup(String date) {
    return 'آخر نسخة على iCloud: $date';
  }

  @override
  String get iCloudNoBackup => 'لا توجد نسخة على iCloud بعد';

  @override
  String get iCloudBackedUp => 'تم النسخ إلى iCloud';

  @override
  String get iCloudNoAccount =>
      'لم يتم تسجيل الدخول إلى iCloud على هذا الـ iPhone. تحقق من الإعدادات ← حساب Apple ← iCloud.';

  @override
  String get iCloudTooLarge =>
      'النسخة تتجاوز حد iCloud ‏(1 ميغابايت). استخدم النسخ إلى ملف بدلاً من ذلك.';

  @override
  String get iCloudFailed => 'تعذر حفظ نسخة iCloud';

  @override
  String get whatsNew160 =>
      '• أدوات مصغّرة للشاشة الرئيسية وشاشة القفل\n• مسح وكتابة بلمسة من مركز التحكم (iOS 18)\n• Apple Watch: القراءات الأخيرة والتسجيل في الدفتر بلمسة\n• نسخ احتياطي على iCloud (القوالب والقواعد والمكتبة)';

  @override
  String get healthTitle => 'فحص سلامة الوسم';

  @override
  String get healthToolSubtitle => 'امسح وسمًا لترى تقييمه وما يجب إصلاحه';

  @override
  String get healthIntro =>
      'امسح وسمًا: يتم فحص التنسيق والمساحة الحرة والقفل وأمان الروابط والتوقيع واحتمال النسخ، مع نصيحة لكل نتيجة.';

  @override
  String get healthScan => 'امسح الوسم';

  @override
  String get healthScanAnother => 'امسح وسمًا آخر';

  @override
  String get healthOverallGood => 'الوسم سليم وجاهز للاستخدام.';

  @override
  String get healthOverallWarning =>
      'الوسم يعمل لكن هناك أمور تحتاج إلى انتباه.';

  @override
  String get healthOverallProblem => 'هناك مشكلة في الوسم؛ راجع النصائح أدناه.';

  @override
  String get healthNotNdef => 'غير منسق بصيغة NDEF';

  @override
  String get healthNotNdefTip =>
      'لا تستطيع الهواتف قراءة محتواه. نسّقه من الأدوات ← تنسيق الذاكرة أو اكتب عليه مباشرة.';

  @override
  String get healthEmpty => 'الوسم فارغ';

  @override
  String get healthEmptyTip => 'أضف محتوى من تبويب الكتابة أو من قالب جاهز.';

  @override
  String get healthReadOnly => 'للقراءة فقط (مقفل)';

  @override
  String get healthReadOnlyTip =>
      'لا يمكن تغيير المحتوى، وهذا مناسب للأماكن العامة.';

  @override
  String get healthWritable => 'قابل للكتابة';

  @override
  String get healthWritableTip =>
      'إذا كان سيوضع في مكان عام ففكّر في قفله حتى لا يغيّره أحد.';

  @override
  String healthNearlyFull(String percent) {
    return 'ممتلئ تقريبًا ($percent%)';
  }

  @override
  String get healthNearlyFullTip =>
      'للمحتوى الأطول استخدم وسمًا أكبر (NTAG215/216) أو رابطًا أقصر.';

  @override
  String healthRoomLeft(String free, String total) {
    return '$free من $total بايت فارغة';
  }

  @override
  String get healthRoomLeftTip => 'توجد مساحة لمحتوى جديد.';

  @override
  String get healthRiskyLink => 'رابط خطير';

  @override
  String get healthRiskyLinkTip =>
      'يبدو الرابط كموقع مزيف. لا تفتحه؛ إذا كان الوسم في مكان عام فربما تم العبث به.';

  @override
  String get healthSuspiciousLink => 'رابط مريب';

  @override
  String get healthSuspiciousLinkTip =>
      'عنوان مختصر أو غير معتاد. تحقق منه قبل فتحه.';

  @override
  String get healthSignedValid => 'توقيع صالح';

  @override
  String get healthSignedValidTip => 'كُتب المحتوى بمفتاحك ولم يتغير.';

  @override
  String get healthSignedInvalid => 'توقيع غير صالح';

  @override
  String get healthSignedInvalidTip =>
      'تغيّر المحتوى بعد التوقيع. لا تثق به وأعد كتابة الوسم.';

  @override
  String get healthPossibleClone => 'قد يكون نسخة';

  @override
  String get healthPossibleCloneTip =>
      'نفس محتوى وسم في مكتبتك لكن برقم تسلسلي مختلف. ربما نسخه أحدهم.';

  @override
  String get healthInLibrary => 'محفوظ في مكتبتك';

  @override
  String get healthInLibraryTip => 'هذا أحد وسومك؛ اسمه وملاحظاته في المكتبة.';

  @override
  String get huntTitle => 'البحث عن الكنز';

  @override
  String get huntToolSubtitle =>
      'خبّئ الوسوم ودع اللاعبين يجدونها تلميحًا تلو الآخر';

  @override
  String get huntIntro =>
      'يحمل كل وسم تلميحًا لمكان الوسم التالي. يعرض التطبيق التلميح الأول ويمسح اللاعبون الوسوم بالترتيب مع احتساب الوقت. مثالي لأعياد الميلاد والمدرسة والمناسبات العائلية.';

  @override
  String get huntNew => 'بحث جديد';

  @override
  String get huntEdit => 'تعديل';

  @override
  String get huntDelete => 'حذف';

  @override
  String get huntDeleteTitle => 'حذف هذا البحث عن الكنز؟';

  @override
  String get huntSave => 'حفظ';

  @override
  String get huntName => 'اسم البحث';

  @override
  String get huntStartClue => 'التلميح الأول';

  @override
  String get huntStartClueHint => 'يظهر على الهاتف ويقود إلى الوسم 1.';

  @override
  String huntClueLabel(String n) {
    return 'تلميح الوسم $n';
  }

  @override
  String huntClueHint(String n) {
    return 'يقود إلى الوسم $n.';
  }

  @override
  String get huntLastClueHint => 'الوسم الأخير: رسالة تهنئة أو مكان الكنز.';

  @override
  String get huntAddClue => 'إضافة وسم';

  @override
  String get huntMissingFields =>
      'يلزم اسم وتلميح أول وتلميح وسم واحد على الأقل.';

  @override
  String huntStations(String count) {
    return '$count وسوم';
  }

  @override
  String huntBest(String time) {
    return 'أفضل وقت $time';
  }

  @override
  String get huntWriteTags => 'كتابة الوسوم';

  @override
  String get huntPlay => 'العب';

  @override
  String huntWriteStep(String n, String total) {
    return 'الوسم $n/$total';
  }

  @override
  String huntWriteStepBody(String clue) {
    return 'هذا التلميح سيُكتب على الوسم:\n\n$clue\n\nجهّز الوسم واضغط كتابة. ثم خبّئه حيث يشير التلميح السابق.';
  }

  @override
  String get huntWriteNow => 'اكتب';

  @override
  String huntWriteFailed(String n) {
    return 'تعذرت كتابة الوسم $n؛ حاول مرة أخرى.';
  }

  @override
  String get huntWriteDone => 'تمت كتابة كل الوسوم. خبّئها وابدأ اللعب!';

  @override
  String get huntQuit => 'إنهاء اللعبة';

  @override
  String huntProgress(String found, String total) {
    return 'تم العثور على $found/$total';
  }

  @override
  String get huntCurrentClue => 'التلميح';

  @override
  String huntFinished(String time) {
    return 'أحسنت! الوقت: $time';
  }

  @override
  String get huntDone => 'إنهاء';

  @override
  String get huntScanTag => 'امسح الوسم الذي وجدته';

  @override
  String huntFound(String found, String total) {
    return 'وجدته! $found/$total';
  }

  @override
  String get huntWrongOrder => 'هذا ليس الوسم التالي؛ اتبع التلميح.';

  @override
  String get huntAlreadyFound => 'لقد وجدت هذا الوسم من قبل.';

  @override
  String get huntOtherHunt => 'هذا الوسم يخص بحثًا آخر عن الكنز.';

  @override
  String get huntNotHunt => 'هذا ليس وسمًا للبحث عن الكنز.';

  @override
  String get whatsNew170 =>
      '• فحص سلامة الوسم: تقييم ونصائح\n• البحث عن الكنز: اكتب التلميحات على الوسوم وابحث عنها بالترتيب';

  @override
  String get everydaySection => 'أدوات يومية';

  @override
  String get unitTitle => 'محول الوحدات';

  @override
  String get unitSubtitle => 'الطول والوزن والحرارة والحجم والسرعة';

  @override
  String get unitLength => 'الطول';

  @override
  String get unitWeight => 'الوزن';

  @override
  String get unitTemperature => 'الحرارة';

  @override
  String get unitVolume => 'الحجم';

  @override
  String get unitSpeed => 'السرعة';

  @override
  String get unitValue => 'القيمة';

  @override
  String get unitSwap => 'تبديل الوحدات';

  @override
  String get billTitle => 'تقسيم الحساب';

  @override
  String get billSubtitle => 'المبلغ لكل شخص مع الإكرامية';

  @override
  String get billAmount => 'مبلغ الحساب';

  @override
  String billTip(String percent) {
    return 'الإكرامية: $percent%';
  }

  @override
  String get billPeople => 'عدد الأشخاص';

  @override
  String get billRoundUp => 'تقريب حصة كل شخص للأعلى';

  @override
  String get billPerPerson => 'لكل شخص';

  @override
  String get billTipAmount => 'الإكرامية';

  @override
  String get billTotal => 'الإجمالي';

  @override
  String get pwTitle => 'مولد كلمات المرور';

  @override
  String get pwSubtitle => 'كلمات مرور قوية وسهلة الكتابة';

  @override
  String get pwWeak => 'ضعيفة';

  @override
  String get pwFair => 'متوسطة';

  @override
  String get pwStrong => 'قوية';

  @override
  String get pwVeryStrong => 'قوية جدًا';

  @override
  String get pwNew => 'كلمة مرور جديدة';

  @override
  String get pwCopy => 'نسخ';

  @override
  String get pwCopied => 'تم نسخ كلمة المرور';

  @override
  String pwLength(String n) {
    return 'الطول: $n';
  }

  @override
  String get pwLower => 'أحرف صغيرة';

  @override
  String get pwUpper => 'أحرف كبيرة';

  @override
  String get pwDigits => 'أرقام';

  @override
  String get pwSymbols => 'رموز';

  @override
  String get randTitle => 'النرد والقرعة';

  @override
  String get randSubtitle => 'ارمِ النرد، اقلب العملة، اسحب من قائمة';

  @override
  String get randDice => 'النرد';

  @override
  String randTotal(String total) {
    return 'المجموع: $total';
  }

  @override
  String get randRoll => 'ارمِ';

  @override
  String get randCoin => 'رمي العملة';

  @override
  String get randHeads => 'صورة';

  @override
  String get randTails => 'كتابة';

  @override
  String get randFlip => 'اقلب';

  @override
  String get randDraw => 'سحب من قائمة';

  @override
  String get randDrawHint => 'اسم في كل سطر أو مفصولة بفواصل';

  @override
  String get randDrawButton => 'اسحب';

  @override
  String get randWinner => 'الفائز';

  @override
  String get tallyTitle => 'عداد';

  @override
  String get tallySubtitle =>
      'عدّ الأشخاص أو الجولات أو العناصر؛ يكمل من حيث توقفت';

  @override
  String get tallyReset => 'إعادة الضبط';

  @override
  String get tallyTapHint => 'انقر في أي مكان للعد';

  @override
  String get whatsNew180 =>
      '• أدوات يومية: محول الوحدات، تقسيم الحساب، مولد كلمات المرور، النرد والقرعة، العداد';
}
