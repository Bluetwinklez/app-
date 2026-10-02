// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get addRecord => 'Добавить запись';

  @override
  String get addRule => 'Добавить заметку';

  @override
  String get addTag => 'Добавить метку';

  @override
  String get addToComposerList => 'Добавить в список записи';

  @override
  String get addToWriteList => 'Добавить в список записи';

  @override
  String get addressCannotBeEmpty => 'Адрес не может быть пустым.';

  @override
  String get advancedCommandsDesc =>
      'Одна hex-команда на строку. Напр: 60 = GET_VERSION, 30 04 = чтение стр. 4. Неверные команды могут повредить метку.';

  @override
  String get advancedCommandsSubtitle =>
      'Отправка необработанных hex-команд на метку';

  @override
  String get advancedCommandsTitle => 'Расширенные команды NFC';

  @override
  String get allRulesCleared => 'Все правила удалены';

  @override
  String get appLinksDesc =>
      'При записи на метку касание покажет уведомление и сразу откроет выбранный экран приложения.';

  @override
  String get appLinksSection => 'Ссылки приложения';

  @override
  String get appPackageName => 'Имя пакета Android';

  @override
  String get appSettings => 'Настройки приложения';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'Автозапуск при касании';

  @override
  String get backupExportSuccess => 'Файл резервной копии успешно сохранён';

  @override
  String get backupFileSizeExceeded =>
      'Размер файла резервной копии превышает 2 МБ.';

  @override
  String get backupHistoryMustBeList =>
      'Поле \"history\" должно быть массивом.';

  @override
  String backupImportFailed(String error) {
    return 'Не удалось импортировать копию: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'Резервная копия импортирована: добавлено шаблонов — $templates, правил — $rules, записей истории — $history';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'Некорректный Base64 для ID: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Некорректный Base64 для данных: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Некорректный Base64 для типа: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'Неверный формат JSON: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Недопустимая заметка правила.';

  @override
  String get backupInvalidRuleSha => 'Недопустимый SHA-256 хеш.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'Некорректная дата создания: $date';
  }

  @override
  String get backupInvalidTemplateId => 'Некорректный ID шаблона.';

  @override
  String get backupInvalidTemplateName => 'Некорректное имя шаблона.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'Недопустимое значение TNF ($tnf). Должно быть от 0 до 7.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Превышен лимит истории $max ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'Превышен лимит записей $max ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'Превышен лимит правил $max ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'Превышен лимит шаблонов $max ($count).';
  }

  @override
  String get backupMissingSchemaVersion =>
      'Отсутствует поле \"schemaVersion\".';

  @override
  String get backupRecordMustBeObject =>
      'Каждая NDEF-запись должна быть объектом JSON.';

  @override
  String get backupRecordsMustBeList => 'Записи должны быть массивом.';

  @override
  String get backupRestoreSubtitle =>
      'Сохраняйте шаблоны, заметки и историю в формате JSON или объединяйте с текущими данными.';

  @override
  String get backupRestoreTitle => 'Резервная копия и восстановление (JSON)';

  @override
  String get backupRootMustBeObject =>
      'Корневой элемент должен быть объектом JSON.';

  @override
  String get backupRuleMustBeObject =>
      'Каждое правило должно быть объектом JSON.';

  @override
  String get backupSchemaVersionMustBeInt =>
      'Поле \"schemaVersion\" должно быть целым числом.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'Резервная копия превышает лимит 2 МБ ($bytes байт).';
  }

  @override
  String get backupTagRulesMustBeList =>
      'Поле \"tagRules\" должно быть массивом.';

  @override
  String get backupTemplateMustBeObject =>
      'Каждый шаблон должен быть объектом JSON.';

  @override
  String get backupTemplatesMustBeList =>
      'Поле \"templates\" должно быть массивом.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'Неподдерживаемая версия схемы: $version.';
  }

  @override
  String get batchWrite => 'Пакетная запись';

  @override
  String get bluetoothDeviceName => 'Имя устройства (Опционально)';

  @override
  String get bluetoothMac => 'MAC-адрес Bluetooth';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'Записано байт: $bytes | Проверка: $status';
  }

  @override
  String cameraError(String error) {
    return 'Не удалось открыть камеру. Разрешите доступ в Настройки > Конфиденциальность > Камера.\n($error)';
  }

  @override
  String get cancel => 'Отмена';

  @override
  String get catBusiness => 'Бизнес';

  @override
  String get catCar => 'Авто';

  @override
  String get catHome => 'Дом';

  @override
  String get catOther => 'Другое';

  @override
  String get catPersonal => 'Личное';

  @override
  String get catWork => 'Работа';

  @override
  String get categoryLabel => 'Категория';

  @override
  String get chooseFromGallery => 'Выбрать из галереи';

  @override
  String get clear => 'Очистить';

  @override
  String get clearAll => 'Очистить всё';

  @override
  String get clearAllRulesConfirm => 'Удалить все сохранённые заметки меток?';

  @override
  String get clearConfirmButton => 'Да, очистить';

  @override
  String get clearConfirmMessage =>
      'Все записи NDEF будут стёрты, будет записана пустая запись. Продолжить?';

  @override
  String get clearConfirmTitle => 'Сбросить содержимое метки';

  @override
  String get clearHistory => 'Очистить историю';

  @override
  String get clearList => 'Очистить список';

  @override
  String get clearTagSubtitle => 'Удаляет все записи и пишет пустой NDEF';

  @override
  String get clearTagTitle => 'Очистить метку';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записей в буфере',
      one: '1 запись в буфере',
    );
    return '$_temp0 ($bytes Б) · $source';
  }

  @override
  String get close => 'Закрыть';

  @override
  String get commandsEmptyError => 'Введите хотя бы одну команду.';

  @override
  String get commandsLabel => 'Команды';

  @override
  String get composeRecordTitle => 'Добавить запись';

  @override
  String get confirmClearHistoryContent =>
      'Вся сохранённая история сканирований будет удалена. Продолжить?';

  @override
  String get confirmClearHistoryTitle => 'Очистить историю';

  @override
  String get confirmClearTemplatesContent =>
      'Все сохранённые шаблоны записи будут удалены. Продолжить?';

  @override
  String get confirmClearTemplatesTitle => 'Очистить шаблоны';

  @override
  String get contactCompany => 'Компания / Организация';

  @override
  String get contactEmail => 'Эл. почта';

  @override
  String get contactFullName => 'ФИО';

  @override
  String get contactNote => 'Заметка';

  @override
  String get contactPhone => 'Телефон';

  @override
  String get contactTitle => 'Должность';

  @override
  String get contactWebsite => 'Веб-сайт';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записей',
      one: '1 запись',
    );
    return 'Содержимое: $_temp0 · $content';
  }

  @override
  String get copy => 'Копировать';

  @override
  String get copyAllRecords => 'Копировать все записи';

  @override
  String get copyTagUid => 'Скопировать UID';

  @override
  String get copyToComposer => 'Копировать в список записи';

  @override
  String get csvInvalidAddress => 'недопустимый адрес.';

  @override
  String get csvInvalidEmail => 'недопустимый адрес эл. почты.';

  @override
  String get csvInvalidLocation =>
      'укажите широту и долготу (напр., локация,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'Импортировано максимум $max записей; остальные пропущены.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'Строка $row: значение пустое.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'Строка $row: $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'неизвестный тип \"$type\".';
  }

  @override
  String get csvWifiPasswordLength =>
      'Пароль Wi-Fi должен содержать от 8 до 63 символов.';

  @override
  String get delete => 'Удалить';

  @override
  String deleteTagConfirmContent(String name) {
    return 'Удалить \"$name\" из библиотеки? Физическая метка не изменится.';
  }

  @override
  String get deleteTagConfirmTitle => 'Удалить метку';

  @override
  String get deleteTemplateTooltip => 'Удалить шаблон';

  @override
  String get deviceNameTooLong => 'Слишком длинное имя устройства.';

  @override
  String get dismiss => 'Отклонить';

  @override
  String get editRecordTitle => 'Редактировать запись';

  @override
  String get editRule => 'Изменить заметку';

  @override
  String get editTag => 'Редактировать метку';

  @override
  String get emailBody => 'Текст письма';

  @override
  String get emailRecipient => 'Кому (Email)';

  @override
  String get emailSubject => 'Тема';

  @override
  String get emptyComposerSubtitle =>
      'Нажмите «Добавить запись», чтобы создать веб-ссылку, текст, Wi-Fi или контакт.';

  @override
  String get emptyComposerTitle => 'Записей пока нет';

  @override
  String get emptyHistorySubtitle => 'Отсканированные метки появятся здесь.';

  @override
  String get emptyHistoryTitle => 'История пуста';

  @override
  String get emptyLibrary =>
      'Нет сохранённых меток.\nОтсканируйте метку и сохраните её здесь с фото и именем.';

  @override
  String get eventDescription => 'Описание';

  @override
  String get eventEnd => 'Окончание';

  @override
  String get eventLocation => 'Место';

  @override
  String get eventStart => 'Начало';

  @override
  String get eventTitle => 'Название события';

  @override
  String get exportBackup => 'Экспорт';

  @override
  String get facetimePrompt => 'Введите номер телефона или e-mail от Apple ID.';

  @override
  String fieldCannotBeEmpty(String field) {
    return 'Поле \"$field\" обязательно для заполнения.';
  }

  @override
  String get fieldTextPrompt => 'Текст для записи на метку';

  @override
  String get fieldUrlPrompt => 'Адрес сайта (https://...)';

  @override
  String get fileUrl => 'Ссылка на файл';

  @override
  String get filterAll => 'Все';

  @override
  String get flashlight => 'Фонарик';

  @override
  String get formatConfirmButton => 'Форматировать';

  @override
  String get formatConfirmMessage =>
      'Все данные на метке будут перезаписаны для формата NDEF. Продолжить?';

  @override
  String get formatMemorySubtitle =>
      'Подготавливает для NDEF (чистые или повреждённые)';

  @override
  String get formatMemoryTitle => 'Форматировать память';

  @override
  String get hardwareAvailable => 'NFC готов к работе';

  @override
  String get hardwareDisabled => 'NFC выключен';

  @override
  String get hardwareNotSupported => 'NFC не поддерживается';

  @override
  String get historyFilteredEmpty => 'В истории ничего не найдено.';

  @override
  String get idTooLarge => 'Длина ID не может превышать 255 байт';

  @override
  String get importBackup => 'Импорт (Объединить)';

  @override
  String get importCsv => 'Импорт CSV';

  @override
  String get inAppTagRules => 'Локальные правила меток';

  @override
  String get invalidHexId => 'Некорректный Hex ID';

  @override
  String get invalidHexPayload => 'Некорректная Hex строка данных';

  @override
  String get invalidHexType => 'Некорректная Hex строка типа';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get latitude => 'Широта (Lat)';

  @override
  String get linkCopied => 'Ссылка скопирована';

  @override
  String get linkHistoryDesc => 'Открывает историю';

  @override
  String get linkScanDesc => 'Открывает приложение и запускает сканирование';

  @override
  String get linkToolsDesc => 'Открывает экран утилит';

  @override
  String get linkWriteDesc => 'Открывает экран записи';

  @override
  String get loadToComposerTooltip => 'Загрузить в редактор';

  @override
  String get locationHint => 'Напр.: Дверца холодильника';

  @override
  String get locationLabel => 'Где находится?';

  @override
  String get lockAcknowledge => 'Я понимаю, что это действие необратимо';

  @override
  String get lockButton => 'Заблокировать';

  @override
  String get lockTagSubtitle =>
      'Навсегда делает метку доступной только для чтения';

  @override
  String get lockTagTitle => 'Заблокировать метку';

  @override
  String get lockWarning =>
      'Заблокированная метка становится доступной ТОЛЬКО для чтения: изменить, стереть или разблокировать её будет НЕЛЬЗЯ.';

  @override
  String get longitude => 'Долгота (Lng)';

  @override
  String get manage => 'Управление';

  @override
  String get matchedRule => 'Совпавшая заметка';

  @override
  String get mimePayloadHex => 'Данные (Hex / Текст)';

  @override
  String get mimeTypeLabel => 'MIME тип';

  @override
  String get nameRequired => 'Укажите название метки.';

  @override
  String get navHistory => 'История';

  @override
  String get navHistoryTitle => 'История';

  @override
  String get navRead => 'Читать';

  @override
  String get navReadTitle => 'Чтение метки';

  @override
  String get navSettings => 'Настрой.';

  @override
  String get navSettingsTitle => 'Шаблоны и настройки';

  @override
  String get navTools => 'Утилиты';

  @override
  String get navToolsTitle => 'Утилиты';

  @override
  String get navWrite => 'Запись';

  @override
  String get navWriteTitle => 'Запись метки';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записей',
      one: '1 запись',
    );
    return '$_temp0';
  }

  @override
  String get ndefRecordsTitle => 'NDEF Записи';

  @override
  String get nfcPromptClear => 'Поднесите метку к устройству для сброса';

  @override
  String get nfcPromptLock => 'Поднесите метку для постоянной блокировки';

  @override
  String get nfcPromptScan => 'Поднесите NFC-метку к устройству для чтения';

  @override
  String get nfcPromptWrite => 'Поднесите NFC-метку для сохранения данных';

  @override
  String get no => 'Нет';

  @override
  String get noContentInTag => 'В этой записи нет содержимого метки.';

  @override
  String get noLibraryMatches => 'Ничего не найдено.';

  @override
  String get noRecordsOnTag => 'На метке нет NDEF записей.';

  @override
  String get noTemplates =>
      'Нет сохранённых шаблонов.\nСоздайте запись во вкладке «Запись», чтобы сохранить её как шаблон.';

  @override
  String get noteLabel => 'Заметка';

  @override
  String get onboardingContinue => 'Далее';

  @override
  String get onboardingSkip => 'Пропустить';

  @override
  String get onboardingStart => 'Начать';

  @override
  String get onboardingStep1Body =>
      'Нажмите синюю кнопку внизу и поднесите телефон к метке. Содержимое, ёмкость и серийный номер отобразятся сразу.';

  @override
  String get onboardingStep1Title => 'Сканируйте метку';

  @override
  String get onboardingStep2Body =>
      'Во вкладке «Запись» нажмите «Добавить запись»: веб-ссылки, Wi-Fi, контакты, соцсети и готовые шаблоны.';

  @override
  String get onboardingStep2Title => 'Записывайте что угодно';

  @override
  String get onboardingStep3Body =>
      'Анализируйте память, задавайте пароли, блокируйте метки или форматируйте во вкладке «Утилиты».';

  @override
  String get onboardingStep3Title => 'Экспертные утилиты';

  @override
  String get onboardingStep4Body =>
      'Сохраняйте метки с названиями, заметками и фото в библиотеке. Язык можно сменить в настройках.';

  @override
  String get onboardingStep4Title => 'Каталог меток';

  @override
  String optionalField(String label) {
    return '$label (необязательно)';
  }

  @override
  String pageN(int page) {
    return 'Страница $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'Данные';

  @override
  String get pageRoleLock => 'Блок';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / Блок';

  @override
  String get passwordDialogAction => 'Установить';

  @override
  String get passwordDialogTitle => 'Установить пароль';

  @override
  String get passwordDialogWarning =>
      'Если вы забудете пароль, изменить данные на метке будет невозможно. Чтение останется открытым.';

  @override
  String get passwordError => 'Введите ровно 4 символа или 8 hex-знаков.';

  @override
  String get passwordHint => '4 символа (напр., 1234) или 8 hex-знаков';

  @override
  String get passwordLabel => 'Пароль';

  @override
  String get paste => 'Вставить';

  @override
  String get phoneNumber => 'Номер телефона';

  @override
  String get phoneWithCountryCode =>
      'Введите номер с кодом страны (напр., 79991112233).';

  @override
  String get presetAppDownloadDesc =>
      'Открывает или предлагает скачать ваше приложение.';

  @override
  String get presetAppDownloadTitle => 'Скачивание приложения';

  @override
  String get presetBusinessCardDesc =>
      'Добавляет контакт в телефонную книгу в одно касание.';

  @override
  String get presetBusinessCardTitle => 'Электронная визитка';

  @override
  String get presetDirectionsDesc =>
      'Показывает адрес или геопозицию на карте.';

  @override
  String get presetDirectionsTitle => 'Маршрут / Точка на карте';

  @override
  String get presetEmergencyDesc =>
      'Группа крови, контакты для экстренной связи и медданные.';

  @override
  String get presetEmergencyTitle => 'Экстренная карта (ICE)';

  @override
  String get presetGoogleReviewDesc =>
      'Переводит клиента прямо на страницу отзывов.';

  @override
  String get presetGoogleReviewTitle => 'Отзыв в Google';

  @override
  String get presetGuestWifiDesc =>
      'Подключение к сети без ручного ввода пароля.';

  @override
  String get presetGuestWifiTitle => 'Гостевой Wi-Fi';

  @override
  String get presetInstagramDesc =>
      'Открывает профиль в Instagram при касании.';

  @override
  String get presetInstagramTitle => 'Профиль Instagram';

  @override
  String get presetMenuLinkDesc =>
      'Разместите на столе, чтобы гости сразу открыли меню.';

  @override
  String get presetMenuLinkTitle => 'Меню ресторана';

  @override
  String get presetPetTagDesc =>
      'Позволит нашедшему питомца быстро позвонить вам.';

  @override
  String get presetPetTagTitle => 'Адресник для питомца';

  @override
  String get presetShortcutDesc =>
      'Запускает команды Apple или действия приложения.';

  @override
  String get presetShortcutTitle => 'Запуск быстрых команд';

  @override
  String get presetWebsiteDesc => 'Перенаправляет на любую веб-страницу.';

  @override
  String get presetWebsiteTitle => 'Ссылка на сайт';

  @override
  String get presetWhatsappDesc =>
      'Начинает диалог без сохранения номера в контакты.';

  @override
  String get presetWhatsappTitle => 'Чат в WhatsApp';

  @override
  String get qrCode => 'QR-код';

  @override
  String qrContentChars(int chars) {
    return 'Содержимое ($chars симв.):';
  }

  @override
  String get qrContentEmpty => 'Содержимое пустое.';

  @override
  String qrContentTooLarge(int chars) {
    return 'Содержимое слишком велико для QR-кода ($chars символов, максимум 2048).';
  }

  @override
  String get qrFrameInstructions =>
      'Наведите камеру на QR-код. Ссылки, Wi-Fi и текст будут преобразованы в NDEF.';

  @override
  String qrGenerationFailed(String error) {
    return 'Не удалось сгенерировать QR: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'Предпросмотр QR: $title';
  }

  @override
  String get qrScanTitle => 'Сканирование QR-кода';

  @override
  String get qrSecurityNote =>
      'Предпросмотр QR доступен только для текста и веб-ссылок.\n\nПароли Wi-Fi и бинарные данные не конвертируются ради конфиденциальности.';

  @override
  String get qrUserOnlyNote => 'Открывается только по запросу пользователя.';

  @override
  String get rawInspection => 'Подробный анализ';

  @override
  String get rawRecordDetailsTitle => 'Подробности записи (Только чтение)';

  @override
  String get rawRecordEditorTitle => 'Редактировать сырую NDEF запись';

  @override
  String get readHeroButton => 'Начать скан';

  @override
  String get readHeroEyebrow => 'NFC СКАНЕР';

  @override
  String get readHeroScanning => 'Сканирование...';

  @override
  String get readHeroSubtitle =>
      'Поднесите верхнюю часть телефона к метке для чтения NDEF-записей и данных чипа.';

  @override
  String get readHeroTitle => 'Скан метки';

  @override
  String get readMemorySubtitle =>
      'Постраничное чтение памяти; экспорт в .bin или буфер';

  @override
  String get readMemoryTitle => 'Чтение памяти';

  @override
  String get readyTemplates => 'Готовые шаблоны';

  @override
  String get recordCopied => 'Запись скопирована';

  @override
  String recordIndex(int index) {
    return 'Запись #$index';
  }

  @override
  String get recordTypeCalendar => 'Событие календаря (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'Пользовательский MIME ($mime)';
  }

  @override
  String get recordTypeEmail => 'Запись эл. почты';

  @override
  String get recordTypeLocation => 'Геопозиция / GPS';

  @override
  String get recordTypePhone => 'Номер телефона';

  @override
  String get recordTypeSmartPoster => 'Smart Poster';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'Повреждённый Smart Poster ($bytes байт)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'Smart Poster (Недействительный)';

  @override
  String get recordTypeSms => 'Запись SMS';

  @override
  String get recordTypeText => 'Текстовая запись';

  @override
  String get recordTypeUnknown => 'Неизвестная запись';

  @override
  String get recordTypeUrl => 'Веб-ссылка (URL)';

  @override
  String get recordTypeVCard => 'Контактная карточка (vCard)';

  @override
  String get recordTypeWifi => 'Конфигурация Wi-Fi (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'Повреждённые данные WSC';

  @override
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записей скопировано',
      one: '1 запись скопирована',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'Повторить';

  @override
  String get removePasswordDialogTitle => 'Снять пароль';

  @override
  String get removePasswordDialogWarning => 'Введите текущий пароль метки.';

  @override
  String get removePasswordSubtitle =>
      'Снимает защиту с помощью известного пароля';

  @override
  String get removePasswordTitle => 'Снять пароль';

  @override
  String get removePhoto => 'Удалить';

  @override
  String get rewriteTag => 'Перезаписать';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Удалить правило с заметкой \"$note\"?';
  }

  @override
  String get ruleDeleted => 'Правило удалено';

  @override
  String get ruleNoteDialogTitle => 'Изменить заметку метки';

  @override
  String get ruleNoteHint => 'Напр.: Стеллаж на складе #4 или Переговорная';

  @override
  String get ruleNoteLabel => 'Локальная заметка / Описание';

  @override
  String get ruleSaved => 'Правило сохранено';

  @override
  String get save => 'Сохранить';

  @override
  String get saveAsTemplate => 'Сохранить как шаблон';

  @override
  String get saveBin => 'Сохранить .bin';

  @override
  String get saveLocalHistory => 'Сохранять историю сканирований';

  @override
  String get saveLocalHistorySubtitle =>
      'В выключенном состоянии сканы не сохраняются. При включении успешные сканы сохраняются локально.';

  @override
  String get saveTemplateDialogTitle => 'Сохранить как шаблон';

  @override
  String get saveToLibrary => 'Сохранить в библиотеку';

  @override
  String get scanFabLabel => 'Скан метки';

  @override
  String get scanQrToRecord => 'Сканировать QR';

  @override
  String get scannedTag => 'Считанная метка';

  @override
  String get searchEngine => 'Поисковая система';

  @override
  String get searchHistoryHint => 'Поиск по истории (UID, текст, тип)...';

  @override
  String get searchLibraryHint =>
      'Поиск по названию, заметке, месту или тексту';

  @override
  String get searchQuery => 'Поисковый запрос';

  @override
  String get searchQueryCannotBeEmpty =>
      'Поисковый запрос не может быть пустым.';

  @override
  String get securityRestriction => 'Ограничение безопасности';

  @override
  String get send => 'Отправить';

  @override
  String get setPasswordSubtitle => 'Защищает содержимое метки от перезаписи';

  @override
  String get setPasswordTitle => 'Установить пароль';

  @override
  String get shareRecords => 'Поделиться записями';

  @override
  String get shortcutAutomationNote =>
      'Примечание: Автоматизация привязана к UID метки и сработает даже при смене данных.';

  @override
  String get shortcutStep1 =>
      'Откройте приложение «Команды» и нажмите «Автоматизация».';

  @override
  String get shortcutStep2 =>
      'Нажмите «Новая автоматизация» (+) → выберите «NFC».';

  @override
  String get shortcutStep3 =>
      'Нажмите «Сканировать», приложите метку к iPhone и назовите её.';

  @override
  String get shortcutStep4 =>
      'Выберите «Немедленный запуск» и добавьте нужное действие.';

  @override
  String get shortcutStep5 =>
      'Для открытия приложения выберите действие «Сканировать метку» или «Записать метку».';

  @override
  String get shortcutsGuideSubtitle =>
      'Запускайте действия в касание метки или просите Siri сканировать голосом.';

  @override
  String get shortcutsGuideTitle => 'Siri и Быстрые команды';

  @override
  String get siriPhraseScan =>
      '\"Привет, Siri, сканируй метку в NFC Tag Master\"';

  @override
  String get siriPhraseWrite =>
      '\"Привет, Siri, запиши метку в NFC Tag Master\"';

  @override
  String get siriShortcutsNote =>
      'Команды доступны в приложении «Команды» и поиске Spotlight.';

  @override
  String get smsMessage => 'Текст сообщения';

  @override
  String get socialNetwork => 'Платформа';

  @override
  String get socialUsername => 'Имя пользователя';

  @override
  String get sourceComposer => 'Записи из списка редактора';

  @override
  String get sourceEmpty => 'Без содержимого (только заметка)';

  @override
  String get sourceLastScan => 'Последняя отсканированная метка';

  @override
  String get sourceSelectPrompt => 'Откуда взять данные метки?';

  @override
  String get statusCancelled => 'Операция отменена.';

  @override
  String statusClearError(String error) {
    return 'Ошибка форматирования: $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'Не удалось очистить: $error';
  }

  @override
  String get statusClearSuccess => 'Содержимое метки очищено.';

  @override
  String get statusClearing => 'Режим очистки активен. Поднесите метку...';

  @override
  String statusLockError(String error) {
    return 'Ошибка блокировки: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'Ошибка блокировки: $error';
  }

  @override
  String get statusLockSuccess =>
      'Метка навсегда заблокирована (только чтение).';

  @override
  String get statusLocking => 'Блокировка... Поднесите метку.';

  @override
  String get statusNfcDisabled => 'NFC выключен. Включите его в настройках.';

  @override
  String get statusNfcNotSupported =>
      'NFC не поддерживается на этом устройстве.';

  @override
  String get statusNfcUnavailable => 'NFC сейчас недоступен.';

  @override
  String get statusReady => 'Готов';

  @override
  String statusScanError(String error) {
    return 'Ошибка сканирования: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'Метка успешно прочитана ($id).';
  }

  @override
  String get statusScanning => 'Сканирование... Поднесите телефон к метке.';

  @override
  String statusUnexpectedError(String error) {
    return 'Непредвиденная ошибка: $error';
  }

  @override
  String statusWriteError(String error) {
    return 'Ошибка записи: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'Запись не завершена: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return 'Запись и проверка успешны! ($bytes байт)';
  }

  @override
  String get statusWriting => 'Режим записи активен. Поднесите метку...';

  @override
  String get systemLanguage => 'Язык системы';

  @override
  String get tabApp => 'Приложение';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'Календарь';

  @override
  String get tabContact => 'Контакт (vCard)';

  @override
  String get tabCustomMime => 'Пользовательский MIME';

  @override
  String get tabEmail => 'Эл. почта';

  @override
  String get tabFile => 'Файл';

  @override
  String get tabLocation => 'Геолокация';

  @override
  String get tabPhone => 'Телефон';

  @override
  String get tabSearch => 'Поиск';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'Соцсети';

  @override
  String get tabText => 'Текст';

  @override
  String get tabUrl => 'Веб-URL';

  @override
  String get tabVideo => 'Видео';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'Ёмкость';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max байт ($available байт свободно)';
  }

  @override
  String get tagInfoTitle => 'Информация о метке';

  @override
  String get tagLibraryTitle => 'Моя библиотека меток';

  @override
  String get tagNameHint => 'Напр.: Метка на кухне';

  @override
  String get tagNameLabel => 'Название';

  @override
  String get tagReadOnly => 'Только чтение (Заблокирована)';

  @override
  String tagRulesCount(int count) {
    return 'Правил / заметок: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Отображает заметку на основе точного SHA-256 хеша содержимого NDEF.';

  @override
  String get tagSerialNumber => 'Серийный номер (UID)';

  @override
  String get tagTechnology => 'Технология';

  @override
  String get tagType => 'Тип';

  @override
  String get tagUidCopied => 'UID метки скопирован';

  @override
  String get tagWritable => 'Доступна запись';

  @override
  String get takePhoto => 'Сделать снимок';

  @override
  String get templateGalleryTitle => 'Готовые шаблоны';

  @override
  String get templateNameHint => 'Название шаблона';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записей',
      one: '1 запись',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'Шаблон успешно сохранён';

  @override
  String get toolsExpertSection => 'Эксперт';

  @override
  String get toolsFooterNote =>
      'Инструменты памяти, паролей и команд поддерживают NTAG213/215/216 и MIFARE Ultralight EV1.';

  @override
  String get toolsMemorySection => 'Память';

  @override
  String get toolsSecuritySection => 'Безопасность';

  @override
  String get toolsTagSection => 'Метка';

  @override
  String get totalBytes => 'Общий размер';

  @override
  String get typeTooLarge => 'Длина типа не может превышать 255 байт';

  @override
  String get undo => 'Отменить';

  @override
  String get unknownChip16Pages => 'Неизвестный чип (первые 16 страниц)';

  @override
  String get urlSafetyInvalidUrl => 'Некорректный формат URL.';

  @override
  String get urlSafetyIpv4 => 'Адрес назначения содержит прямой IPv4-адрес.';

  @override
  String get urlSafetyIpv6 => 'Адрес назначения содержит прямой IPv6-адрес.';

  @override
  String get urlSafetyMissingScheme => 'Отсутствует схема протокола URL.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'Нестандартный порт подключения (Порт: $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'Обнаружен интернационализированный домен / Punycode (\"xn--\").';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'Нестандартная схема URL: \"$scheme\".';
  }

  @override
  String get urlSafetyUnencrypted => 'Незащищённое соединение (http://).';

  @override
  String get urlSafetyUserInfo =>
      'URL содержит учётные данные (userinfo). Возможен фишинг.';

  @override
  String get usernameCannotBeEmpty => 'Имя пользователя не может быть пустым.';

  @override
  String get usernameNoSpaces =>
      'Имя пользователя не должно содержать пробелы.';

  @override
  String get validAndroidPackage =>
      'Введите корректное имя пакета Android (напр., com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'Введите корректный Bluetooth MAC (напр., 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'Введите корректную ссылку на видео.';

  @override
  String get validWebAddress =>
      'Введите корректный веб-адрес (напр., https://example.com/doc.pdf).';

  @override
  String get verificationNotChecked => 'Не проверялось';

  @override
  String get verificationPassed => 'Успешно';

  @override
  String get videoUrlCannotBeEmpty => 'Ссылка на видео не может быть пустой.';

  @override
  String get videoUrlOrId => 'Ссылка на видео или YouTube ID';

  @override
  String get videoUrlOrIdPrompt =>
      'Введите URL (https://...) или ID видео на YouTube.';

  @override
  String get wifiAuthOpen => 'Открытая (Без пароля)';

  @override
  String get wifiAuthType => 'Тип защиты';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'Скрытая сеть';

  @override
  String get wifiPassword => 'Пароль';

  @override
  String get wifiSsid => 'Имя сети (SSID)';

  @override
  String get withSiri => 'С помощью Siri';

  @override
  String get writeDumpConfirmButton => 'Записать';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes байт) будет записан в память метки. UID и системные страницы не затрагиваются.';
  }

  @override
  String get writeDumpSubtitle => 'Записывает бинарный файл памяти на метку';

  @override
  String get writeDumpTitle => 'Записать дамп (.bin)';

  @override
  String get writeHeroButton => 'Начать запись';

  @override
  String get writeHeroEyebrow => 'NFC РЕДАКТОР';

  @override
  String get writeHeroSubtitle =>
      'Подготовьте несколько записей NDEF и запишите их на метку за один раз.';

  @override
  String get writeHeroTitle => 'Запись метки';

  @override
  String get writeHeroWriting => 'Запись...';

  @override
  String get writeResultFailed => 'Ошибка операции';

  @override
  String get writeResultSuccess => 'Успешно выполнено';

  @override
  String get writeTemplates => 'Шаблоны записи';

  @override
  String get writeTemplatesSubtitle =>
      'Сохраняйте часто используемые записи NDEF как шаблоны для быстрой записи.';

  @override
  String get yes => 'Да';
}
