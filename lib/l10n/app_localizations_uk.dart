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
  String get nfcPromptScan => 'Піднесіть мітку до верхньої частини телефону';

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
  String get verificationNotChecked => 'Не перевірялося';

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
  String rewriteSourceUidLabel(String uid) {
    return 'Вихідний UID: $uid';
  }

  @override
  String rewriteRecordCountLabel(num count) {
    return 'Кількість записів для запису: $count';
  }

  @override
  String get rewriteInstruction =>
      'Підготуйте цільову мітку, натисніть \"Доторкнутися і записати\" та піднесіть мітку.';

  @override
  String get tapAndWrite => 'Доторкнутися і записати';

  @override
  String get rewritePromptMessage =>
      'Піднесіть цільову мітку до пристрою (вміст буде повністю оновлено)';

  @override
  String rewriteFailedMessage(String error) {
    return 'Не вдалося перезаписати: $error';
  }

  @override
  String get writeVerifiedTitle => 'Запис перевірено';

  @override
  String get writeVerifiedDesc =>
      'Вміст NDEF успішно записано та перевірено на цільовій мітці.';

  @override
  String writtenRecordCount(num count) {
    return 'Кількість записаних записів: $count';
  }

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
  String compareScannedUid(String uid) {
    return 'UID сканованої мітки: $uid';
  }

  @override
  String compareWrittenData(num count, num bytes) {
    return 'Записані дані: $count записів ($bytes байтів)';
  }

  @override
  String compareScannedData(num count, num bytes) {
    return 'Скановані дані: $count записів ($bytes байтів)';
  }

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
  String batchTargetCountLabel(num count) {
    return 'Кількість цільових міток: $count';
  }

  @override
  String batchComposerSummary(num count, num bytes) {
    return 'Записи: $count ($bytes байтів)';
  }

  @override
  String get batchStartButton => 'Почати пакетний запис';

  @override
  String get batchControlPanelTitle => 'Панель керування пакетним записом';

  @override
  String get batchCancelOrClose => 'Скасувати / Закрити';

  @override
  String get batchAllCompleted => 'Усі спроби запису завершено!';

  @override
  String batchNextTag(num current, num total) {
    return 'Наступна: Мітка #$current / $total';
  }

  @override
  String batchStats(num success, num fail, num remaining) {
    return 'Успішно: $success | Помилка: $fail | Залишилося: $remaining';
  }

  @override
  String batchSuccessMsg(String message) {
    return 'Успішно ($message)';
  }

  @override
  String batchFailMsg(String message) {
    return 'Помилка: $message';
  }

  @override
  String tagNumberLabel(num index) {
    return 'Мітка #$index: ';
  }

  @override
  String get waitingForTag => 'Очікування мітки...';

  @override
  String tapToWriteForTag(num index) {
    return 'Доторкнутися і записати для мітки #$index';
  }

  @override
  String get batchFinishButton => 'Завершити пакетний запис';

  @override
  String batchPromptMessage(num current, num total) {
    return 'Пакетний запис: Піднесіть мітку #$current / $total';
  }

  @override
  String batchTagSuccessSummary(num count) {
    return '$count записів записано та перевірено';
  }

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
  String templateLoadedToComposer(String name) {
    return 'Записи з шаблону \"$name\" завантажено у список.';
  }

  @override
  String get templateSaveEmptyError =>
      'Додайте записи перед збереженням шаблону.';

  @override
  String templateDefaultName(num index) {
    return 'Шаблон $index';
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
  String ruleNoteShaSummary(String sha) {
    return 'Хеш вмісту NDEF (SHA-256):\n$sha';
  }

  @override
  String get ruleNoteSavedSnack => 'Примітку мітки збережено.';

  @override
  String get ruleNoteDeleteTitle => 'Видалити примітку мітки';

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
  String backupTemplatesCount(num count) {
    return '• Шаблони: $count';
  }

  @override
  String backupRulesCount(num count) {
    return '• Примітки/правила міток: $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Включити історію сканувань (необов\'язково)';

  @override
  String backupHistoryCount(num count) {
    return '$count записів історії';
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
  String backupExportError(String error) {
    return 'Помилка експорту: $error';
  }

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
    return 'Помилка перевірки резервної копії: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Виявлено історію сканувань';

  @override
  String backupHistoryDetectedMsg(num count) {
    return 'Резервна копія містить $count записів історії, але на цьому пристрої функція вимкнена.\n\n';
  }

  @override
  String get backupHistoryDetectedPrompt =>
      'Імпортувати та увімкнути історію? Чи пропустити її та імпортувати лише шаблони і примітки?';

  @override
  String get backupSkipHistoryOption =>
      'Пропустити історію (завантажити лише шаблони і примітки)';

  @override
  String get backupEnableHistoryOption => 'Увімкнути історію та завантажити';

  @override
  String backupImportSuccessWithSummary(String summary) {
    return 'Імпорт успішно завершено:\n$summary';
  }

  @override
  String backupMergeError(String error) {
    return 'Помилка злиття: $error';
  }

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
  String ndefClipboardBanner(num count, num bytes, String source) {
    return 'Буфер NDEF: $count записів ($bytes Б) - $source';
  }

  @override
  String get template => 'Шаблон';

  @override
  String get nfcScannerTitle => 'NFC Сканер';

  @override
  String lastScannedTagId(String id) {
    return 'Остання мітка: $id';
  }

  @override
  String get composeRecord => 'Створити запис';

  @override
  String get protectOrRemove => 'Захистити / зняти';

  @override
  String get previousScans => 'Попередні сканування';

  @override
  String scanErrorWithMsg(String error) {
    return 'Помилка сканування: $error';
  }

  @override
  String get noScannedTagYet => 'Ще не відскановано жодної мітки NFC';

  @override
  String get tapScanPrompt =>
      'Натисніть \"Почати сканування\" та піднесіть мітку до телефону.';

  @override
  String get ndefCopyAndRewriteTitle => 'Копіювання та перезапис вмісту NDEF';

  @override
  String ndefCopyNotice(num count, num bytes) {
    return '$count записів ($bytes байтів) - Обробляються лише дані NDEF, UID не клонується.';
  }

  @override
  String tagIdHeader(String id) {
    return 'Мітка $id';
  }

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
  String errorWithMsg(String error) {
    return 'Помилка: $error';
  }

  @override
  String get noNdefMessageOnTag => 'На мітці не знайдено повідомлень NDEF.';

  @override
  String readNdefRecordsHeader(num count) {
    return 'Зчитані записи NDEF ($count)';
  }

  @override
  String stagedNdefRecordsHeader(num count) {
    return 'Підготовлені записи NDEF ($count)';
  }

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
  String inspectorPayloadTruncated(num length) {
    return 'Примітка: Обсяг даних $length байтів; показано перші 64 байти.';
  }

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
  String composerTotalSizeAndCount(num bytes, num count) {
    return 'Загальний обсяг: $bytes байтів | Записів: $count';
  }

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
  String writeAndVerifyWithBytes(num bytes) {
    return 'Записати на мітку та перевірити ($bytes байтів)';
  }

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
  String confirmWriteRecordCount(num count) {
    return 'Кількість записів для запису: $count';
  }

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
  String historyScansCount(num count) {
    return 'Збережені сканування: $count';
  }

  @override
  String get noHistoryYet => 'Історія сканувань порожня.';

  @override
  String noHistoryResultsForQuery(String query) {
    return 'Для \"$query\" нічого не знайдено.';
  }

  @override
  String get tryDifferentQuery => 'Спробуйте інший UID, текст або тип запису.';

  @override
  String get clearSearch => 'Очистити пошук';

  @override
  String historyItemHeader(String time, num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записів',
      one: '1 запис',
    );
    return '$time | $_temp0';
  }

  @override
  String get deleteThisRecord => 'Видалити цей запис';

  @override
  String historyCapacitySummary(num cap, num used) {
    return 'Ємність: $capБ | Використано: $usedБ';
  }

  @override
  String historyUidHeader(String uid) {
    return 'UID історії $uid';
  }

  @override
  String get qrPreview => 'QR перегляд';

  @override
  String templateRecordCountWithDate(num count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записів',
      one: '1 запис',
    );
    return '$_temp0 | $date';
  }

  @override
  String writeVerificationSummary(num bytes, String status) {
    return 'Записано байтів: $bytes | Перевірка: $status';
  }

  @override
  String get lockTagConfirmTitle => 'Назавжди заблокувати мітку';

  @override
  String get lockTagWarning1 =>
      'Заблокована мітка стає доступною лише для читання: змінити або розблокувати її НЕМОЖЛИВО.';

  @override
  String get lockTagWarning2 =>
      'Переконайтеся, що спочатку записали правильний вміст.';

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
  String get qrPreviewTooltip => 'Попередній перегляд QR-коду';

  @override
  String get unknownParentheses => '(Невідомо)';

  @override
  String get ok => 'ОК';
}
