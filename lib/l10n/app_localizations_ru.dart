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
  String get backupFileSizeExceeded =>
      'Размер файла резервной копии превышает 2 МБ.';

  @override
  String get backupHistoryMustBeList =>
      'Поле \"history\" должно быть массивом.';

  @override
  String backupInvalidJson(String error) {
    return 'Неверный формат JSON: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Недопустимая заметка правила.';

  @override
  String get backupInvalidRuleSha => 'Недопустимый SHA-256 хеш.';

  @override
  String get backupInvalidTemplateId => 'Некорректный ID шаблона.';

  @override
  String get backupInvalidTemplateName => 'Некорректное имя шаблона.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Превышен лимит истории $max ($count).';
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
  String get clearConfirmMessage =>
      'Все записи NDEF будут стёрты, будет записана пустая запись. Продолжить?';

  @override
  String get clearConfirmTitle => 'Сбросить содержимое метки';

  @override
  String get clearHistory => 'Очистить историю';

  @override
  String get clearTagSubtitle => 'Удаляет все записи и пишет пустой NDEF';

  @override
  String get clearTagTitle => 'Очистить метку';

  @override
  String get close => 'Закрыть';

  @override
  String get commandsEmptyError => 'Введите хотя бы одну команду.';

  @override
  String get commandsLabel => 'Команды';

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
  String get contactPhone => 'Телефон';

  @override
  String get contactTitle => 'Должность';

  @override
  String get contactWebsite => 'Веб-сайт';

  @override
  String get copy => 'Копировать';

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
  String get deleteTemplateTooltip => 'Удалить шаблон';

  @override
  String get deviceNameTooLong => 'Слишком длинное имя устройства.';

  @override
  String get dismiss => 'Отклонить';

  @override
  String get editRecordTitle => 'Редактировать запись';

  @override
  String get emailRecipient => 'Кому (Email)';

  @override
  String get exportBackup => 'Экспорт';

  @override
  String get facetimePrompt => 'Введите номер телефона или e-mail от Apple ID.';

  @override
  String fieldCannotBeEmpty(String field) {
    return 'Поле \"$field\" обязательно для заполнения.';
  }

  @override
  String get flashlight => 'Фонарик';

  @override
  String get formatMemorySubtitle =>
      'Подготавливает для NDEF (чистые или повреждённые)';

  @override
  String get formatMemoryTitle => 'Форматировать память';

  @override
  String get idTooLarge => 'Длина ID не может превышать 255 байт';

  @override
  String get importBackup => 'Импорт (Объединить)';

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
  String get locationLabel => 'Где находится?';

  @override
  String get lockAcknowledge => 'Я понимаю, что это действие необратимо';

  @override
  String get lockTagSubtitle =>
      'Навсегда делает метку доступной только для чтения';

  @override
  String get lockTagTitle => 'Заблокировать метку';

  @override
  String get manage => 'Управление';

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
  String get nfcPromptClear => 'Поднесите метку к устройству для сброса';

  @override
  String get nfcPromptLock => 'Поднесите метку для постоянной блокировки';

  @override
  String get nfcPromptScan => 'Поднесите метку к верхней части телефона';

  @override
  String get nfcPromptWrite => 'Поднесите NFC-метку для сохранения данных';

  @override
  String get no => 'Нет';

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
  String get rawRecordDetailsTitle => 'Подробности записи (Только чтение)';

  @override
  String get rawRecordEditorTitle => 'Редактировать сырую NDEF запись';

  @override
  String get readHeroButton => 'Начать скан';

  @override
  String get readMemorySubtitle =>
      'Постраничное чтение памяти; экспорт в .bin или буфер';

  @override
  String get readMemoryTitle => 'Чтение памяти';

  @override
  String get readyTemplates => 'Готовые шаблоны';

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
  String get redo => 'Повторить';

  @override
  String get removePasswordSubtitle =>
      'Снимает защиту с помощью известного пароля';

  @override
  String get removePasswordTitle => 'Снять пароль';

  @override
  String get rewriteTag => 'Перезаписать';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Удалить правило с заметкой \"$note\"?';
  }

  @override
  String get ruleNoteDialogTitle => 'Изменить заметку метки';

  @override
  String get ruleNoteLabel => 'Локальная заметка / Описание';

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
  String get scanFabLabel => 'Скан метки';

  @override
  String get scannedTag => 'Считанная метка';

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
  String get socialUsername => 'Имя пользователя';

  @override
  String get sourceSelectPrompt => 'Откуда взять данные метки?';

  @override
  String get statusCancelled => 'Отменено';

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
  String get tabContact => 'Контакт (vCard)';

  @override
  String get tabCustomMime => 'Пользовательский MIME';

  @override
  String get tabEmail => 'Эл. почта';

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
  String get tagInfoTitle => 'Информация о метке';

  @override
  String get tagLibraryTitle => 'Моя библиотека меток';

  @override
  String tagRulesCount(int count) {
    return 'Правил / заметок: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Отображает заметку на основе точного SHA-256 хеша содержимого NDEF.';

  @override
  String get tagWritable => 'Доступна запись';

  @override
  String get takePhoto => 'Сделать снимок';

  @override
  String get templateNameHint => 'Название шаблона';

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
  String get videoUrlOrIdPrompt =>
      'Введите URL (https://...) или ID видео на YouTube.';

  @override
  String get wifiAuthOpen => 'Открытая (Без пароля)';

  @override
  String get wifiPassword => 'Пароль';

  @override
  String get wifiSsid => 'Имя сети (SSID)';

  @override
  String get withSiri => 'С помощью Siri';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes байт) будет записан в память метки. UID и системные страницы не затрагиваются.';
  }

  @override
  String get writeDumpSubtitle => 'Записывает бинарный файл памяти на метку';

  @override
  String get writeDumpTitle => 'Записать дамп (.bin)';

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
  String get unknown => 'Неизвестно';

  @override
  String get error => 'Ошибка';

  @override
  String get nfcPromptReady => 'Поднесите метку';

  @override
  String get invalidResponseFormat => 'Получен недопустимый формат ответа';

  @override
  String get nfcReadError => 'Ошибка чтения NFC';

  @override
  String get invalidPlatformResponse =>
      'Получен недопустимый ответ от платформы';

  @override
  String get writeFailed => 'Ошибка записи';

  @override
  String get lockFailed => 'Ошибка блокировки';

  @override
  String get failedToConnectTag => 'Не удалось подключиться к метке';

  @override
  String get invalidTagResponse => 'Недопустимый ответ от метки';

  @override
  String get commandFailed => 'Команда не выполнена';

  @override
  String get ndefTypeOrIdTooLong => 'Тип или ID NDEF превышает 255 байт';

  @override
  String get ndefUnsupportedOrInvalidRecord =>
      'Неподдерживаемая или недействительная запись NDEF';

  @override
  String get ndefMissingTypeLength => 'Отсутствует длина типа NDEF';

  @override
  String get ndefMissingPayloadLength =>
      'Отсутствует длина полезной нагрузки NDEF';

  @override
  String get ndefMissingIdLength => 'Отсутствует длина ID NDEF';

  @override
  String get ndefMissingType => 'Отсутствует тип NDEF';

  @override
  String get ndefMissingId => 'Отсутствует ID NDEF';

  @override
  String get ndefMissingPayload => 'Отсутствует полезная нагрузка NDEF';

  @override
  String get unprotected => '(Без пароля)';

  @override
  String get binaryDataPreview => '(Двоичные данные)';

  @override
  String get emptyValue => '(Пусто)';

  @override
  String get tnfEmpty => '0: Empty (Пусто)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (Неизвестно)';

  @override
  String get tnfUnchanged => '6: Unchanged (Фрагментированный NDEF)';

  @override
  String get tnfReserved => '7: Reserved (Зарезервировано)';

  @override
  String get ntagUnsupportedChip =>
      'Эта операция поддерживается только на метках NTAG213/215/216 и MIFARE Ultralight EV1.';

  @override
  String ntagPageReadFailed(String page) {
    return 'Не удалось прочитать страницу $page (метка не ответила или область защищена).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'Не удалось записать страницу $page: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'Не удалось записать страницу $page (отклонено; заблокировано или защищено).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'Не удалось прочитать дальше страницы $page; область может быть защищена паролем.';
  }

  @override
  String get ntagPasswordPackSize =>
      'Пароль должен быть 4 байта, а PACK — 2 байта.';

  @override
  String get ntagPasswordSize => 'Пароль должен быть 4 байта.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'Неверный пароль или метка отклонила проверку.';

  @override
  String get ntagPasswordWrong => 'Неверный пароль.';

  @override
  String get ntagCcInvalid =>
      'Область CC содержит значение не NDEF; эту область OTP нельзя форматировать.';

  @override
  String get ntagDumpTooShort =>
      'Дамп слишком короткий; нет данных пользователя.';

  @override
  String get ntagInvalidHex =>
      'Введите допустимое шестнадцатеричное значение (напр.: 30 04).';

  @override
  String get googleReviewFieldLabel => 'Ссылка на отзыв или Place ID';

  @override
  String get menuLinkFieldLabel => 'Ссылка на меню';

  @override
  String get menuTitleHint => 'Наше меню';

  @override
  String get petName => 'Кличка питомца';

  @override
  String get ownerPhone => 'Телефон владельца';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'Привет, я $pet! Пожалуйста, позвоните хозяину: $phone$note';
  }

  @override
  String get bloodType => 'Группа крови';

  @override
  String get allergies => 'Аллергии / Лекарства';

  @override
  String get emergencyContact => 'Экстренный контакт';

  @override
  String get emergencyInfo => 'ЭКСТРЕННАЯ ИНФОРМАЦИЯ';

  @override
  String emergencyBlood(String blood) {
    return 'Группа крови: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'Аллергии: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'В экстренном случае звонить: $contact';
  }

  @override
  String get storeLink => 'Ссылка на магазин';

  @override
  String get link => 'Ссылка';

  @override
  String get title => 'Заголовок';

  @override
  String get webAddress => 'Веб-адрес';

  @override
  String get address => 'Адрес';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'Шаблоны: добавлено $added, обновлено $updated';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'Заметки/правила меток: добавлено $added, обновлено $updated';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'История пропущена, так как отключена на устройстве: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'История: добавлено $added, $skipped пропущено/уже есть';
  }

  @override
  String get backupSummaryNoNewData =>
      'Новых данных для импорта не найдено (совпадает с существующими записями).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field должно быть строкой.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field должно быть действительной датой.';
  }

  @override
  String get rawTypeHexLabel => 'Тип (Hex-байты)';

  @override
  String get rawIdHexLabel => 'ID (Hex-байты, необязательно)';

  @override
  String get rawPayloadHexLabel => 'Полезная нагрузка (Hex-байты)';

  @override
  String get rawOptionalHexHint => 'Необязательные hex-байты';

  @override
  String get saveChanges => 'Сохранить изменения';

  @override
  String get edit => 'Редактировать';

  @override
  String get clearAllButton => 'Очистить все';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: прочитано $count страниц';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip отформатирован';
  }

  @override
  String get ntagInvalidDumpFile =>
      'Недопустимый файл дампа (должен быть кратен 4 байтам, 32–1024 байт).';

  @override
  String ntagPagesWritten(int count) {
    return 'Записано страниц: $count';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: защита паролем включена';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: пароль удален';
  }

  @override
  String get memoryDumpCopied => 'Дамп памяти скопирован';

  @override
  String ntagCommandsSent(int count) {
    return 'Отправлено команд: $count';
  }

  @override
  String get emptyResponse => '(пустой ответ)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages стр. · $bytes байт';
  }

  @override
  String get composeTextEmpty => 'Текстовое содержимое не может быть пустым.';

  @override
  String get composeTextTooLong =>
      'Текст слишком длинный (максимум 5000 символов).';

  @override
  String get composeUrlInvalid =>
      'Введите корректный адрес (например: https://example.com или ссылка app://).';

  @override
  String get composeUrlTooLong =>
      'URL слишком длинный (максимум 2000 символов).';

  @override
  String get composeEmailInvalid =>
      'Введите корректный адрес эл. почты (например: name@domain.com).';

  @override
  String get composePhoneInvalid =>
      'Введите корректный номер телефона (например: +905551234567).';

  @override
  String get composeSmsPhoneInvalid => 'Введите корректный номер получателя.';

  @override
  String get composeLatInvalid =>
      'Широта должна быть в диапазоне от -90 до +90.';

  @override
  String get composeLngInvalid =>
      'Долгота должна быть в диапазоне от -180 до +180.';

  @override
  String get composeVcardNameEmpty => 'Имя контакта не может быть пустым.';

  @override
  String get composeVcardNameTooLong =>
      'Имя контакта слишком длинное (максимум 200 символов).';

  @override
  String get composeVcardEmailInvalid => 'Введите корректный адрес эл. почты.';

  @override
  String get composeVcardPhoneInvalid => 'Введите корректный номер телефона.';

  @override
  String get composeVcardUrlInvalid =>
      'Введите корректный веб-адрес (например: https://...).';

  @override
  String get composeCalSummaryEmpty => 'Название события не может быть пустым.';

  @override
  String get composeCalSummaryTooLong =>
      'Название события слишком длинное (максимум 250 символов).';

  @override
  String get composeCalDateInvalid =>
      'Время окончания должно быть позже времени начала.';

  @override
  String get composeSpUriInvalid =>
      'Введите корректный целевой URL (например: https://...).';

  @override
  String get composeSpLangInvalid =>
      'Введите корректный код языка ISO (например: ru, en).';

  @override
  String get composeMimeTypeInvalid =>
      'Введите корректный тип MIME (например: application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'Введите корректную hex-строку (четное количество hex-символов).';

  @override
  String get composeMimePayloadTooLarge =>
      'Размер полезной нагрузки слишком велик (максимум 10 КБ).';

  @override
  String get composeWifiSsidEmpty => 'Имя сети (SSID) не может быть пустым.';

  @override
  String get composeWifiPasswordRequired =>
      'Пароль Wi-Fi обязателен для зашифрованных сетей.';

  @override
  String get composeWifiPasswordLength =>
      'Пароль WPA/WPA2 должен содержать от 8 до 63 символов.';

  @override
  String get composeEditNdefRecord => 'Редактировать запись NDEF';

  @override
  String get composeNewNdefRecord => 'Создать новую запись NDEF';

  @override
  String get quickLinksHeader => 'Быстрые ссылки';

  @override
  String get quickLinkCustomUri => 'Пользовательский URI';

  @override
  String get quickLinkSocial => 'Социальные сети';

  @override
  String get quickLinkVideo => 'Видео';

  @override
  String get quickLinkSearch => 'Поиск';

  @override
  String get quickLinkFile => 'Файл';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime Аудио';

  @override
  String get quickLinkAddress => 'Адрес';

  @override
  String get quickLinkPayment => 'Ссылка на оплату';

  @override
  String get quickLinkApp => 'Приложение (Android)';

  @override
  String get updateRecord => 'Обновить запись';

  @override
  String get addToList => 'Добавить в список';

  @override
  String get quickCustomUriError =>
      'Введите адрес со схемой (например: spotify:track:... или myapp://page).';

  @override
  String get quickFileEmptyMessage => 'Введите ссылку на файл.';

  @override
  String get quickPaymentEmptyMessage => 'Введите ссылку на оплату.';

  @override
  String get quickCustomUriDesc =>
      'Можно ввести любой адрес со схемой; телефон откроет поддерживающее приложение.';

  @override
  String get quickSocialLabel => 'Социальная сеть';

  @override
  String get quickVideoLabel => 'Ссылка на видео';

  @override
  String get quickVideoHint => 'https://youtu.be/... или ID видео';

  @override
  String get quickVideoDesc =>
      'Ссылка на YouTube, Vimeo и др. или только идентификатор видео YouTube.';

  @override
  String get quickSearchHint => 'например: Погода в Москве';

  @override
  String get quickFileLabel => 'Ссылка на файл';

  @override
  String get quickFileDesc =>
      'Из-за малого объема метки записывается веб-ссылка, а не сам файл (Google Диск, Dropbox и т.д.).';

  @override
  String get quickPhoneOrAppleId => 'Телефон или Apple ID';

  @override
  String get quickFacetimeVideoDesc =>
      'iPhone при касании метки начнет видеозвонок FaceTime.';

  @override
  String get quickFacetimeAudioDesc =>
      'iPhone при касании метки начнет только аудиозвонок FaceTime.';

  @override
  String get quickMapProvider => 'Картографическое приложение';

  @override
  String get quickAddressHint => 'например: Тверская ул., д. 1, Москва';

  @override
  String get quickPaymentDesc =>
      'Можно использовать ссылки на оплату (PayPal.me, Stripe и др.). Данные карты никогда не записываются на метку.';

  @override
  String get quickAppDesc =>
      'Телефоны Android откроют это приложение (или Play Маркет). iPhone игнорирует этот тип; добавьте ссылку на App Store как URL.';

  @override
  String get quickDeviceNameOptional => 'Имя устройства (необязательно)';

  @override
  String get quickSpeakerHint => 'например: Динамик';

  @override
  String get quickBluetoothDesc =>
      'Телефоны Android предложат сопряжение с этим устройством. iPhone не поддерживает метки сопряжения Bluetooth.';

  @override
  String get composeTextContent => 'Текстовое содержимое';

  @override
  String get composeTextHint => 'Введите текст для записи';

  @override
  String get composeEmailSubjectOptional => 'Тема (необязательно)';

  @override
  String get composeEmailBodyOptional => 'Текст сообщения (необязательно)';

  @override
  String get composeSmsRecipient => 'Номер телефона получателя';

  @override
  String get composeSmsHint => 'SMS-сообщение для отправки...';

  @override
  String get composeVcardFullName => 'Полное имя (отображаемое имя) *';

  @override
  String get composeVcardNameHint => 'Иван Иванов';

  @override
  String get composeVcardNote => 'Заметка / Описание';

  @override
  String get composeCalTitle => 'Название события *';

  @override
  String get composeCalTitleHint => 'Встреча по проекту';

  @override
  String get composeCalLocationHint => 'Переговорная 2 или онлайн';

  @override
  String get composeCalDesc => 'Описание события';

  @override
  String get composeCalStartEndTime => 'Время начала и окончания:';

  @override
  String get composeSpTitleLabel => 'Заголовок (отображаемый текст)';

  @override
  String get composeSpTitleHint => 'Брошюра компании';

  @override
  String get composeMimeTypeLabel => 'Тип MIME *';

  @override
  String get composeDataFormat => 'Формат данных: ';

  @override
  String get composeFormatHex => 'Шестнадцатеричный (Hex)';

  @override
  String get composeMimeHexBytes => 'Hex-байты *';

  @override
  String get composeMimeTextPayload => 'Текст полезной нагрузки (UTF-8) *';

  @override
  String get composeWifiWarningTitle =>
      'Предупреждение о безопасности и платформе:';

  @override
  String get composeWifiWarningBody =>
      '• Пароль Wi-Fi сохраняется на метке в открытом виде и доступен для чтения любому.\n• Автоматическое подключение не гарантируется; может потребоваться подтверждение пользователя.';

  @override
  String get composeWifiSsidLabel => 'Имя сети (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'Тип безопасности (аутентификация)';

  @override
  String get composeWifiOpenNetwork => 'Открытая сеть (без пароля)';

  @override
  String get composeWifiPasswordLabel => 'Пароль Wi-Fi *';

  @override
  String get composeWifiEncryptionLabel => 'Тип шифрования';

  @override
  String get composeWifiAesRecommended => 'AES (рекомендуется)';

  @override
  String get quickSearchTextLabel => 'Поисковый запрос';

  @override
  String get readTagMemoryPrompt =>
      'Поднесите метку к телефону для чтения памяти';

  @override
  String get readingTagMemoryStatus => 'Чтение памяти...';

  @override
  String get formatTagConfirmTitle => 'Форматировать память';

  @override
  String get formatTagConfirmMessage =>
      'Данные на метке будут удалены, и она будет подготовлена как пустой NDEF. Продолжить?';

  @override
  String get formatButton => 'Форматировать';

  @override
  String get formatTagPrompt => 'Поднесите метку для форматирования';

  @override
  String get formattingStatus => 'Форматирование...';

  @override
  String filePickerFailed(String error) {
    return 'Не удалось открыть выбор файла: $error';
  }

  @override
  String get writeButton => 'Записать';

  @override
  String get writeDumpPrompt => 'Поднесите метку для записи дампа';

  @override
  String get writingDumpStatus => 'Запись дампа...';

  @override
  String get setPasswordWarning =>
      'Если вы забудете пароль, изменить содержимое метки будет невозможно. Чтение останется открытым для всех.';

  @override
  String get setPasswordAction => 'Установить пароль';

  @override
  String get setPasswordPrompt => 'Поднесите метку для установки пароля';

  @override
  String get settingPasswordStatus => 'Установка пароля...';

  @override
  String get removePasswordPromptMessage =>
      'Введите пароль, ранее установленный на метке.';

  @override
  String get remove => 'Удалить';

  @override
  String get removePasswordPrompt => 'Поднесите метку для снятия пароля';

  @override
  String get removingPasswordStatus => 'Снятие пароля...';

  @override
  String get sendCommandsPrompt => 'Поднесите метку для отправки команд';

  @override
  String get sendingCommandsStatus => 'Отправка команд...';

  @override
  String get sendButton => 'Отправить';

  @override
  String get tagNoteEditTitle => 'Редактировать заметку метки';

  @override
  String get tagNoteInputLabel => 'Заметка / Описание в приложении';

  @override
  String get tagNoteInputHint =>
      'например: Инфо о переговорной или Стеллаж #12';

  @override
  String get tagNoteDeleteTitle => 'Удалить заметку метки';

  @override
  String get clearAllTagRulesTitle => 'Удалить все заметки';

  @override
  String get clearAllTagRulesConfirm =>
      'Все сохраненные заметки меток будут удалены. Подтверждаете?';

  @override
  String get deleteAll => 'Удалить все';

  @override
  String get tagRulesExplanation =>
      'Для меток с совпадающим хэшем SHA-256 отображается только сохраненная заметка. Внешних действий не запускается.';

  @override
  String get noTagRulesDefined => 'Заметок для меток пока нет.';

  @override
  String lastUpdated(String time) {
    return 'Последнее обновление: $time';
  }

  @override
  String get tagLibraryNoMatch => 'Теги по вашему запросу не найдены.';

  @override
  String get tagLibraryAddToLibrary => 'Добавить в библиотеку';

  @override
  String get name => 'Имя';

  @override
  String get tagLibraryAddTag => 'Добавить метку';

  @override
  String get all => 'Все';

  @override
  String tagLibraryPhotoError(String error) {
    return 'Не удалось выбрать фото: $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'Удалить метку';

  @override
  String get tagLibraryNameHint => 'например: Офисный брелок';

  @override
  String get tagLibraryNoTagContent => 'В этой записи нет содержимого метки.';

  @override
  String get tagLibrarySourceLastScanned => 'Последнее сканирование';

  @override
  String get tagLibraryEmpty => 'Сохраненных меток пока нет.';

  @override
  String get tagLibrarySourceEmpty => 'Пустая запись';

  @override
  String get tagLibraryNamePrompt => 'Пожалуйста, введите название метки';

  @override
  String get tagLibrarySearchHint => 'Поиск по имени, категории или локации...';

  @override
  String get tagLibrarySourceWriteList => 'Список записи';

  @override
  String get tagLibraryLocationHint => 'например: Рабочий стол, Входная дверь';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return 'Вы уверены, что хотите удалить метку \"$name\" из библиотеки?';
  }

  @override
  String get noContent => 'Нет содержимого';

  @override
  String tagLibraryRecordSummary(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count записей NDEF',
      one: '1 запись NDEF',
    );
    return '$_temp0';
  }

  @override
  String get tagLibraryEditTag => 'Редактировать метку';

  @override
  String get rawTypeHexHint => '41 (A) или 55 (U) и т.д.';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: Поле \"records\" должно быть списком.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: Элемент может содержать максимум $max записей NDEF.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - Запись #$index не является допустимым объектом.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - Запись #$index: Недопустимое значение TNF ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - Запись #$index: \"type\" должен быть строкой Base64.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - Запись #$index: \"type\" не является допустимыми данными Base64 ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - Запись #$index: \"id\" должен быть строкой Base64.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - Запись #$index: \"id\" не является допустимыми данными Base64 ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - Запись #$index: \"payload\" должен быть строкой Base64.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - Запись #$index: \"payload\" не является допустимыми данными Base64 ($error).';
  }

  @override
  String get composerUndoSnack => 'Последнее изменение отменено.';

  @override
  String get composerRedoSnack => 'Изменение повторено.';

  @override
  String get noRecordsToCopy => 'Нет записей NDEF для копирования.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count записей NDEF ($bytes Б) скопировано в буфер обмена.\n(Копируются только данные NDEF; UID или зашифрованные секторы не клонируются)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: добавлено $count записей.';
  }

  @override
  String get tagEmptyNoRecordsToImport =>
      'Метка пуста; нет записей для импорта.';

  @override
  String get sourceTag => 'С метки';

  @override
  String get sourceQr => 'Из QR-кода';

  @override
  String filePickerError(String error) {
    return 'Не удалось открыть выбор файла: $error';
  }

  @override
  String get csvFileTooLarge => 'Файл CSV слишком большой (максимум 512 КБ).';

  @override
  String get noRecordsFound => 'Записи не найдены';

  @override
  String get someRowsSkipped => 'Некоторые строки пропущены';

  @override
  String get expectedFormat => 'Ожидаемый формат:';

  @override
  String get noClipboardContent => 'В буфере обмена нет содержимого NDEF.';

  @override
  String get pasteFromClipboardTitle => 'Вставить из буфера NDEF';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'Данные в буфере: $count записей, $bytes байт ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      'Вы хотите заменить текущие записи или добавить в конец?';

  @override
  String get pasteOverwriteOption => 'Перезаписать (Заменить)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'Текущие $count записей будут заменены содержимым буфера (потребуется подтверждение).';
  }

  @override
  String get pasteEmptySubtitle => 'Содержимое буфера помещается в список.';

  @override
  String get pasteAppendOption => 'Добавить в конец';

  @override
  String get pasteAppendSubtitle =>
      'Текущие записи сохраняются, записи из буфера добавляются в конец списка.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count записей добавлено.';
  }

  @override
  String get confirmOverwriteTitle => 'Перезаписать записи?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'В списке $currentCount записей. Они будут заменены $newCount записями из буфера. Продолжить?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'Записи заменены на $count новых.';
  }

  @override
  String get yesReplace => 'Да, заменить';

  @override
  String recordsImportedToComposer(num count) {
    return '$count записей импортировано.';
  }

  @override
  String get noContentToCopy => 'Не найден контент NDEF для копирования.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count записей NDEF скопировано и добавлено (Данные скопированы, UID не клонируется).';
  }

  @override
  String get noContentToRewrite => 'Не найден контент NDEF для перезаписи.';

  @override
  String get rewriteTagTitle => 'Перезаписать метку';

  @override
  String get importantNotice => 'ВАЖНОЕ ПРИМЕЧАНИЕ:';

  @override
  String get rewriteNotice1 =>
      '• Эта операция ПОЛНОСТЬЮ ПЕРЕЗАПИСЫВАЕТ существующие данные NDEF; не добавляет в конец.\n';

  @override
  String get rewriteNotice2 =>
      '• Целевая метка должна быть доступна для записи (не заблокирована).\n';

  @override
  String get rewriteNotice3 =>
      '• Запись не происходит автоматически на предыдущую метку; требуется новое касание NFC.';

  @override
  String get rewriteInstruction =>
      'Подготовьте целевую метку, нажмите \"Коснуться и записать\" и поднесите метку.';

  @override
  String get tapAndWrite => 'Коснуться и записать';

  @override
  String get rewritePromptMessage =>
      'Поднесите целевую метку к устройству (содержимое будет полностью обновлено)';

  @override
  String get writeVerifiedTitle => 'Запись проверена';

  @override
  String get writeVerifiedDesc =>
      'Данные NDEF успешно записаны и проверены на целевой метке.';

  @override
  String get writeVerifiedHint =>
      'Вы можете начать следующее сканирование для проверки или сравнения данных.';

  @override
  String get scanAndCompareNow => 'Сканировать и сравнить сейчас';

  @override
  String get contentMatchesExactly => 'Содержимое полностью совпадает';

  @override
  String get differenceDetected => 'Обнаружены различия';

  @override
  String get compareMatchDesc =>
      'Сообщение NDEF на целевой метке побайтово совпадает с исходным.';

  @override
  String get compareDiffDesc =>
      'Данные с метки отличаются от исходных. Проверьте, не заблокирована ли метка.';

  @override
  String get batchEmptyComposerError =>
      'Добавьте хотя бы одну запись перед запуском пакетной записи.';

  @override
  String get batchWriteTitle => 'Пакетная запись меток';

  @override
  String get batchWriteSubtitle =>
      'Записывайте одно и то же содержимое NDEF на несколько меток подряд.';

  @override
  String get attention => 'ВНИМАНИЕ:';

  @override
  String get batchNotice1 =>
      '• Во избежание случайной двойной записи каждый шаг запускается кнопкой \"Записать следующий\".\n';

  @override
  String get batchNotice2 =>
      '• Автоматическое непрерывное сканирование не производится; метки меняются вручную.';

  @override
  String get batchStartButton => 'Начать пакетную запись';

  @override
  String get batchControlPanelTitle => 'Панель управления пакетной записью';

  @override
  String get batchCancelOrClose => 'Отмена / Закрыть';

  @override
  String get batchAllCompleted => 'Все попытки записи завершены!';

  @override
  String batchStats(String ok, String failed, String left) {
    return 'Успешно: $ok | Ошибки: $failed | Осталось: $left';
  }

  @override
  String get waitingForTag => 'Ожидание метки...';

  @override
  String get batchFinishButton => 'Завершить пакетную запись';

  @override
  String get writeError => 'Ошибка записи';

  @override
  String get batchConfirmCancelTitle => 'Отменить пакетную запись';

  @override
  String get batchConfirmCancelMessage =>
      'Прервать пакетную запись? Уже записанные метки сохранятся, оставшиеся записаны не будут.';

  @override
  String get cancelled => 'Отменено';

  @override
  String get batchCancelledSnack =>
      'Пакетная запись отменена. Ваш список сохранен.';

  @override
  String get cancelAndClose => 'Отменить и закрыть';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'Автономный анализ URL';

  @override
  String get urlSafetyScheme => 'Схема (Протокол):';

  @override
  String get urlSafetyPort => 'Порт:';

  @override
  String get urlSafetyUserInfoLabel => 'Информация пользователя:';

  @override
  String get urlSafetyIpLiteral => 'Прямой IP-адрес:';

  @override
  String get urlSafetyDomain => 'Нет (Доменное имя)';

  @override
  String get urlSafetyPunycodeLabel => 'Международный / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => 'Да (Подозрение на омоглифы)';

  @override
  String get urlSafetyWarningsHeader => 'Предупреждения о безопасности:';

  @override
  String get urlSafetyDisclaimer =>
      'ПРИМЕЧАНИЕ: Автономный анализ. Не проверяет на вирусы в сети. URL не открывается автоматически.';

  @override
  String get templateSaveEmptyError =>
      'Добавьте записи перед сохранением шаблона.';

  @override
  String templateDefaultName(String n) {
    return 'Шаблон $n';
  }

  @override
  String get templateNameSample => 'например: Сайт компании и контакты';

  @override
  String get templateSavedSnack => 'Шаблон сохранен.';

  @override
  String get ruleNoteRequiresNdef =>
      'Метка должна содержать хотя бы одну запись NDEF для добавления заметки.';

  @override
  String get ruleNoteAddTitle => 'Добавить заметку к метке';

  @override
  String get ruleNoteDigestExplanation =>
      'Привязывается к хэшу SHA-256 NDEF. При сканировании отображается только это описание.';

  @override
  String get ruleNoteSavedSnack => 'Заметка метки сохранена.';

  @override
  String get ruleNoteDeleteConfirm =>
      'Заметка для этой метки будет удалена. Продолжить?';

  @override
  String get ruleNoteDeletedSnack => 'Заметка метки удалена.';

  @override
  String get backupExportTitle => 'Экспорт резервной копии';

  @override
  String get backupExportWarningTitle =>
      'ПРЕДУПРЕЖДЕНИЕ О КОНФИДЕНЦИАЛЬНОСТИ И БЕЗОПАСНОСТИ';

  @override
  String get backupExportWarningBody =>
      'Экспортируемый файл (JSON) — открытый текст. Может содержать пароли Wi-Fi и личные данные. Храните в безопасном месте.';

  @override
  String get backupIncludedItems => 'Включаемые элементы:';

  @override
  String backupTemplatesCount(String count) {
    return '• Шаблоны: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• Заметки/правила меток: $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Включить историю сканирований (необязательно)';

  @override
  String backupHistoryCount(String count) {
    return 'Записей истории: $count';
  }

  @override
  String get backupHistoryDisabled =>
      'История сканирований отключена на этом устройстве';

  @override
  String get backupExportAndShare => 'Экспортировать и поделиться';

  @override
  String get backupFileNameLabel => 'Файл резервной копии NFC Tag Master';

  @override
  String get backupFileShareSubject =>
      'Резервная копия шаблонов и данных NFC Tag Master (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'Файл резервной копии успешно экспортирован.';

  @override
  String get backupExportCancelled => 'Экспорт отменен.';

  @override
  String get backupImportTitle => 'Импорт резервной копии';

  @override
  String get backupMergeRuleTitle => 'ПРАВИЛО БЕЗОПАСНОСТИ И СЛИЯНИЯ';

  @override
  String get backupMergeRule1 =>
      '• Импорт работает путем ОБЪЕДИНЕНИЯ; ваши текущие записи НИКОГДА не удаляются.\n';

  @override
  String get backupMergeRule2 =>
      '• Файлы могут содержать пароли Wi-Fi и личные данные; загружайте только из надежных источников.\n';

  @override
  String get backupMergeRule3 =>
      '• Лимит размера: 2 МиБ. Данные проходят строгую проверку схемы и Base64 перед загрузкой.';

  @override
  String get backupSelectFilePrompt =>
      'Выберите корректный файл .json для слияния.';

  @override
  String get selectFileButton => 'Выбрать файл';

  @override
  String get fileSelectionCancelled => 'Выбор файла отменен.';

  @override
  String get backupFileExceedsLimit =>
      'Выбранный файл превышает допустимый размер 2 МиБ.';

  @override
  String fileReadError(String error) {
    return 'Ошибка чтения файла: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Ошибка проверки копии: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Обнаружена история сканирований';

  @override
  String get backupHistoryDetectedPrompt =>
      'Импортировать и включить историю? Или пропустить её и импортировать только шаблоны и заметки?';

  @override
  String get backupSkipHistoryOption =>
      'Пропустить историю (загрузить только шаблоны и заметки)';

  @override
  String get backupEnableHistoryOption => 'Включить историю и загрузить';

  @override
  String get nfcReadyStatus => 'NFC готов';

  @override
  String get nfcReadyDesc => 'Оборудование NFC активно и готово к работе';

  @override
  String get nfcDisabledStatus => 'NFC выключен';

  @override
  String get nfcDisabledDesc =>
      'NFC выключен. Пожалуйста, включите его в настройках устройства.';

  @override
  String get template => 'Шаблон';

  @override
  String get nfcScannerTitle => 'NFC Сканер';

  @override
  String get composeRecord => 'Создать запись';

  @override
  String get protectOrRemove => 'Защитить / снять';

  @override
  String get previousScans => 'Предыдущие сканирования';

  @override
  String get noScannedTagYet => 'Пока нет сканированных меток NFC';

  @override
  String get tapScanPrompt =>
      'Нажмите \"Начать сканирование\" и поднесите метку к телефону.';

  @override
  String get ndefCopyAndRewriteTitle => 'Копирование и перезапись NDEF';

  @override
  String get savedTagNoteHeader => 'Сохраненная заметка метки (правило)';

  @override
  String get tagNoteOrRule => 'Заметка / правило метки';

  @override
  String get editNote => 'Редактировать заметку';

  @override
  String get deleteNote => 'Удалить заметку';

  @override
  String get tagNoteDigestNotice =>
      'Привязано к SHA-256 байтов NDEF. Внешних действий не запускает.';

  @override
  String get addCustomTagNotePrompt =>
      'Вы можете добавить локальную заметку для этого содержимого NDEF.';

  @override
  String get addNoteToThisTag => 'Добавить заметку к этой метке';

  @override
  String get ndefSupport => 'Поддержка NDEF:';

  @override
  String get usedSpace => 'Использовано памяти:';

  @override
  String get freeSpace => 'Свободно памяти:';

  @override
  String get noNdefMessageOnTag => 'На метке не найдено сообщений NDEF.';

  @override
  String get hideDetails => 'Скрыть подробности';

  @override
  String get advancedRecordInspector => 'Инспектор записей (Расширенный)';

  @override
  String get ndefRecordInspectorTitle => 'Инспектор записей NDEF (Расширенный)';

  @override
  String get inspectorType => 'Тип:';

  @override
  String get inspectorPayloadLength => 'Длина полезной нагрузки:';

  @override
  String get inspectorRawHexPreview => 'Предпросмотр Hex (ограничено):';

  @override
  String get ndefRecordsToWriteTitle => 'Записи NDEF для записи';

  @override
  String get pasteFromClipboardAction =>
      'Вставить из буфера (Заменить / Добавить)';

  @override
  String get importAction => 'Импортировать';

  @override
  String get importFromTagAction => 'Импорт с метки NFC';

  @override
  String get importFromQrAction => 'Импорт из QR-кода';

  @override
  String get importFromCsvAction => 'Импорт из файла CSV';

  @override
  String get composerEmptyDescription =>
      'Вы можете записывать текст, ссылки, Wi-Fi, телефоны, контакты и многое другое.';

  @override
  String get urlSafetyReview => 'Проверка URL';

  @override
  String get inspector => 'Инспектор';

  @override
  String get typeLabel => 'Тип:';

  @override
  String get payloadLabel => 'Полезная нагрузка:';

  @override
  String get writeAndVerify => 'Записать на метку и проверить';

  @override
  String get batchWriteButtonLabel => 'Пакетная запись меток (2..100 меток)';

  @override
  String get clearTagButtonLabel => 'Сбросить метку (очистить содержимое)';

  @override
  String get confirmWriteTitle => 'Подтвердите запись на метку';

  @override
  String get confirmWriteMessage1 =>
      'Эта операция ПОЛНОСТЬЮ ПЕРЕЗАПИШЕТ существующее содержимое NDEF на метке.';

  @override
  String get confirmWriteMessage2 =>
      'Убедитесь, что метка доступна для записи. Данные будут автоматически проверены.';

  @override
  String get yesWrite => 'Да, записать';

  @override
  String get scanHistoryDisabledTitle => 'История сканирований выключена';

  @override
  String get scanHistoryDisabledDesc =>
      'В целях конфиденциальности история по умолчанию не сохраняется. Включите её в настройках.';

  @override
  String get enableHistory => 'Включить историю';

  @override
  String get historySearchHint =>
      'Поиск по UID, тексту или типу (например: URL, Wi-Fi, 04A1...)';

  @override
  String get noHistoryYet => 'История сканирований пуста.';

  @override
  String get tryDifferentQuery =>
      'Попробуйте другой UID, текст или тип записи.';

  @override
  String get clearSearch => 'Очистить поиск';

  @override
  String get deleteThisRecord => 'Удалить эту запись';

  @override
  String get qrPreview => 'QR предпросмотр';

  @override
  String get lockTagConfirmTitle => 'Навсегда заблокировать метку';

  @override
  String get lockTagWarning2 =>
      'Убедитесь, что сначала записали правильное содержимое.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'Предпросмотр QR-кода';

  @override
  String get unknownParentheses => '(Неизвестно)';

  @override
  String get ok => 'ОК';

  @override
  String rewriteSourceUid(String uid) {
    return 'UID источника: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return 'Записей к записи: $count';
  }

  @override
  String rewriteFailed(String message) {
    return 'Перезапись не удалась: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return 'Записано записей: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'UID считанной метки: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return 'Записанные данные: $count зап. ($bytes байт)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'Считанные данные: $count зап. ($bytes байт)';
  }

  @override
  String batchTargetCount(String count) {
    return 'Целевых меток: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return 'Список записи: $count зап. ($bytes байт)';
  }

  @override
  String batchNext(String current, String total) {
    return 'Далее: метка #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return 'Успешно ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return 'Ошибка: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'Метка #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'Коснитесь и запишите метку #$n';
  }

  @override
  String batchPrompt(String current, String total) {
    return 'Пакетная запись: поднесите метку #$current / $total';
  }

  @override
  String batchWrittenVerified(String count) {
    return 'Записано и проверено: $count';
  }

  @override
  String templateLoaded(String name) {
    return 'Записи из «$name» добавлены в список.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'Хеш содержимого NDEF (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return 'Ошибка экспорта: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'В копии $count записей истории, но история на этом устройстве отключена.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'Импорт выполнен:\n$summary';
  }

  @override
  String mergeError(String error) {
    return 'Ошибка объединения: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'Буфер NDEF: $count зап. ($bytes Б) - $source';
  }

  @override
  String get heroScanSubtitle =>
      'Поднесите метку к верхней части телефона — содержимое, ёмкость и серийный номер появятся сразу.';

  @override
  String lastTagLabel(String uid) {
    return 'Последняя метка: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'Ошибка сканирования: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count зап. ($bytes байт) — копируются только данные NDEF, без UID.';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'Метка $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'Ошибка: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return 'Считанные записи NDEF ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return 'Записи NDEF к записи ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return 'Примечание: данные занимают $bytes байт, показаны первые 64.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return 'Общий размер: $bytes байт | Записей: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return 'Записать и проверить ($bytes байт)';
  }

  @override
  String savedScansCount(String count) {
    return 'Сохранённые сканы: $count';
  }

  @override
  String historyNoResults(String query) {
    return 'Ничего не найдено по запросу «$query».';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count зап.';
  }

  @override
  String historyCapacity(String max, String used) {
    return 'Ёмкость: $max Б | Занято: $used Б';
  }

  @override
  String historySourceLabel(String uid) {
    return 'История UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count зап. | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return 'Сохранённые правила/заметки: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return 'Записано байт: $bytes | Проверка: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'Заблокированная метка станет только для чтения: содержимое НЕЛЬЗЯ будет изменить или стереть, а блокировку — СНЯТЬ. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'Размер сообщения: $bytes байт';
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
  String get valueNone => 'Нет';

  @override
  String get valueYesIp => 'Да (IP-адрес)';

  @override
  String get nfcMissingShort => 'Нет NFC';

  @override
  String get clearClipboard => 'Очистить буфер';

  @override
  String get statLibrary => 'Библиотека';

  @override
  String get scanTagTitle => 'Сканировать';

  @override
  String get readingInProgress => 'Чтение...';

  @override
  String get rawMemorySubtitle => 'Сырая память';

  @override
  String get copyToClipboard => 'Копировать в буфер';

  @override
  String get serialUidLabel => 'Серийный № (UID):';

  @override
  String get totalCapacityLabel => 'Общая ёмкость:';

  @override
  String get technologiesLabel => 'Технологии:';

  @override
  String get idLabel => 'Идентификатор (ID):';

  @override
  String get undoTooltip => 'Отменить';

  @override
  String get clearComposer => 'Очистить список';

  @override
  String composerTotalSize(String bytes) {
    return 'Общий размер: $bytes байт';
  }

  @override
  String get yesClear => 'Да, очистить';

  @override
  String get ssidTooLong => 'SSID — не более 32 байт.';

  @override
  String get locationPlace => 'Место';

  @override
  String get targetWebUrl => 'Целевой URL *';

  @override
  String get languageCodeLabel => 'Код языка (ISO 639-1) *';

  @override
  String get utf8Text => 'Текст UTF-8';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf, размер: $bytes байт';
  }

  @override
  String get quickGallerySubtitle => 'Готово в одно касание';

  @override
  String get quickLibraryTitle => 'Мои метки';

  @override
  String get quickLibrarySubtitle => 'Сохранённые метки';

  @override
  String get saveToLibrary => 'Сохранить в библиотеку';

  @override
  String libraryMatch(String name) {
    return 'В библиотеке: $name';
  }

  @override
  String tagChipLabel(String chip) {
    return 'Чип: $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return 'Производитель: $name';
  }

  @override
  String get settingsLibrarySubtitle =>
      'Ваши метки с названиями, заметками и фото';

  @override
  String get showOnboardingAgain => 'Показать вводный тур снова';

  @override
  String get importFromGallery => 'Добавить из готовых шаблонов';

  @override
  String get appearanceTitle => 'Оформление';

  @override
  String get themeSystem => 'Системная';

  @override
  String get themeLight => 'Светлая';

  @override
  String get themeDark => 'Тёмная';

  @override
  String get valuePresentRisky => 'Есть (может быть опасно)';

  @override
  String get supportedValue => 'Поддерживается';

  @override
  String get notSupportedValue => 'Не поддерживается';

  @override
  String get nfcUnsupportedDesc => 'Это устройство не поддерживает NFC';

  @override
  String get ndefTrailingData => 'Лишние данные после сообщения NDEF';

  @override
  String get ndefMissingEnd => 'Нет конца сообщения NDEF';

  @override
  String vcardPhoneShort(String value) {
    return 'Тел.: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'Эл. почта: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return 'Организация: $value';
  }

  @override
  String get pageUidLock => 'UID / Блок.';

  @override
  String get pageData => 'Данные';

  @override
  String get pageLock => 'Блок.';

  @override
  String memoryPageLine(String page) {
    return 'Стр. $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (телефон)';

  @override
  String get mapApple => 'Apple Карты';

  @override
  String get mapGoogle => 'Google Карты';

  @override
  String get whatsappMessageHint => 'Здравствуйте, хочу узнать подробнее';

  @override
  String get facetimeTargetHint => '+79161234567 или name@icloud.com';

  @override
  String get bluetoothMacLabel => 'MAC-адрес Bluetooth';

  @override
  String get webAddressUrlLabel => 'Веб-адрес (URL)';

  @override
  String get latitudeLabel => 'Широта (Lat)';

  @override
  String get longitudeLabel => 'Долгота (Lng)';

  @override
  String get emailAddressLabel => 'Адрес эл. почты';

  @override
  String get websiteLabel => 'Веб-сайт';

  @override
  String get wifiAuthWpa2Home => 'WPA2 Personal (стандарт для дома/офиса)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 Personal (смешанный)';

  @override
  String get hostLabel => 'Хост:';

  @override
  String get readOnlyLocked => 'Только чтение (заблокирована)';

  @override
  String get redoTooltip => 'Повторить';

  @override
  String historyFoundCount(String found, String total) {
    return 'Найдено: $found / $total';
  }

  @override
  String get addToWriteListShort => 'В список записи';

  @override
  String get mimeTypeHint => 'application/json или text/plain';

  @override
  String get hapticsToggle => 'Вибрация';

  @override
  String get hapticsToggleSubtitle =>
      'Короткая вибрация после чтения или записи';

  @override
  String get soundsToggle => 'Звуки';

  @override
  String get soundsToggleSubtitle => 'Короткий системный звук при результате';

  @override
  String get backupLibraryMustBeList => 'Библиотека меток должна быть списком.';

  @override
  String get backupInvalidLibraryEntry => 'Недопустимая запись библиотеки.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'В библиотеке не более $max записей.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'Библиотека: добавлено $added';
  }

  @override
  String backupLibraryCount(String count) {
    return '• Библиотека: $count (без фото)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return 'Посл. метка: $bytes / $max Б';
  }

  @override
  String get contentTooLargeForChips =>
      'Слишком много для обычных меток: сократите текст или используйте короткую ссылку.';

  @override
  String get tagReportTitle => 'Отчёт о метке';

  @override
  String get tagReportSubtitle => 'Чип, блокировки, пароль и заполнение';

  @override
  String get tagReportPrompt => 'Поднесите метку для проверки';

  @override
  String get tagReportBusy => 'Проверка метки...';

  @override
  String tagReportDone(String chip) {
    return 'Отчёт готов: $chip';
  }

  @override
  String get unknownChip => 'Неизвестный чип';

  @override
  String get yes => 'Да';

  @override
  String get reportChip => 'Чип';

  @override
  String get reportNdefFormatted => 'Формат NDEF';

  @override
  String get reportWritable => 'Доступна запись';

  @override
  String get reportStaticLock => 'Статическая блокировка';

  @override
  String get reportDynamicLock => 'Динамическая блокировка';

  @override
  String get reportPassword => 'Защита паролем';

  @override
  String get reportReadProtected => 'Защита чтения';

  @override
  String get reportNdefUsage => 'Заполнение NDEF';

  @override
  String get reportVerdictWritable => 'Метка готова к записи';

  @override
  String get reportVerdictRestricted => 'Метка ограничена';

  @override
  String get reportCopied => 'Отчёт скопирован';

  @override
  String get compareTagsTitle => 'Сравнить две метки';

  @override
  String get compareTagsSubtitle =>
      'Проверьте, совпадает ли копия с оригиналом';

  @override
  String get compareStepFirst => 'Сначала считайте первую (исходную) метку.';

  @override
  String get compareStepSecond => 'Теперь считайте вторую метку.';

  @override
  String get compareIdentical => 'Содержимое совпадает';

  @override
  String get compareDifferent => 'Содержимое различается';

  @override
  String get compareSameTag => 'Одна и та же метка считана дважды.';

  @override
  String get compareDifferentTags => 'Две разные метки.';

  @override
  String get compareRecordSame => 'Совпадает';

  @override
  String get compareRecordChanged => 'Отличается';

  @override
  String get compareRecordOnlyFirst => 'Только на A';

  @override
  String get compareRecordOnlySecond => 'Только на B';

  @override
  String get compareBothEmpty => 'Обе метки пусты.';

  @override
  String capacityExceededShort(String needed, String max) {
    return 'Слишком много данных: $needed / $max байт';
  }

  @override
  String get verifyFailedAfterWrite =>
      'Данные не подтверждены — держите метку дольше.';

  @override
  String get blankTagTitle => 'Метка ещё не подготовлена';

  @override
  String get blankTagBody =>
      'Метка новая и не отформатирована под NDEF. Приложение может подготовить её и записать данные одним касанием (NTAG и MIFARE Ultralight).';

  @override
  String get blankTagAction => 'Подготовить и записать';

  @override
  String get shareTag => 'Поделиться';

  @override
  String get shareAsText => 'Поделиться текстом';

  @override
  String get shareAsFile => 'Поделиться файлом (.json)';

  @override
  String get shareAsFileSubtitle =>
      'Записи можно точно записать на другом устройстве';

  @override
  String get importFromJsonFile => 'Из файла метки (.json)';

  @override
  String get invalidTagFile => 'Недопустимый файл метки.';

  @override
  String get continuousScanTitle => 'Непрерывное сканирование';

  @override
  String get continuousScanSubtitle =>
      'Считывайте метки подряд и делитесь списком в CSV';

  @override
  String continuousScanCount(String count) {
    return 'Считано меток: $count';
  }

  @override
  String get exportCsv => 'Поделиться CSV';

  @override
  String get clearList => 'Очистить список';

  @override
  String get csvColumnTime => 'Время';

  @override
  String get csvColumnRecords => 'Записи';

  @override
  String get csvColumnContent => 'Содержимое';

  @override
  String get csvColumnCapacity => 'Ёмкость (Б)';

  @override
  String get csvColumnUsed => 'Занято (Б)';

  @override
  String get batchSerialToggle => 'Добавить серийные номера';

  @override
  String batchSerialHint(String token) {
    return 'Укажите $token в записи, и номер встанет туда; иначе к каждой метке добавится отдельная текстовая запись с номером.';
  }

  @override
  String get batchSerialPrefix => 'Префикс';

  @override
  String get batchSerialStart => 'Начало';

  @override
  String get batchSerialDigits => 'Разрядов';

  @override
  String batchSerialPreview(String first, String last) {
    return 'Первый: $first · Последний: $last';
  }

  @override
  String get batchFromCsvButton => 'Из CSV-файла (строка на метку)';

  @override
  String get batchCsvTitle => 'Пакетная запись из CSV';

  @override
  String batchCsvSummary(String count) {
    return 'Будет записано меток: $count. Каждая получает одну строку CSV по порядку.';
  }

  @override
  String batchCsvTruncated(String max) {
    return 'Для пакетной записи берётся не более $max строк; остальные пропущены.';
  }

  @override
  String get cloneTagTitle => 'Клонировать метку';

  @override
  String get cloneTagSubtitle =>
      'Прочитать метку и записать её содержимое на другие';

  @override
  String get cloneSourceStep =>
      'Шаг 1: отсканируйте исходную метку. Копируется только NDEF-содержимое; UID клонировать нельзя.';

  @override
  String get cloneSourceEmpty =>
      'На исходной метке нет NDEF-записей для копирования.';

  @override
  String get cloneReadyTitle => 'Источник прочитан';

  @override
  String cloneReadySummary(String count, String bytes) {
    return 'Будет скопировано записей: $count ($bytes байт). Выберите количество меток.';
  }

  @override
  String get cloneEditFirst => 'Сначала изменить';

  @override
  String get tapPreviewTitle => 'Что произойдёт при касании телефоном?';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'Метка пуста; ничего не произойдёт.';

  @override
  String tapIosUrl(String target) {
    return 'Появится уведомление; по нажатию $target откроется в Safari или нужном приложении.';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target сразу откроется в браузере или нужном приложении.';
  }

  @override
  String tapIosApp(String target) {
    return 'Появится уведомление; приложение откроется через «$target», если установлено.';
  }

  @override
  String tapAndroidApp(String target) {
    return 'Приложение откроется через «$target», если установлено.';
  }

  @override
  String tapIosCall(String target) {
    return 'Появится уведомление; по нажатию начнётся звонок на $target.';
  }

  @override
  String tapAndroidCall(String target) {
    return 'Откроется приложение «Телефон» с номером $target.';
  }

  @override
  String tapIosSms(String target) {
    return 'Появится уведомление; «Сообщения» откроют новое сообщение для $target.';
  }

  @override
  String tapAndroidSms(String target) {
    return 'Откроется приложение сообщений для $target.';
  }

  @override
  String tapIosEmail(String target) {
    return 'Появится уведомление; «Почта» откроет новое письмо для $target.';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'Откроется почтовое приложение для $target.';
  }

  @override
  String get tapIosMap =>
      'iPhone сам не открывает места «geo:». Используйте ссылку Apple или Google Карт (Быстрые ссылки).';

  @override
  String get tapAndroidMap => 'Карты откроются в этом месте.';

  @override
  String get tapIosNeedsApp =>
      'iPhone сам ничего не делает с этим содержимым; его нужно читать NFC-приложением.';

  @override
  String get tapAndroidText =>
      'На большинстве телефонов ничего не происходит или текст показывается на системном экране.';

  @override
  String get tapAndroidContact => 'Предлагается добавить контакт.';

  @override
  String get tapAndroidWifi =>
      'Предлагается подключиться к сети (Android 10 и новее).';

  @override
  String get tapAndroidCalendar =>
      'Если календарь поддерживает, предложит добавить событие.';

  @override
  String get tapAndroidOther =>
      'Откроется, только если установлено подходящее приложение.';

  @override
  String tapIgnoredRecords(String count) {
    return 'Телефоны выполняют только первую запись; остальные ($count) видны в NFC-приложениях.';
  }

  @override
  String get tapIosRequirement =>
      'iPhone XS и новее читают в фоне, если экран разблокирован и не открыты Камера/Wallet.';

  @override
  String get galleryCatBusiness => 'Бизнес';

  @override
  String get galleryCatSocial => 'Соцсети';

  @override
  String get galleryCatHome => 'Дом';

  @override
  String get galleryCatPersonal => 'Личное';

  @override
  String get galleryCatAutomation => 'Автоматизация';

  @override
  String get galleryFavorites => 'Избранное';

  @override
  String get gallerySearchHint => 'Поиск шаблонов...';

  @override
  String get galleryNoResults => 'Подходящих шаблонов нет.';

  @override
  String get galleryAddFavorite => 'В избранное';

  @override
  String get galleryRemoveFavorite => 'Убрать из избранного';

  @override
  String get presetEventTitle => 'Приглашение на событие';

  @override
  String get presetEventDesc =>
      'Записывает событие в формате iCalendar; Android может добавить его в календарь.';

  @override
  String get eventNameLabel => 'Название события';

  @override
  String get eventDateLabel => 'Дата (ГГГГ-ММ-ДД)';

  @override
  String get eventTimeLabel => 'Время (ЧЧ:ММ)';

  @override
  String get eventDateTimeInvalid =>
      'Неверная дата или время. Пример: 2026-12-31 и 19:00';

  @override
  String get presetLuggageTitle => 'Багажная бирка';

  @override
  String get presetLuggageDesc =>
      'Если потеряется, нашедший легко свяжется с вами.';

  @override
  String luggageMessage(String name, String contact) {
    return 'Этот багаж принадлежит: $name. Если нашли, свяжитесь: $contact';
  }

  @override
  String get presetPlaylistTitle => 'Плейлист';

  @override
  String get presetPlaylistDesc =>
      'Открывает плейлист Spotify, Apple Music или YouTube.';

  @override
  String get playlistLinkLabel => 'Ссылка на плейлист';

  @override
  String get presetEmailMeTitle => 'Напишите мне';

  @override
  String get presetEmailMeDesc => 'Открывает новое письмо вам с готовой темой.';

  @override
  String get presetCallMeTitle => 'Позвоните мне';

  @override
  String get presetCallMeDesc => 'Телефон позвонит на ваш номер.';

  @override
  String get presetRunShortcutTitle => 'Запустить быструю команду';

  @override
  String get presetRunShortcutDesc =>
      'Запускает указанную быструю команду iPhone: свет, музыка, режим фокусирования...';

  @override
  String get shortcutNameLabel => 'Название команды';
}
