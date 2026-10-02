// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get addRecord => '레코드 추가';

  @override
  String get addRule => '규칙 추가';

  @override
  String get addTag => '태그 추가';

  @override
  String get addToComposerList => '쓰기 목록에 추가';

  @override
  String get addToWriteList => '쓰기 목록에 추가';

  @override
  String get addressCannotBeEmpty => '주소를 입력해주세요.';

  @override
  String get advancedCommandsDesc =>
      '한 줄에 하나의 16진수 명령 입력. 예: 60 = GET_VERSION, 30 04 = 4페이지 읽기. 잘못된 쓰기 명령은 태그를 손상시킬 수 있습니다.';

  @override
  String get advancedCommandsSubtitle => '태그에 16진수 원시 명령어를 직접 전송합니다';

  @override
  String get advancedCommandsTitle => '고급 NFC 명령어';

  @override
  String get allRulesCleared => '모든 규칙이 삭제되었습니다';

  @override
  String get appLinksDesc => '이 링크를 태그에 기록하면 접촉 시 알림과 함께 앱의 해당 화면이 열립니다.';

  @override
  String get appLinksSection => '앱 링크';

  @override
  String get appPackageName => 'Android 패키지 이름';

  @override
  String get appSettings => '앱 설정';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => '태그 접촉 시 자동 실행';

  @override
  String get backupExportSuccess => '백업 파일이 성공적으로 저장되었습니다';

  @override
  String get backupFileSizeExceeded => '백업 파일 크기가 2 MiB를 초과합니다.';

  @override
  String get backupHistoryMustBeList => '\"history\" 필드는 목록 형태여야 합니다.';

  @override
  String backupImportFailed(String error) {
    return '백업 가져오기 실패: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return '백업 가져오기 완료: 템플릿 $templates개, 규칙 $rules개, 기록 $history개 추가됨';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'ID의 Base64 인코딩이 잘못되었습니다: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Payload의 Base64 인코딩이 잘못되었습니다: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Type의 Base64 인코딩이 잘못되었습니다: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return '유효하지 않은 JSON 형식입니다: $error';
  }

  @override
  String get backupInvalidRuleNote => '유효한 규칙 메모여야 합니다.';

  @override
  String get backupInvalidRuleSha => '유효한 64자리 SHA-256 16진수 문자열이어야 합니다.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return '생성 일시 형식이 잘못되었습니다: $date';
  }

  @override
  String get backupInvalidTemplateId => '유효하지 않은 템플릿 ID입니다.';

  @override
  String get backupInvalidTemplateName => '유효하지 않은 템플릿 이름입니다.';

  @override
  String backupInvalidTnf(String tnf) {
    return '유효하지 않은 TNF 값 ($tnf)입니다. 0에서 7 사이여야 합니다.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return '기록 수가 최대 제한 $max개를 초과했습니다 ($count개).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return '레코드 수가 최대 제한 $max개를 초과했습니다 ($count개).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return '규칙 수가 최대 제한 $max개를 초과했습니다 ($count개).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return '템플릿 수가 최대 제한 $max개를 초과했습니다 ($count개).';
  }

  @override
  String get backupMissingSchemaVersion => '\"schemaVersion\" 필드가 누락되었습니다.';

  @override
  String get backupRecordMustBeObject => '각 NDEF 레코드는 JSON 객체여야 합니다.';

  @override
  String get backupRecordsMustBeList => '레코드 필드는 목록 형태여야 합니다.';

  @override
  String get backupRestoreSubtitle =>
      '템플릿, 메모 및 기록을 JSON 형식으로 내보내거나 기존 데이터와 병합합니다.';

  @override
  String get backupRestoreTitle => '백업 및 복원 (JSON)';

  @override
  String get backupRootMustBeObject => '루트 요소는 JSON 객체여야 합니다.';

  @override
  String get backupRuleMustBeObject => '각 규칙은 JSON 객체여야 합니다.';

  @override
  String get backupSchemaVersionMustBeInt => '\"schemaVersion\" 필드는 정수여야 합니다.';

  @override
  String backupSizeExceeded(int bytes) {
    return '백업 데이터가 허용된 2 MiB 크기를 초과합니다 ($bytes 바이트).';
  }

  @override
  String get backupTagRulesMustBeList => '\"tagRules\" 필드는 목록 형태여야 합니다.';

  @override
  String get backupTemplateMustBeObject => '각 템플릿은 JSON 객체여야 합니다.';

  @override
  String get backupTemplatesMustBeList => '\"templates\" 필드는 목록 형태여야 합니다.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return '지원되지 않는 백업 스키마 버전입니다: $version.';
  }

  @override
  String get batchWrite => '일괄 쓰기';

  @override
  String get bluetoothDeviceName => '기기 이름 (선택)';

  @override
  String get bluetoothMac => '블루투스 MAC 주소';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return '기록된 바이트: $bytes | 검증: $status';
  }

  @override
  String cameraError(String error) {
    return '카메라를 실행할 수 없습니다. 설정 > 개인정보 보호 > 카메라에서 허용해주세요.\n($error)';
  }

  @override
  String get cancel => '취소';

  @override
  String get catBusiness => '비즈니스';

  @override
  String get catCar => '차량';

  @override
  String get catHome => '집';

  @override
  String get catOther => '기타';

  @override
  String get catPersonal => '개인';

  @override
  String get catWork => '직장';

  @override
  String get categoryLabel => '카테고리';

  @override
  String get chooseFromGallery => '갤러리에서 선택';

  @override
  String get clear => '지우기';

  @override
  String get clearAll => '모두 삭제';

  @override
  String get clearAllRulesConfirm => '저장된 모든 메모를 삭제하시겠습니까?';

  @override
  String get clearConfirmButton => '예, 지우기';

  @override
  String get clearConfirmMessage => '태그의 모든 NDEF 데이터가 삭제됩니다. 계속하시겠습니까?';

  @override
  String get clearConfirmTitle => '태그 내용 초기화';

  @override
  String get clearHistory => '기록 지우기';

  @override
  String get clearList => '목록 지우기';

  @override
  String get clearTagSubtitle => '모든 레코드를 삭제하고 빈 NDEF를 씁니다';

  @override
  String get clearTagTitle => '태그 내용 지우기';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '클립보드에 $count개 레코드 준비됨 ($bytes B) · $source',
    );
    return '$_temp0';
  }

  @override
  String get close => '닫기';

  @override
  String get commandsEmptyError => '명령어를 하나 이상 입력하세요.';

  @override
  String get commandsLabel => '명령어';

  @override
  String get composeRecordTitle => '레코드 추가';

  @override
  String get confirmClearHistoryContent => '기기에 저장된 모든 스캔 기록이 삭제됩니다. 계속하시겠습니까?';

  @override
  String get confirmClearHistoryTitle => '스캔 기록 지우기';

  @override
  String get confirmClearTemplatesContent => '저장된 모든 템플릿이 삭제됩니다. 계속하시겠습니까?';

  @override
  String get confirmClearTemplatesTitle => '템플릿 삭제';

  @override
  String get contactCompany => '회사 / 단체';

  @override
  String get contactEmail => '이메일';

  @override
  String get contactFullName => '이름';

  @override
  String get contactNote => '메모';

  @override
  String get contactPhone => '전화번호';

  @override
  String get contactTitle => '직함 / 직책';

  @override
  String get contactWebsite => '웹사이트';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '내용: $count개 레코드 · $content',
    );
    return '$_temp0';
  }

  @override
  String get copy => '복사';

  @override
  String get copyAllRecords => '모든 레코드 복사';

  @override
  String get copyTagUid => 'UID 복사';

  @override
  String get copyToComposer => '쓰기 목록에 복사';

  @override
  String get csvInvalidAddress => '유효하지 않은 주소입니다.';

  @override
  String get csvInvalidEmail => '유효하지 않은 이메일입니다.';

  @override
  String get csvInvalidLocation =>
      '위도와 경도를 입력하세요 (예: location,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return '최대 $max개 레코드만 가져왔으며 나머지는 건너뛰었습니다.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return '$row번째 줄: 값이 비어 있습니다.';
  }

  @override
  String csvRowError(String error, int row) {
    return '$row번째 줄: $error';
  }

  @override
  String csvUnknownType(String type) {
    return '알 수 없는 유형 \"$type\"입니다.';
  }

  @override
  String get csvWifiPasswordLength => 'Wi-Fi 비밀번호는 8~63자여야 합니다.';

  @override
  String get delete => '삭제';

  @override
  String deleteTagConfirmContent(String name) {
    return '\"$name\" 태그를 보관함에서 삭제하시겠습니까? 실제 태그 내용은 유지됩니다.';
  }

  @override
  String get deleteTagConfirmTitle => '태그 삭제';

  @override
  String get deleteTemplateTooltip => '템플릿 삭제';

  @override
  String get deviceNameTooLong => '기기 이름이 너무 깁니다.';

  @override
  String get dismiss => '닫기';

  @override
  String get editRecordTitle => '레코드 편집';

  @override
  String get editRule => '규칙 편집';

  @override
  String get editTag => '태그 편집';

  @override
  String get emailBody => '내용';

  @override
  String get emailRecipient => '받는 사람 이메일';

  @override
  String get emailSubject => '제목';

  @override
  String get emptyComposerSubtitle =>
      '\"레코드 추가\"를 눌러 URL, 텍스트, Wi-Fi, 연락처를 만드세요.';

  @override
  String get emptyComposerTitle => '추가된 데이터가 없습니다';

  @override
  String get emptyHistorySubtitle => '스캔한 태그 내용이 여기에 표시됩니다.';

  @override
  String get emptyHistoryTitle => '스캔 기록이 없습니다';

  @override
  String get emptyLibrary => '저장된 태그가 없습니다.\n태그를 스캔한 후 사진과 함께 등록해보세요.';

  @override
  String get eventDescription => '설명';

  @override
  String get eventEnd => '종료 일시';

  @override
  String get eventLocation => '장소';

  @override
  String get eventStart => '시작 일시';

  @override
  String get eventTitle => '일정 제목';

  @override
  String get exportBackup => '내보내기';

  @override
  String get facetimePrompt => '전화번호 또는 Apple ID 이메일을 입력하세요.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" 항목을 입력해주세요.';
  }

  @override
  String get fieldTextPrompt => '태그에 쓸 텍스트 내용';

  @override
  String get fieldUrlPrompt => '웹사이트 주소 (https://...)';

  @override
  String get fileUrl => '파일 다운로드 URL';

  @override
  String get filterAll => '전체';

  @override
  String get flashlight => '손전등';

  @override
  String get formatConfirmButton => '포맷';

  @override
  String get formatConfirmMessage => '데이터를 지우고 빈 NDEF 태그로 포맷합니다. 계속하시겠습니까?';

  @override
  String get formatMemorySubtitle => 'NDEF용으로 초기화합니다 (빈 태그/손상 태그)';

  @override
  String get formatMemoryTitle => '메모리 포맷';

  @override
  String get hardwareAvailable => 'NFC 하드웨어 준비됨';

  @override
  String get hardwareDisabled => 'NFC 비활성화됨';

  @override
  String get hardwareNotSupported => 'NFC 미지원';

  @override
  String get historyFilteredEmpty => '일치하는 기록을 찾을 수 없습니다.';

  @override
  String get idTooLarge => 'ID 길이는 255바이트를 초과할 수 없습니다';

  @override
  String get importBackup => '가져오기 (병합)';

  @override
  String get importCsv => 'CSV 가져오기';

  @override
  String get inAppTagRules => '태그 로컬 규칙';

  @override
  String get invalidHexId => '유효하지 않은 16진수 ID 문자열';

  @override
  String get invalidHexPayload => '유효하지 않은 16진수 Payload 문자열';

  @override
  String get invalidHexType => '유효하지 않은 16진수 Type 문자열';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get latitude => '위도 (Lat)';

  @override
  String get linkCopied => '링크가 복사되었습니다';

  @override
  String get linkHistoryDesc => '기록 화면을 엽니다';

  @override
  String get linkScanDesc => '앱을 열고 스캔을 시작합니다';

  @override
  String get linkToolsDesc => '도구 화면을 엽니다';

  @override
  String get linkWriteDesc => '쓰기 편집 화면을 엽니다';

  @override
  String get loadToComposerTooltip => '작성기에 불러오기';

  @override
  String get locationHint => '예: 냉장고 문';

  @override
  String get locationLabel => '위치';

  @override
  String get lockAcknowledge => '이 작업은 취소할 수 없음을 이해했습니다';

  @override
  String get lockButton => '잠그기';

  @override
  String get lockTagSubtitle => '태그를 영구 읽기 전용으로 설정합니다 (되돌리기 불가)';

  @override
  String get lockTagTitle => '태그 영구 잠금';

  @override
  String get lockWarning =>
      '잠긴 태그는 영구 읽기 전용이 됩니다: 변경, 삭제 또는 잠금 해제가 절대 불가능합니다. 신중히 확인하세요.';

  @override
  String get longitude => '경도 (Lng)';

  @override
  String get manage => '관리';

  @override
  String get matchedRule => '일치하는 메모';

  @override
  String get mimePayloadHex => '페이로드 (Hex / 텍스트)';

  @override
  String get mimeTypeLabel => 'MIME 유형';

  @override
  String get nameRequired => '태그 이름을 입력하세요.';

  @override
  String get navHistory => '기록';

  @override
  String get navHistoryTitle => '기록';

  @override
  String get navRead => '읽기';

  @override
  String get navReadTitle => '태그 읽기';

  @override
  String get navSettings => '설정';

  @override
  String get navSettingsTitle => '템플릿 및 설정';

  @override
  String get navTools => '도구';

  @override
  String get navToolsTitle => '도구';

  @override
  String get navWrite => '쓰기';

  @override
  String get navWriteTitle => '태그 쓰기';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 레코드',
    );
    return '$_temp0';
  }

  @override
  String get ndefRecordsTitle => 'NDEF 레코드';

  @override
  String get nfcPromptClear => '태그를 초기화하려면 기기에 대어주세요';

  @override
  String get nfcPromptLock => '영구 잠금할 태그를 기기에 대어주세요';

  @override
  String get nfcPromptScan => '태그를 읽으려면 기기 뒷면에 대어주세요';

  @override
  String get nfcPromptWrite => '데이터를 기록할 NFC 태그를 대어주세요';

  @override
  String get no => '아니요';

  @override
  String get noContentInTag => '연결된 태그 내용이 없습니다.';

  @override
  String get noLibraryMatches => '검색 결과가 없습니다.';

  @override
  String get noRecordsOnTag => '태그에서 NDEF 레코드를 찾을 수 없습니다.';

  @override
  String get noTemplates => '저장된 템플릿이 없습니다.\n\"쓰기\" 탭에서 데이터를 생성해 템플릿으로 저장하세요.';

  @override
  String get noteLabel => '메모';

  @override
  String get onboardingContinue => '계속';

  @override
  String get onboardingSkip => '건너뛰기';

  @override
  String get onboardingStart => '시작하기';

  @override
  String get onboardingStep1Body =>
      '파란 버튼을 누르고 기기 뒷면을 태그에 대어주세요. 내용, 용량, 일련번호가 즉시 확인됩니다.';

  @override
  String get onboardingStep1Title => '간편한 태그 스캔';

  @override
  String get onboardingStep2Body =>
      '\"쓰기\" 탭에서 \"레코드 추가\"：웹 링크, Wi-Fi, 연락처, SNS를 템플릿으로 빠르게 제작하세요.';

  @override
  String get onboardingStep2Title => '무엇이든 기록하기';

  @override
  String get onboardingStep3Body =>
      '메모리 분석, 비밀번호 잠금, 포맷 기능을 \"도구\" 탭에서 손쉽게 이용하세요.';

  @override
  String get onboardingStep3Title => '전문가 도구';

  @override
  String get onboardingStep4Body =>
      '기록한 태그에 이름과 사진, 메모를 달아 보관함에 저장하세요. 설정에서 언어도 변경할 수 있습니다.';

  @override
  String get onboardingStep4Title => '나만의 태그 관리';

  @override
  String optionalField(String label) {
    return '$label (선택)';
  }

  @override
  String pageN(int page) {
    return '$page페이지';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => '데이터';

  @override
  String get pageRoleLock => '잠금';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / 잠금';

  @override
  String get passwordDialogAction => '설정';

  @override
  String get passwordDialogTitle => '비밀번호 설정';

  @override
  String get passwordDialogWarning =>
      '비밀번호를 분실하면 태그 내용을 다시 수정할 수 없습니다. 읽기는 누구에게나 허용됩니다.';

  @override
  String get passwordError => '정확히 4글자 또는 8자리 16진수를 입력하세요.';

  @override
  String get passwordHint => '4글자 (예: 1234) 또는 8자리 16진수';

  @override
  String get passwordLabel => '비밀번호';

  @override
  String get paste => '붙여넣기';

  @override
  String get phoneNumber => '전화번호';

  @override
  String get phoneWithCountryCode => '국가 번호를 포함하여 입력해주세요 (예: 821012345678).';

  @override
  String get presetAppDownloadDesc => 'Android 기기에서 앱을 실행하거나 설치 화면을 엽니다.';

  @override
  String get presetAppDownloadTitle => '앱 다운로드 안내';

  @override
  String get presetBusinessCardDesc => '휴대폰을 대면 연락처가 주소록에 바로 추가됩니다.';

  @override
  String get presetBusinessCardTitle => '디지털 명함';

  @override
  String get presetDirectionsDesc => '지도상에 목적지 주소나 매장 위치를 표시합니다.';

  @override
  String get presetDirectionsTitle => '길찾기 / 오시는 길';

  @override
  String get presetEmergencyDesc => '혈액형, 비상 연락처 및 중요 진료 정보를 제공합니다.';

  @override
  String get presetEmergencyTitle => '응급 카드 (ICE)';

  @override
  String get presetGoogleReviewDesc => '매장 리뷰 작성 화면으로 고객을 곧바로 안내합니다.';

  @override
  String get presetGoogleReviewTitle => 'Google 리뷰 안내';

  @override
  String get presetGuestWifiDesc => '비밀번호 입력 없이 간편하게 Wi-Fi에 접속합니다.';

  @override
  String get presetGuestWifiTitle => '게스트용 Wi-Fi 카드';

  @override
  String get presetInstagramDesc => '터치 시 Instagram 프로필 화면을 바로 엽니다.';

  @override
  String get presetInstagramTitle => 'Instagram 프로필';

  @override
  String get presetMenuLinkDesc => '테이블에 부착하여 고객이 메뉴를 즉시 확인하게 합니다.';

  @override
  String get presetMenuLinkTitle => '식당 전자 메뉴판';

  @override
  String get presetPetTagDesc => '반려동물을 찾은 사람이 즉시 주인에게 전화할 수 있습니다.';

  @override
  String get presetPetTagTitle => '반려동물 인식표';

  @override
  String get presetShortcutDesc => 'iPhone 단축어나 앱 내 주요 동작을 실행합니다.';

  @override
  String get presetShortcutTitle => '단축어 실행기';

  @override
  String get presetWebsiteDesc => '원하는 모든 인터넷 웹페이지로 바로 이동합니다.';

  @override
  String get presetWebsiteTitle => '웹사이트 연결';

  @override
  String get presetWhatsappDesc => '번호를 주소록에 저장하지 않고 채팅을 시작합니다.';

  @override
  String get presetWhatsappTitle => 'WhatsApp 바로 연결';

  @override
  String get qrCode => 'QR 코드';

  @override
  String qrContentChars(int chars) {
    return '내용 ($chars자):';
  }

  @override
  String get qrContentEmpty => '변환할 내용이 비어 있습니다.';

  @override
  String qrContentTooLarge(int chars) {
    return 'QR 코드로 만들기엔 내용이 너무 깁니다 ($chars자, 최대 2048자 지원).';
  }

  @override
  String get qrFrameInstructions =>
      'QR 코드를 사각 틀 안에 맞춰주세요. 웹 링크, Wi-Fi 및 텍스트가 변환됩니다.';

  @override
  String qrGenerationFailed(String error) {
    return 'QR 코드 생성 실패: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'QR 코드 미리보기: $title';
  }

  @override
  String get qrScanTitle => 'QR 코드 스캔';

  @override
  String get qrSecurityNote =>
      'QR 미리보기는 일반 텍스트 및 웹 URL만 지원합니다.\n\nWi-Fi 비밀번호나 바이너리 데이터는 보안상 QR로 변환되지 않습니다.';

  @override
  String get qrUserOnlyNote => '사용자 요청 시에만 표시됩니다.';

  @override
  String get rawInspection => '상세 분석';

  @override
  String get rawRecordDetailsTitle => '레코드 세부 정보 (읽기 전용)';

  @override
  String get rawRecordEditorTitle => '원시 NDEF 레코드 편집';

  @override
  String get readHeroButton => '스캔 시작';

  @override
  String get readHeroEyebrow => 'NFC 리더';

  @override
  String get readHeroScanning => '스캔 중...';

  @override
  String get readHeroSubtitle => '휴대폰을 태그에 대어 NDEF 데이터와 칩 정보를 확인하세요.';

  @override
  String get readHeroTitle => '태그 스캔';

  @override
  String get readMemorySubtitle => '페이지별 원시 메모리; 복사 또는 .bin 저장';

  @override
  String get readMemoryTitle => '메모리 읽기';

  @override
  String get readyTemplates => '추천 템플릿';

  @override
  String get recordCopied => '내용이 복사되었습니다';

  @override
  String recordIndex(int index) {
    return '레코드 #$index';
  }

  @override
  String get recordTypeCalendar => '캘린더 일정 (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return '사용자 지정 MIME ($mime)';
  }

  @override
  String get recordTypeEmail => '이메일 레코드';

  @override
  String get recordTypeLocation => '위치 / GPS';

  @override
  String get recordTypePhone => '전화번호';

  @override
  String get recordTypeSmartPoster => '스마트 포스터';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return '손상된 스마트 포스터 데이터 ($bytes 바이트)';
  }

  @override
  String get recordTypeSmartPosterInvalid => '스마트 포스터 (유효하지 않은 데이터)';

  @override
  String get recordTypeSms => 'SMS 레코드';

  @override
  String get recordTypeText => '텍스트 레코드';

  @override
  String get recordTypeUnknown => '알 수 없는 레코드';

  @override
  String get recordTypeUrl => '웹 링크 (URL)';

  @override
  String get recordTypeVCard => '연락처 카드 (vCard)';

  @override
  String get recordTypeWifi => 'Wi-Fi 네트워크 설정 (WSC)';

  @override
  String get recordTypeWifiCorrupt => '손상된 WSC 데이터';

  @override
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 레코드가 클립보드에 복사되었습니다',
    );
    return '$_temp0';
  }

  @override
  String get redo => '다시 실행';

  @override
  String get removePasswordDialogTitle => '비밀번호 해제';

  @override
  String get removePasswordDialogWarning => '태그에 설정된 현재 비밀번호를 입력하세요.';

  @override
  String get removePasswordSubtitle => '설정된 비밀번호를 입력해 보호를 해제합니다';

  @override
  String get removePasswordTitle => '비밀번호 해제';

  @override
  String get removePhoto => '삭제';

  @override
  String get rewriteTag => '다시 쓰기';

  @override
  String ruleDeleteConfirm(String note) {
    return '\"$note\" 메모가 포함된 규칙을 삭제하시겠습니까?';
  }

  @override
  String get ruleDeleted => '규칙이 삭제되었습니다';

  @override
  String get ruleNoteDialogTitle => '태그 메모 편집';

  @override
  String get ruleNoteHint => '예: 창고 선반 #4 또는 회의실';

  @override
  String get ruleNoteLabel => '앱 내 메모 / 라벨';

  @override
  String get ruleSaved => '규칙이 저장되었습니다';

  @override
  String get save => '저장';

  @override
  String get saveAsTemplate => '템플릿으로 저장';

  @override
  String get saveBin => '.bin 저장';

  @override
  String get saveLocalHistory => '로컬 스캔 기록 저장';

  @override
  String get saveLocalHistorySubtitle =>
      '끄면 스캔 기록을 저장하지 않습니다. 켜면 성공한 스캔만 로컬에 저장됩니다.';

  @override
  String get saveTemplateDialogTitle => '템플릿으로 저장';

  @override
  String get saveToLibrary => '보관함에 저장';

  @override
  String get scanFabLabel => '태그 스캔';

  @override
  String get scanQrToRecord => 'QR 코드 스캔';

  @override
  String get scannedTag => '스캔된 태그';

  @override
  String get searchEngine => '검색 엔진';

  @override
  String get searchHistoryHint => '기록 검색 (UID, 내용, 유형)...';

  @override
  String get searchLibraryHint => '이름, 메모, 위치 또는 내용으로 검색';

  @override
  String get searchQuery => '검색어';

  @override
  String get searchQueryCannotBeEmpty => '검색어를 입력해주세요.';

  @override
  String get securityRestriction => '보안 제한 사항';

  @override
  String get send => '전송';

  @override
  String get setPasswordSubtitle => '무단 덮어쓰기로부터 태그 내용을 보호합니다';

  @override
  String get setPasswordTitle => '비밀번호 설정';

  @override
  String get shareRecords => '레코드 공유';

  @override
  String get shortcutAutomationNote =>
      '참고: 자동화는 태그의 UID에 연동되므로 데이터가 변경되어도 실행됩니다.';

  @override
  String get shortcutStep1 => '단축어 앱을 열고 하단의 \"자동화\"를 탭하세요.';

  @override
  String get shortcutStep2 => '\"새로운 자동화\" (+) → \"NFC\"를 선택합니다.';

  @override
  String get shortcutStep3 => '\"스캔\"을 누르고 기기를 태그에 대어 이름을 지정하세요.';

  @override
  String get shortcutStep4 => '\"즉시 실행\"을 선택하고 원하는 동작을 추가하세요.';

  @override
  String get shortcutStep5 => '이 앱을 실행하려면 \"태그 스캔\" 또는 \"태그 쓰기\"를 선택하세요.';

  @override
  String get shortcutsGuideSubtitle => '태그 접촉 시 작업을 자동 실행하거나 Siri로 음성 스캔하세요.';

  @override
  String get shortcutsGuideTitle => 'Siri 및 단축어';

  @override
  String get siriPhraseScan => '\"Siri야, NFC Tag Master로 태그 스캔해 줘\"';

  @override
  String get siriPhraseWrite => '\"Siri야, NFC Tag Master로 태그 써 줘\"';

  @override
  String get siriShortcutsNote => '단축어 앱과 Spotlight 검색에서도 바로 확인하실 수 있습니다.';

  @override
  String get smsMessage => '문자 내용';

  @override
  String get socialNetwork => '플랫폼';

  @override
  String get socialUsername => '사용자 이름 / 아이디';

  @override
  String get sourceComposer => '작성기 목록의 레코드';

  @override
  String get sourceEmpty => '내용 없음 (메모만)';

  @override
  String get sourceLastScan => '최근 스캔한 태그';

  @override
  String get sourceSelectPrompt => '태그 데이터를 어디서 가져올까요?';

  @override
  String get statusCancelled => '작업이 취소되었습니다.';

  @override
  String statusClearError(String error) {
    return '초기화 오류: $error';
  }

  @override
  String statusClearFailed(String error) {
    return '초기화 실패: $error';
  }

  @override
  String get statusClearSuccess => '태그 내용이 삭제되었습니다.';

  @override
  String get statusClearing => '초기화 모드 활성화됨. 태그를 대어주세요...';

  @override
  String statusLockError(String error) {
    return '잠금 오류: $error';
  }

  @override
  String statusLockFailed(String error) {
    return '잠금 실패: $error';
  }

  @override
  String get statusLockSuccess => '태그가 영구 잠금(읽기 전용)되었습니다.';

  @override
  String get statusLocking => '잠금 모드 활성화됨. 태그를 대어주세요...';

  @override
  String get statusNfcDisabled => 'NFC가 꺼져 있습니다. 설정에서 켜주세요.';

  @override
  String get statusNfcNotSupported => '이 기기는 NFC 기능을 지원하지 않습니다.';

  @override
  String get statusNfcUnavailable => '현재 NFC를 사용할 수 없습니다.';

  @override
  String get statusReady => '준비됨';

  @override
  String statusScanError(String error) {
    return '스캔 오류: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return '태그를 성공적으로 읽었습니다 ($id).';
  }

  @override
  String get statusScanning => '스캔 중... 휴대폰을 태그에 대어주세요.';

  @override
  String statusUnexpectedError(String error) {
    return '예기치 못한 오류: $error';
  }

  @override
  String statusWriteError(String error) {
    return '쓰기 오류: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return '쓰기를 완료할 수 없습니다: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return '쓰기 및 검증 성공! ($bytes 바이트)';
  }

  @override
  String get statusWriting => '쓰기 모드 활성화됨. 대상 태그를 대어주세요...';

  @override
  String get systemLanguage => '시스템 언어';

  @override
  String get tabApp => '앱';

  @override
  String get tabBluetooth => '블루투스';

  @override
  String get tabCalendar => '캘린더';

  @override
  String get tabContact => '연락처 (vCard)';

  @override
  String get tabCustomMime => '사용자 지정 MIME';

  @override
  String get tabEmail => '이메일';

  @override
  String get tabFile => '파일';

  @override
  String get tabLocation => '위치';

  @override
  String get tabPhone => '전화';

  @override
  String get tabSearch => '검색';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => '소셜 미디어';

  @override
  String get tabText => '텍스트';

  @override
  String get tabUrl => '웹 URL';

  @override
  String get tabVideo => '비디오';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => '용량';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max 바이트 ($available 바이트 남음)';
  }

  @override
  String get tagInfoTitle => '태그 정보';

  @override
  String get tagLibraryTitle => '태그 보관함';

  @override
  String get tagNameHint => '예: 주방 태그';

  @override
  String get tagNameLabel => '태그 이름';

  @override
  String get tagReadOnly => '읽기 전용 (잠김)';

  @override
  String tagRulesCount(int count) {
    return '저장된 규칙 / 메모: $count';
  }

  @override
  String get tagRulesSubtitle => 'NDEF 데이터의 SHA-256 해시를 기준으로 일치하는 메모만 표시합니다.';

  @override
  String get tagSerialNumber => '일련번호 (UID)';

  @override
  String get tagTechnology => '기술 규격';

  @override
  String get tagType => '유형';

  @override
  String get tagUidCopied => '태그 UID가 복사되었습니다';

  @override
  String get tagWritable => '쓰기 가능';

  @override
  String get takePhoto => '사진 촬영';

  @override
  String get templateGalleryTitle => '추천 템플릿';

  @override
  String get templateNameHint => '템플릿 이름';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 레코드',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => '템플릿이 저장되었습니다';

  @override
  String get toolsExpertSection => '고급';

  @override
  String get toolsFooterNote =>
      '메모리, 비밀번호 및 고급 명령 기능은 NTAG213/215/216 및 MIFARE Ultralight EV1을 지원합니다.';

  @override
  String get toolsMemorySection => '메모리';

  @override
  String get toolsSecuritySection => '보안';

  @override
  String get toolsTagSection => '태그';

  @override
  String get totalBytes => '총 용량';

  @override
  String get typeTooLarge => 'Type 길이는 255바이트를 초과할 수 없습니다';

  @override
  String get undo => '실행 취소';

  @override
  String get unknownChip16Pages => '알 수 없는 칩 (처음 16페이지)';

  @override
  String get urlSafetyInvalidUrl => '유효하지 않거나 파싱할 수 없는 URL 형식입니다.';

  @override
  String get urlSafetyIpv4 => '도메인 이름 대신 직접 IPv4 주소가 사용되었습니다.';

  @override
  String get urlSafetyIpv6 => '직접 IPv6 주소가 사용되었습니다.';

  @override
  String get urlSafetyMissingScheme => 'URL 프로토콜 스키마(http/https 등)가 누락되었습니다.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return '비표준 네트워크 포트(포트: $port)입니다.';
  }

  @override
  String get urlSafetyPunycode => '국제화 도메인 / 퓨니코드(\"xn--\")가 감지되었습니다.';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return '비표준 URL 스키마입니다: \"$scheme\".';
  }

  @override
  String get urlSafetyUnencrypted => '암호화되지 않은 일반 연결(http://)입니다.';

  @override
  String get urlSafetyUserInfo => 'URL에 사용자 인증 정보가 포함되어 있어 피싱 위험이 있습니다.';

  @override
  String get usernameCannotBeEmpty => '사용자 이름을 입력해주세요.';

  @override
  String get usernameNoSpaces => '사용자 이름에 공백을 포함할 수 없습니다.';

  @override
  String get validAndroidPackage =>
      '유효한 Android 패키지 이름을 입력하세요 (예: com.whatsapp).';

  @override
  String get validBluetoothMac =>
      '유효한 블루투스 MAC 주소를 입력하세요 (예: 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => '유효한 비디오 링크를 입력해주세요.';

  @override
  String get validWebAddress =>
      '유효한 웹 주소를 입력하세요 (예: https://example.com/doc.pdf).';

  @override
  String get verificationNotChecked => '미확인';

  @override
  String get verificationPassed => '통과됨';

  @override
  String get videoUrlCannotBeEmpty => '비디오 링크를 입력해주세요.';

  @override
  String get videoUrlOrId => '영상 링크 또는 YouTube ID';

  @override
  String get videoUrlOrIdPrompt => 'URL (https://...) 또는 YouTube ID를 입력하세요.';

  @override
  String get wifiAuthOpen => '개방형 (비밀번호 없음)';

  @override
  String get wifiAuthType => '보안 유형';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => '숨겨진 네트워크';

  @override
  String get wifiPassword => '비밀번호';

  @override
  String get wifiSsid => '네트워크 이름 (SSID)';

  @override
  String get withSiri => 'Siri 사용';

  @override
  String get writeDumpConfirmButton => '쓰기';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes 바이트) 데이터를 사용자 메모리에 기록합니다. 기존 데이터는 덮어써집니다.';
  }

  @override
  String get writeDumpSubtitle => '저장된 바이너리 파일을 태그에 기록합니다';

  @override
  String get writeDumpTitle => '덤프 쓰기 (.bin)';

  @override
  String get writeHeroButton => '쓰기 시작';

  @override
  String get writeHeroEyebrow => 'NDEF 라이터';

  @override
  String get writeHeroSubtitle => '여러 NDEF 레코드를 준비하여 태그에 한 번에 기록하세요.';

  @override
  String get writeHeroTitle => '태그에 쓰기';

  @override
  String get writeHeroWriting => '기록 중...';

  @override
  String get writeResultFailed => '작업 실패';

  @override
  String get writeResultSuccess => '작업 성공';

  @override
  String get writeTemplates => '쓰기 템플릿';

  @override
  String get writeTemplatesSubtitle =>
      '자주 쓰는 NDEF 데이터를 템플릿으로 저장하여 언제든 간편하게 쓰세요.';

  @override
  String get yes => '예';
}
