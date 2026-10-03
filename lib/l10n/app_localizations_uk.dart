// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get addRecord => 'Додати запис';

  @override
  String get addToComposerList => 'Додати до списку запису';

  @override
  String get addToWriteList => 'Додати до списку запису';

  @override
  String get addressCannotBeEmpty => 'Адреса не може бути порожньою.';

  @override
  String get advancedCommandsDesc =>
      'Одна hex-команда на рядок. Напр.: 60 = GET_VERSION, 30 04 = читати сторінку 4. Неправильні команди можуть пошкодити мітку.';

  @override
  String get advancedCommandsSubtitle =>
      'Надсилає необроблені hex-команди безпосередньо до мітки';

  @override
  String get advancedCommandsTitle => 'Розширені команди NFC';

  @override
  String get appLinksDesc =>
      'При записі на мітку торкання покаже сповіщення та відкриє додаток на потрібному екрані.';

  @override
  String get appLinksSection => 'Посилання додатку';

  @override
  String get appPackageName => 'Назва пакета Android';

  @override
  String get appSettings => 'Налаштування програми';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'Автозапуск при торканні';

  @override
  String get backupFileSizeExceeded =>
      'Розмір файлу резервної копії перевищує 2 МіБ.';

  @override
  String get backupHistoryMustBeList => 'Поле \"history\" має бути списком.';

  @override
  String backupInvalidJson(String error) {
    return 'Некоректний формат JSON: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Неприпустима нотатка правила.';

  @override
  String get backupInvalidRuleSha => 'Неприпустимий SHA-256 хеш.';

  @override
  String get backupInvalidTemplateId => 'Некоректний ID шаблону.';

  @override
  String get backupInvalidTemplateName => 'Некоректна назва шаблону.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Кількість історії перевищує ліміт $max ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'Кількість правил перевищує ліміт $max ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'Кількість шаблонів перевищує ліміт $max ($count).';
  }

  @override
  String get backupMissingSchemaVersion => 'Відсутнє поле \"schemaVersion\".';

  @override
  String get backupRecordMustBeObject =>
      'Кожен запис NDEF має бути об\'єктом JSON.';

  @override
  String get backupRestoreSubtitle =>
      'Зберігайте шаблони, нотатки та історію у форматі JSON або об\'єднуйте з наявними даними.';

  @override
  String get backupRestoreTitle => 'Резервне копіювання та відновлення (JSON)';

  @override
  String get backupRootMustBeObject =>
      'Кореневий елемент має бути об\'єктом JSON.';

  @override
  String get backupRuleMustBeObject => 'Кожне правило має бути об\'єктом JSON.';

  @override
  String get backupSchemaVersionMustBeInt =>
      'Поле \"schemaVersion\" має бути цілим числом.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'Резервна копія перевищує ліміт 2 МіБ ($bytes байтів).';
  }

  @override
  String get backupTagRulesMustBeList => 'Поле \"tagRules\" має бути списком.';

  @override
  String get backupTemplateMustBeObject =>
      'Кожен шаблон має бути об\'єктом JSON.';

  @override
  String get backupTemplatesMustBeList =>
      'Поле \"templates\" має бути списком.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'Непідтримувана версія схеми: $version.';
  }

  @override
  String cameraError(String error) {
    return 'Не вдалося відкрити камеру. Надайте дозвіл у меню Параметри > Приватність > Камера.\n($error)';
  }

  @override
  String get cancel => 'Скасувати';

  @override
  String get catBusiness => 'Бізнес';

  @override
  String get catCar => 'Авто';

  @override
  String get catHome => 'Дім';

  @override
  String get catOther => 'Інше';

  @override
  String get catPersonal => 'Особисте';

  @override
  String get catWork => 'Робота';

  @override
  String get categoryLabel => 'Категорія';

  @override
  String get chooseFromGallery => 'Обрати з галереї';

  @override
  String get clear => 'Очистити';

  @override
  String get clearAll => 'Очистити все';

  @override
  String get clearConfirmMessage =>
      'Усі записи NDEF буде видалено, і буде записано порожній запис. Продовжити?';

  @override
  String get clearConfirmTitle => 'Скинути вміст мітки';

  @override
  String get clearHistory => 'Очистити історію';

  @override
  String get clearTagSubtitle => 'Видаляє всі записи та записує порожній NDEF';

  @override
  String get clearTagTitle => 'Очистити мітку';

  @override
  String get close => 'Закрити';

  @override
  String get commandsEmptyError => 'Введіть хоча б одну команду.';

  @override
  String get commandsLabel => 'Команди';

  @override
  String get confirmClearHistoryContent =>
      'Усю збережену історію сканувань буде видалено. Продовжити?';

  @override
  String get confirmClearHistoryTitle => 'Очистити історію';

  @override
  String get confirmClearTemplatesContent =>
      'Усі збережені шаблони запису буде видалено. Продовжити?';

  @override
  String get confirmClearTemplatesTitle => 'Очистити шаблони';

  @override
  String get contactCompany => 'Компанія / Організація';

  @override
  String get contactEmail => 'Ел. пошта';

  @override
  String get contactFullName => 'ПІБ';

  @override
  String get contactPhone => 'Телефон';

  @override
  String get contactTitle => 'Посада';

  @override
  String get contactWebsite => 'Веб-сайт';

  @override
  String get copy => 'Копіювати';

  @override
  String get copyTagUid => 'Скопіювати UID';

  @override
  String get copyToComposer => 'Копіювати в список запису';

  @override
  String get csvInvalidAddress => 'неприпустима адреса.';

  @override
  String get csvInvalidEmail => 'неприпустима адреса ел. пошти.';

  @override
  String get csvInvalidLocation =>
      'вкажіть широту та довготу (напр., локація,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'Імпортовано максимум $max записів; решту пропущено.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'Рядок $row: значення порожнє.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'Рядок $row: $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'невідомий тип \"$type\".';
  }

  @override
  String get csvWifiPasswordLength =>
      'Пароль Wi-Fi має містити від 8 до 63 символів.';

  @override
  String get delete => 'Видалити';

  @override
  String get deleteTemplateTooltip => 'Видалити шаблон';

  @override
  String get deviceNameTooLong => 'Занадто довга назва пристрою.';

  @override
  String get dismiss => 'Відхилити';

  @override
  String get editRecordTitle => 'Редагувати запис';

  @override
  String get emailRecipient => 'Кому (Email)';

  @override
  String get exportBackup => 'Експорт';

  @override
  String get facetimePrompt =>
      'Введіть номер телефону або e-mail від Apple ID.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" не може бути порожнім.';
  }

  @override
  String get flashlight => 'Ліхтарик';

  @override
  String get formatMemorySubtitle =>
      'Підготовка для NDEF (чисті або пошкоджені мітки)';

  @override
  String get formatMemoryTitle => 'Форматувати пам\'ять';

  @override
  String get idTooLarge => 'Довжина ID не може перевищувати 255 байтів';

  @override
  String get importBackup => 'Імпорт (Об\'єднати)';

  @override
  String get inAppTagRules => 'Локальні правила міток';

  @override
  String get invalidHexId => 'Некоректний hex-рядок ID';

  @override
  String get invalidHexPayload => 'Некоректний hex-рядок даних';

  @override
  String get invalidHexType => 'Некоректний hex-рядок типу';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get linkCopied => 'Посилання скопійовано';

  @override
  String get linkHistoryDesc => 'Відкриває історію';

  @override
  String get linkScanDesc => 'Відкриває додаток і починає сканування';

  @override
  String get linkToolsDesc => 'Відкриває екран утиліт';

  @override
  String get linkWriteDesc => 'Відкриває екран запису';

  @override
  String get locationLabel => 'Де розташована?';

  @override
  String get lockAcknowledge => 'Я розумію, що цю дію не можна скасувати';

  @override
  String get lockTagSubtitle =>
      'Назавжди робить мітку доступною лише для читання';

  @override
  String get lockTagTitle => 'Заблокувати мітку';

  @override
  String get manage => 'Керування';

  @override
  String get navHistory => 'Історія';

  @override
  String get navHistoryTitle => 'Історія';

  @override
  String get navRead => 'Читати';

  @override
  String get navReadTitle => 'Зчитування мітки';

  @override
  String get navSettings => 'Налашт.';

  @override
  String get navSettingsTitle => 'Шаблони та налаштування';

  @override
  String get navTools => 'Утиліти';

  @override
  String get navToolsTitle => 'Утиліти';

  @override
  String get navWrite => 'Запис';

  @override
  String get navWriteTitle => 'Запис мітки';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записів',
      one: '1 запис',
    );
    return '$_temp0';
  }

  @override
  String get nfcPromptClear => 'Піднесіть мітку для скидання';

  @override
  String get nfcPromptLock => 'Піднесіть мітку для остаточного блокування';

  @override
  String get nfcPromptScan => 'Піднесіть мітку до верхньої частини телефону';

  @override
  String get nfcPromptWrite => 'Піднесіть NFC-мітку для збереження даних';

  @override
  String get no => 'Ні';

  @override
  String get noTemplates =>
      'Немає збережених шаблонів.\nСтворіть запис на вкладці \"Запис\", щоб зберегти його як шаблон.';

  @override
  String get noteLabel => 'Нотатка';

  @override
  String get onboardingContinue => 'Далі';

  @override
  String get onboardingSkip => 'Пропустити';

  @override
  String get onboardingStart => 'Розпочати';

  @override
  String get onboardingStep1Body =>
      'Торкніться синьої кнопки внизу та піднесіть телефон до мітки. Вміст, місткість та UID з\'являться миттєво.';

  @override
  String get onboardingStep1Title => 'Скануйте мітку';

  @override
  String get onboardingStep2Body =>
      'У вкладці \"Запис\" натисніть \"Додати запис\": веб-посилання, Wi-Fi, контакти, соцмережі та готові шаблони.';

  @override
  String get onboardingStep2Title => 'Записуйте будь-що';

  @override
  String get onboardingStep3Body =>
      'Аналізуйте пам\'ять, встановлюйте паролі, блокуйте або форматуйте мітки у вкладці \"Утиліти\".';

  @override
  String get onboardingStep3Title => 'Експертні інструменти';

  @override
  String get onboardingStep4Body =>
      'Зберігайте мітки з назвами, нотатками та фото у вашій бібліотеці. Змінюйте мову в Налаштуваннях.';

  @override
  String get onboardingStep4Title => 'Каталог міток';

  @override
  String optionalField(String label) {
    return '$label (необов\'язково)';
  }

  @override
  String get passwordError => 'Введіть рівно 4 символи або 8 hex-знаків.';

  @override
  String get passwordHint => '4 символи (напр., 1234) або 8 hex-знаків';

  @override
  String get passwordLabel => 'Пароль';

  @override
  String get paste => 'Вставити';

  @override
  String get phoneNumber => 'Номер телефону';

  @override
  String get phoneWithCountryCode =>
      'Введіть номер з кодом країни (напр., 380501234567).';

  @override
  String get presetAppDownloadDesc =>
      'Відкриває або пропонує встановити додаток на Android.';

  @override
  String get presetAppDownloadTitle => 'Завантаження додатку';

  @override
  String get presetBusinessCardDesc =>
      'Передає вашу візитку; Android запропонує зберегти, на iPhone вона відкриється в NFC-застосунку.';

  @override
  String get presetBusinessCardTitle => 'Цифрова візитка';

  @override
  String get presetDirectionsDesc => 'Показує адресу або місце на карті.';

  @override
  String get presetDirectionsTitle => 'Маршрут / Точка на карті';

  @override
  String get presetEmergencyDesc =>
      'Група крові, контакти для зв\'язку та життєво важливі дані.';

  @override
  String get presetEmergencyTitle => 'Екстрена картка (ICE)';

  @override
  String get presetGoogleReviewDesc =>
      'Спрямовує клієнта на сторінку відгуків у Google.';

  @override
  String get presetGoogleReviewTitle => 'Відгук у Google';

  @override
  String get presetGuestWifiDesc =>
      'Android підключається дотиком; на iPhone дані видно в NFC-застосунку.';

  @override
  String get presetGuestWifiTitle => 'Гостьовий Wi-Fi';

  @override
  String get presetInstagramDesc => 'Миттєво відкриває профіль у Instagram.';

  @override
  String get presetInstagramTitle => 'Профіль Instagram';

  @override
  String get presetMenuLinkDesc =>
      'Розмістіть на столиках для швидкого перегляду меню.';

  @override
  String get presetMenuLinkTitle => 'Меню ресторану';

  @override
  String get presetPetTagDesc =>
      'Дозволяє тому, хто знайшов улюбленця, швидко вам зателефонувати.';

  @override
  String get presetPetTagTitle => 'Адресник для тварини';

  @override
  String get presetShortcutDesc =>
      'Запускає команди Apple або дії всередині додатку.';

  @override
  String get presetShortcutTitle => 'Швидкі команди';

  @override
  String get presetWebsiteDesc => 'Спрямовує на будь-яку веб-сторінку.';

  @override
  String get presetWebsiteTitle => 'Посилання на сайт';

  @override
  String get presetWhatsappDesc =>
      'Початок листування без збереження номера в контакти.';

  @override
  String get presetWhatsappTitle => 'Чат у WhatsApp';

  @override
  String get qrCode => 'QR-код';

  @override
  String qrContentChars(int chars) {
    return 'Вміст ($chars симв.):';
  }

  @override
  String get qrContentEmpty => 'Вміст для перетворення порожній.';

  @override
  String qrContentTooLarge(int chars) {
    return 'Вміст занадто великий для QR-коду ($chars символів, максимум 2048).';
  }

  @override
  String get qrFrameInstructions =>
      'Наведіть камеру на QR-код. Веб-посилання, Wi-Fi та текст буде перетворено на записи.';

  @override
  String qrGenerationFailed(String error) {
    return 'Не вдалося створити QR-код: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'Попередній перегляд QR: $title';
  }

  @override
  String get qrScanTitle => 'Сканувати QR-код';

  @override
  String get qrSecurityNote =>
      'Попередній перегляд QR підтримується лише для тексту та веб-посилань.\n\nПаролі Wi-Fi та бінарні дані не конвертуються з міркувань безпеки.';

  @override
  String get qrUserOnlyNote => 'Відкривається лише за запитом користувача.';

  @override
  String get rawRecordDetailsTitle => 'Деталі запису (Лише читання)';

  @override
  String get rawRecordEditorTitle => 'Редагувати сирий запис NDEF';

  @override
  String get readHeroButton => 'Почати сканування';

  @override
  String get readMemorySubtitle =>
      'Посторінкове читання пам\'яті; копіювання або збереження у .bin';

  @override
  String get readMemoryTitle => 'Читати пам\'ять';

  @override
  String get readyTemplates => 'Готові шаблони';

  @override
  String get recordTypeCalendar => 'Подія календаря (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'Власний MIME ($mime)';
  }

  @override
  String get recordTypeEmail => 'Запис ел. пошти';

  @override
  String get recordTypeLocation => 'Геолокація / GPS';

  @override
  String get recordTypePhone => 'Номер телефону';

  @override
  String get recordTypeSmartPoster => 'Smart Poster';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'Пошкоджений запис Smart Poster ($bytes байтів)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'Smart Poster (Некоректний)';

  @override
  String get recordTypeSms => 'Запис SMS';

  @override
  String get recordTypeText => 'Текстовий запис';

  @override
  String get recordTypeUnknown => 'Невідомий запис';

  @override
  String get recordTypeUrl => 'Веб-посилання (URL)';

  @override
  String get recordTypeVCard => 'Картка контакту (vCard)';

  @override
  String get recordTypeWifi => 'Конфігурація Wi-Fi (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'Пошкоджені дані WSC';

  @override
  String get redo => 'Повторити';

  @override
  String get removePasswordSubtitle =>
      'Знімає захист за допомогою відомого пароля';

  @override
  String get removePasswordTitle => 'Зняти пароль';

  @override
  String get rewriteTag => 'Перезаписати';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Видалити правило з нотаткою \"$note\"?';
  }

  @override
  String get ruleNoteDialogTitle => 'Редагувати нотатку мітки';

  @override
  String get ruleNoteLabel => 'Локальна нотатка / Опис';

  @override
  String get save => 'Зберегти';

  @override
  String get saveAsTemplate => 'Зберегти як шаблон';

  @override
  String get saveBin => 'Зберегти .bin';

  @override
  String get saveLocalHistory => 'Зберігати історію сканувань';

  @override
  String get saveLocalHistorySubtitle =>
      'Якщо вимкнено, скани не зберігаються. Якщо ввімкнено, успішні скани зберігаються локально.';

  @override
  String get scanFabLabel => 'Сканувати мітку';

  @override
  String get scannedTag => 'Зчитана мітка';

  @override
  String get searchQueryCannotBeEmpty =>
      'Пошуковий запит не може бути порожнім.';

  @override
  String get securityRestriction => 'Обмеження безпеки';

  @override
  String get send => 'Надіслати';

  @override
  String get setPasswordSubtitle =>
      'Захищає вміст мітки від несанкціонованого перезапису';

  @override
  String get setPasswordTitle => 'Встановити пароль';

  @override
  String get shortcutAutomationNote =>
      'Примітка: Автоматизація прив\'язується до UID мітки і працюватиме навіть при зміні даних.';

  @override
  String get shortcutStep1 =>
      'Відкрийте додаток \"Команди\" та оберіть \"Автоматизація\" внизу.';

  @override
  String get shortcutStep2 =>
      'Натисніть \"Нова автоматизація\" (+) → виберіть \"NFC\".';

  @override
  String get shortcutStep3 =>
      'Натисніть \"Сканувати\", піднесіть мітку до iPhone та назвіть її.';

  @override
  String get shortcutStep4 =>
      'Оберіть \"Негайний запуск\" та додайте потрібну дію.';

  @override
  String get shortcutStep5 =>
      'Для відкриття додатку оберіть дію \"Сканувати мітку\" або \"Записати мітку\".';

  @override
  String get shortcutsGuideSubtitle =>
      'Запускайте дії в один дотик до мітки або попросіть Siri сканувати голосом.';

  @override
  String get shortcutsGuideTitle => 'Siri та Швидкі команди';

  @override
  String get siriPhraseScan =>
      '\"Привіт, Siri, скануй мітку в NFC Tag Master\"';

  @override
  String get siriPhraseWrite =>
      '\"Привіт, Siri, запиши мітку в NFC Tag Master\"';

  @override
  String get siriShortcutsNote =>
      'Ці команди також з\'являться в додатку \"Команди\" та пошуку Spotlight.';

  @override
  String get smsMessage => 'Текст повідомлення';

  @override
  String get socialUsername => 'Ім\'я користувача';

  @override
  String get sourceSelectPrompt => 'Звідки взяти дані для мітки?';

  @override
  String get statusCancelled => 'Скасовано';

  @override
  String statusClearError(String error) {
    return 'Помилка форматування: $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'Помилка очищення: $error';
  }

  @override
  String get statusClearSuccess => 'Вміст мітки успішно очищено.';

  @override
  String get statusClearing => 'Режим очищення активний. Піднесіть мітку...';

  @override
  String statusLockError(String error) {
    return 'Помилка блокування: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'Помилка блокування: $error';
  }

  @override
  String get statusLockSuccess =>
      'Мітку назавжди заблоковано (лише для читання).';

  @override
  String get statusLocking => 'Блокування... Піднесіть мітку.';

  @override
  String get statusNfcDisabled =>
      'NFC вимкнено. Увімкніть його в налаштуваннях.';

  @override
  String get statusNfcNotSupported => 'NFC не підтримується на цьому пристрої.';

  @override
  String get statusNfcUnavailable => 'NFC наразі недоступний.';

  @override
  String get statusReady => 'Готово';

  @override
  String statusScanError(String error) {
    return 'Помилка сканування: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'Мітку успішно зчитано ($id).';
  }

  @override
  String get statusScanning => 'Сканування... Піднесіть телефон до мітки.';

  @override
  String statusUnexpectedError(String error) {
    return 'Неочікувана помилка: $error';
  }

  @override
  String statusWriteError(String error) {
    return 'Помилка запису: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'Не вдалося записати: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return 'Запис і перевірка успішні! ($bytes байтів)';
  }

  @override
  String get statusWriting => 'Режим запису активний. Піднесіть мітку...';

  @override
  String get systemLanguage => 'Мова системи';

  @override
  String get tabContact => 'Контакт (vCard)';

  @override
  String get tabCustomMime => 'Власний MIME';

  @override
  String get tabEmail => 'Ел. пошта';

  @override
  String get tabPhone => 'Телефон';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabText => 'Текст';

  @override
  String get tabUrl => 'Веб-URL';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => 'Інформація про мітку';

  @override
  String get tagLibraryTitle => 'Моя бібліотека міток';

  @override
  String tagRulesCount(int count) {
    return 'Збережених правил / нотаток: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Відображає лише збережену нотатку на основі SHA-256 хешу байтів вмісту NDEF.';

  @override
  String get tagWritable => 'Доступний для запису';

  @override
  String get takePhoto => 'Зробити фото';

  @override
  String get templateNameHint => 'Назва шаблону';

  @override
  String get toolsExpertSection => 'Експерт';

  @override
  String get toolsFooterNote =>
      'Інструменти пам\'яті, паролів і команд підтримують NTAG213/215/216 та MIFARE Ultralight EV1.';

  @override
  String get toolsMemorySection => 'Пам\'ять';

  @override
  String get toolsSecuritySection => 'Безпека';

  @override
  String get toolsTagSection => 'Мітка';

  @override
  String get typeTooLarge => 'Довжина типу не може перевищувати 255 байтів';

  @override
  String get undo => 'Скасувати';

  @override
  String get unknownChip16Pages => 'Невідомий чіп (перші 16 сторінок)';

  @override
  String get urlSafetyInvalidUrl => 'Некоректний формат URL.';

  @override
  String get urlSafetyIpv4 => 'Адреса призначення містить пряму IPv4-адресу.';

  @override
  String get urlSafetyIpv6 => 'Адреса призначення містить пряму IPv6-адресу.';

  @override
  String get urlSafetyMissingScheme => 'Відсутня схема протоколу URL.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'Нестандартний порт підключення (Порт: $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'Виявлено інтернаціоналізований домен / Punycode (\"xn--\").';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'Нестандартна схема URL: \"$scheme\".';
  }

  @override
  String get urlSafetyUnencrypted => 'Незашифроване з\'єднання (http://).';

  @override
  String get urlSafetyUserInfo =>
      'URL містить облікові дані (userinfo). Можливий фішинг.';

  @override
  String get usernameCannotBeEmpty =>
      'Ім\'я користувача не може бути порожнім.';

  @override
  String get usernameNoSpaces =>
      'Ім\'я користувача не повинно містити пробілів.';

  @override
  String get validAndroidPackage =>
      'Введіть коректну назву пакета Android (напр., com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'Введіть коректну Bluetooth MAC-адресу (напр., 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'Введіть коректне посилання на відео.';

  @override
  String get validWebAddress =>
      'Введіть коректну веб-адресу (напр., https://example.com/file.pdf).';

  @override
  String get verificationNotChecked => 'Не перевірялося';

  @override
  String get verificationPassed => 'Пройдено';

  @override
  String get videoUrlCannotBeEmpty =>
      'Посилання на відео не може бути порожнім.';

  @override
  String get videoUrlOrIdPrompt =>
      'Введіть URL (https://...) або ID відео на YouTube.';

  @override
  String get wifiAuthOpen => 'Відкрита (Без захисту)';

  @override
  String get wifiPassword => 'Пароль';

  @override
  String get wifiSsid => 'Назва мережі (SSID)';

  @override
  String get withSiri => 'За допомогою Siri';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes байтів) буде записано в пам\'ять мітки. UID та сторінки конфігурації зберігаються.';
  }

  @override
  String get writeDumpSubtitle => 'Записує бінарний файл пам\'яті на мітку';

  @override
  String get writeDumpTitle => 'Записати дамп (.bin)';

  @override
  String get writeHeroTitle => 'Записати мітку';

  @override
  String get writeHeroWriting => 'Запис...';

  @override
  String get writeResultFailed => 'Помилка операції';

  @override
  String get writeResultSuccess => 'Успішно виконано';

  @override
  String get writeTemplates => 'Шаблони запису';

  @override
  String get writeTemplatesSubtitle =>
      'Зберігайте популярний вміст NDEF як шаблони для швидкого запису.';

  @override
  String get unknown => 'Невідомо';

  @override
  String get error => 'Помилка';

  @override
  String get nfcPromptReady => 'Піднесіть мітку';

  @override
  String get invalidResponseFormat => 'Отримано недійсний формат відповіді';

  @override
  String get nfcReadError => 'Помилка зчитування NFC';

  @override
  String get invalidPlatformResponse =>
      'Отримано недійсний відповідь від платформи';

  @override
  String get writeFailed => 'Не вдалося записати';

  @override
  String get lockFailed => 'Не вдалося заблокувати';

  @override
  String get failedToConnectTag => 'Не вдалося підключитися до мітки';

  @override
  String get invalidTagResponse => 'Недійсна відповідь від мітки';

  @override
  String get commandFailed => 'Команда не виконана';

  @override
  String get ndefTypeOrIdTooLong => 'Тип або ID NDEF перевищує 255 байтів';

  @override
  String get ndefUnsupportedOrInvalidRecord =>
      'Непідтримуваний або недійсний запис NDEF';

  @override
  String get ndefMissingTypeLength => 'Відсутня довжина типу NDEF';

  @override
  String get ndefMissingPayloadLength =>
      'Відсутня довжина корисного навантаження NDEF';

  @override
  String get ndefMissingIdLength => 'Відсутня довжина ID NDEF';

  @override
  String get ndefMissingType => 'Відсутній тип NDEF';

  @override
  String get ndefMissingId => 'Відсутній ID NDEF';

  @override
  String get ndefMissingPayload => 'Відсутнє корисне навантаження NDEF';

  @override
  String get unprotected => '(Без пароля)';

  @override
  String get binaryDataPreview => '(Двійкові дані)';

  @override
  String get emptyValue => '(Порожньо)';

  @override
  String get tnfEmpty => '0: Empty (Порожньо)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (Невідомо)';

  @override
  String get tnfUnchanged => '6: Unchanged (Фрагментований NDEF)';

  @override
  String get tnfReserved => '7: Reserved (Зарезервовано)';

  @override
  String get ntagUnsupportedChip =>
      'Ця операція підтримується лише на мітках NTAG213/215/216 та MIFARE Ultralight EV1.';

  @override
  String ntagPageReadFailed(String page) {
    return 'Не вдалося прочитати сторінку $page (мітка не відповіла або область захищена).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'Не вдалося записати сторінку $page: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'Не вдалося записати сторінку $page (відхилено; заблоковано або захищено).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'Не вдалося прочитати далі сторінки $page; ця область може бути захищена паролем.';
  }

  @override
  String get ntagPasswordPackSize =>
      'Пароль має бути 4 байти, а PACK — 2 байти.';

  @override
  String get ntagPasswordSize => 'Пароль має бути 4 байти.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'Невірний пароль або мітка відхилила автентифікацію.';

  @override
  String get ntagPasswordWrong => 'Невірний пароль.';

  @override
  String get ntagCcInvalid =>
      'Область CC містить значення не NDEF; цю область OTP не можна відформатувати.';

  @override
  String get ntagDumpTooShort =>
      'Дамп занадто короткий; не містить даних користувача.';

  @override
  String get ntagInvalidHex =>
      'Введіть дійсне шістнадцяткове значення (напр.: 30 04).';

  @override
  String get googleReviewFieldLabel => 'Посилання на відгук або Place ID';

  @override
  String get menuLinkFieldLabel => 'Посилання на меню';

  @override
  String get menuTitleHint => 'Наше меню';

  @override
  String get petName => 'Кличка тварини';

  @override
  String get ownerPhone => 'Телефон власника';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'Привіт, я $pet! Будь ласка, зателефонуйте моєму власнику: $phone$note';
  }

  @override
  String get bloodType => 'Група крові';

  @override
  String get allergies => 'Алергії / Ліки';

  @override
  String get emergencyContact => 'Екстрений контакт';

  @override
  String get emergencyInfo => 'ЕКСТРЕНА ІНФОРМАЦІЯ';

  @override
  String emergencyBlood(String blood) {
    return 'Група крові: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'Алергії: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'У разі екстреної ситуації телефонуйте: $contact';
  }

  @override
  String get storeLink => 'Посилання на магазин';

  @override
  String get link => 'Посилання';

  @override
  String get title => 'Заголовок';

  @override
  String get webAddress => 'Веб-адреса';

  @override
  String get address => 'Адреса';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'Шаблони: додано $added, оновлено $updated';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'Нотатки/правила міток: додано $added, оновлено $updated';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'Історію сканування пропущено, оскільки вона вимкнена на пристрої: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'Історія: додано $added, пропущено/наявні $skipped';
  }

  @override
  String get backupSummaryNoNewData =>
      'Нових даних для імпорту не знайдено (збігаються з наявними записами).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field має бути рядком.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field має бути дійсною датою.';
  }

  @override
  String get rawTypeHexLabel => 'Тип (Hex-байти)';

  @override
  String get rawIdHexLabel => 'ID (Hex-байти, необов\'язково)';

  @override
  String get rawPayloadHexLabel => 'Корисне навантаження (Hex-байти)';

  @override
  String get rawOptionalHexHint => 'Необов\'язкові hex-байти';

  @override
  String get saveChanges => 'Зберегти зміни';

  @override
  String get edit => 'Редагувати';

  @override
  String get clearAllButton => 'Очистити все';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: прочитано $count сторінок';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip відформатовано';
  }

  @override
  String get ntagInvalidDumpFile =>
      'Недійсний файл дампу (має бути кратним 4 байтам, 32–1024 байт).';

  @override
  String ntagPagesWritten(int count) {
    return 'Записано сторінок: $count';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: захист паролем увімкнено';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: пароль видалено';
  }

  @override
  String get memoryDumpCopied => 'Дамп пам\'яті скопійовано';

  @override
  String ntagCommandsSent(int count) {
    return 'Надіслано команд: $count';
  }

  @override
  String get emptyResponse => '(порожня відповідь)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages стор. · $bytes байт';
  }

  @override
  String get composeTextEmpty => 'Текстовий вміст не може бути порожнім.';

  @override
  String get composeTextTooLong =>
      'Текст занадто довгий (максимум 5000 символів).';

  @override
  String get composeUrlInvalid =>
      'Введіть дійсну адресу (наприклад: https://example.com або посилання app://).';

  @override
  String get composeUrlTooLong =>
      'URL занадто довгий (максимум 2000 символів).';

  @override
  String get composeEmailInvalid =>
      'Введіть дійсну адресу електронної пошти (наприклад: name@domain.com).';

  @override
  String get composePhoneInvalid =>
      'Введіть дійсний номер телефону (наприклад: +905551234567).';

  @override
  String get composeSmsPhoneInvalid =>
      'Введіть дійсний номер телефону одержувача.';

  @override
  String get composeLatInvalid => 'Широта має бути від -90 до +90.';

  @override
  String get composeLngInvalid => 'Довгота має бути від -180 до +180.';

  @override
  String get composeVcardNameEmpty => 'Ім\'я контакту не може бути порожнім.';

  @override
  String get composeVcardNameTooLong =>
      'Ім\'я контакту занадто довге (максимум 200 символів).';

  @override
  String get composeVcardEmailInvalid =>
      'Введіть дійсну адресу електронної пошти.';

  @override
  String get composeVcardPhoneInvalid => 'Введіть дійсний номер телефону.';

  @override
  String get composeVcardUrlInvalid =>
      'Введіть дійсну веб-адресу (наприклад: https://...).';

  @override
  String get composeCalSummaryEmpty => 'Назва події не може бути порожньою.';

  @override
  String get composeCalSummaryTooLong =>
      'Назва події занадто довга (максимум 250 символів).';

  @override
  String get composeCalDateInvalid =>
      'Час завершення має бути пізнішим за час початку.';

  @override
  String get composeSpUriInvalid =>
      'Введіть дійсну цільову URL-адресу (наприклад: https://...).';

  @override
  String get composeSpLangInvalid =>
      'Введіть дійсний код мови ISO (наприклад: uk, en).';

  @override
  String get composeMimeTypeInvalid =>
      'Введіть дійсний тип MIME (наприклад: application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'Введіть дійсний шістнадцятковий рядок (парна кількість hex-символів).';

  @override
  String get composeMimePayloadTooLarge =>
      'Розмір корисного навантаження занадто великий (максимум 10 КБ).';

  @override
  String get composeWifiSsidEmpty =>
      'Назва мережі (SSID) не може бути порожньою.';

  @override
  String get composeWifiPasswordRequired =>
      'Пароль Wi-Fi обов\'язковий для зашифрованих мереж.';

  @override
  String get composeWifiPasswordLength =>
      'Пароль WPA/WPA2 має містити від 8 до 63 символів.';

  @override
  String get composeEditNdefRecord => 'Редагувати запис NDEF';

  @override
  String get composeNewNdefRecord => 'Створити новий запис NDEF';

  @override
  String get quickLinksHeader => 'Швидкі посилання';

  @override
  String get quickLinkCustomUri => 'Власний URI';

  @override
  String get quickLinkSocial => 'Соціальні мережі';

  @override
  String get quickLinkVideo => 'Відео';

  @override
  String get quickLinkSearch => 'Пошук';

  @override
  String get quickLinkFile => 'Файл';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime Аудіо';

  @override
  String get quickLinkAddress => 'Адреса';

  @override
  String get quickLinkPayment => 'Посилання для оплати';

  @override
  String get quickLinkApp => 'Додаток (Android)';

  @override
  String get updateRecord => 'Оновити запис';

  @override
  String get addToList => 'Додати до списку';

  @override
  String get quickCustomUriError =>
      'Введіть адресу зі схемою (наприклад: spotify:track:... або myapp://page).';

  @override
  String get quickFileEmptyMessage => 'Введіть посилання на файл.';

  @override
  String get quickPaymentEmptyMessage => 'Введіть посилання для оплати.';

  @override
  String get quickCustomUriDesc =>
      'Можна ввести будь-яку адресу зі схемою; телефон відкриє відповідний додаток.';

  @override
  String get quickSocialLabel => 'Соціальна мережа';

  @override
  String get quickVideoLabel => 'Посилання на відео';

  @override
  String get quickVideoHint => 'https://youtu.be/... або ідентифікатор відео';

  @override
  String get quickVideoDesc =>
      'Можна ввести посилання на YouTube, Vimeo тощо або лише ідентифікатор відео YouTube.';

  @override
  String get quickSearchHint => 'наприклад: Погода Київ';

  @override
  String get quickFileLabel => 'Посилання на файл';

  @override
  String get quickFileDesc =>
      'Через малий обсяг мітки записується веб-посилання, а не сам файл (Google Drive, Dropbox тощо).';

  @override
  String get quickPhoneOrAppleId => 'Телефон або Apple ID';

  @override
  String get quickFacetimeVideoDesc =>
      'iPhone при дотику до мітки розпочне відеовиклик FaceTime.';

  @override
  String get quickFacetimeAudioDesc =>
      'iPhone при дотику до мітки розпочне лише аудіовиклик FaceTime.';

  @override
  String get quickMapProvider => 'Картографічний додаток';

  @override
  String get quickAddressHint => 'наприклад: вул. Хрещатик 1, Київ';

  @override
  String get quickPaymentDesc =>
      'Можна використовувати посилання для оплати (PayPal.me, Stripe тощо). Дані картки ніколи не записуються на мітку.';

  @override
  String get quickAppDesc =>
      'Телефони Android відкриють цей додаток (або Play Store). iPhone ігнорує цей тип; додайте посилання на App Store як URL.';

  @override
  String get quickDeviceNameOptional => 'Назва пристрою (необов\'язково)';

  @override
  String get quickSpeakerHint => 'наприклад: Динамік';

  @override
  String get quickBluetoothDesc =>
      'Телефони Android запропонують з\'єднання з цим пристроєм. iPhone не підтримує мітки створення пари Bluetooth.';

  @override
  String get composeTextContent => 'Текстовий вміст';

  @override
  String get composeTextHint => 'Введіть текст для запису';

  @override
  String get composeEmailSubjectOptional => 'Тема (необов\'язково)';

  @override
  String get composeEmailBodyOptional => 'Текст повідомлення (необов\'язково)';

  @override
  String get composeSmsRecipient => 'Номер телефону одержувача';

  @override
  String get composeSmsHint => 'SMS-повідомлення для надсилання...';

  @override
  String get composeVcardFullName => 'Повне ім\'я (ім\'я для відображення) *';

  @override
  String get composeVcardNameHint => 'Іван Коваленко';

  @override
  String get composeVcardNote => 'Примітка / Опис';

  @override
  String get composeCalTitle => 'Назва події *';

  @override
  String get composeCalTitleHint => 'Зустріч по проекту';

  @override
  String get composeCalLocationHint => 'Конференц-зал 2 або онлайн';

  @override
  String get composeCalDesc => 'Опис події';

  @override
  String get composeCalStartEndTime => 'Час початку та завершення:';

  @override
  String get composeSpTitleLabel => 'Заголовок (текст для відображення)';

  @override
  String get composeSpTitleHint => 'Брошура компанії';

  @override
  String get composeMimeTypeLabel => 'Тип MIME *';

  @override
  String get composeDataFormat => 'Формат даних: ';

  @override
  String get composeFormatHex => 'Шістнадцятковий (Hex)';

  @override
  String get composeMimeHexBytes => 'Hex-байти *';

  @override
  String get composeMimeTextPayload => 'Текст корисного навантаження (UTF-8) *';

  @override
  String get composeWifiWarningTitle =>
      'Попередження щодо безпеки та платформи:';

  @override
  String get composeWifiWarningBody =>
      '• Пароль Wi-Fi зберігається у відкритому вигляді та може бути прочитаний будь-ким.\n• Автоматичне підключення не гарантується; може знадобитися підтвердження користувача.';

  @override
  String get composeWifiSsidLabel => 'Назва мережі (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'Тип безпеки (автентифікація)';

  @override
  String get composeWifiOpenNetwork => 'Відкрита мережа (без пароля)';

  @override
  String get composeWifiPasswordLabel => 'Пароль Wi-Fi *';

  @override
  String get composeWifiEncryptionLabel => 'Тип шифрування';

  @override
  String get composeWifiAesRecommended => 'AES (рекомендовано)';

  @override
  String get quickSearchTextLabel => 'Пошуковий запит';

  @override
  String get readTagMemoryPrompt =>
      'Піднесіть мітку до телефону для зчитування пам\'яті';

  @override
  String get readingTagMemoryStatus => 'Зчитування пам\'яті...';

  @override
  String get formatTagConfirmTitle => 'Форматувати пам\'ять';

  @override
  String get formatTagConfirmMessage =>
      'Дані на мітці будуть видалені, і вона буде підготовлена як порожній NDEF. Продовжити?';

  @override
  String get formatButton => 'Форматувати';

  @override
  String get formatTagPrompt => 'Піднесіть мітку для форматування';

  @override
  String get formattingStatus => 'Форматування...';

  @override
  String filePickerFailed(String error) {
    return 'Не вдалося відкрити вибір файлу: $error';
  }

  @override
  String get writeButton => 'Записати';

  @override
  String get writeDumpPrompt => 'Піднесіть мітку для запису дампу';

  @override
  String get writingDumpStatus => 'Запис дампу...';

  @override
  String get setPasswordWarning =>
      'Якщо ви забудете пароль, змінити вміст буде неможливо. Зчитування залишається відкритим для всіх.';

  @override
  String get setPasswordAction => 'Встановити пароль';

  @override
  String get setPasswordPrompt => 'Піднесіть мітку для встановлення пароля';

  @override
  String get settingPasswordStatus => 'Встановлення пароля...';

  @override
  String get removePasswordPromptMessage =>
      'Введіть пароль, раніше встановлений на мітці.';

  @override
  String get remove => 'Видалити';

  @override
  String get removePasswordPrompt => 'Піднесіть мітку для зняття пароля';

  @override
  String get removingPasswordStatus => 'Зняття пароля...';

  @override
  String get sendCommandsPrompt => 'Піднесіть мітку для надсилання команд';

  @override
  String get sendingCommandsStatus => 'Надсилання команд...';

  @override
  String get sendButton => 'Надіслати';

  @override
  String get tagNoteEditTitle => 'Редагувати примітку мітки';

  @override
  String get tagNoteInputLabel => 'Примітка / Опис у додатку';

  @override
  String get tagNoteInputHint =>
      'наприклад: Інфо про переговорну або Складський стелаж #12';

  @override
  String get tagNoteDeleteTitle => 'Видалити примітку мітки';

  @override
  String get clearAllTagRulesTitle => 'Видалити всі примітки';

  @override
  String get clearAllTagRulesConfirm =>
      'Усі збережені примітки міток будуть видалені. Підтверджуєте?';

  @override
  String get deleteAll => 'Видалити все';

  @override
  String get tagRulesExplanation =>
      'Для міток із відповідним хешем SHA-256 відображається лише збережена примітка. Зовнішні дії не запускаються.';

  @override
  String get noTagRulesDefined => 'Ще не визначено жодної примітки для міток.';

  @override
  String lastUpdated(String time) {
    return 'Останнє оновлення: $time';
  }

  @override
  String get tagLibraryNoMatch => 'Не знайдено міток, що відповідають пошуку.';

  @override
  String get tagLibraryAddToLibrary => 'Додати до бібліотеки';

  @override
  String get name => 'Ім\'я';

  @override
  String get tagLibraryAddTag => 'Додати мітку';

  @override
  String get all => 'Всі';

  @override
  String tagLibraryPhotoError(String error) {
    return 'Не вдалося вибрати фото: $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'Видалити мітку';

  @override
  String get tagLibraryNameHint => 'наприклад: Офісний брелок';

  @override
  String get tagLibraryNoTagContent => 'У цьому записі немає вмісту мітки.';

  @override
  String get tagLibrarySourceLastScanned => 'Останнє сканування';

  @override
  String get tagLibraryEmpty => 'Збережених міток ще немає.';

  @override
  String get tagLibrarySourceEmpty => 'Порожній запис';

  @override
  String get tagLibraryNamePrompt => 'Будь ласка, введіть назву мітки';

  @override
  String get tagLibrarySearchHint =>
      'Пошук за назвою, категорією або розташуванням...';

  @override
  String get tagLibrarySourceWriteList => 'Список запису';

  @override
  String get tagLibraryLocationHint => 'наприклад: Робочий стіл, Вхідні двері';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return 'Ви впевнені, що хочете видалити мітку \"$name\" з бібліотеки?';
  }

  @override
  String get noContent => 'Вміст відсутній';

  @override
  String tagLibraryRecordSummary(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записів NDEF',
      one: '1 запис NDEF',
    );
    return '$_temp0';
  }

  @override
  String get tagLibraryEditTag => 'Редагувати мітку';

  @override
  String get rawTypeHexHint => '41 (A) або 55 (U) тощо';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: Поле \"records\" має бути списком.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: Елемент може містити максимум $max записів NDEF.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - Запис #$index не є дійсним об\'єктом.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - Запис #$index: Недійсне значення TNF ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - Запис #$index: \"type\" має бути рядком Base64.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - Запис #$index: \"type\" не є дійсними даними Base64 ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - Запис #$index: \"id\" має бути рядком Base64.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - Запис #$index: \"id\" не є дійсними даними Base64 ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - Запис #$index: \"payload\" має бути рядком Base64.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - Запис #$index: \"payload\" не є дійсними даними Base64 ($error).';
  }

  @override
  String get composerUndoSnack => 'Останню зміну скасовано.';

  @override
  String get composerRedoSnack => 'Зміну повторено.';

  @override
  String get noRecordsToCopy => 'Немає записів NDEF для копіювання.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count записів NDEF ($bytes Б) скопійовано в буфер обміну.\n(Копіюються лише дані NDEF; UID або зашифровані сектори не клонуються)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: додано $count записів.';
  }

  @override
  String get tagEmptyNoRecordsToImport =>
      'Мітка порожня; немає записів для імпорту.';

  @override
  String get sourceTag => 'З мітки';

  @override
  String get sourceQr => 'З QR-коду';

  @override
  String filePickerError(String error) {
    return 'Не вдалося відкрити вибір файлу: $error';
  }

  @override
  String get csvFileTooLarge => 'Файл CSV занадто великий (максимум 512 КБ).';

  @override
  String get noRecordsFound => 'Записів не знайдено';

  @override
  String get someRowsSkipped => 'Деякі рядки пропущено';

  @override
  String get expectedFormat => 'Очікуваний формат:';

  @override
  String get noClipboardContent =>
      'У буфері обміну немає скопійованого вмісту NDEF.';

  @override
  String get pasteFromClipboardTitle => 'Вставити з буфера NDEF';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'Дані в буфері: $count записів, $bytes байтів ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      'Бажаєте замінити поточні записи чи додати в кінець?';

  @override
  String get pasteOverwriteOption => 'Перезаписати (Замінити)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'Поточні $count записів будуть видалені та замінені вмістом буфера (потрібне підтвердження).';
  }

  @override
  String get pasteEmptySubtitle => 'Вміст буфера поміщається у список.';

  @override
  String get pasteAppendOption => 'Додати в кінець';

  @override
  String get pasteAppendSubtitle =>
      'Поточні записи зберігаються, записи з буфера додаються в кінець списку.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count записів додано.';
  }

  @override
  String get confirmOverwriteTitle => 'Перезаписати записи?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'У списку $currentCount записів. Вони будуть замінені $newCount записами з буфера. Продовжити?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'Записи замінено на $count нових.';
  }

  @override
  String get yesReplace => 'Так, замінити';

  @override
  String recordsImportedToComposer(num count) {
    return '$count записів імпортовано.';
  }

  @override
  String get noContentToCopy => 'Не знайдено вмісту NDEF для копіювання.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count записів NDEF скопійовано та додано (Вміст скопійовано, UID не клонується).';
  }

  @override
  String get noContentToRewrite => 'Не знайдено вмісту NDEF для перезапису.';

  @override
  String get rewriteTagTitle => 'Перезаписати мітку';

  @override
  String get importantNotice => 'ВАЖЛИВЕ ПОВІДОМЛЕННЯ:';

  @override
  String get rewriteNotice1 =>
      '• Ця операція ПОВНІСТЮ ПЕРЕЗАПИСУЄ наявний вміст NDEF; не додає в кінець.\n';

  @override
  String get rewriteNotice2 =>
      '• Цільова мітка має бути доступною для запису (розблокованою).\n';

  @override
  String get rewriteNotice3 =>
      '• Запис не відбувається автоматично на попередню мітку; потрібен новий дотик NFC.';

  @override
  String get rewriteInstruction =>
      'Підготуйте цільову мітку, натисніть \"Доторкнутися і записати\" та піднесіть мітку.';

  @override
  String get tapAndWrite => 'Доторкнутися і записати';

  @override
  String get rewritePromptMessage =>
      'Піднесіть цільову мітку до пристрою (вміст буде повністю оновлено)';

  @override
  String get writeVerifiedTitle => 'Запис перевірено';

  @override
  String get writeVerifiedDesc =>
      'Вміст NDEF успішно записано та перевірено на цільовій мітці.';

  @override
  String get writeVerifiedHint =>
      'Ви можете почати наступне сканування для перевірки або порівняння даних.';

  @override
  String get scanAndCompareNow => 'Сканувати та порівняти зараз';

  @override
  String get contentMatchesExactly => 'Вміст повністю збігається';

  @override
  String get differenceDetected => 'Виявлено розбіжність';

  @override
  String get compareMatchDesc =>
      'Повідомлення NDEF на цільовій мітці побайтово збігається з вихідним.';

  @override
  String get compareDiffDesc =>
      'Є розбіжності між зчитаними та запланованими даними. Перевірте, чи не заблокована мітка.';

  @override
  String get batchEmptyComposerError =>
      'Додайте хоча б один запис перед початком пакетного запису.';

  @override
  String get batchWriteTitle => 'Пакетний запис міток';

  @override
  String get batchWriteSubtitle =>
      'Записуйте один і той самий вміст NDEF на декілька міток поспіль.';

  @override
  String get attention => 'УВАГА:';

  @override
  String get batchNotice1 =>
      '• Щоб уникнути випадкового подвійного запису, кожен крок запускається кнопкою \"Записати наступний\".\n';

  @override
  String get batchNotice2 =>
      '• Автоматичне безперервне сканування не проводиться; мітки слід замінювати фізично.';

  @override
  String get batchStartButton => 'Почати пакетний запис';

  @override
  String get batchControlPanelTitle => 'Панель керування пакетним записом';

  @override
  String get batchCancelOrClose => 'Скасувати / Закрити';

  @override
  String get batchAllCompleted => 'Усі спроби запису завершено!';

  @override
  String batchStats(String ok, String failed, String left) {
    return 'Успішно: $ok | Помилки: $failed | Залишилось: $left';
  }

  @override
  String get waitingForTag => 'Очікування мітки...';

  @override
  String get batchFinishButton => 'Завершити пакетний запис';

  @override
  String get writeError => 'Помилка запису';

  @override
  String get batchConfirmCancelTitle => 'Скасувати пакетний запис';

  @override
  String get batchConfirmCancelMessage =>
      'Перервати пакетний запис? Уже записані мітки збережуться, решта записані не будуть.';

  @override
  String get cancelled => 'Скасовано';

  @override
  String get batchCancelledSnack =>
      'Пакетний запис скасовано. Ваш список збережено.';

  @override
  String get cancelAndClose => 'Скасувати та закрити';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'Автономний аналіз URL';

  @override
  String get urlSafetyScheme => 'Схема (Протокол):';

  @override
  String get urlSafetyPort => 'Порт:';

  @override
  String get urlSafetyUserInfoLabel => 'Інформація користувача:';

  @override
  String get urlSafetyIpLiteral => 'Пряма IP-адреса:';

  @override
  String get urlSafetyDomain => 'Ні (Доменне ім\'я)';

  @override
  String get urlSafetyPunycodeLabel => 'Міжнародний / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => 'Так (Підозра на омогліфи)';

  @override
  String get urlSafetyWarningsHeader => 'Попередження безпеки:';

  @override
  String get urlSafetyDisclaimer =>
      'ПРИМІТКА: Автономний аналіз. Не перевіряє на віруси в мережі. URL не відкривається автоматично.';

  @override
  String get templateSaveEmptyError =>
      'Додайте записи перед збереженням шаблону.';

  @override
  String templateDefaultName(String n) {
    return 'Шаблон $n';
  }

  @override
  String get templateNameSample => 'наприклад: Сайт компанії та контакти';

  @override
  String get templateSavedSnack => 'Шаблон збережено.';

  @override
  String get ruleNoteRequiresNdef =>
      'Мітка повинна містити хоча б один запис NDEF для додавання примітки.';

  @override
  String get ruleNoteAddTitle => 'Додати власну примітку до мітки';

  @override
  String get ruleNoteDigestExplanation =>
      'Прив\'язується до хешу SHA-256 NDEF. При скануванні показується лише цей опис.';

  @override
  String get ruleNoteSavedSnack => 'Примітку мітки збережено.';

  @override
  String get ruleNoteDeleteConfirm =>
      'Примітку для цієї мітки буде видалено. Продовжити?';

  @override
  String get ruleNoteDeletedSnack => 'Примітку мітки видалено.';

  @override
  String get backupExportTitle => 'Експорт резервної копії';

  @override
  String get backupExportWarningTitle =>
      'ПОПЕРЕДЖЕННЯ ПРО КОНФІДЕНЦІЙНІСТЬ ТА БЕЗПЕКУ';

  @override
  String get backupExportWarningBody =>
      'Експортований файл (JSON) — відкритий текст. Може містити паролі Wi-Fi або контактні дані. Зберігайте в безпечному місці.';

  @override
  String get backupIncludedItems => 'Елементи для включення:';

  @override
  String backupTemplatesCount(String count) {
    return '• Шаблони: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• Нотатки/правила міток: $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Включити історію сканувань (необов\'язково)';

  @override
  String backupHistoryCount(String count) {
    return 'Записів історії: $count';
  }

  @override
  String get backupHistoryDisabled =>
      'Історію сканувань вимкнено на цьому пристрої';

  @override
  String get backupExportAndShare => 'Експортувати та поділитися';

  @override
  String get backupFileNameLabel => 'Файл резервної копії NFC Tag Master';

  @override
  String get backupFileShareSubject =>
      'Резервна копія шаблонів та даних NFC Tag Master (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'Файл резервної копії успішно експортовано.';

  @override
  String get backupExportCancelled => 'Експорт скасовано.';

  @override
  String get backupImportTitle => 'Імпорт резервної копії';

  @override
  String get backupMergeRuleTitle => 'ПРАВИЛО БЕЗПЕКИ ТА ЗЛИТТЯ';

  @override
  String get backupMergeRule1 =>
      '• Імпорт працює шляхом ОБ\'ЄДНАННЯ; ваші наявні записи НІКОЛИ не видаляються.\n';

  @override
  String get backupMergeRule2 =>
      '• Файли можуть містити паролі Wi-Fi та персональні дані; завантажуйте лише з надійних джерел.\n';

  @override
  String get backupMergeRule3 =>
      '• Обмеження розміру: 2 МіБ. Дані проходять сувору перевірку схеми та Base64 перед завантаженням.';

  @override
  String get backupSelectFilePrompt =>
      'Виберіть дійсний файл .json для об\'єднання.';

  @override
  String get selectFileButton => 'Вибрати файл';

  @override
  String get fileSelectionCancelled => 'Вибір файлу скасовано.';

  @override
  String get backupFileExceedsLimit =>
      'Вибраний файл перевищує дозволений ліміт 2 МіБ.';

  @override
  String fileReadError(String error) {
    return 'Помилка читання файлу: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Помилка перевірки копії: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Виявлено історію сканувань';

  @override
  String get backupHistoryDetectedPrompt =>
      'Імпортувати та увімкнути історію? Чи пропустити її та імпортувати лише шаблони і примітки?';

  @override
  String get backupSkipHistoryOption =>
      'Пропустити історію (завантажити лише шаблони і примітки)';

  @override
  String get backupEnableHistoryOption => 'Увімкнути історію та завантажити';

  @override
  String get nfcReadyStatus => 'NFC готовий';

  @override
  String get nfcReadyDesc => 'Модуль NFC активний і готовий до використання';

  @override
  String get nfcDisabledStatus => 'NFC вимкнено';

  @override
  String get nfcDisabledDesc =>
      'NFC вимкнено. Увімкніть його в налаштуваннях пристрою.';

  @override
  String get template => 'Шаблон';

  @override
  String get nfcScannerTitle => 'NFC Сканер';

  @override
  String get composeRecord => 'Створити запис';

  @override
  String get protectOrRemove => 'Захистити / зняти';

  @override
  String get previousScans => 'Попередні сканування';

  @override
  String get noScannedTagYet => 'Ще не відскановано жодної мітки NFC';

  @override
  String get tapScanPrompt =>
      'Натисніть \"Почати сканування\" та піднесіть мітку до телефону.';

  @override
  String get ndefCopyAndRewriteTitle => 'Копіювання та перезапис вмісту NDEF';

  @override
  String get savedTagNoteHeader =>
      'Збережена примітка мітки (правило в додатку)';

  @override
  String get tagNoteOrRule => 'Примітка / правило мітки';

  @override
  String get editNote => 'Редагувати примітку';

  @override
  String get deleteNote => 'Видалити примітку';

  @override
  String get tagNoteDigestNotice =>
      'Прив\'язано до хешу SHA-256 точних байтів NDEF. Зовнішніх дій не запускає.';

  @override
  String get addCustomTagNotePrompt =>
      'Ви можете додати власну локальну примітку або опис для цього вмісту NDEF.';

  @override
  String get addNoteToThisTag => 'Додати примітку до цієї мітки';

  @override
  String get ndefSupport => 'Підтримка NDEF:';

  @override
  String get usedSpace => 'Використано пам\'яті:';

  @override
  String get freeSpace => 'Вільно пам\'яті:';

  @override
  String get noNdefMessageOnTag => 'На мітці не знайдено повідомлень NDEF.';

  @override
  String get hideDetails => 'Приховати деталі';

  @override
  String get advancedRecordInspector => 'Інспектор записів (Розширений)';

  @override
  String get ndefRecordInspectorTitle => 'Розширений інспектор записів NDEF';

  @override
  String get inspectorType => 'Тип:';

  @override
  String get inspectorPayloadLength => 'Довжина корисного навантаження:';

  @override
  String get inspectorRawHexPreview => 'Попередній перегляд Hex (обмежено):';

  @override
  String get ndefRecordsToWriteTitle => 'Записи NDEF для запису';

  @override
  String get pasteFromClipboardAction =>
      'Вставити з буфера (Замінити / Додати)';

  @override
  String get importAction => 'Імпортувати';

  @override
  String get importFromTagAction => 'Імпортувати з мітки NFC';

  @override
  String get importFromQrAction => 'Імпортувати з QR-коду';

  @override
  String get importFromCsvAction => 'Імпортувати з файлу CSV';

  @override
  String get composerEmptyDescription =>
      'Ви можете записувати текст, посилання, Wi-Fi, телефони, контакти та багато іншого.';

  @override
  String get urlSafetyReview => 'Перевірка URL';

  @override
  String get inspector => 'Інспектор';

  @override
  String get typeLabel => 'Тип:';

  @override
  String get payloadLabel => 'Корисне навантаження:';

  @override
  String get writeAndVerify => 'Записати на мітку та перевірити';

  @override
  String get batchWriteButtonLabel => 'Пакетний запис міток (2..100 міток)';

  @override
  String get clearTagButtonLabel => 'Скинути мітку (очистити вміст)';

  @override
  String get confirmWriteTitle => 'Підтвердіть запис на мітку';

  @override
  String get confirmWriteMessage1 =>
      'Ця операція ПОВНІСТЮ ПЕРЕЗАПИШЕ наявний вміст NDEF на мітці.';

  @override
  String get confirmWriteMessage2 =>
      'Переконайтеся, що мітка доступна для запису. Вміст буде автоматично перевірено.';

  @override
  String get yesWrite => 'Так, записати';

  @override
  String get scanHistoryDisabledTitle => 'Історію сканувань вимкнено';

  @override
  String get scanHistoryDisabledDesc =>
      'З міркувань конфіденційності історія типово не зберігається. Ви можете ввімкнути її в налаштуваннях.';

  @override
  String get enableHistory => 'Увімкнути історію';

  @override
  String get historySearchHint =>
      'Пошук за UID, текстом або типом (наприклад: URL, Wi-Fi, 04A1...)';

  @override
  String get noHistoryYet => 'Історія сканувань порожня.';

  @override
  String get tryDifferentQuery => 'Спробуйте інший UID, текст або тип запису.';

  @override
  String get clearSearch => 'Очистити пошук';

  @override
  String get deleteThisRecord => 'Видалити цей запис';

  @override
  String get qrPreview => 'QR перегляд';

  @override
  String get lockTagConfirmTitle => 'Назавжди заблокувати мітку';

  @override
  String get lockTagWarning2 =>
      'Переконайтеся, що спочатку записали правильний вміст.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'Попередній перегляд QR-коду';

  @override
  String get unknownParentheses => '(Невідомо)';

  @override
  String get ok => 'ОК';

  @override
  String rewriteSourceUid(String uid) {
    return 'UID джерела: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return 'Записів до запису: $count';
  }

  @override
  String rewriteFailed(String message) {
    return 'Перезапис не вдався: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return 'Записано записів: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'UID зчитаної мітки: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return 'Записані дані: $count зап. ($bytes байт)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'Зчитані дані: $count зап. ($bytes байт)';
  }

  @override
  String batchTargetCount(String count) {
    return 'Цільових міток: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return 'Список запису: $count зап. ($bytes байт)';
  }

  @override
  String batchNext(String current, String total) {
    return 'Далі: мітка #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return 'Успішно ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return 'Помилка: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'Мітка #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'Торкніться й запишіть мітку #$n';
  }

  @override
  String batchPrompt(String current, String total) {
    return 'Пакетний запис: піднесіть мітку #$current / $total';
  }

  @override
  String batchWrittenVerified(String count) {
    return 'Записано й перевірено: $count';
  }

  @override
  String templateLoaded(String name) {
    return 'Записи з «$name» додано до списку.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'Хеш вмісту NDEF (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return 'Помилка експорту: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'У копії $count записів історії, але історію на цьому пристрої вимкнено.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'Імпорт виконано:\n$summary';
  }

  @override
  String mergeError(String error) {
    return 'Помилка об\'єднання: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'Буфер NDEF: $count зап. ($bytes Б) - $source';
  }

  @override
  String get heroScanSubtitle =>
      'Піднесіть мітку до верхньої частини телефона — вміст, ємність і серійний номер з\'являться одразу.';

  @override
  String lastTagLabel(String uid) {
    return 'Остання мітка: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'Помилка сканування: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count зап. ($bytes байт) — копіюються лише дані NDEF, без UID.';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'Мітка $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'Помилка: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return 'Зчитані записи NDEF ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return 'Записи NDEF до запису ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return 'Примітка: дані займають $bytes байт, показано перші 64.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return 'Загальний розмір: $bytes байт | Записів: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return 'Записати й перевірити ($bytes байт)';
  }

  @override
  String savedScansCount(String count) {
    return 'Збережені скани: $count';
  }

  @override
  String historyNoResults(String query) {
    return 'Нічого не знайдено за запитом «$query».';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count зап.';
  }

  @override
  String historyCapacity(String max, String used) {
    return 'Ємність: $max Б | Зайнято: $used Б';
  }

  @override
  String historySourceLabel(String uid) {
    return 'Історія UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count зап. | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return 'Збережені правила/нотатки: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return 'Записано байт: $bytes | Перевірка: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'Заблокована мітка стане лише для читання: вміст НЕМОЖЛИВО буде змінити чи стерти, а блокування — ЗНЯТИ. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'Розмір повідомлення: $bytes байт';
  }

  @override
  String bytesShort(String bytes) {
    return 'Байт: $bytes Б';
  }

  @override
  String bytesValue(String bytes) {
    return '$bytes байт';
  }

  @override
  String bytesOfCapacity(String bytes, String max) {
    return '$bytes / $max байт';
  }

  @override
  String get valueNone => 'Немає';

  @override
  String get valueYesIp => 'Так (IP-адреса)';

  @override
  String get nfcMissingShort => 'Немає NFC';

  @override
  String get clearClipboard => 'Очистити буфер';

  @override
  String get statLibrary => 'Бібліотека';

  @override
  String get scanTagTitle => 'Сканувати';

  @override
  String get readingInProgress => 'Зчитування...';

  @override
  String get rawMemorySubtitle => 'Сира пам\'ять';

  @override
  String get copyToClipboard => 'Копіювати в буфер';

  @override
  String get serialUidLabel => 'Серійний № (UID):';

  @override
  String get totalCapacityLabel => 'Загальна ємність:';

  @override
  String get technologiesLabel => 'Технології:';

  @override
  String get idLabel => 'Ідентифікатор (ID):';

  @override
  String get undoTooltip => 'Скасувати';

  @override
  String get clearComposer => 'Очистити список';

  @override
  String composerTotalSize(String bytes) {
    return 'Загальний розмір: $bytes байт';
  }

  @override
  String get yesClear => 'Так, очистити';

  @override
  String get ssidTooLong => 'SSID — не більше 32 байт.';

  @override
  String get locationPlace => 'Місце';

  @override
  String get targetWebUrl => 'Цільова URL *';

  @override
  String get languageCodeLabel => 'Код мови (ISO 639-1) *';

  @override
  String get utf8Text => 'Текст UTF-8';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf, розмір: $bytes байт';
  }

  @override
  String get quickGallerySubtitle => 'Готово одним дотиком';

  @override
  String get quickLibraryTitle => 'Мої мітки';

  @override
  String get quickLibrarySubtitle => 'Збережені мітки';

  @override
  String get saveToLibrary => 'Зберегти в бібліотеку';

  @override
  String libraryMatch(String name) {
    return 'У бібліотеці: $name';
  }

  @override
  String tagChipLabel(String chip) {
    return 'Чип: $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return 'Виробник: $name';
  }

  @override
  String get settingsLibrarySubtitle =>
      'Ваші мітки з назвами, нотатками й фото';

  @override
  String get showOnboardingAgain => 'Показати вступ знову';

  @override
  String get importFromGallery => 'Додати з готових шаблонів';

  @override
  String get appearanceTitle => 'Вигляд';

  @override
  String get themeSystem => 'Системна';

  @override
  String get themeLight => 'Світла';

  @override
  String get themeDark => 'Темна';

  @override
  String get valuePresentRisky => 'Є (може бути небезпечно)';

  @override
  String get supportedValue => 'Підтримується';

  @override
  String get notSupportedValue => 'Не підтримується';

  @override
  String get nfcUnsupportedDesc => 'Цей пристрій не підтримує NFC';

  @override
  String get ndefTrailingData => 'Зайві дані після повідомлення NDEF';

  @override
  String get ndefMissingEnd => 'Немає кінця повідомлення NDEF';

  @override
  String vcardPhoneShort(String value) {
    return 'Тел.: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'Ел. пошта: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return 'Організація: $value';
  }

  @override
  String get pageUidLock => 'UID / Блок.';

  @override
  String get pageData => 'Дані';

  @override
  String get pageLock => 'Блок.';

  @override
  String memoryPageLine(String page) {
    return 'Стор. $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (телефон)';

  @override
  String get mapApple => 'Apple Карти';

  @override
  String get mapGoogle => 'Google Карти';

  @override
  String get whatsappMessageHint => 'Вітаю, хочу дізнатися більше';

  @override
  String get facetimeTargetHint => '+380671234567 або name@icloud.com';

  @override
  String get bluetoothMacLabel => 'MAC-адреса Bluetooth';

  @override
  String get webAddressUrlLabel => 'Вебадреса (URL)';

  @override
  String get latitudeLabel => 'Широта (Lat)';

  @override
  String get longitudeLabel => 'Довгота (Lng)';

  @override
  String get emailAddressLabel => 'Адреса ел. пошти';

  @override
  String get websiteLabel => 'Вебсайт';

  @override
  String get wifiAuthWpa2Home => 'WPA2 Personal (стандарт для дому/офісу)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 Personal (змішаний)';

  @override
  String get hostLabel => 'Хост:';

  @override
  String get readOnlyLocked => 'Лише читання (заблоковано)';

  @override
  String get redoTooltip => 'Повторити';

  @override
  String historyFoundCount(String found, String total) {
    return 'Знайдено: $found / $total';
  }

  @override
  String get addToWriteListShort => 'До списку запису';

  @override
  String get mimeTypeHint => 'application/json або text/plain';

  @override
  String get hapticsToggle => 'Вібрація';

  @override
  String get hapticsToggleSubtitle =>
      'Коротка вібрація після зчитування або запису';

  @override
  String get soundsToggle => 'Звуки';

  @override
  String get soundsToggleSubtitle => 'Короткий системний звук при результаті';

  @override
  String get backupLibraryMustBeList => 'Бібліотека міток має бути списком.';

  @override
  String get backupInvalidLibraryEntry => 'Недійсний запис бібліотеки.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'У бібліотеці не більше $max записів.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'Бібліотека: додано $added';
  }

  @override
  String backupLibraryCount(String count) {
    return '• Бібліотека: $count (без фото)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return 'Ост. мітка: $bytes / $max Б';
  }

  @override
  String get contentTooLargeForChips =>
      'Завеликий для звичайних міток: скоротіть текст або використайте коротке посилання.';

  @override
  String get tagReportTitle => 'Звіт про мітку';

  @override
  String get tagReportSubtitle => 'Чип, блокування, пароль і заповнення';

  @override
  String get tagReportPrompt => 'Піднесіть мітку для перевірки';

  @override
  String get tagReportBusy => 'Перевірка мітки...';

  @override
  String tagReportDone(String chip) {
    return 'Звіт готовий: $chip';
  }

  @override
  String get unknownChip => 'Невідомий чип';

  @override
  String get yes => 'Так';

  @override
  String get reportChip => 'Чип';

  @override
  String get reportNdefFormatted => 'Формат NDEF';

  @override
  String get reportWritable => 'Доступний запис';

  @override
  String get reportStaticLock => 'Статичне блокування';

  @override
  String get reportDynamicLock => 'Динамічне блокування';

  @override
  String get reportPassword => 'Захист паролем';

  @override
  String get reportReadProtected => 'Захист читання';

  @override
  String get reportNdefUsage => 'Заповнення NDEF';

  @override
  String get reportVerdictWritable => 'Мітка готова до запису';

  @override
  String get reportVerdictRestricted => 'Мітка обмежена';

  @override
  String get reportCopied => 'Звіт скопійовано';

  @override
  String get compareTagsTitle => 'Порівняти дві мітки';

  @override
  String get compareTagsSubtitle =>
      'Перевірте, чи збігається копія з оригіналом';

  @override
  String get compareStepFirst => 'Спочатку зчитайте першу (оригінальну) мітку.';

  @override
  String get compareStepSecond => 'Тепер зчитайте другу мітку.';

  @override
  String get compareIdentical => 'Вміст збігається';

  @override
  String get compareDifferent => 'Вміст відрізняється';

  @override
  String get compareSameTag => 'Ту саму мітку зчитано двічі.';

  @override
  String get compareDifferentTags => 'Дві різні мітки.';

  @override
  String get compareRecordSame => 'Збігається';

  @override
  String get compareRecordChanged => 'Відрізняється';

  @override
  String get compareRecordOnlyFirst => 'Лише на A';

  @override
  String get compareRecordOnlySecond => 'Лише на B';

  @override
  String get compareBothEmpty => 'Обидві мітки порожні.';

  @override
  String capacityExceededShort(String needed, String max) {
    return 'Забагато даних: $needed / $max байт';
  }

  @override
  String get verifyFailedAfterWrite =>
      'Дані не підтверджено — тримайте мітку довше.';

  @override
  String get blankTagTitle => 'Мітка ще не підготовлена';

  @override
  String get blankTagBody =>
      'Мітка нова й не відформатована під NDEF. Застосунок може підготувати її й записати дані одним дотиком (NTAG і MIFARE Ultralight).';

  @override
  String get blankTagAction => 'Підготувати й записати';

  @override
  String get shareTag => 'Поділитися';

  @override
  String get shareAsText => 'Поділитися текстом';

  @override
  String get shareAsFile => 'Поділитися файлом (.json)';

  @override
  String get shareAsFileSubtitle =>
      'Записи можна точно записати на іншому пристрої';

  @override
  String get importFromJsonFile => 'З файлу мітки (.json)';

  @override
  String get invalidTagFile => 'Недійсний файл мітки.';

  @override
  String get continuousScanTitle => 'Безперервне сканування';

  @override
  String get continuousScanSubtitle =>
      'Зчитуйте мітки поспіль і діліться списком у CSV';

  @override
  String continuousScanCount(String count) {
    return 'Зчитано міток: $count';
  }

  @override
  String get exportCsv => 'Поділитися CSV';

  @override
  String get clearList => 'Очистити список';

  @override
  String get csvColumnTime => 'Час';

  @override
  String get csvColumnRecords => 'Записи';

  @override
  String get csvColumnContent => 'Вміст';

  @override
  String get csvColumnCapacity => 'Ємність (Б)';

  @override
  String get csvColumnUsed => 'Зайнято (Б)';

  @override
  String get batchSerialToggle => 'Додати серійні номери';

  @override
  String batchSerialHint(String token) {
    return 'Вкажіть $token у записі, і номер стане туди; інакше до кожної мітки додасться окремий текстовий запис із номером.';
  }

  @override
  String get batchSerialPrefix => 'Префікс';

  @override
  String get batchSerialStart => 'Початок';

  @override
  String get batchSerialDigits => 'Розрядів';

  @override
  String batchSerialPreview(String first, String last) {
    return 'Перший: $first · Останній: $last';
  }

  @override
  String get batchFromCsvButton => 'З CSV-файлу (рядок на мітку)';

  @override
  String get batchCsvTitle => 'Пакетний запис із CSV';

  @override
  String batchCsvSummary(String count) {
    return 'Буде записано міток: $count. Кожна отримує один рядок CSV за порядком.';
  }

  @override
  String batchCsvTruncated(String max) {
    return 'Для пакетного запису береться не більше $max рядків; решту пропущено.';
  }

  @override
  String get cloneTagTitle => 'Клонувати мітку';

  @override
  String get cloneTagSubtitle => 'Прочитати мітку й записати її вміст на інші';

  @override
  String get cloneSourceStep =>
      'Крок 1: відскануйте вихідну мітку. Копіюється лише NDEF-вміст; UID клонувати не можна.';

  @override
  String get cloneSourceEmpty =>
      'На вихідній мітці немає NDEF-записів для копіювання.';

  @override
  String get cloneReadyTitle => 'Джерело прочитано';

  @override
  String cloneReadySummary(String count, String bytes) {
    return 'Буде скопійовано записів: $count ($bytes байт). Виберіть кількість міток.';
  }

  @override
  String get cloneEditFirst => 'Спершу змінити';

  @override
  String get tapPreviewTitle => 'Що станеться при дотику телефоном?';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'Мітка порожня; нічого не станеться.';

  @override
  String tapIosUrl(String target) {
    return 'З\'явиться сповіщення; натискання відкриє $target у Safari чи відповідному застосунку.';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target одразу відкриється в браузері чи відповідному застосунку.';
  }

  @override
  String tapIosApp(String target) {
    return 'З\'явиться сповіщення; застосунок відкриється через «$target», якщо встановлено.';
  }

  @override
  String tapAndroidApp(String target) {
    return 'Застосунок відкриється через «$target», якщо встановлено.';
  }

  @override
  String tapIosCall(String target) {
    return 'З\'явиться сповіщення; натискання здійснить дзвінок на $target.';
  }

  @override
  String tapAndroidCall(String target) {
    return 'Відкриється застосунок «Телефон» з номером $target.';
  }

  @override
  String tapIosSms(String target) {
    return 'З\'явиться сповіщення; «Повідомлення» відкриють нове повідомлення для $target.';
  }

  @override
  String tapAndroidSms(String target) {
    return 'Відкриється застосунок повідомлень для $target.';
  }

  @override
  String tapIosEmail(String target) {
    return 'З\'явиться сповіщення; «Пошта» відкриє новий лист для $target.';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'Відкриється поштовий застосунок для $target.';
  }

  @override
  String get tapIosMap =>
      'iPhone сам не відкриває місця «geo:». Використайте посилання Apple чи Google Карт (Швидкі посилання).';

  @override
  String get tapAndroidMap => 'Карти відкриються в цьому місці.';

  @override
  String get tapIosNeedsApp =>
      'iPhone сам нічого не робить із цим вмістом; його треба читати NFC-застосунком.';

  @override
  String get tapAndroidText =>
      'На більшості телефонів нічого не стається або текст показується на системному екрані.';

  @override
  String get tapAndroidContact => 'Пропонується додати контакт.';

  @override
  String get tapAndroidWifi =>
      'Пропонується підключитися до мережі (Android 10 і новіше).';

  @override
  String get tapAndroidCalendar =>
      'Якщо календар підтримує, запропонує додати подію.';

  @override
  String get tapAndroidOther =>
      'Відкриється, лише якщо встановлено відповідний застосунок.';

  @override
  String tapIgnoredRecords(String count) {
    return 'Телефони виконують лише перший запис; решта ($count) видно в NFC-застосунках.';
  }

  @override
  String get tapIosRequirement =>
      'iPhone XS і новіші читають у фоні, якщо розблоковано й не відкрито Камеру/Wallet.';

  @override
  String get galleryCatBusiness => 'Бізнес';

  @override
  String get galleryCatSocial => 'Соцмережі';

  @override
  String get galleryCatHome => 'Дім';

  @override
  String get galleryCatPersonal => 'Особисте';

  @override
  String get galleryCatAutomation => 'Автоматизація';

  @override
  String get galleryFavorites => 'Обране';

  @override
  String get gallerySearchHint => 'Пошук шаблонів...';

  @override
  String get galleryNoResults => 'Відповідних шаблонів немає.';

  @override
  String get galleryAddFavorite => 'До обраного';

  @override
  String get galleryRemoveFavorite => 'Прибрати з обраного';

  @override
  String get presetEventTitle => 'Запрошення на подію';

  @override
  String get presetEventDesc =>
      'Записує подію у форматі iCalendar; Android може додати її до календаря.';

  @override
  String get eventNameLabel => 'Назва події';

  @override
  String get eventDateLabel => 'Дата (РРРР-ММ-ДД)';

  @override
  String get eventTimeLabel => 'Час (ГГ:ХХ)';

  @override
  String get eventDateTimeInvalid =>
      'Неправильна дата чи час. Приклад: 2026-12-31 і 19:00';

  @override
  String get presetLuggageTitle => 'Багажна бирка';

  @override
  String get presetLuggageDesc =>
      'Якщо загубиться, той, хто знайде, легко зв\'яжеться з вами.';

  @override
  String luggageMessage(String name, String contact) {
    return 'Цей багаж належить: $name. Якщо знайшли, зв\'яжіться: $contact';
  }

  @override
  String get presetPlaylistTitle => 'Плейлист';

  @override
  String get presetPlaylistDesc =>
      'Відкриває плейлист Spotify, Apple Music чи YouTube.';

  @override
  String get playlistLinkLabel => 'Посилання на плейлист';

  @override
  String get presetEmailMeTitle => 'Напишіть мені';

  @override
  String get presetEmailMeDesc => 'Відкриває новий лист вам із готовою темою.';

  @override
  String get presetCallMeTitle => 'Зателефонуйте мені';

  @override
  String get presetCallMeDesc => 'Телефон зателефонує на ваш номер.';

  @override
  String get presetRunShortcutTitle => 'Запустити швидку команду';

  @override
  String get presetRunShortcutDesc =>
      'Запускає вказану швидку команду iPhone: світло, музика, зміна режиму зосередження...';

  @override
  String get shortcutNameLabel => 'Назва команди';

  @override
  String get recipesSection => 'Готові рецепти автоматизації';

  @override
  String get recipesIntro =>
      'Створіть у «Командах» команду з назвою нижче й додайте дії. Потім прив\'яжіть її до NFC-автоматизації або натисніть «Додати на мітку», щоб записати посилання запуску.';

  @override
  String get recipeAddToTag => 'Додати на мітку';

  @override
  String get recipeBedTitle => 'На добраніч';

  @override
  String get recipeBedActions =>
      'Тумбочка: фокус «Сон» · будильник · вимкнути світло';

  @override
  String get recipeCarTitle => 'Режим авто';

  @override
  String get recipeCarActions =>
      'Тримач в авто: фокус «Водіння» · маршрут додому · музика';

  @override
  String get recipeDoorTitle => 'Я вдома';

  @override
  String get recipeDoorActions =>
      'Вхідні двері: світло · Wi-Fi · повідомлення родині «Я вдома»';

  @override
  String get recipeDeskTitle => 'Робочий режим';

  @override
  String get recipeDeskActions =>
      'Стіл: фокус «Робота» · таймер 25 хв · плейлист';

  @override
  String get recipeGymTitle => 'Тренування';

  @override
  String get recipeGymActions =>
      'Спортивна сумка: почати тренування · плейлист · «Не турбувати»';

  @override
  String get recipeKitchenTitle => 'Кухонний таймер';

  @override
  String get recipeKitchenActions =>
      'Кухня: таймер 10 хв · відкрити список покупок';

  @override
  String get libraryLabelsField => 'Мітки / теки (через кому)';

  @override
  String get libraryLabelsHint => 'офіс, 2 поверх';

  @override
  String librarySaveFailed(String error) {
    return 'Не вдалося зберегти: $error';
  }

  @override
  String get csvColumnLabels => 'Мітки';

  @override
  String get firstNameLabel => 'Ім\'я';

  @override
  String get lastNameLabel => 'Прізвище';

  @override
  String get wifiPasswordMinHint => 'Щонайменше 8 символів';

  @override
  String get emailExampleHint => 'name@example.com';

  @override
  String get wifiSsidExampleHint => 'Home_WiFi_5G';

  @override
  String get nfcErrUnavailable =>
      'NFC недоступний або вимкнений на цьому пристрої.';

  @override
  String get nfcErrBusy => 'Триває інша NFC-операція; зачекайте.';

  @override
  String get nfcErrCancelled => 'Операцію скасовано.';

  @override
  String get nfcErrAppPaused =>
      'Операцію скасовано: застосунок перейшов у фон.';

  @override
  String get nfcErrUnsupportedTag => 'Цей тип мітки не підтримується.';

  @override
  String get nfcErrNtagOnly =>
      'Цей інструмент працює лише з мітками NTAG / MIFARE Ultralight.';

  @override
  String get nfcErrNotNdefRead => 'Мітку знайдено, але вона не у форматі NDEF.';

  @override
  String get nfcErrNotNdefWrite =>
      'Мітка не у форматі NDEF; телефон не може записати NDEF напряму.';

  @override
  String get nfcErrReadOnly => 'Мітка лише для читання (заблокована).';

  @override
  String get nfcErrNoData => 'Немає даних для запису.';

  @override
  String nfcErrCapacity(String required, String max) {
    return 'Недостатньо місця: потрібно $required байт, доступно $max.';
  }

  @override
  String get nfcErrCapacityShort => 'Недостатньо місця на мітці.';

  @override
  String get nfcErrVerify =>
      'Перевірка не пройдена: прочитані дані не збігаються.';

  @override
  String get nfcErrConnectionLost =>
      'Зв\'язок із міткою втрачено; тримайте її нерухомо й повторіть.';

  @override
  String get nfcErrAlreadyLocked => 'Мітка вже заблокована (лише читання).';

  @override
  String get nfcErrLockNotNdef =>
      'Мітка не у форматі NDEF; запишіть запис перед блокуванням.';

  @override
  String get nfcErrLockNotSupported => 'Цей тип мітки не підтримує блокування.';

  @override
  String get nfcSheetConnected => 'Мітку підключено, виконується...';

  @override
  String get nfcSheetReadOk => 'Мітку прочитано!';

  @override
  String get nfcSheetEmptyRead => 'Прочитано порожню мітку!';

  @override
  String get nfcSheetMultipleTags =>
      'Виявлено кілька міток. Піднесіть лише одну.';

  @override
  String get nfcSheetWriteVerified => 'Записано й перевірено!';

  @override
  String get nfcSheetWritten => 'Записано на мітку!';

  @override
  String get nfcSheetLocked => 'Мітку заблоковано назавжди!';

  @override
  String get nfcWriteDone => 'Успішно записано на мітку.';

  @override
  String get errorWidgetMessage =>
      'Не вдалося показати цей розділ. Поверніться й спробуйте ще раз.';

  @override
  String get nfcErrTimeout =>
      'Час вичерпано, мітку не знайдено. Піднесіть її до верхньої частини телефона й повторіть.';

  @override
  String get aboutTitle => 'Про застосунок';

  @override
  String aboutVersion(String version) {
    return 'Версія $version';
  }

  @override
  String get privacySummary =>
      'Дані залишаються на цьому пристрої: без акаунта, сервера, реклами й стеження.';

  @override
  String get whatsNewTitle => 'Що нового';

  @override
  String get whatsNew110 =>
      '• 14 мов, темна тема й новий дизайн\n• Шаблони з категоріями, пошуком і обраним\n• Пакетний запис: серійні номери, CSV і клонування\n• Попередній перегляд «Що буде при дотику?» і попередження про ємність\n• Бібліотека міток із фото, нотатками й мітками\n• Звіт, порівняння, безперервне сканування та експорт CSV\n• Siri, Команди й готові рецепти автоматизації';

  @override
  String lastBackupAt(String date) {
    return 'Остання копія: $date';
  }

  @override
  String get noBackupYet => 'Резервних копій ще немає.';

  @override
  String get backupStale => 'Останній копії понад 30 днів; варто зробити нову.';

  @override
  String get backupICloudTip =>
      'Порада: у меню «Поділитися» виберіть «Зберегти у Файли» → iCloud Drive.';

  @override
  String get dragToReorder => 'Перетягніть для сортування';

  @override
  String get modeTitle => 'Режим';

  @override
  String get modeNormal => 'Звичайний';

  @override
  String get modeCompat => 'Сумісність';

  @override
  String get modeNormalDesc =>
      'Звичайний: усе ввімкнено; кожну записану мітку перечитують і перевіряють.';

  @override
  String get modeCompatDesc =>
      'Сумісність: без перечитування після запису. Надійніше на деяких старих чи проблемних мітках.';

  @override
  String get rateApp => 'Оцінити застосунок';

  @override
  String get rateAppUnavailable =>
      'Вікно оцінки зараз недоступне (у TestFlight не з\'являється).';

  @override
  String get chipsTitle => 'NFC-чипи';

  @override
  String get chipsSubtitle => 'Яку мітку купити? Ємність і підтримка';

  @override
  String get chipsIntro =>
      'Корисні байти — максимум NDEF-вмісту. Для початку підійде NTAG215.';

  @override
  String chipsUsable(String bytes) {
    return 'Доступно: $bytes байт';
  }

  @override
  String get chipsReadWrite => 'Читання й запис';

  @override
  String get chipsReadOnlyNdef => 'Лише якщо NDEF';

  @override
  String get chipsNotSupported => 'Не підтримується';

  @override
  String get chipsNxpOnly => 'Лише телефони з чипом NXP';

  @override
  String get chipUseSmall =>
      'Одне посилання, короткий текст, Wi-Fi; найдешевша';

  @override
  String get chipUseMedium => 'Візитки, кілька записів; фігурки amiibo';

  @override
  String get chipUseLarge => 'Довгий вміст, детальні візитки';

  @override
  String get chipUseSecure => 'Захист від підробок (товари, квитки)';

  @override
  String get chipUseTicket => 'Проїзні й квитки на події';

  @override
  String get chipUseAccess => 'Перепустки й готельні ключі';

  @override
  String get chipUseIndustrial =>
      'Бібліотеки, склади, промисловість; більша дальність';

  @override
  String get chipUseJapan => 'Поширений у Японії (транспорт, оплата)';

  @override
  String get chipUseLegacy => 'Застарілий тип; не рекомендується';

  @override
  String templateVarsHint(String date, String time, String counter) {
    return 'Порада: $date, $time або $counter у тексті чи посиланні заповнюються під час запису.';
  }

  @override
  String templateVarsPreview(String date, String time, String counter) {
    return 'Під час запису: $date · $time · лічильник $counter';
  }

  @override
  String get libraryWriteToTag => 'Записати на мітку';

  @override
  String libraryWritePrompt(String name) {
    return 'Піднесіть мітку, щоб записати «$name»';
  }

  @override
  String get presetSmartCardTitle => 'Розумна візитка';

  @override
  String get presetSmartCardDesc =>
      'Сайт, візитка й Wi-Fi на одній мітці. Телефон спершу відкриє сайт.';

  @override
  String get presetLostItemTitle => 'Загублена річ';

  @override
  String get presetLostItemDesc =>
      'Той, хто знайде, відкриє готове SMS для вас.';

  @override
  String get lostItemNameLabel => 'Річ (напр. ключі, гаманець)';

  @override
  String lostItemSms(String item) {
    return 'Вітаю, я знайшов вашу річ: $item.';
  }

  @override
  String lostItemText(String item, String name) {
    return 'Ця річ ($item) належить: $name. Будь ласка, зв\'яжіться.';
  }

  @override
  String get presetVoiceTitle => 'Голосове повідомлення';

  @override
  String get presetVoiceDesc =>
      'На подарунку чи коробці: дотик увімкне голосову нотатку або пісню.';

  @override
  String get voiceLinkLabel =>
      'Посилання на аудіо (iCloud, Drive, SoundCloud…)';

  @override
  String get logbookTitle => 'Журнал';

  @override
  String get logbookSubtitle =>
      'Відвідуваність, ліки, інвентар: кожен дотик із часом';

  @override
  String get logbookNew => 'Новий журнал';

  @override
  String get logbookName => 'Назва журналу';

  @override
  String get logbookKindAttendance => 'Відвідуваність';

  @override
  String get logbookKindMedication => 'Ліки';

  @override
  String get logbookKindInventory => 'Інвентаризація';

  @override
  String get logbookKindCustom => 'Інше';

  @override
  String get logbookEmpty =>
      'Журналів ще немає. Створіть, наприклад, «Відвідуваність 3А» чи «Вечірні ліки».';

  @override
  String get logbookScanButton => 'Сканувати й записати';

  @override
  String logbookEntryAdded(String label) {
    return 'Записано: $label';
  }

  @override
  String get logbookNoEntries => 'Записів ще немає.';

  @override
  String logbookToday(String count, String tags) {
    return 'Сьогодні: $count записів · $tags різних міток';
  }

  @override
  String logbookMedTaken(String time) {
    return 'Сьогодні прийнято ✓ (востаннє: $time)';
  }

  @override
  String get logbookMedNotTaken => 'Сьогодні ще не прийнято';

  @override
  String logbookInventorySummary(String count) {
    return 'Враховано різних міток: $count';
  }

  @override
  String logbookDeleteConfirm(String name) {
    return 'Видалити журнал «$name» з усіма записами?';
  }

  @override
  String logbookEntries(String count) {
    return 'Записів: $count';
  }

  @override
  String lastSeenAt(String date) {
    return 'Востаннє: $date';
  }

  @override
  String get neverSeen => 'Ще не сканувалася';

  @override
  String get sortLongestUnseen => 'Найдовше не бачили';

  @override
  String get unseen30Days => 'Не бачили 30+ днів';

  @override
  String get inventoryCardTitle => 'Ця мітка є в бібліотеці';

  @override
  String scanReportLine(String unique, String dup, String empty) {
    return '$unique різних міток · $dup повторно · $empty порожніх';
  }
}
