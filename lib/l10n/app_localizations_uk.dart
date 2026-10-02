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
  String get addRule => 'Додати правило';

  @override
  String get addTag => 'Додати мітку';

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
  String get allRulesCleared => 'Усі правила видалено';

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
  String get backupExportSuccess => 'Файл резервної копії успішно збережено';

  @override
  String get backupFileSizeExceeded =>
      'Розмір файлу резервної копії перевищує 2 МіБ.';

  @override
  String get backupHistoryMustBeList => 'Поле \"history\" має бути списком.';

  @override
  String backupImportFailed(String error) {
    return 'Не вдалося імпортувати резервну копію: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'Резервну копію імпортовано: додано $templates шаблонів, $rules правил, $history записів історії';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'Некоректний Base64 для ID: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Некоректний Base64 для даних: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Некоректний Base64 для типу: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'Некоректний формат JSON: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Неприпустима нотатка правила.';

  @override
  String get backupInvalidRuleSha => 'Неприпустимий SHA-256 хеш.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'Некоректна дата створення: $date';
  }

  @override
  String get backupInvalidTemplateId => 'Некоректний ID шаблону.';

  @override
  String get backupInvalidTemplateName => 'Некоректна назва шаблону.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'Неприпустиме значення TNF ($tnf). Має бути від 0 до 7.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Кількість історії перевищує ліміт $max ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'Кількість записів перевищує ліміт $max ($count).';
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
  String get backupRecordsMustBeList => 'Записи мають бути списком.';

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
  String get batchWrite => 'Пакетний запис';

  @override
  String get bluetoothDeviceName => 'Назва пристрою (Необов\'язково)';

  @override
  String get bluetoothMac => 'MAC-адреса Bluetooth';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'Записано байтів: $bytes | Перевірка: $status';
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
  String get clearAllRulesConfirm => 'Видалити всі збережені нотатки міток?';

  @override
  String get clearConfirmButton => 'Так, очистити';

  @override
  String get clearConfirmMessage =>
      'Усі записи NDEF буде видалено, і буде записано порожній запис. Продовжити?';

  @override
  String get clearConfirmTitle => 'Скинути вміст мітки';

  @override
  String get clearHistory => 'Очистити історію';

  @override
  String get clearList => 'Очистити список';

  @override
  String get clearTagSubtitle => 'Видаляє всі записи та записує порожній NDEF';

  @override
  String get clearTagTitle => 'Очистити мітку';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записів у буфері обміну',
      one: '1 запис у буфері обміну',
    );
    return '$_temp0 ($bytes Б) · $source';
  }

  @override
  String get close => 'Закрити';

  @override
  String get commandsEmptyError => 'Введіть хоча б одну команду.';

  @override
  String get commandsLabel => 'Команди';

  @override
  String get composeRecordTitle => 'Додати новий запис';

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
  String get contactNote => 'Нотатка';

  @override
  String get contactPhone => 'Телефон';

  @override
  String get contactTitle => 'Посада';

  @override
  String get contactWebsite => 'Веб-сайт';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записів',
      one: '1 запис',
    );
    return 'Вміст: $_temp0 · $content';
  }

  @override
  String get copy => 'Копіювати';

  @override
  String get copyAllRecords => 'Копіювати всі записи';

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
  String deleteTagConfirmContent(String name) {
    return 'Видалити \"$name\" з бібліотеки? Фізична мітка не зміниться.';
  }

  @override
  String get deleteTagConfirmTitle => 'Видалити мітку';

  @override
  String get deleteTemplateTooltip => 'Видалити шаблон';

  @override
  String get deviceNameTooLong => 'Занадто довга назва пристрою.';

  @override
  String get dismiss => 'Відхилити';

  @override
  String get editRecordTitle => 'Редагувати запис';

  @override
  String get editRule => 'Змінити правило';

  @override
  String get editTag => 'Редагувати мітку';

  @override
  String get emailBody => 'Текст листа';

  @override
  String get emailRecipient => 'Кому (Email)';

  @override
  String get emailSubject => 'Тема';

  @override
  String get emptyComposerSubtitle =>
      'Натисніть \"Додати запис\", щоб створити URL, текст, Wi-Fi або контакт.';

  @override
  String get emptyComposerTitle => 'Записів ще немає';

  @override
  String get emptyHistorySubtitle => 'Відскановані мітки з\'являтимуться тут.';

  @override
  String get emptyHistoryTitle => 'Історія порожня';

  @override
  String get emptyLibrary =>
      'Збережених міток ще немає.\nВідскануйте мітку та збережіть її тут з фото та назвою.';

  @override
  String get eventDescription => 'Опис';

  @override
  String get eventEnd => 'Завершення';

  @override
  String get eventLocation => 'Місце';

  @override
  String get eventStart => 'Початок';

  @override
  String get eventTitle => 'Назва події';

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
  String get fieldTextPrompt => 'Текст для запису на мітку';

  @override
  String get fieldUrlPrompt => 'Адреса сайту (https://...)';

  @override
  String get fileUrl => 'Посилання на файл';

  @override
  String get filterAll => 'Всі';

  @override
  String get flashlight => 'Ліхтарик';

  @override
  String get formatConfirmButton => 'Форматувати';

  @override
  String get formatConfirmMessage =>
      'Дані на мітці буде видалено та налаштовано як порожню мітку NDEF. Продовжити?';

  @override
  String get formatMemorySubtitle =>
      'Підготовка для NDEF (чисті або пошкоджені мітки)';

  @override
  String get formatMemoryTitle => 'Форматувати пам\'ять';

  @override
  String get hardwareAvailable => 'NFC готовий до роботи';

  @override
  String get hardwareDisabled => 'NFC вимкнено';

  @override
  String get hardwareNotSupported => 'NFC не підтримується';

  @override
  String get historyFilteredEmpty => 'Нічого не знайдено в історії.';

  @override
  String get idTooLarge => 'Довжина ID не може перевищувати 255 байтів';

  @override
  String get importBackup => 'Імпорт (Об\'єднати)';

  @override
  String get importCsv => 'Імпорт CSV';

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
  String get latitude => 'Широта (Lat)';

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
  String get loadToComposerTooltip => 'Завантажити в редактор';

  @override
  String get locationHint => 'Напр.: Дверцята холодильника';

  @override
  String get locationLabel => 'Де розташована?';

  @override
  String get lockAcknowledge => 'Я розумію, що цю дію не можна скасувати';

  @override
  String get lockButton => 'Заблокувати';

  @override
  String get lockTagSubtitle =>
      'Назавжди робить мітку доступною лише для читання';

  @override
  String get lockTagTitle => 'Заблокувати мітку';

  @override
  String get lockWarning =>
      'Заблокована мітка стає доступною ТІЛЬКИ для читання: змінити, стерти чи розблокувати її буде НЕМОЖЛИВО.';

  @override
  String get longitude => 'Довгота (Lng)';

  @override
  String get manage => 'Керування';

  @override
  String get matchedRule => 'Відповідна нотатка';

  @override
  String get mimePayloadHex => 'Дані (Hex / Текст)';

  @override
  String get mimeTypeLabel => 'MIME тип';

  @override
  String get nameRequired => 'Будь ласка, вкажіть назву мітки.';

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
  String get ndefRecordsTitle => 'Записи NDEF';

  @override
  String get nfcPromptClear => 'Піднесіть мітку для скидання';

  @override
  String get nfcPromptLock => 'Піднесіть мітку для остаточного блокування';

  @override
  String get nfcPromptScan => 'Піднесіть NFC-мітку до пристрою для зчитування';

  @override
  String get nfcPromptWrite => 'Піднесіть NFC-мітку для збереження даних';

  @override
  String get no => 'Ні';

  @override
  String get noContentInTag => 'У цьому записі немає вмісту мітки.';

  @override
  String get noLibraryMatches => 'Нічого не знайдено.';

  @override
  String get noRecordsOnTag => 'На мітці не знайдено записів NDEF.';

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
  String pageN(int page) {
    return 'Сторінка $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'Дані';

  @override
  String get pageRoleLock => 'Блок';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / Блок';

  @override
  String get passwordDialogAction => 'Встановити';

  @override
  String get passwordDialogTitle => 'Встановити пароль';

  @override
  String get passwordDialogWarning =>
      'Якщо ви забудете цей пароль, змінити дані на мітці буде неможливо. Читання залишиться відкритим.';

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
      'Додає контакт до адресної книги в один дотик.';

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
      'Підключення до мережі без введення пароля.';

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
  String get rawInspection => 'Детальний аналіз';

  @override
  String get rawRecordDetailsTitle => 'Деталі запису (Лише читання)';

  @override
  String get rawRecordEditorTitle => 'Редагувати сирий запис NDEF';

  @override
  String get readHeroButton => 'Почати сканування';

  @override
  String get readHeroEyebrow => 'ЗЧИТУВАЧ NFC';

  @override
  String get readHeroScanning => 'Сканування...';

  @override
  String get readHeroSubtitle =>
      'Піднесіть верхню частину телефону до мітки для читання записів NDEF та даних чіпа.';

  @override
  String get readHeroTitle => 'Сканувати мітку';

  @override
  String get readMemorySubtitle =>
      'Посторінкове читання пам\'яті; копіювання або збереження у .bin';

  @override
  String get readMemoryTitle => 'Читати пам\'ять';

  @override
  String get readyTemplates => 'Готові шаблони';

  @override
  String get recordCopied => 'Вміст скопійовано';

  @override
  String recordIndex(int index) {
    return 'Запис #$index';
  }

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
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записів скопійовано',
      one: '1 запис скопійовано',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'Повторити';

  @override
  String get removePasswordDialogTitle => 'Зняти пароль';

  @override
  String get removePasswordDialogWarning => 'Введіть поточний пароль мітки.';

  @override
  String get removePasswordSubtitle =>
      'Знімає захист за допомогою відомого пароля';

  @override
  String get removePasswordTitle => 'Зняти пароль';

  @override
  String get removePhoto => 'Видалити';

  @override
  String get rewriteTag => 'Перезаписати';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Видалити правило з нотаткою \"$note\"?';
  }

  @override
  String get ruleDeleted => 'Правило видалено';

  @override
  String get ruleNoteDialogTitle => 'Редагувати нотатку мітки';

  @override
  String get ruleNoteHint => 'Напр.: Стелаж на складі #4 або Конференц-зал';

  @override
  String get ruleNoteLabel => 'Локальна нотатка / Опис';

  @override
  String get ruleSaved => 'Правило збережено';

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
  String get saveTemplateDialogTitle => 'Зберегти як шаблон';

  @override
  String get saveToLibrary => 'Зберегти в бібліотеку';

  @override
  String get scanFabLabel => 'Сканувати мітку';

  @override
  String get scanQrToRecord => 'Сканувати QR';

  @override
  String get scannedTag => 'Зчитана мітка';

  @override
  String get searchEngine => 'Пошукова система';

  @override
  String get searchHistoryHint => 'Пошук в історії (UID, вміст, тип)...';

  @override
  String get searchLibraryHint =>
      'Пошук за назвою, нотаткою, місцем або текстом';

  @override
  String get searchQuery => 'Пошуковий запит';

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
  String get shareRecords => 'Поділитися записами';

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
  String get socialNetwork => 'Платформа';

  @override
  String get socialUsername => 'Ім\'я користувача';

  @override
  String get sourceComposer => 'Записи зі списку редактора';

  @override
  String get sourceEmpty => 'Без вмісту (лише нотатка)';

  @override
  String get sourceLastScan => 'Остання відсканована мітка';

  @override
  String get sourceSelectPrompt => 'Звідки взяти дані для мітки?';

  @override
  String get statusCancelled => 'Операцію скасовано.';

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
  String get tabApp => 'Додаток';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'Календар';

  @override
  String get tabContact => 'Контакт (vCard)';

  @override
  String get tabCustomMime => 'Власний MIME';

  @override
  String get tabEmail => 'Ел. пошта';

  @override
  String get tabFile => 'Файл';

  @override
  String get tabLocation => 'Геолокація';

  @override
  String get tabPhone => 'Телефон';

  @override
  String get tabSearch => 'Пошук';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'Соцмережі';

  @override
  String get tabText => 'Текст';

  @override
  String get tabUrl => 'Веб-URL';

  @override
  String get tabVideo => 'Відео';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'Місткість';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max байтів ($available байтів вільно)';
  }

  @override
  String get tagInfoTitle => 'Інформація про мітку';

  @override
  String get tagLibraryTitle => 'Моя бібліотека міток';

  @override
  String get tagNameHint => 'Напр.: Мітка на кухні';

  @override
  String get tagNameLabel => 'Назва';

  @override
  String get tagReadOnly => 'Тільки читання (Заблоковано)';

  @override
  String tagRulesCount(int count) {
    return 'Збережених правил / нотаток: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Відображає лише збережену нотатку на основі SHA-256 хешу байтів вмісту NDEF.';

  @override
  String get tagSerialNumber => 'Серійний номер (UID)';

  @override
  String get tagTechnology => 'Технологія';

  @override
  String get tagType => 'Тип';

  @override
  String get tagUidCopied => 'UID мітки скопійовано';

  @override
  String get tagWritable => 'Доступний для запису';

  @override
  String get takePhoto => 'Зробити фото';

  @override
  String get templateGalleryTitle => 'Готові шаблони';

  @override
  String get templateNameHint => 'Назва шаблону';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записів',
      one: '1 запис',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'Шаблон успішно збережено';

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
  String get totalBytes => 'Загальний розмір';

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
  String get verificationNotChecked => 'Не перевірялось';

  @override
  String get verificationPassed => 'Пройдено';

  @override
  String get videoUrlCannotBeEmpty =>
      'Посилання на відео не може бути порожнім.';

  @override
  String get videoUrlOrId => 'Посилання на відео або YouTube ID';

  @override
  String get videoUrlOrIdPrompt =>
      'Введіть URL (https://...) або ID відео на YouTube.';

  @override
  String get wifiAuthOpen => 'Відкрита (Без захисту)';

  @override
  String get wifiAuthType => 'Тип безпеки';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'Прихована мережа';

  @override
  String get wifiPassword => 'Пароль';

  @override
  String get wifiSsid => 'Назва мережі (SSID)';

  @override
  String get withSiri => 'За допомогою Siri';

  @override
  String get writeDumpConfirmButton => 'Записати';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes байтів) буде записано в пам\'ять мітки. UID та сторінки конфігурації зберігаються.';
  }

  @override
  String get writeDumpSubtitle => 'Записує бінарний файл пам\'яті на мітку';

  @override
  String get writeDumpTitle => 'Записати дамп (.bin)';

  @override
  String get writeHeroButton => 'Почати запис';

  @override
  String get writeHeroEyebrow => 'ЗАПИСУВАЧ NDEF';

  @override
  String get writeHeroSubtitle =>
      'Створіть кілька записів NDEF та запишіть їх на мітку за один раз.';

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
  String get yes => 'Так';
}
