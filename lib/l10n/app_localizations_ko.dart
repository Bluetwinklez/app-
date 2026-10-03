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
  String get backupFileSizeExceeded => '백업 파일 크기가 2 MiB를 초과합니다.';

  @override
  String get backupHistoryMustBeList => '\"history\" 필드는 목록 형태여야 합니다.';

  @override
  String backupInvalidJson(String error) {
    return '유효하지 않은 JSON 형식입니다: $error';
  }

  @override
  String get backupInvalidRuleNote => '유효한 규칙 메모여야 합니다.';

  @override
  String get backupInvalidRuleSha => '유효한 64자리 SHA-256 16진수 문자열이어야 합니다.';

  @override
  String get backupInvalidTemplateId => '유효하지 않은 템플릿 ID입니다.';

  @override
  String get backupInvalidTemplateName => '유효하지 않은 템플릿 이름입니다.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return '기록 수가 최대 제한 $max개를 초과했습니다 ($count개).';
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
  String get clearConfirmMessage => '태그의 모든 NDEF 데이터가 삭제됩니다. 계속하시겠습니까?';

  @override
  String get clearConfirmTitle => '태그 내용 초기화';

  @override
  String get clearHistory => '기록 지우기';

  @override
  String get clearTagSubtitle => '모든 레코드를 삭제하고 빈 NDEF를 씁니다';

  @override
  String get clearTagTitle => '태그 내용 지우기';

  @override
  String get close => '닫기';

  @override
  String get commandsEmptyError => '명령어를 하나 이상 입력하세요.';

  @override
  String get commandsLabel => '명령어';

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
  String get contactPhone => '전화번호';

  @override
  String get contactTitle => '직함 / 직책';

  @override
  String get contactWebsite => '웹사이트';

  @override
  String get copy => '복사';

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
  String get deleteTemplateTooltip => '템플릿 삭제';

  @override
  String get deviceNameTooLong => '기기 이름이 너무 깁니다.';

  @override
  String get dismiss => '닫기';

  @override
  String get editRecordTitle => '레코드 편집';

  @override
  String get emailRecipient => '받는 사람 이메일';

  @override
  String get exportBackup => '내보내기';

  @override
  String get facetimePrompt => '전화번호 또는 Apple ID 이메일을 입력하세요.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" 항목을 입력해주세요.';
  }

  @override
  String get flashlight => '손전등';

  @override
  String get formatMemorySubtitle => 'NDEF용으로 초기화합니다 (빈 태그/손상 태그)';

  @override
  String get formatMemoryTitle => '메모리 포맷';

  @override
  String get idTooLarge => 'ID 길이는 255바이트를 초과할 수 없습니다';

  @override
  String get importBackup => '가져오기 (병합)';

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
  String get locationLabel => '위치';

  @override
  String get lockAcknowledge => '이 작업은 취소할 수 없음을 이해했습니다';

  @override
  String get lockTagSubtitle => '태그를 영구 읽기 전용으로 설정합니다 (되돌리기 불가)';

  @override
  String get lockTagTitle => '태그 영구 잠금';

  @override
  String get manage => '관리';

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
  String get nfcPromptClear => '태그를 초기화하려면 기기에 대어주세요';

  @override
  String get nfcPromptLock => '영구 잠금할 태그를 기기에 대어주세요';

  @override
  String get nfcPromptScan => '태그를 휴대폰 상단에 대세요';

  @override
  String get nfcPromptWrite => '데이터를 기록할 NFC 태그를 대어주세요';

  @override
  String get no => '아니요';

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
  String get rawRecordDetailsTitle => '레코드 세부 정보 (읽기 전용)';

  @override
  String get rawRecordEditorTitle => '원시 NDEF 레코드 편집';

  @override
  String get readHeroButton => '스캔 시작';

  @override
  String get readMemorySubtitle => '페이지별 원시 메모리; 복사 또는 .bin 저장';

  @override
  String get readMemoryTitle => '메모리 읽기';

  @override
  String get readyTemplates => '추천 템플릿';

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
  String get redo => '다시 실행';

  @override
  String get removePasswordSubtitle => '설정된 비밀번호를 입력해 보호를 해제합니다';

  @override
  String get removePasswordTitle => '비밀번호 해제';

  @override
  String get rewriteTag => '다시 쓰기';

  @override
  String ruleDeleteConfirm(String note) {
    return '\"$note\" 메모가 포함된 규칙을 삭제하시겠습니까?';
  }

  @override
  String get ruleNoteDialogTitle => '태그 메모 편집';

  @override
  String get ruleNoteLabel => '앱 내 메모 / 라벨';

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
  String get scanFabLabel => '태그 스캔';

  @override
  String get scannedTag => '스캔된 태그';

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
  String get socialUsername => '사용자 이름 / 아이디';

  @override
  String get sourceSelectPrompt => '태그 데이터를 어디서 가져올까요?';

  @override
  String get statusCancelled => '취소됨';

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
  String get tabContact => '연락처 (vCard)';

  @override
  String get tabCustomMime => '사용자 지정 MIME';

  @override
  String get tabEmail => '이메일';

  @override
  String get tabPhone => '전화';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabText => '텍스트';

  @override
  String get tabUrl => '웹 URL';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => '태그 정보';

  @override
  String get tagLibraryTitle => '태그 보관함';

  @override
  String tagRulesCount(int count) {
    return '저장된 규칙 / 메모: $count';
  }

  @override
  String get tagRulesSubtitle => 'NDEF 데이터의 SHA-256 해시를 기준으로 일치하는 메모만 표시합니다.';

  @override
  String get tagWritable => '쓰기 가능';

  @override
  String get takePhoto => '사진 촬영';

  @override
  String get templateNameHint => '템플릿 이름';

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
  String get verificationNotChecked => '확인되지 않음';

  @override
  String get verificationPassed => '통과';

  @override
  String get videoUrlCannotBeEmpty => '비디오 링크를 입력해주세요.';

  @override
  String get videoUrlOrIdPrompt => 'URL (https://...) 또는 YouTube ID를 입력하세요.';

  @override
  String get wifiAuthOpen => '개방형 (비밀번호 없음)';

  @override
  String get wifiPassword => '비밀번호';

  @override
  String get wifiSsid => '네트워크 이름 (SSID)';

  @override
  String get withSiri => 'Siri 사용';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes 바이트) 데이터를 사용자 메모리에 기록합니다. 기존 데이터는 덮어써집니다.';
  }

  @override
  String get writeDumpSubtitle => '저장된 바이너리 파일을 태그에 기록합니다';

  @override
  String get writeDumpTitle => '덤프 쓰기 (.bin)';

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
  String get unknown => '알 수 없음';

  @override
  String get error => '오류';

  @override
  String get nfcPromptReady => '태그를 대세요';

  @override
  String get invalidResponseFormat => '잘못된 응답 형식을 받았습니다';

  @override
  String get nfcReadError => 'NFC 읽기 오류';

  @override
  String get invalidPlatformResponse => '플랫폼에서 잘못된 응답을 받았습니다';

  @override
  String get writeFailed => '쓰기 실패';

  @override
  String get lockFailed => '잠금 실패';

  @override
  String get failedToConnectTag => '태그에 연결할 수 없습니다';

  @override
  String get invalidTagResponse => '태그의 응답이 올바르지 않습니다';

  @override
  String get commandFailed => '명령 실패';

  @override
  String get ndefTypeOrIdTooLong => 'NDEF 유형 또는 ID가 255바이트를 초과합니다';

  @override
  String get ndefUnsupportedOrInvalidRecord => '지원되지 않거나 잘못된 NDEF 레코드';

  @override
  String get ndefMissingTypeLength => 'NDEF 유형 길이가 없습니다';

  @override
  String get ndefMissingPayloadLength => 'NDEF 페이로드 길이가 없습니다';

  @override
  String get ndefMissingIdLength => 'NDEF ID 길이가 없습니다';

  @override
  String get ndefMissingType => 'NDEF 유형이 없습니다';

  @override
  String get ndefMissingId => 'NDEF ID가 없습니다';

  @override
  String get ndefMissingPayload => 'NDEF 페이로드가 없습니다';

  @override
  String get unprotected => '(비밀번호 없음)';

  @override
  String get binaryDataPreview => '(바이너리 데이터)';

  @override
  String get emptyValue => '(비어 있음)';

  @override
  String get tnfEmpty => '0: Empty (비어 있음)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (알 수 없음)';

  @override
  String get tnfUnchanged => '6: Unchanged (청크 NDEF)';

  @override
  String get tnfReserved => '7: Reserved (예약됨)';

  @override
  String get ntagUnsupportedChip =>
      '이 작업은 NTAG213/215/216 및 MIFARE Ultralight EV1 태그에서만 지원됩니다.';

  @override
  String ntagPageReadFailed(String page) {
    return '페이지 $page을(를) 읽을 수 없습니다(태그가 응답하지 않거나 보호된 영역).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return '페이지 $page에 쓸 수 없습니다: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return '페이지 $page에 쓸 수 없습니다(태그 거부; 잠겨 있거나 비밀번호로 보호됨).';
  }

  @override
  String ntagProtectedArea(String page) {
    return '페이지 $page 이후를 읽을 수 없습니다. 이 영역은 비밀번호로 보호되어 있을 수 있습니다.';
  }

  @override
  String get ntagPasswordPackSize => '비밀번호는 4바이트, PACK은 2바이트여야 합니다.';

  @override
  String get ntagPasswordSize => '비밀번호는 4바이트여야 합니다.';

  @override
  String get ntagPasswordWrongOrAuthFailed => '비밀번호가 올바르지 않거나 태그가 인증을 거부했습니다.';

  @override
  String get ntagPasswordWrong => '비밀번호가 올바르지 않습니다.';

  @override
  String get ntagCcInvalid =>
      '태그의 CC 영역에 NDEF 이외의 값이 기록되었습니다. 이 OTP 영역은 포맷할 수 없습니다.';

  @override
  String get ntagDumpTooShort => '덤프 파일이 너무 짧아 사용자 데이터가 없습니다.';

  @override
  String get ntagInvalidHex => '올바른 16진수 값을 입력하세요(예: 30 04).';

  @override
  String get googleReviewFieldLabel => '리뷰 링크 또는 Place ID';

  @override
  String get menuLinkFieldLabel => '메뉴 링크';

  @override
  String get menuTitleHint => '메뉴';

  @override
  String get petName => '반려동물 이름';

  @override
  String get ownerPhone => '주인 전화번호';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return '안녕하세요, 저는 $pet입니다! 주인에게 전화해 주세요: $phone$note';
  }

  @override
  String get bloodType => '혈액형';

  @override
  String get allergies => '알레르기 / 약물';

  @override
  String get emergencyContact => '비상 연락처';

  @override
  String get emergencyInfo => '응급 정보';

  @override
  String emergencyBlood(String blood) {
    return '혈액형: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return '알레르기: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return '비상시 전화: $contact';
  }

  @override
  String get storeLink => '스토어 링크';

  @override
  String get link => '링크';

  @override
  String get title => '제목';

  @override
  String get webAddress => '웹 주소';

  @override
  String get address => '주소';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return '템플릿: $added개 추가됨, $updated개 업데이트됨';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return '태그 메모/규칙: $added개 추가됨, $updated개 업데이트됨';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return '기기에서 검사 기록이 비활성화되어 건너뛰었습니다: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return '기록: $added개 추가됨, $skipped개 건너뜀';
  }

  @override
  String get backupSummaryNoNewData => '가져올 새 데이터를 찾을 수 없습니다(기존 레코드와 일치함).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field은(는) 문자열이어야 합니다.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field은(는) 올바른 날짜여야 합니다.';
  }

  @override
  String get rawTypeHexLabel => '유형(16진수 바이트)';

  @override
  String get rawIdHexLabel => 'ID(16진수 바이트, 선택사항)';

  @override
  String get rawPayloadHexLabel => '페이로드(16진수 바이트)';

  @override
  String get rawOptionalHexHint => '선택적 16진수 바이트';

  @override
  String get saveChanges => '변경사항 저장';

  @override
  String get edit => '편집';

  @override
  String get clearAllButton => '모두 지우기';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: $count페이지 읽음';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip 포맷 완료';
  }

  @override
  String get ntagInvalidDumpFile => '유효하지 않은 덤프 파일 (4바이트의 배수, 32~1024바이트여야 함).';

  @override
  String ntagPagesWritten(int count) {
    return '$count페이지 기록됨';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: 비밀번호 보호 활성화됨';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: 비밀번호가 제거됨';
  }

  @override
  String get memoryDumpCopied => '메모리 덤프가 복사됨';

  @override
  String ntagCommandsSent(int count) {
    return '$count개 명령 전송됨';
  }

  @override
  String get emptyResponse => '(빈 응답)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages페이지 · $bytes바이트';
  }

  @override
  String get composeTextEmpty => '텍스트 내용은 비어 있을 수 없습니다.';

  @override
  String get composeTextTooLong => '텍스트가 너무 깁니다(최대 5000자).';

  @override
  String get composeUrlInvalid =>
      '유효한 주소를 입력하세요(예: https://example.com 또는 app:// 링크).';

  @override
  String get composeUrlTooLong => 'URL이 너무 깁니다(최대 2000자).';

  @override
  String get composeEmailInvalid => '유효한 이메일 주소를 입력하세요(예: name@domain.com).';

  @override
  String get composePhoneInvalid => '유효한 전화번호를 입력하세요(예: +905551234567).';

  @override
  String get composeSmsPhoneInvalid => '유효한 수신자 전화번호를 입력하세요.';

  @override
  String get composeLatInvalid => '위도는 -90에서 +90 사이여야 합니다.';

  @override
  String get composeLngInvalid => '경도는 -180에서 +180 사이여야 합니다.';

  @override
  String get composeVcardNameEmpty => '연락처 이름은 비어 있을 수 없습니다.';

  @override
  String get composeVcardNameTooLong => '연락처 이름이 너무 깁니다(최대 200자).';

  @override
  String get composeVcardEmailInvalid => '유효한 이메일 주소를 입력하세요.';

  @override
  String get composeVcardPhoneInvalid => '유효한 전화번호를 입력하세요.';

  @override
  String get composeVcardUrlInvalid => '유효한 웹 주소를 입력하세요(예: https://...).';

  @override
  String get composeCalSummaryEmpty => '일정 제목은 비어 있을 수 없습니다.';

  @override
  String get composeCalSummaryTooLong => '일정 제목이 너무 깁니다(최대 250자).';

  @override
  String get composeCalDateInvalid => '종료 시간은 시작 시간 이후여야 합니다.';

  @override
  String get composeSpUriInvalid => '유효한 대상 URL을 입력하세요(예: https://...).';

  @override
  String get composeSpLangInvalid => '유효한 ISO 언어 코드를 입력하세요(예: ko, en).';

  @override
  String get composeMimeTypeInvalid =>
      '유효한 MIME 유형을 입력하세요(예: application/json, text/plain).';

  @override
  String get composeMimeHexInvalid => '유효한 16진수 문자열을 입력하세요(짝수 개의 16진수 문자).';

  @override
  String get composeMimePayloadTooLarge => '페이로드 크기가 너무 큽니다(최대 10 KB).';

  @override
  String get composeWifiSsidEmpty => '네트워크 이름(SSID)은 비어 있을 수 없습니다.';

  @override
  String get composeWifiPasswordRequired => '암호화된 네트워크에는 Wi-Fi 비밀번호가 필요합니다.';

  @override
  String get composeWifiPasswordLength => 'WPA/WPA2 비밀번호는 8자에서 63자 사이여야 합니다.';

  @override
  String get composeEditNdefRecord => 'NDEF 레코드 편집';

  @override
  String get composeNewNdefRecord => '새 NDEF 레코드 생성';

  @override
  String get quickLinksHeader => '빠른 링크';

  @override
  String get quickLinkCustomUri => '사용자 정의 URI';

  @override
  String get quickLinkSocial => '소셜 네트워크';

  @override
  String get quickLinkVideo => '비디오';

  @override
  String get quickLinkSearch => '검색';

  @override
  String get quickLinkFile => '파일';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime 오디오';

  @override
  String get quickLinkAddress => '주소';

  @override
  String get quickLinkPayment => '결제 링크';

  @override
  String get quickLinkApp => '앱 (Android)';

  @override
  String get updateRecord => '레코드 업데이트';

  @override
  String get addToList => '목록에 추가';

  @override
  String get quickCustomUriError =>
      '스킴을 포함한 주소를 입력하세요(예: spotify:track:... 또는 myapp://page).';

  @override
  String get quickFileEmptyMessage => '파일 링크를 입력하세요.';

  @override
  String get quickPaymentEmptyMessage => '결제 링크를 입력하세요.';

  @override
  String get quickCustomUriDesc => '스킴으로 시작하는 주소를 입력할 수 있으며 휴대폰에서 지원 앱을 엽니다.';

  @override
  String get quickSocialLabel => '소셜 네트워크';

  @override
  String get quickVideoLabel => '동영상 링크';

  @override
  String get quickVideoHint => 'https://youtu.be/... 또는 동영상 ID';

  @override
  String get quickVideoDesc =>
      'YouTube, Vimeo 등의 링크 또는 YouTube 동영상 ID만 입력할 수 있습니다.';

  @override
  String get quickSearchHint => '예: 서울 날씨';

  @override
  String get quickFileLabel => '파일 링크';

  @override
  String get quickFileDesc =>
      '태그 용량이 작기 때문에 파일 자체가 아닌 웹 링크가 기록됩니다(Google Drive, Dropbox 등).';

  @override
  String get quickPhoneOrAppleId => '전화번호 또는 Apple ID';

  @override
  String get quickFacetimeVideoDesc =>
      '태그를 터치한 iPhone에서 FaceTime 영상 통화를 시작합니다.';

  @override
  String get quickFacetimeAudioDesc =>
      '태그를 터치한 iPhone에서 FaceTime 음성 통화만 시작합니다.';

  @override
  String get quickMapProvider => '지도 앱';

  @override
  String get quickAddressHint => '예: 서울시 중구 세종대로 110';

  @override
  String get quickPaymentDesc =>
      'PayPal.me, Stripe 등의 결제 링크를 사용할 수 있습니다. 카드 정보는 절대 태그에 기록되지 않습니다.';

  @override
  String get quickAppDesc =>
      'Android 휴대폰은 터치 시 이 앱을 엽니다(미설치 시 Play 스토어 열림). iPhone은 이 유형을 무시하므로 App Store 링크를 URL로 추가하세요.';

  @override
  String get quickDeviceNameOptional => '기기 이름(선택 사항)';

  @override
  String get quickSpeakerHint => '예: 스피커';

  @override
  String get quickBluetoothDesc =>
      'Android 휴대폰은 터치 시 이 기기와의 페어링을 제안합니다. iPhone은 Bluetooth 페어링 태그를 지원하지 않습니다.';

  @override
  String get composeTextContent => '텍스트 내용';

  @override
  String get composeTextHint => '작성할 텍스트를 입력하세요';

  @override
  String get composeEmailSubjectOptional => '제목(선택 사항)';

  @override
  String get composeEmailBodyOptional => '메시지 본문(선택 사항)';

  @override
  String get composeSmsRecipient => '수신자 전화번호';

  @override
  String get composeSmsHint => '보낼 SMS 메시지...';

  @override
  String get composeVcardFullName => '전체 이름(표시 이름) *';

  @override
  String get composeVcardNameHint => '홍길동';

  @override
  String get composeVcardNote => '메모 / 설명';

  @override
  String get composeCalTitle => '일정 제목 *';

  @override
  String get composeCalTitleHint => '프로젝트 회의';

  @override
  String get composeCalLocationHint => '회의실 2 또는 온라인';

  @override
  String get composeCalDesc => '일정 설명';

  @override
  String get composeCalStartEndTime => '시작 및 종료 시간:';

  @override
  String get composeSpTitleLabel => '제목(표시 텍스트)';

  @override
  String get composeSpTitleHint => '회사 브로셔';

  @override
  String get composeMimeTypeLabel => 'MIME 유형 *';

  @override
  String get composeDataFormat => '데이터 형식: ';

  @override
  String get composeFormatHex => '16진수 (Hex)';

  @override
  String get composeMimeHexBytes => '16진수 바이트 *';

  @override
  String get composeMimeTextPayload => '페이로드 텍스트 (UTF-8) *';

  @override
  String get composeWifiWarningTitle => '보안 및 플랫폼 주의 사항:';

  @override
  String get composeWifiWarningBody =>
      '• 태그에 기록된 Wi-Fi 비밀번호는 일반 텍스트로 저장되어 누구나 읽을 수 있습니다.\n• 터치 시 자동 연결이 보장되지 않으며 사용자 확인이 필요할 수 있습니다.';

  @override
  String get composeWifiSsidLabel => '네트워크 이름 (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => '보안 유형 (인증)';

  @override
  String get composeWifiOpenNetwork => '개방형 네트워크 (비밀번호 없음)';

  @override
  String get composeWifiPasswordLabel => 'Wi-Fi 비밀번호 *';

  @override
  String get composeWifiEncryptionLabel => '암호화 유형';

  @override
  String get composeWifiAesRecommended => 'AES (권장)';

  @override
  String get quickSearchTextLabel => '검색할 텍스트';

  @override
  String get readTagMemoryPrompt => '메모리를 읽으려면 태그를 휴대폰에 대세요';

  @override
  String get readingTagMemoryStatus => '메모리 읽는 중...';

  @override
  String get formatTagConfirmTitle => '메모리 포맷';

  @override
  String get formatTagConfirmMessage =>
      '태그의 데이터가 삭제되고 빈 NDEF로 준비됩니다. 계속하시겠습니까?';

  @override
  String get formatButton => '포맷';

  @override
  String get formatTagPrompt => '포맷할 태그를 대세요';

  @override
  String get formattingStatus => '포맷 중...';

  @override
  String filePickerFailed(String error) {
    return '파일 선택기 열기 실패: $error';
  }

  @override
  String get writeButton => '쓰기';

  @override
  String get writeDumpPrompt => '덤프를 기록할 태그를 대세요';

  @override
  String get writingDumpStatus => '덤프 쓰는 중...';

  @override
  String get setPasswordWarning =>
      '비밀번호를 잊어버리면 내용을 다시 변경할 수 없습니다. 읽기는 공개된 상태로 유지됩니다.';

  @override
  String get setPasswordAction => '비밀번호 설정';

  @override
  String get setPasswordPrompt => '비밀번호를 설정할 태그를 대세요';

  @override
  String get settingPasswordStatus => '비밀번호 설정 중...';

  @override
  String get removePasswordPromptMessage => '이전에 태그에 설정한 비밀번호를 입력하세요.';

  @override
  String get remove => '제거';

  @override
  String get removePasswordPrompt => '비밀번호를 제거할 태그를 대세요';

  @override
  String get removingPasswordStatus => '비밀번호 제거 중...';

  @override
  String get sendCommandsPrompt => '명령을 보낼 태그를 대세요';

  @override
  String get sendingCommandsStatus => '명령 전송 중...';

  @override
  String get sendButton => '전송';

  @override
  String get tagNoteEditTitle => '태그 메모 편집';

  @override
  String get tagNoteInputLabel => '앱 내 메모 / 설명';

  @override
  String get tagNoteInputHint => '예: 회의실 정보 또는 창고 선반 #12';

  @override
  String get tagNoteDeleteTitle => '태그 메모 삭제';

  @override
  String get clearAllTagRulesTitle => '모든 메모 삭제';

  @override
  String get clearAllTagRulesConfirm => '저장된 모든 앱 내 태그 메모가 삭제됩니다. 확인하시겠습니까?';

  @override
  String get deleteAll => '모두 삭제';

  @override
  String get tagRulesExplanation =>
      'NDEF SHA-256 다이제스트와 일치하는 태그에는 저장된 메모만 표시됩니다. 외부 동작은 실행되지 않습니다.';

  @override
  String get noTagRulesDefined => '정의된 태그 메모가 없습니다.';

  @override
  String lastUpdated(String time) {
    return '마지막 업데이트: $time';
  }

  @override
  String get tagLibraryNoMatch => '검색과 일치하는 태그가 없습니다.';

  @override
  String get tagLibraryAddToLibrary => '라이브러리에 추가';

  @override
  String get name => '이름';

  @override
  String get tagLibraryAddTag => '태그 추가';

  @override
  String get all => '전체';

  @override
  String tagLibraryPhotoError(String error) {
    return '사진을 선택하지 못했습니다: $error';
  }

  @override
  String get tagLibraryDeleteTitle => '태그 삭제';

  @override
  String get tagLibraryNameHint => '예: 사무실 열쇠고리';

  @override
  String get tagLibraryNoTagContent => '이 레코드에 태그 내용이 없습니다.';

  @override
  String get tagLibrarySourceLastScanned => '최근 스캔';

  @override
  String get tagLibraryEmpty => '저장된 태그가 없습니다.';

  @override
  String get tagLibrarySourceEmpty => '빈 레코드';

  @override
  String get tagLibraryNamePrompt => '태그 이름을 입력하세요';

  @override
  String get tagLibrarySearchHint => '이름, 카테고리 또는 위치로 검색...';

  @override
  String get tagLibrarySourceWriteList => '쓰기 목록';

  @override
  String get tagLibraryLocationHint => '예: 책상, 현관문';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return '라이브러리에서 \"$name\" 태그를 삭제하시겠습니까?';
  }

  @override
  String get noContent => '내용 없음';

  @override
  String tagLibraryRecordSummary(num count) {
    return '$count개의 NDEF 레코드';
  }

  @override
  String get tagLibraryEditTag => '태그 편집';

  @override
  String get rawTypeHexHint => '41 (A) 또는 55 (U) 등';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: \"records\" 필드는 목록이어야 합니다.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: 항목에는 최대 $max개의 NDEF 레코드가 포함될 수 있습니다.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - 레코드 #$index이(가) 유효한 객체가 아닙니다.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - 레코드 #$index: 유효하지 않은 TNF 값 ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - 레코드 #$index: \"type\"은 Base64 문자열이어야 합니다.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - 레코드 #$index: \"type\"이(가) 유효한 Base64 데이터가 아닙니다($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - 레코드 #$index: \"id\"는 Base64 문자열이어야 합니다.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - 레코드 #$index: \"id\"가 유효한 Base64 데이터가 아닙니다($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - 레코드 #$index: \"payload\"는 Base64 문자열이어야 합니다.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - 레코드 #$index: \"payload\"가 유효한 Base64 데이터가 아닙니다($error).';
  }

  @override
  String get composerUndoSnack => '마지막 변경 사항이 취소되었습니다.';

  @override
  String get composerRedoSnack => '변경 사항이 다시 실행되었습니다.';

  @override
  String get noRecordsToCopy => '복사할 NDEF 레코드가 없습니다.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count개의 NDEF 레코드($bytes B)가 클립보드에 복사되었습니다.\n(NDEF 내용만 복사되며 UID나 암호화된 섹터는 복제되지 않습니다)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: $count개 레코드 추가됨.';
  }

  @override
  String get tagEmptyNoRecordsToImport => '태그가 비어 있습니다. 가져올 레코드가 없습니다.';

  @override
  String get sourceTag => '태그에서';

  @override
  String get sourceQr => 'QR 코드에서';

  @override
  String filePickerError(String error) {
    return '파일 선택기를 열 수 없습니다: $error';
  }

  @override
  String get csvFileTooLarge => 'CSV 파일이 너무 큽니다(최대 512 KB).';

  @override
  String get noRecordsFound => '레코드를 찾을 수 없음';

  @override
  String get someRowsSkipped => '일부 행 건너뜀';

  @override
  String get expectedFormat => '예상 형식:';

  @override
  String get noClipboardContent => '클립보드에 복사된 NDEF 내용이 없습니다.';

  @override
  String get pasteFromClipboardTitle => 'NDEF 클립보드에서 붙여넣기';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return '클립보드 데이터: $count개 레코드, $bytes바이트($source)';
  }

  @override
  String get clipboardPastePrompt => '현재 레코드를 대체하시겠습니까, 아니면 끝에 추가하시겠습니까?';

  @override
  String get pasteOverwriteOption => '덮어쓰기 (교체)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return '현재 $count개의 레코드가 삭제되고 클립보드 내용으로 대체됩니다(확인 필요).';
  }

  @override
  String get pasteEmptySubtitle => '클립보드 내용이 작성기에 추가됩니다.';

  @override
  String get pasteAppendOption => '끝에 추가';

  @override
  String get pasteAppendSubtitle => '현재 레코드는 유지되며 클립보드의 레코드가 목록 끝에 추가됩니다.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count개 레코드 추가됨.';
  }

  @override
  String get confirmOverwriteTitle => '레코드를 덮어쓰시겠습니까?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return '현재 $currentCount개의 레코드가 있습니다. 클립보드의 $newCount개 레코드로 대체됩니다. 계속하시겠습니까?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return '$count개의 레코드로 대체되었습니다.';
  }

  @override
  String get yesReplace => '예, 교체';

  @override
  String recordsImportedToComposer(num count) {
    return '$count개 레코드 가져옴.';
  }

  @override
  String get noContentToCopy => '복사할 NDEF 콘텐츠를 찾을 수 없습니다.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count개의 NDEF 레코드가 복사되어 추가되었습니다(내용은 복사되지만 UID는 복제되지 않음).';
  }

  @override
  String get noContentToRewrite => '다시 쓸 NDEF 콘텐츠를 찾을 수 없습니다.';

  @override
  String get rewriteTagTitle => '태그 다시 쓰기';

  @override
  String get importantNotice => '중요 알림:';

  @override
  String get rewriteNotice1 =>
      '• 이 작업은 대상 태그의 기존 NDEF 내용을 완전히 덮어씁니다(추가되지 않음).\n';

  @override
  String get rewriteNotice2 => '• 대상 태그는 쓰기 가능한(잠금 해제된) NDEF 태그여야 합니다.\n';

  @override
  String get rewriteNotice3 => '• 이전 태그에 자동으로 쓰지 않으며 새 NFC 터치가 필요합니다.';

  @override
  String get rewriteInstruction =>
      '대상 태그를 준비하고 \"터치하여 쓰기\"를 누른 뒤 태그를 휴대폰에 대세요.';

  @override
  String get tapAndWrite => '터치하여 쓰기';

  @override
  String get rewritePromptMessage => '대상 태그를 기기에 대세요(내용이 완전히 갱신됩니다)';

  @override
  String get writeVerifiedTitle => '쓰기 확인 완료';

  @override
  String get writeVerifiedDesc => 'NDEF 콘텐츠가 대상 태그에 성공적으로 기록되고 확인되었습니다.';

  @override
  String get writeVerifiedHint => '다음 스캔을 시작하여 기록된 데이터를 확인하거나 비교할 수 있습니다.';

  @override
  String get scanAndCompareNow => '지금 스캔하여 비교';

  @override
  String get contentMatchesExactly => '콘텐츠가 정확히 일치합니다';

  @override
  String get differenceDetected => '차이점 발견됨';

  @override
  String get compareMatchDesc =>
      '대상 태그의 NDEF 메시지가 기록된 소스 NDEF 메시지와 바이트 단위로 정확히 일치합니다.';

  @override
  String get compareDiffDesc =>
      '읽은 데이터와 기록할 데이터 사이에 차이가 있습니다. 태그가 잠겨 있는지 확인하세요.';

  @override
  String get batchEmptyComposerError =>
      '일괄 쓰기를 시작하기 전에 작성기에 최소 하나의 레코드를 추가하세요.';

  @override
  String get batchWriteTitle => '일괄 태그 쓰기';

  @override
  String get batchWriteSubtitle => '동일한 NDEF 콘텐츠를 여러 태그에 순차적으로 기록할 수 있습니다.';

  @override
  String get attention => '주의:';

  @override
  String get batchNotice1 =>
      '• 동일한 태그에 중복 기록되는 것을 방지하기 위해 각 쓰기는 \"다음 쓰기\" 버튼으로 명시적으로 시작됩니다.\n';

  @override
  String get batchNotice2 => '• 자동 연속 스캔은 수행되지 않으며 각 태그를 물리적으로 교체해야 합니다.';

  @override
  String get batchStartButton => '일괄 쓰기 시작';

  @override
  String get batchControlPanelTitle => '일괄 쓰기 제어판';

  @override
  String get batchCancelOrClose => '취소 / 닫기';

  @override
  String get batchAllCompleted => '모든 태그 시도가 완료되었습니다!';

  @override
  String batchStats(String ok, String failed, String left) {
    return '성공: $ok | 실패: $failed | 남음: $left';
  }

  @override
  String get waitingForTag => '태그 대기 중...';

  @override
  String get batchFinishButton => '일괄 쓰기 완료';

  @override
  String get writeError => '쓰기 오류';

  @override
  String get batchConfirmCancelTitle => '일괄 쓰기 취소';

  @override
  String get batchConfirmCancelMessage =>
      '일괄 쓰기 세션을 종료하시겠습니까? 지금까지 기록된 태그는 유지되며 나머지 태그는 기록되지 않습니다.';

  @override
  String get cancelled => '취소됨';

  @override
  String get batchCancelledSnack => '일괄 쓰기가 취소되었습니다. 작성기 내용이 보존되었습니다.';

  @override
  String get cancelAndClose => '취소 및 닫기';

  @override
  String get urlSafetyOfflineAnalysisTitle => '오프라인 URL 분석';

  @override
  String get urlSafetyScheme => '스킴 (프로토콜):';

  @override
  String get urlSafetyPort => '포트:';

  @override
  String get urlSafetyUserInfoLabel => '사용자 정보:';

  @override
  String get urlSafetyIpLiteral => '직접 IP 주소:';

  @override
  String get urlSafetyDomain => '아니요 (도메인 이름)';

  @override
  String get urlSafetyPunycodeLabel => '국제 / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => '예 (동형이의어 의심)';

  @override
  String get urlSafetyWarningsHeader => '보안 / 주의 알림:';

  @override
  String get urlSafetyDisclaimer =>
      '참고: 이 분석은 로컬 오프라인 규칙을 기반으로 합니다. 온라인 바이러스 검사가 아니며 URL이 자동으로 열리지 않습니다.';

  @override
  String get templateSaveEmptyError => '템플릿으로 저장하기 전에 레코드를 추가하세요.';

  @override
  String templateDefaultName(String n) {
    return '템플릿 $n';
  }

  @override
  String get templateNameSample => '예: 회사 웹사이트 및 연락처';

  @override
  String get templateSavedSnack => '템플릿이 저장되었습니다.';

  @override
  String get ruleNoteRequiresNdef => '메모를 추가하려면 태그에 최소 하나의 NDEF 레코드가 있어야 합니다.';

  @override
  String get ruleNoteAddTitle => '사용자 지정 태그 메모 추가';

  @override
  String get ruleNoteDigestExplanation =>
      '이 메모는 태그 NDEF SHA-256 다이제스트에 바인딩됩니다. 태그 스캔 시 이 설명만 표시됩니다.';

  @override
  String get ruleNoteSavedSnack => '태그 메모가 저장되었습니다.';

  @override
  String get ruleNoteDeleteConfirm => '이 태그의 앱 내 메모가 삭제됩니다. 계속하시겠습니까?';

  @override
  String get ruleNoteDeletedSnack => '태그 메모가 삭제되었습니다.';

  @override
  String get backupExportTitle => '백업 내보내기';

  @override
  String get backupExportWarningTitle => '개인정보 보호 및 보안 경고';

  @override
  String get backupExportWarningBody =>
      '내보낸 백업 파일(JSON)은 일반 텍스트입니다. Wi-Fi 비밀번호나 연락처 등 민감한 데이터가 포함될 수 있습니다. 안전하게 보관하세요.';

  @override
  String get backupIncludedItems => '포함할 항목:';

  @override
  String backupTemplatesCount(String count) {
    return '• 템플릿: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• 태그 메모/규칙: $count';
  }

  @override
  String get backupIncludeHistoryOptional => '스캔 기록 포함 (선택 사항)';

  @override
  String backupHistoryCount(String count) {
    return '기록 $count개';
  }

  @override
  String get backupHistoryDisabled => '이 기기에서는 스캔 기록이 비활성화되어 있습니다';

  @override
  String get backupExportAndShare => '내보내기 및 공유';

  @override
  String get backupFileNameLabel => 'NFC Tag Master 백업 파일';

  @override
  String get backupFileShareSubject => 'NFC Tag Master 템플릿 및 데이터 백업 (JSON)';

  @override
  String get backupExportSuccessSnack => '백업 파일이 성공적으로 내보내지고 공유되었습니다.';

  @override
  String get backupExportCancelled => '내보내기 공유가 취소되었습니다.';

  @override
  String get backupImportTitle => '백업 가져오기';

  @override
  String get backupMergeRuleTitle => '보안 및 병합 규칙';

  @override
  String get backupMergeRule1 => '• 가져오기는 병합 방식으로 작동하며 기존 레코드는 절대 삭제되지 않습니다.\n';

  @override
  String get backupMergeRule2 =>
      '• 백업 파일에 Wi-Fi 비밀번호나 개인정보가 포함될 수 있으므로 신뢰할 수 있는 소스에서만 로드하세요.\n';

  @override
  String get backupMergeRule3 =>
      '• 파일 크기 제한: 2 MiB. 로드하기 전에 엄격한 스키마 및 Base64 검증을 거칩니다.';

  @override
  String get backupSelectFilePrompt => '병합할 유효한 .json 백업 파일을 선택하세요.';

  @override
  String get selectFileButton => '파일 선택';

  @override
  String get fileSelectionCancelled => '파일 선택이 취소되었습니다.';

  @override
  String get backupFileExceedsLimit => '선택한 파일이 허용된 2 MiB 제한을 초과합니다.';

  @override
  String fileReadError(String error) {
    return '파일 읽기 오류: $error';
  }

  @override
  String backupValidationError(String error) {
    return '백업 검증 오류: $error';
  }

  @override
  String get backupHistoryDetectedTitle => '스캔 기록 감지됨';

  @override
  String get backupHistoryDetectedPrompt =>
      '기록도 가져오고 활성화하시겠습니까? 아니면 기록을 건너뛰고 템플릿과 메모만 가져올까요?';

  @override
  String get backupSkipHistoryOption => '기록 건너뛰기 (템플릿 및 메모만 로드)';

  @override
  String get backupEnableHistoryOption => '기록 활성화 및 로드';

  @override
  String get nfcReadyStatus => 'NFC 준비됨';

  @override
  String get nfcReadyDesc => 'NFC 하드웨어가 활성화되어 사용 준비가 되었습니다';

  @override
  String get nfcDisabledStatus => 'NFC 꺼짐';

  @override
  String get nfcDisabledDesc => 'NFC가 꺼져 있습니다. 기기 설정에서 켜주세요.';

  @override
  String get template => '템플릿';

  @override
  String get nfcScannerTitle => 'NFC 스캐너';

  @override
  String get composeRecord => '레코드 생성';

  @override
  String get protectOrRemove => '보호 / 제거';

  @override
  String get previousScans => '이전 스캔';

  @override
  String get noScannedTagYet => '스캔된 NFC 태그가 아직 없습니다';

  @override
  String get tapScanPrompt => '\"스캔 시작\"을 누르고 태그를 휴대폰에 대세요.';

  @override
  String get ndefCopyAndRewriteTitle => 'NDEF 콘텐츠 복사 및 다시 쓰기';

  @override
  String get savedTagNoteHeader => '저장된 태그 메모 (앱 내 규칙)';

  @override
  String get tagNoteOrRule => '태그 메모 / 규칙';

  @override
  String get editNote => '메모 편집';

  @override
  String get deleteNote => '메모 삭제';

  @override
  String get tagNoteDigestNotice =>
      '이 메모는 정확한 NDEF 바이트의 SHA-256 다이제스트와 일치합니다. 외부 작업을 트리거하지 않습니다.';

  @override
  String get addCustomTagNotePrompt =>
      '이 NDEF 콘텐츠에 대한 사용자 지정 로컬 메모나 설명을 추가할 수 있습니다.';

  @override
  String get addNoteToThisTag => '이 태그에 메모 추가';

  @override
  String get ndefSupport => 'NDEF 지원:';

  @override
  String get usedSpace => '사용된 공간:';

  @override
  String get freeSpace => '여유 공간:';

  @override
  String get noNdefMessageOnTag => '태그에 저장된 NDEF 메시지를 찾을 수 없습니다.';

  @override
  String get hideDetails => '세부정보 숨기기';

  @override
  String get advancedRecordInspector => '레코드 검사기 (고급)';

  @override
  String get ndefRecordInspectorTitle => '고급 NDEF 레코드 검사기';

  @override
  String get inspectorType => '유형:';

  @override
  String get inspectorPayloadLength => '페이로드 길이:';

  @override
  String get inspectorRawHexPreview => '원시 16진수 미리보기 (제한됨):';

  @override
  String get ndefRecordsToWriteTitle => '기록할 NDEF 레코드';

  @override
  String get pasteFromClipboardAction => '클립보드에서 붙여넣기 (대체 / 추가)';

  @override
  String get importAction => '가져오기';

  @override
  String get importFromTagAction => 'NFC 태그에서 가져오기';

  @override
  String get importFromQrAction => 'QR 코드에서 가져오기';

  @override
  String get importFromCsvAction => 'CSV 파일에서 가져오기';

  @override
  String get composerEmptyDescription =>
      '태그에 텍스트, 웹 링크, Wi-Fi, 전화번호, 이메일, 연락처 카드 등을 쓸 수 있습니다.';

  @override
  String get urlSafetyReview => 'URL 검토';

  @override
  String get inspector => '검사기';

  @override
  String get typeLabel => '유형:';

  @override
  String get payloadLabel => '페이로드:';

  @override
  String get writeAndVerify => '태그에 쓰고 확인';

  @override
  String get batchWriteButtonLabel => '일괄 태그 쓰기 (2..100개 태그)';

  @override
  String get clearTagButtonLabel => '태그 초기화 (내용 지우기)';

  @override
  String get confirmWriteTitle => '태그 쓰기 확인';

  @override
  String get confirmWriteMessage1 => '이 작업은 대상 태그의 기존 NDEF 콘텐츠를 완전히 덮어씁니다.';

  @override
  String get confirmWriteMessage2 =>
      '대상 태그가 쓰기 가능한지(잠금 해제됨) 확인하세요. 기록 후 자동으로 확인됩니다.';

  @override
  String get yesWrite => '예, 쓰기';

  @override
  String get scanHistoryDisabledTitle => '스캔 기록 꺼짐';

  @override
  String get scanHistoryDisabledDesc =>
      '개인정보 보호를 위해 스캔 기록은 기본적으로 저장되지 않습니다. 설정 탭에서 활성화할 수 있습니다.';

  @override
  String get enableHistory => '기록 활성화';

  @override
  String get historySearchHint => 'UID, 텍스트 또는 유형으로 검색(예: URL, Wi-Fi, 04A1...)';

  @override
  String get noHistoryYet => '저장된 스캔 기록이 아직 없습니다.';

  @override
  String get tryDifferentQuery => '다른 UID, 텍스트 내용 또는 레코드 유형을 사용해 보세요.';

  @override
  String get clearSearch => '검색 지우기';

  @override
  String get deleteThisRecord => '이 레코드 삭제';

  @override
  String get qrPreview => 'QR 미리보기';

  @override
  String get lockTagConfirmTitle => '태그 영구 잠금';

  @override
  String get lockTagWarning2 => '먼저 올바른 내용을 기록했는지 확인하세요.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'QR 코드 미리보기';

  @override
  String get unknownParentheses => '(알 수 없음)';

  @override
  String get ok => '확인';

  @override
  String rewriteSourceUid(String uid) {
    return '원본 UID: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return '쓸 레코드: $count';
  }

  @override
  String rewriteFailed(String message) {
    return '다시 쓰기 실패: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return '쓴 레코드: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return '스캔한 태그 UID: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return '쓴 데이터: $count개 ($bytes바이트)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return '스캔한 데이터: $count개 ($bytes바이트)';
  }

  @override
  String batchTargetCount(String count) {
    return '대상 태그 수: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return '쓰기 목록: $count개 ($bytes바이트)';
  }

  @override
  String batchNext(String current, String total) {
    return '다음: 태그 #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return '성공 ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return '실패: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return '태그 #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return '태그 #$n 터치하여 쓰기';
  }

  @override
  String batchPrompt(String current, String total) {
    return '일괄 쓰기: 태그 #$current / $total를 가까이 대세요';
  }

  @override
  String batchWrittenVerified(String count) {
    return '$count개 레코드를 쓰고 검증했습니다';
  }

  @override
  String templateLoaded(String name) {
    return '\"$name\"의 레코드를 쓰기 목록에 추가했습니다.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'NDEF 콘텐츠 요약 (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return '내보내기 오류: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return '백업에 스캔 기록 $count개가 있지만 이 기기에서는 기록이 꺼져 있습니다.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return '가져오기 성공:\n$summary';
  }

  @override
  String mergeError(String error) {
    return '병합 오류: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'NDEF 클립보드: $count개 ($bytes B) - $source';
  }

  @override
  String get heroScanSubtitle => '태그를 휴대폰 위쪽에 대면 내용, 용량, 일련번호가 바로 표시됩니다.';

  @override
  String lastTagLabel(String uid) {
    return '마지막 태그: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return '스캔 오류: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count개 ($bytes바이트) - NDEF 데이터만 복사하며 UID는 복사하지 않습니다.';
  }

  @override
  String tagSourceLabel(String uid) {
    return '태그 $uid';
  }

  @override
  String errorWithMessage(String message) {
    return '오류: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return '읽은 NDEF 레코드 ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return '쓸 NDEF 레코드 ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return '참고: 페이로드가 $bytes바이트라 처음 64바이트만 표시합니다.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return '전체 크기: $bytes바이트 | 레코드: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return '쓰고 검증 ($bytes바이트)';
  }

  @override
  String savedScansCount(String count) {
    return '저장된 스캔: $count';
  }

  @override
  String historyNoResults(String query) {
    return '\"$query\"에 대한 결과가 없습니다.';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count개';
  }

  @override
  String historyCapacity(String max, String used) {
    return '용량: $max B | 사용: $used B';
  }

  @override
  String historySourceLabel(String uid) {
    return '기록 UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count개 | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return '저장된 규칙/메모: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return '쓴 바이트: $bytes | 검증: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return '잠근 태그는 읽기 전용이 되어 내용을 다시는 바꾸거나 지울 수 없고 잠금도 해제할 수 없습니다. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return '메시지 크기: $bytes바이트';
  }

  @override
  String bytesShort(String bytes) {
    return '바이트: $bytes B';
  }

  @override
  String bytesValue(String bytes) {
    return '$bytes바이트';
  }

  @override
  String bytesOfCapacity(String bytes, String max) {
    return '$bytes / $max바이트';
  }

  @override
  String get valueNone => '없음';

  @override
  String get valueYesIp => '예 (IP 주소)';

  @override
  String get nfcMissingShort => 'NFC 없음';

  @override
  String get clearClipboard => '클립보드 지우기';

  @override
  String get statLibrary => '보관함';

  @override
  String get scanTagTitle => '태그 스캔';

  @override
  String get readingInProgress => '읽는 중...';

  @override
  String get rawMemorySubtitle => '원시 메모리';

  @override
  String get copyToClipboard => '클립보드에 복사';

  @override
  String get serialUidLabel => '일련번호 (UID):';

  @override
  String get totalCapacityLabel => '전체 용량:';

  @override
  String get technologiesLabel => '기술:';

  @override
  String get idLabel => '식별자 (ID):';

  @override
  String get undoTooltip => '실행 취소';

  @override
  String get clearComposer => '목록 지우기';

  @override
  String composerTotalSize(String bytes) {
    return '전체 크기: $bytes바이트';
  }

  @override
  String get yesClear => '예, 지우기';

  @override
  String get ssidTooLong => 'SSID는 최대 32바이트입니다.';

  @override
  String get locationPlace => '장소';

  @override
  String get targetWebUrl => '대상 URL *';

  @override
  String get languageCodeLabel => '언어 코드 (ISO 639-1) *';

  @override
  String get utf8Text => 'UTF-8 텍스트';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf, 크기: $bytes바이트';
  }

  @override
  String get quickGallerySubtitle => '한 번에 완성';

  @override
  String get quickLibraryTitle => '내 태그';

  @override
  String get quickLibrarySubtitle => '저장된 태그';

  @override
  String get saveToLibrary => '보관함에 저장';

  @override
  String libraryMatch(String name) {
    return '보관함: $name';
  }

  @override
  String tagChipLabel(String chip) {
    return '칩: $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return '제조사: $name';
  }

  @override
  String get settingsLibrarySubtitle => '이름, 메모, 사진이 있는 태그';

  @override
  String get showOnboardingAgain => '소개 다시 보기';

  @override
  String get importFromGallery => '템플릿에서 추가';

  @override
  String get appearanceTitle => '화면 모드';

  @override
  String get themeSystem => '시스템';

  @override
  String get themeLight => '라이트';

  @override
  String get themeDark => '다크';

  @override
  String get valuePresentRisky => '있음 (위험할 수 있음)';

  @override
  String get supportedValue => '지원됨';

  @override
  String get notSupportedValue => '지원 안 됨';

  @override
  String get nfcUnsupportedDesc => '이 기기는 NFC를 지원하지 않습니다';

  @override
  String get ndefTrailingData => 'NDEF 메시지 뒤에 추가 데이터가 있습니다';

  @override
  String get ndefMissingEnd => 'NDEF 메시지 끝이 없습니다';

  @override
  String vcardPhoneShort(String value) {
    return '전화: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return '이메일: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return '회사: $value';
  }

  @override
  String get pageUidLock => 'UID / 잠금';

  @override
  String get pageData => '데이터';

  @override
  String get pageLock => '잠금';

  @override
  String memoryPageLine(String page) {
    return '페이지 $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (전화)';

  @override
  String get mapApple => 'Apple 지도';

  @override
  String get mapGoogle => 'Google 지도';

  @override
  String get whatsappMessageHint => '안녕하세요, 문의드립니다';

  @override
  String get facetimeTargetHint => '+821012345678 또는 name@icloud.com';

  @override
  String get bluetoothMacLabel => '블루투스 MAC 주소';

  @override
  String get webAddressUrlLabel => '웹 주소 (URL)';

  @override
  String get latitudeLabel => '위도 (Lat)';

  @override
  String get longitudeLabel => '경도 (Lng)';

  @override
  String get emailAddressLabel => '이메일 주소';

  @override
  String get websiteLabel => '웹사이트';

  @override
  String get wifiAuthWpa2Home => 'WPA2 개인 (가정/사무실 표준)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 개인 (혼합)';

  @override
  String get hostLabel => '호스트:';

  @override
  String get readOnlyLocked => '읽기 전용 (잠김)';

  @override
  String get redoTooltip => '다시 실행';

  @override
  String historyFoundCount(String found, String total) {
    return '찾음: $found / $total';
  }

  @override
  String get addToWriteListShort => '쓰기 목록에 추가';

  @override
  String get mimeTypeHint => 'application/json 또는 text/plain';

  @override
  String get hapticsToggle => '햅틱';

  @override
  String get hapticsToggleSubtitle => '읽기·쓰기가 끝나면 짧게 진동';

  @override
  String get soundsToggle => '소리';

  @override
  String get soundsToggleSubtitle => '결과 시 짧은 시스템 소리 재생';

  @override
  String get backupLibraryMustBeList => '태그 보관함은 목록이어야 합니다.';

  @override
  String get backupInvalidLibraryEntry => '잘못된 보관함 항목입니다.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return '보관함은 최대 $max개까지입니다.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return '보관함: $added개 추가';
  }

  @override
  String backupLibraryCount(String count) {
    return '• 태그 보관함: $count (사진 제외)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return '마지막 태그: $bytes / $max B';
  }

  @override
  String get contentTooLargeForChips =>
      '일반 태그에 담기에 너무 큽니다. 텍스트를 줄이거나 짧은 링크를 쓰세요.';

  @override
  String get tagReportTitle => '태그 보고서';

  @override
  String get tagReportSubtitle => '칩, 잠금, 비밀번호, 사용량';

  @override
  String get tagReportPrompt => '확인할 태그를 대세요';

  @override
  String get tagReportBusy => '태그 확인 중...';

  @override
  String tagReportDone(String chip) {
    return '보고서 완료: $chip';
  }

  @override
  String get unknownChip => '알 수 없는 칩';

  @override
  String get yes => '예';

  @override
  String get reportChip => '칩';

  @override
  String get reportNdefFormatted => 'NDEF 포맷됨';

  @override
  String get reportWritable => '쓰기 가능';

  @override
  String get reportStaticLock => '정적 잠금';

  @override
  String get reportDynamicLock => '동적 잠금';

  @override
  String get reportPassword => '비밀번호 보호';

  @override
  String get reportReadProtected => '읽기 보호';

  @override
  String get reportNdefUsage => 'NDEF 사용량';

  @override
  String get reportVerdictWritable => '태그에 쓸 수 있습니다';

  @override
  String get reportVerdictRestricted => '태그에 제한이 있습니다';

  @override
  String get reportCopied => '보고서를 복사했습니다';

  @override
  String get compareTagsTitle => '두 태그 비교';

  @override
  String get compareTagsSubtitle => '복사본이 원본과 같은지 확인';

  @override
  String get compareStepFirst => '먼저 첫 번째(원본) 태그를 스캔하세요.';

  @override
  String get compareStepSecond => '이제 두 번째 태그를 스캔하세요.';

  @override
  String get compareIdentical => '내용이 같습니다';

  @override
  String get compareDifferent => '내용이 다릅니다';

  @override
  String get compareSameTag => '같은 태그를 두 번 스캔했습니다.';

  @override
  String get compareDifferentTags => '서로 다른 두 태그입니다.';

  @override
  String get compareRecordSame => '같음';

  @override
  String get compareRecordChanged => '다름';

  @override
  String get compareRecordOnlyFirst => 'A에만 있음';

  @override
  String get compareRecordOnlySecond => 'B에만 있음';

  @override
  String get compareBothEmpty => '두 태그 모두 비어 있습니다.';

  @override
  String capacityExceededShort(String needed, String max) {
    return '내용이 너무 큽니다: $needed / $max바이트';
  }

  @override
  String get verifyFailedAfterWrite => '쓴 데이터를 확인하지 못했습니다. 태그를 더 오래 대세요.';

  @override
  String get blankTagTitle => '태그가 아직 준비되지 않았습니다';

  @override
  String get blankTagBody =>
      '새 태그라 NDEF 포맷이 되어 있지 않습니다. 앱에서 한 번에 준비하고 내용을 쓸 수 있습니다 (NTAG, MIFARE Ultralight).';

  @override
  String get blankTagAction => '준비 후 쓰기';

  @override
  String get shareTag => '공유';

  @override
  String get shareAsText => '텍스트로 공유';

  @override
  String get shareAsFile => '파일로 공유 (.json)';

  @override
  String get shareAsFileSubtitle => '다른 기기에서 그대로 쓸 수 있습니다';

  @override
  String get importFromJsonFile => '태그 파일에서 (.json)';

  @override
  String get invalidTagFile => '잘못된 태그 파일입니다.';

  @override
  String get continuousScanTitle => '연속 스캔';

  @override
  String get continuousScanSubtitle => '태그를 연달아 스캔하고 목록을 CSV로 공유';

  @override
  String continuousScanCount(String count) {
    return '태그 $count개 스캔';
  }

  @override
  String get exportCsv => 'CSV로 공유';

  @override
  String get clearList => '목록 지우기';

  @override
  String get csvColumnTime => '시간';

  @override
  String get csvColumnRecords => '레코드';

  @override
  String get csvColumnContent => '내용';

  @override
  String get csvColumnCapacity => '용량 (B)';

  @override
  String get csvColumnUsed => '사용 (B)';

  @override
  String get batchSerialToggle => '일련번호 추가';

  @override
  String batchSerialHint(String token) {
    return '레코드에 $token을 넣으면 그 자리에 번호가 들어갑니다. 없으면 번호가 담긴 텍스트 레코드가 태그마다 추가됩니다.';
  }

  @override
  String get batchSerialPrefix => '접두사';

  @override
  String get batchSerialStart => '시작';

  @override
  String get batchSerialDigits => '자릿수';

  @override
  String batchSerialPreview(String first, String last) {
    return '처음: $first · 마지막: $last';
  }

  @override
  String get batchFromCsvButton => 'CSV 파일에서 (한 줄에 태그 하나)';

  @override
  String get batchCsvTitle => 'CSV로 일괄 쓰기';

  @override
  String batchCsvSummary(String count) {
    return '$count개 태그에 씁니다. 각 태그에 CSV 한 줄이 순서대로 기록됩니다.';
  }

  @override
  String batchCsvTruncated(String max) {
    return '일괄 쓰기는 최대 $max줄까지 사용하며 나머지는 건너뛰었습니다.';
  }

  @override
  String get cloneTagTitle => '태그 복제';

  @override
  String get cloneTagSubtitle => '태그를 읽고 내용을 다른 태그에 씁니다';

  @override
  String get cloneSourceStep =>
      '1단계: 원본 태그를 스캔하세요. NDEF 내용만 복사되며 UID는 복제할 수 없습니다.';

  @override
  String get cloneSourceEmpty => '원본 태그에 복사할 NDEF 레코드가 없습니다.';

  @override
  String get cloneReadyTitle => '원본 읽기 완료';

  @override
  String cloneReadySummary(String count, String bytes) {
    return '$count개 레코드($bytes바이트)를 복사합니다. 쓸 태그 수를 선택하세요.';
  }

  @override
  String get cloneEditFirst => '먼저 편집';

  @override
  String get tapPreviewTitle => '휴대폰을 대면 어떻게 되나요?';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => '태그가 비어 있어 아무 일도 일어나지 않습니다.';

  @override
  String tapIosUrl(String target) {
    return '알림이 뜨고, 누르면 $target이(가) Safari나 해당 앱에서 열립니다.';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target이(가) 브라우저나 해당 앱에서 바로 열립니다.';
  }

  @override
  String tapIosApp(String target) {
    return '알림이 뜨고, 앱이 설치되어 있으면 \"$target\"(으)로 열립니다.';
  }

  @override
  String tapAndroidApp(String target) {
    return '앱이 설치되어 있으면 \"$target\"(으)로 열립니다.';
  }

  @override
  String tapIosCall(String target) {
    return '알림이 뜨고, 누르면 $target(으)로 전화합니다.';
  }

  @override
  String tapAndroidCall(String target) {
    return '전화 앱이 $target 번호로 열립니다.';
  }

  @override
  String tapIosSms(String target) {
    return '알림이 뜨고, 메시지 앱이 $target에게 보낼 새 메시지로 열립니다.';
  }

  @override
  String tapAndroidSms(String target) {
    return '메시지 앱이 $target에게 열립니다.';
  }

  @override
  String tapIosEmail(String target) {
    return '알림이 뜨고, Mail이 $target에게 보낼 새 이메일로 열립니다.';
  }

  @override
  String tapAndroidEmail(String target) {
    return '이메일 앱이 $target에게 열립니다.';
  }

  @override
  String get tapIosMap =>
      'iPhone은 \"geo:\" 위치를 자동으로 열지 않습니다. Apple 또는 Google 지도 링크를 사용하세요(빠른 링크).';

  @override
  String get tapAndroidMap => '지도 앱이 이 위치로 열립니다.';

  @override
  String get tapIosNeedsApp => 'iPhone은 이 내용을 자동으로 처리하지 않습니다. NFC 앱으로 읽어야 합니다.';

  @override
  String get tapAndroidText => '대부분의 휴대폰에서는 아무 일도 없거나 시스템 화면에 텍스트가 표시됩니다.';

  @override
  String get tapAndroidContact => '연락처 추가를 제안합니다.';

  @override
  String get tapAndroidWifi => '네트워크 연결을 제안합니다(Android 10 이상).';

  @override
  String get tapAndroidCalendar => '캘린더 앱이 지원하면 일정 추가를 제안합니다.';

  @override
  String get tapAndroidOther => '이 내용을 지원하는 앱이 설치된 경우에만 열립니다.';

  @override
  String tapIgnoredRecords(String count) {
    return '휴대폰은 첫 레코드만 실행합니다. 나머지 $count개는 NFC 앱에서 보입니다.';
  }

  @override
  String get tapIosRequirement =>
      'iPhone XS 이상은 잠금 해제 상태이고 카메라/지갑이 열려 있지 않을 때 백그라운드로 읽습니다.';

  @override
  String get galleryCatBusiness => '비즈니스';

  @override
  String get galleryCatSocial => '소셜';

  @override
  String get galleryCatHome => '홈';

  @override
  String get galleryCatPersonal => '개인';

  @override
  String get galleryCatAutomation => '자동화';

  @override
  String get galleryFavorites => '즐겨찾기';

  @override
  String get gallerySearchHint => '템플릿 검색...';

  @override
  String get galleryNoResults => '일치하는 템플릿이 없습니다.';

  @override
  String get galleryAddFavorite => '즐겨찾기에 추가';

  @override
  String get galleryRemoveFavorite => '즐겨찾기에서 제거';

  @override
  String get presetEventTitle => '이벤트 초대';

  @override
  String get presetEventDesc =>
      '일정을 iCalendar 형식으로 씁니다. Android는 캘린더에 추가할 수 있습니다.';

  @override
  String get eventNameLabel => '이벤트 이름';

  @override
  String get eventDateLabel => '날짜 (YYYY-MM-DD)';

  @override
  String get eventTimeLabel => '시간 (HH:MM)';

  @override
  String get eventDateTimeInvalid => '날짜나 시간이 올바르지 않습니다. 예: 2026-12-31, 19:00';

  @override
  String get presetLuggageTitle => '수하물 태그';

  @override
  String get presetLuggageDesc => '분실 시 습득자가 쉽게 연락할 수 있습니다.';

  @override
  String luggageMessage(String name, String contact) {
    return '이 수하물은 $name의 것입니다. 발견하시면 연락 주세요: $contact';
  }

  @override
  String get presetPlaylistTitle => '플레이리스트';

  @override
  String get presetPlaylistDesc => 'Spotify, Apple Music, YouTube 플레이리스트를 엽니다.';

  @override
  String get playlistLinkLabel => '플레이리스트 링크';

  @override
  String get presetEmailMeTitle => '이메일 보내기';

  @override
  String get presetEmailMeDesc => '제목이 채워진 새 이메일을 엽니다.';

  @override
  String get presetCallMeTitle => '전화하기';

  @override
  String get presetCallMeDesc => '태그한 휴대폰이 내 번호로 전화합니다.';

  @override
  String get presetRunShortcutTitle => '단축어 실행';

  @override
  String get presetRunShortcutDesc =>
      '지정한 iPhone 단축어 실행: 조명 켜기, 음악 재생, 집중 모드 변경...';

  @override
  String get shortcutNameLabel => '단축어 이름';

  @override
  String get recipesSection => '자동화 레시피';

  @override
  String get recipesIntro =>
      '단축어 앱에서 아래 이름으로 단축어를 만들고 동작을 추가하세요. 그런 다음 NFC 자동화에 연결하거나 \"태그에 추가\"로 실행 링크를 쓰세요.';

  @override
  String get recipeAddToTag => '태그에 추가';

  @override
  String get recipeBedTitle => '굿나잇';

  @override
  String get recipeBedActions => '침대 옆: 수면 집중 모드 · 알람 설정 · 조명 끄기';

  @override
  String get recipeCarTitle => '차량 모드';

  @override
  String get recipeCarActions => '차량 거치대: 운전 집중 모드 · 집 경로 안내 · 음악 재생';

  @override
  String get recipeDoorTitle => '집 도착';

  @override
  String get recipeDoorActions => '현관: 조명 켜기 · Wi-Fi 켜기 · 가족에게 \"도착\" 메시지';

  @override
  String get recipeDeskTitle => '집중 시간';

  @override
  String get recipeDeskActions => '책상: 업무 집중 모드 · 25분 타이머 · 집중 플레이리스트';

  @override
  String get recipeGymTitle => '운동';

  @override
  String get recipeGymActions => '운동 가방: 운동 시작 · 운동 플레이리스트 · 방해 금지';

  @override
  String get recipeKitchenTitle => '주방 타이머';

  @override
  String get recipeKitchenActions => '주방: 10분 타이머 · 장보기 목록 열기';

  @override
  String get libraryLabelsField => '라벨 / 폴더 (쉼표로 구분)';

  @override
  String get libraryLabelsHint => '사무실, 2층';

  @override
  String librarySaveFailed(String error) {
    return '저장하지 못했습니다: $error';
  }

  @override
  String get csvColumnLabels => '라벨';
}
