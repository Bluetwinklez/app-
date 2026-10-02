// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get addRecord => 'レコードを追加';

  @override
  String get addRule => 'ルールを追加';

  @override
  String get addTag => 'タグを追加';

  @override
  String get addToComposerList => '書き込みリストに追加';

  @override
  String get addToWriteList => '書き込みリストに追加';

  @override
  String get addressCannotBeEmpty => '住所を入力してください。';

  @override
  String get advancedCommandsDesc =>
      '1行に1つの16進数コマンドを入力。例: 60 = GET_VERSION, 30 04 = 4ページ読取。誤った書き込みはタグを壊す恐れがあります。';

  @override
  String get advancedCommandsSubtitle => 'タグに生の16進数コマンドを直接送信します';

  @override
  String get advancedCommandsTitle => '高度なNFCコマンド';

  @override
  String get allRulesCleared => 'すべてのルールを削除しました';

  @override
  String get appLinksDesc => 'このリンクをタグに書き込むと、iPhoneをタッチした際にアプリの該当画面を開きます。';

  @override
  String get appLinksSection => 'アプリリンク';

  @override
  String get appPackageName => 'Androidパッケージ名';

  @override
  String get appSettings => 'アプリ設定';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'タッチで自動実行';

  @override
  String get backupExportSuccess => 'バックアップファイルを保存しました';

  @override
  String get backupFileSizeExceeded => 'バックアップファイルが 2 MiB を超えています。';

  @override
  String get backupHistoryMustBeList => '\"history\" は配列である必要があります。';

  @override
  String backupImportFailed(String error) {
    return 'バックアップの復元に失敗しました: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return '復元が完了しました: テンプレート $templates 件、ルール $rules 件、履歴 $history 件を追加';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'IDのBase64形式が不正です: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'PayloadのBase64形式が不正です: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'TypeのBase64形式が不正です: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return '無効なJSON形式です: $error';
  }

  @override
  String get backupInvalidRuleNote => '無効なメモ文字列です。';

  @override
  String get backupInvalidRuleSha => '無効なSHA-256ハッシュ文字列です。';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return '無効な作成日時です: $date';
  }

  @override
  String get backupInvalidTemplateId => '無効なテンプレートIDです。';

  @override
  String get backupInvalidTemplateName => '無効なテンプレート名です。';

  @override
  String backupInvalidTnf(String tnf) {
    return '無効なTNF値 ($tnf) です。0〜7の範囲で指定してください。';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return '履歴数が上限の $max 件を超えています ($count)。';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'レコード数が上限の $max 件を超えています ($count)。';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'ルール数が上限の $max 件を超えています ($count)。';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'テンプレート数が上限の $max 件を超えています ($count)。';
  }

  @override
  String get backupMissingSchemaVersion => '\"schemaVersion\" フィールドがありません。';

  @override
  String get backupRecordMustBeObject => '各NDEFレコードはJSONオブジェクトである必要があります。';

  @override
  String get backupRecordsMustBeList => 'レコードは配列である必要があります。';

  @override
  String get backupRestoreSubtitle => 'テンプレート、メモ、履歴をJSON形式で保存または既存データに結合します。';

  @override
  String get backupRestoreTitle => 'バックアップと復元 (JSON)';

  @override
  String get backupRootMustBeObject => 'ルートはJSONオブジェクトである必要があります。';

  @override
  String get backupRuleMustBeObject => '各ルールはJSONオブジェクトである必要があります。';

  @override
  String get backupSchemaVersionMustBeInt => '\"schemaVersion\" は整数である必要があります。';

  @override
  String backupSizeExceeded(int bytes) {
    return 'バックアップデータが上限の 2 MiB を超えています ($bytes バイト)。';
  }

  @override
  String get backupTagRulesMustBeList => '\"tagRules\" は配列である必要があります。';

  @override
  String get backupTemplateMustBeObject => '各テンプレートはJSONオブジェクトである必要があります。';

  @override
  String get backupTemplatesMustBeList => '\"templates\" は配列である必要があります。';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return '未対応のスキーマバージョンです: $version';
  }

  @override
  String get batchWrite => '一括書き込み';

  @override
  String get bluetoothDeviceName => 'デバイス名 (任意)';

  @override
  String get bluetoothMac => 'Bluetooth MACアドレス';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return '書き込みサイズ: $bytes バイト | 検証: $status';
  }

  @override
  String cameraError(String error) {
    return 'カメラを開けませんでした。設定 > プライバシー > カメラで許可してください。\n($error)';
  }

  @override
  String get cancel => 'キャンセル';

  @override
  String get catBusiness => 'ビジネス';

  @override
  String get catCar => '車';

  @override
  String get catHome => '自宅';

  @override
  String get catOther => 'その他';

  @override
  String get catPersonal => '個人';

  @override
  String get catWork => '職場';

  @override
  String get categoryLabel => 'カテゴリ';

  @override
  String get chooseFromGallery => 'アルバムから選択';

  @override
  String get clear => 'クリア';

  @override
  String get clearAll => 'すべて削除';

  @override
  String get clearAllRulesConfirm => '保存されているすべてのメモを削除しますか？';

  @override
  String get clearConfirmButton => 'はい、消去します';

  @override
  String get clearConfirmMessage => 'タグ上のすべてのNDEFレコードが消去されます。続行しますか？';

  @override
  String get clearConfirmTitle => 'タグ内容の初期化';

  @override
  String get clearHistory => '履歴を削除';

  @override
  String get clearList => 'リストをクリア';

  @override
  String get clearTagSubtitle => '全レコードを消去して空のNDEFを書き込みます';

  @override
  String get clearTagTitle => 'タグを消去';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件のレコードがクリップボードにあります ($bytes B) · $source',
    );
    return '$_temp0';
  }

  @override
  String get close => '閉じる';

  @override
  String get commandsEmptyError => 'コマンドを1つ以上入力してください。';

  @override
  String get commandsLabel => 'コマンド';

  @override
  String get composeRecordTitle => 'レコードを追加';

  @override
  String get confirmClearHistoryContent =>
      '端末に保存されているすべてのスキャン履歴が削除されます。よろしいですか？';

  @override
  String get confirmClearHistoryTitle => '履歴の消去';

  @override
  String get confirmClearTemplatesContent =>
      '保存されているすべての書き込みテンプレートが削除されます。よろしいですか？';

  @override
  String get confirmClearTemplatesTitle => 'テンプレートの消去';

  @override
  String get contactCompany => '会社名 / 組織名';

  @override
  String get contactEmail => 'メールアドレス';

  @override
  String get contactFullName => '氏名';

  @override
  String get contactNote => 'メモ';

  @override
  String get contactPhone => '電話番号';

  @override
  String get contactTitle => '役職 / 部署';

  @override
  String get contactWebsite => 'Webサイト';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '内容: $count 件のレコード · $content',
    );
    return '$_temp0';
  }

  @override
  String get copy => 'コピー';

  @override
  String get copyAllRecords => 'すべてのレコードをコピー';

  @override
  String get copyTagUid => 'UIDをコピー';

  @override
  String get copyToComposer => '書き込みリストにコピー';

  @override
  String get csvInvalidAddress => '無効なアドレスです。';

  @override
  String get csvInvalidEmail => '無効なメールアドレスです。';

  @override
  String get csvInvalidLocation =>
      '緯度と経度を入力してください (例: location,41.0082,28.9784)。';

  @override
  String csvMaxRowsExceeded(int max) {
    return '最大 $max 件までインポートできます。残りはスキップされました。';
  }

  @override
  String csvRowEmptyValue(int row) {
    return '$row 行目: 値が空です。';
  }

  @override
  String csvRowError(String error, int row) {
    return '$row 行目: $error';
  }

  @override
  String csvUnknownType(String type) {
    return '不明なタイプ \"$type\" です。';
  }

  @override
  String get csvWifiPasswordLength => 'Wi-Fiパスワードは8〜63文字である必要があります。';

  @override
  String get delete => '削除';

  @override
  String deleteTagConfirmContent(String name) {
    return '\"$name\" をライブラリから削除しますか？ 実際のタグ内容は変更されません。';
  }

  @override
  String get deleteTagConfirmTitle => 'タグを削除';

  @override
  String get deleteTemplateTooltip => 'テンプレートを削除';

  @override
  String get deviceNameTooLong => 'デバイス名が長すぎます。';

  @override
  String get dismiss => '閉じる';

  @override
  String get editRecordTitle => 'レコードを編集';

  @override
  String get editRule => 'ルールを編集';

  @override
  String get editTag => 'タグを編集';

  @override
  String get emailBody => '本文';

  @override
  String get emailRecipient => '宛先メールアドレス';

  @override
  String get emailSubject => '件名';

  @override
  String get emptyComposerSubtitle =>
      '「レコードを追加」からURL、テキスト、Wi-Fi、連絡先などを作成してください。';

  @override
  String get emptyComposerTitle => 'データがありません';

  @override
  String get emptyHistorySubtitle => 'スキャンしたタグがここに表示されます。';

  @override
  String get emptyHistoryTitle => 'スキャン履歴がありません';

  @override
  String get emptyLibrary => '保存されたタグはありません。\nタグを読み取って写真と一緒に登録してください。';

  @override
  String get eventDescription => '説明';

  @override
  String get eventEnd => '終了日時';

  @override
  String get eventLocation => '開催場所';

  @override
  String get eventStart => '開始日時';

  @override
  String get eventTitle => 'イベント名';

  @override
  String get exportBackup => 'エクスポート';

  @override
  String get facetimePrompt => '電話番号またはApple IDのメールアドレスを入力してください。';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" は必須項目です。';
  }

  @override
  String get fieldTextPrompt => 'タグに書き込むテキスト';

  @override
  String get fieldUrlPrompt => 'Webサイトのアドレス (https://...)';

  @override
  String get fileUrl => 'ファイルURL';

  @override
  String get filterAll => 'すべて';

  @override
  String get flashlight => 'ライト';

  @override
  String get formatConfirmButton => 'フォーマット';

  @override
  String get formatConfirmMessage => 'データが消去され、空のNDEFタグとして初期化されます。続行しますか？';

  @override
  String get formatMemorySubtitle => 'NDEF用に初期化します (未フォーマットや破損タグ)';

  @override
  String get formatMemoryTitle => 'メモリをフォーマット';

  @override
  String get hardwareAvailable => 'NFC利用可能';

  @override
  String get hardwareDisabled => 'NFCが無効です';

  @override
  String get hardwareNotSupported => 'NFC非対応';

  @override
  String get historyFilteredEmpty => '該当する履歴がありません。';

  @override
  String get idTooLarge => 'IDの長さは255バイト以内です';

  @override
  String get importBackup => 'インポート (結合)';

  @override
  String get importCsv => 'CSVインポート';

  @override
  String get inAppTagRules => 'タグの独自ルール';

  @override
  String get invalidHexId => '不正な16進数ID文字列';

  @override
  String get invalidHexPayload => '不正な16進数Payload文字列';

  @override
  String get invalidHexType => '不正な16進数Type文字列';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get latitude => '緯度 (Lat)';

  @override
  String get linkCopied => 'リンクをコピーしました';

  @override
  String get linkHistoryDesc => '履歴を開く';

  @override
  String get linkScanDesc => 'アプリを開いてスキャンを開始';

  @override
  String get linkToolsDesc => 'ツール画面を開く';

  @override
  String get linkWriteDesc => '書き込み画面を開く';

  @override
  String get loadToComposerTooltip => '作成画面に読み込む';

  @override
  String get locationHint => '例: 冷蔵庫のドア';

  @override
  String get locationLabel => '設置場所';

  @override
  String get lockAcknowledge => 'この操作は取り消せないことを理解しました';

  @override
  String get lockButton => 'ロックする';

  @override
  String get lockTagSubtitle => 'タグを恒久的に読み取り専用にします (解除不可)';

  @override
  String get lockTagTitle => 'タグをロック';

  @override
  String get lockWarning => 'ロックされたタグは恒久的に読み取り専用になります。内容の変更やロック解除は二度とできません。';

  @override
  String get longitude => '経度 (Lng)';

  @override
  String get manage => '管理';

  @override
  String get matchedRule => '一致したメモ';

  @override
  String get mimePayloadHex => 'ペイロード (Hex / テキスト)';

  @override
  String get mimeTypeLabel => 'MIMEタイプ';

  @override
  String get nameRequired => 'タグの名前を入力してください。';

  @override
  String get navHistory => '履歴';

  @override
  String get navHistoryTitle => '履歴';

  @override
  String get navRead => '読取';

  @override
  String get navReadTitle => 'タグを読み取る';

  @override
  String get navSettings => '設定';

  @override
  String get navSettingsTitle => 'テンプレートと設定';

  @override
  String get navTools => 'ツール';

  @override
  String get navToolsTitle => 'ツール';

  @override
  String get navWrite => '書込';

  @override
  String get navWriteTitle => 'タグに書き込む';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件のレコード',
    );
    return '$_temp0';
  }

  @override
  String get ndefRecordsTitle => 'NDEFレコード';

  @override
  String get nfcPromptClear => '初期化するタグを近づけてください';

  @override
  String get nfcPromptLock => '永久ロックするタグを近づけてください';

  @override
  String get nfcPromptScan => '端末の上部をNFCタグに近づけてください';

  @override
  String get nfcPromptWrite => 'データを書き込むタグを近づけてください';

  @override
  String get no => 'いいえ';

  @override
  String get noContentInTag => 'タグの内容がありません。';

  @override
  String get noLibraryMatches => '一致するタグがありません。';

  @override
  String get noRecordsOnTag => 'タグにNDEFレコードが見つかりません。';

  @override
  String get noTemplates => '保存されたテンプレートはまだありません。\n「書込」タブでデータを作成して保存してください。';

  @override
  String get noteLabel => 'メモ';

  @override
  String get onboardingContinue => '次へ';

  @override
  String get onboardingSkip => 'スキップ';

  @override
  String get onboardingStart => 'はじめる';

  @override
  String get onboardingStep1Body =>
      '青いボタンをタップしてスマホをタグにかざします。内容、容量、UIDが瞬時に表示されます。';

  @override
  String get onboardingStep1Title => 'タグをかざすだけ';

  @override
  String get onboardingStep2Body =>
      '「書込」タブで「レコード追加」：Webリンク、Wi-Fi、名刺、SNS、テンプレートなど多彩に対応。';

  @override
  String get onboardingStep2Title => '自由に書き込み';

  @override
  String get onboardingStep3Body => 'メモリ解析、パスワード保護、ロック、フォーマットなどを「ツール」タブで完結。';

  @override
  String get onboardingStep3Title => '専門ツール';

  @override
  String get onboardingStep4Body =>
      '書き込んだタグに名前や写真、メモをつけてライブラリに保存。言語も設定から変更できます。';

  @override
  String get onboardingStep4Title => 'タグを整理整頓';

  @override
  String optionalField(String label) {
    return '$label (任意)';
  }

  @override
  String pageN(int page) {
    return 'ページ $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'データ';

  @override
  String get pageRoleLock => 'ロック';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / ロック';

  @override
  String get passwordDialogAction => '設定';

  @override
  String get passwordDialogTitle => 'パスワード設定';

  @override
  String get passwordDialogWarning => 'パスワードを忘れると二度と書き込めなくなります。読み取りは公開のままです。';

  @override
  String get passwordError => '正確に4文字または8桁の16進数を入力してください。';

  @override
  String get passwordHint => '4文字 (例: 1234) または8桁の16進数';

  @override
  String get passwordLabel => 'パスワード';

  @override
  String get paste => '貼り付け';

  @override
  String get phoneNumber => '電話番号';

  @override
  String get phoneWithCountryCode => '国番号を含めて入力してください (例: 819012345678)。';

  @override
  String get presetAppDownloadDesc => 'Android端末でアプリを開くかストアへ案内します。';

  @override
  String get presetAppDownloadTitle => 'アプリのダウンロード';

  @override
  String get presetBusinessCardDesc => 'スマホをタッチすると連絡先がアドレス帳に追加されます。';

  @override
  String get presetBusinessCardTitle => 'デジタル名刺';

  @override
  String get presetDirectionsDesc => 'マップ上で指定の住所やピンを表示します。';

  @override
  String get presetDirectionsTitle => '地図・アクセス案内';

  @override
  String get presetEmergencyDesc => '血液型、緊急連絡先、既往症などの重要情報。';

  @override
  String get presetEmergencyTitle => '緊急医療カード (ICE)';

  @override
  String get presetGoogleReviewDesc => '店舗のGoogle口コミ投稿ページへ直接誘導します。';

  @override
  String get presetGoogleReviewTitle => 'Google口コミ案内';

  @override
  String get presetGuestWifiDesc => 'パスワード入力不要でWi-Fiにすぐ接続できます。';

  @override
  String get presetGuestWifiTitle => '来客用Wi-Fiカード';

  @override
  String get presetInstagramDesc => 'タッチした人のInstagramで直接プロフィールを開きます。';

  @override
  String get presetInstagramTitle => 'Instagramプロフィール';

  @override
  String get presetMenuLinkDesc => 'テーブルに貼ってお客様にメニューを即座に表示。';

  @override
  String get presetMenuLinkTitle => 'レストランのメニュー';

  @override
  String get presetPetTagDesc => '保護した人がその場ですぐに飼い主へ電話できます。';

  @override
  String get presetPetTagTitle => 'ペット迷子札';

  @override
  String get presetShortcutDesc => 'iPhoneのショートカットやアプリ機能を発火。';

  @override
  String get presetShortcutTitle => 'ショートカット起動';

  @override
  String get presetWebsiteDesc => '指定のWebページへブラウザで転送します。';

  @override
  String get presetWebsiteTitle => 'Webサイト誘導';

  @override
  String get presetWhatsappDesc => '電話帳に登録することなく即座にチャットを開始。';

  @override
  String get presetWhatsappTitle => 'WhatsApp直接チャット';

  @override
  String get qrCode => 'QRコード';

  @override
  String qrContentChars(int chars) {
    return '内容 ($chars 文字):';
  }

  @override
  String get qrContentEmpty => '変換するデータが空です。';

  @override
  String qrContentTooLarge(int chars) {
    return 'データサイズが大きすぎます ($chars 文字、最大2048文字まで)。';
  }

  @override
  String get qrFrameInstructions =>
      '枠内にQRコードを合わせてください。Webリンク、Wi-Fi、テキストが変換されます。';

  @override
  String qrGenerationFailed(String error) {
    return 'QRコードの生成に失敗しました: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'QRコードプレビュー: $title';
  }

  @override
  String get qrScanTitle => 'QRコードをスキャン';

  @override
  String get qrSecurityNote =>
      'QRプレビューは平文テキストおよびWeb URLのみに対応しています。\n\nWi-Fiパスワードやバイナリは安全のため変換されません。';

  @override
  String get qrUserOnlyNote => 'ユーザー要求時のみ表示されます。';

  @override
  String get rawInspection => 'バイナリ詳細検査';

  @override
  String get rawRecordDetailsTitle => 'レコード詳細 (読み取り専用)';

  @override
  String get rawRecordEditorTitle => '生のNDEFレコード編集';

  @override
  String get readHeroButton => 'スキャン開始';

  @override
  String get readHeroEyebrow => 'NFCリーダー';

  @override
  String get readHeroScanning => 'スキャン中...';

  @override
  String get readHeroSubtitle => 'スマホをNFCタグにかざしてNDEFレコードとチップ情報を取得します。';

  @override
  String get readHeroTitle => 'タグをスキャン';

  @override
  String get readMemorySubtitle => 'ページ単位の生メモリ表示; コピーまたは .bin 保存';

  @override
  String get readMemoryTitle => 'メモリ読み取り';

  @override
  String get readyTemplates => '既製テンプレート';

  @override
  String get recordCopied => '内容をコピーしました';

  @override
  String recordIndex(int index) {
    return 'レコード #$index';
  }

  @override
  String get recordTypeCalendar => 'カレンダーイベント (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return '独自MIME ($mime)';
  }

  @override
  String get recordTypeEmail => 'メールレコード';

  @override
  String get recordTypeLocation => '位置情報 / GPS';

  @override
  String get recordTypePhone => '電話番号';

  @override
  String get recordTypeSmartPoster => 'スマートポスター';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return '破損したスマートポスター ($bytes バイト)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'スマートポスター (無効なデータ)';

  @override
  String get recordTypeSms => 'SMSレコード';

  @override
  String get recordTypeText => 'テキストレコード';

  @override
  String get recordTypeUnknown => '不明なレコード';

  @override
  String get recordTypeUrl => 'Webリンク (URL)';

  @override
  String get recordTypeVCard => '連絡先 (vCard)';

  @override
  String get recordTypeWifi => 'Wi-Fi設定 (WSC)';

  @override
  String get recordTypeWifiCorrupt => '破損したWSCデータ';

  @override
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件のレコードをクリップボードにコピーしました',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'やり直し';

  @override
  String get removePasswordDialogTitle => 'パスワード解除';

  @override
  String get removePasswordDialogWarning => '設定されているパスワードを入力してください。';

  @override
  String get removePasswordSubtitle => '設定済みパスワードを入力して保護を解除';

  @override
  String get removePasswordTitle => 'パスワード解除';

  @override
  String get removePhoto => '削除';

  @override
  String get rewriteTag => '再書き込み';

  @override
  String ruleDeleteConfirm(String note) {
    return 'メモ \"$note\" のルールを削除しますか？';
  }

  @override
  String get ruleDeleted => 'ルールを削除しました';

  @override
  String get ruleNoteDialogTitle => 'タグのメモを編集';

  @override
  String get ruleNoteHint => '例: 倉庫の棚 #4 や 会議室';

  @override
  String get ruleNoteLabel => 'ローカルメモ / ラベル';

  @override
  String get ruleSaved => 'ルールを保存しました';

  @override
  String get save => '保存';

  @override
  String get saveAsTemplate => 'テンプレートとして保存';

  @override
  String get saveBin => '.bin 保存';

  @override
  String get saveLocalHistory => 'スキャン履歴を端末に保存';

  @override
  String get saveLocalHistorySubtitle =>
      'オフの場合履歴は保持されません。オンにすると成功したスキャンがローカルに保存されます。';

  @override
  String get saveTemplateDialogTitle => 'テンプレートとして保存';

  @override
  String get saveToLibrary => 'ライブラリに保存';

  @override
  String get scanFabLabel => 'タグをスキャン';

  @override
  String get scanQrToRecord => 'QRコード読取';

  @override
  String get scannedTag => 'スキャンしたタグ';

  @override
  String get searchEngine => '検索エンジン';

  @override
  String get searchHistoryHint => '履歴を検索 (UID、内容、種別)...';

  @override
  String get searchLibraryHint => '名前、メモ、場所、内容で検索';

  @override
  String get searchQuery => '検索キーワード';

  @override
  String get searchQueryCannotBeEmpty => '検索キーワードを入力してください。';

  @override
  String get securityRestriction => 'セキュリティ制限';

  @override
  String get send => '送信';

  @override
  String get setPasswordSubtitle => 'タグへの不正な書き込みを防ぐパスワードを設定';

  @override
  String get setPasswordTitle => 'パスワード設定';

  @override
  String get shareRecords => 'レコードを共有';

  @override
  String get shortcutAutomationNote =>
      '注意: オートメーションはタグのUIDに紐付くため、内容が変わっても動作します。';

  @override
  String get shortcutStep1 => 'ショートカットアプリを開き、下部の「オートメーション」をタップ。';

  @override
  String get shortcutStep2 => '「新規オートメーション」(+) → 「NFC」を選択。';

  @override
  String get shortcutStep3 => '「スキャン」をタップしてタグにかざし、名前を付けます。';

  @override
  String get shortcutStep4 => '「すぐに実行」を選び、実行したいアクションを追加します。';

  @override
  String get shortcutStep5 => 'このアプリを開くには「タグをスキャン」または「タグに書き込み」を選択。';

  @override
  String get shortcutsGuideSubtitle =>
      'タグにタッチして自動でタスクを実行したり、Siriに音声でスキャンを頼めます。';

  @override
  String get shortcutsGuideTitle => 'Siriとショートカット';

  @override
  String get siriPhraseScan => '「Hey Siri、NFC Tag Masterでタグをスキャン」';

  @override
  String get siriPhraseWrite => '「Hey Siri、NFC Tag Masterでタグに書き込み」';

  @override
  String get siriShortcutsNote => 'ショートカットアプリやSpotlight検索にも表示されます。';

  @override
  String get smsMessage => 'メッセージ内容';

  @override
  String get socialNetwork => 'プラットフォーム';

  @override
  String get socialUsername => 'ユーザー名';

  @override
  String get sourceComposer => '書き込みリストのデータ';

  @override
  String get sourceEmpty => 'データなし (メモのみ)';

  @override
  String get sourceLastScan => '直前に読み取ったタグ';

  @override
  String get sourceSelectPrompt => 'どこからタグデータを取得しますか？';

  @override
  String get statusCancelled => '処理がキャンセルされました。';

  @override
  String statusClearError(String error) {
    return '初期化エラー: $error';
  }

  @override
  String statusClearFailed(String error) {
    return '初期化に失敗しました: $error';
  }

  @override
  String get statusClearSuccess => 'タグの初期化が完了しました。';

  @override
  String get statusClearing => '初期化待機中... タグを近づけてください。';

  @override
  String statusLockError(String error) {
    return 'ロックエラー: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'ロックに失敗しました: $error';
  }

  @override
  String get statusLockSuccess => 'タグを永久ロック（読み取り専用）にしました。';

  @override
  String get statusLocking => 'ロック待機中... タグを近づけてください。';

  @override
  String get statusNfcDisabled => 'NFCが無効です。設定で有効にしてください。';

  @override
  String get statusNfcNotSupported => 'この端末はNFCに対応していません。';

  @override
  String get statusNfcUnavailable => '現在NFCを利用できません。';

  @override
  String get statusReady => '準備完了';

  @override
  String statusScanError(String error) {
    return 'スキャンエラー: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'タグを読み取りました ($id)。';
  }

  @override
  String get statusScanning => 'スキャン中... スマホをタグに近づけてください。';

  @override
  String statusUnexpectedError(String error) {
    return '予期しないエラー: $error';
  }

  @override
  String statusWriteError(String error) {
    return '書き込みエラー: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return '書き込みに失敗しました: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return '書き込みと検証が完了しました！ ($bytes バイト)';
  }

  @override
  String get statusWriting => '書き込み待機中... タグを近づけてください。';

  @override
  String get systemLanguage => 'システム言語';

  @override
  String get tabApp => 'アプリ';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'カレンダー';

  @override
  String get tabContact => '連絡先 (vCard)';

  @override
  String get tabCustomMime => '独自MIME';

  @override
  String get tabEmail => 'メール';

  @override
  String get tabFile => 'ファイル';

  @override
  String get tabLocation => '位置情報';

  @override
  String get tabPhone => '電話番号';

  @override
  String get tabSearch => '検索';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'SNS';

  @override
  String get tabText => 'テキスト';

  @override
  String get tabUrl => 'Web URL';

  @override
  String get tabVideo => '動画';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => '容量';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max バイト (空き $available バイト)';
  }

  @override
  String get tagInfoTitle => 'タグ情報';

  @override
  String get tagLibraryTitle => 'タグライブラリ';

  @override
  String get tagNameHint => '例: キッチンのタグ';

  @override
  String get tagNameLabel => 'タグ名';

  @override
  String get tagReadOnly => '読み取り専用 (ロック済)';

  @override
  String tagRulesCount(int count) {
    return '登録ルール / メモ数: $count';
  }

  @override
  String get tagRulesSubtitle => 'NDEFバイト列のSHA-256ハッシュに基づいて一致するメモのみを表示します。';

  @override
  String get tagSerialNumber => 'シリアル番号 (UID)';

  @override
  String get tagTechnology => '規格';

  @override
  String get tagType => '種類';

  @override
  String get tagUidCopied => 'UIDをコピーしました';

  @override
  String get tagWritable => '書き込み可能';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get templateGalleryTitle => '既製テンプレート';

  @override
  String get templateNameHint => 'テンプレート名';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 件のレコード',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'テンプレートを保存しました';

  @override
  String get toolsExpertSection => 'エキスパート';

  @override
  String get toolsFooterNote =>
      'メモリ・パスワード機能はNTAG213/215/216およびMIFARE Ultralight EV1に対応しています。';

  @override
  String get toolsMemorySection => 'メモリ';

  @override
  String get toolsSecuritySection => 'セキュリティ';

  @override
  String get toolsTagSection => 'タグ';

  @override
  String get totalBytes => '合計サイズ';

  @override
  String get typeTooLarge => 'Typeの長さは255バイト以内です';

  @override
  String get undo => '元に戻す';

  @override
  String get unknownChip16Pages => '不明なチップ (先頭16ページ)';

  @override
  String get urlSafetyInvalidUrl => '無効なURL形式です。';

  @override
  String get urlSafetyIpv4 => 'ドメインではなく直接のIPv4アドレスが含まれています。';

  @override
  String get urlSafetyIpv6 => '直接のIPv6アドレスが含まれています。';

  @override
  String get urlSafetyMissingScheme => 'URLスキーム (http/httpsなど) が不足しています。';

  @override
  String urlSafetyNonStandardPort(String port) {
    return '非標準のポート番号 (ポート: $port) です。';
  }

  @override
  String get urlSafetyPunycode => '国際化ドメイン / Punycode (\"xn--\") が検出されました。';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return '非標準のURLスキームです: \"$scheme\"。';
  }

  @override
  String get urlSafetyUnencrypted => '暗号化されていない接続 (http://) です。';

  @override
  String get urlSafetyUserInfo => 'URLにユーザー認証情報が含まれています。フィッシングの可能性があります。';

  @override
  String get usernameCannotBeEmpty => 'ユーザー名を入力してください。';

  @override
  String get usernameNoSpaces => 'ユーザー名に空白は含められません。';

  @override
  String get validAndroidPackage =>
      '有効なAndroidパッケージ名を入力してください (例: com.whatsapp)。';

  @override
  String get validBluetoothMac =>
      '有効なBluetooth MACアドレスを入力してください (例: 00:11:22:AA:BB:CC)。';

  @override
  String get validVideoUrl => '有効な動画リンクを入力してください。';

  @override
  String get validWebAddress =>
      '有効なWebアドレスを入力してください (例: https://example.com/file.pdf)。';

  @override
  String get verificationNotChecked => '未検証';

  @override
  String get verificationPassed => '合格';

  @override
  String get videoUrlCannotBeEmpty => '動画リンクを入力してください。';

  @override
  String get videoUrlOrId => '動画URLまたはYouTube ID';

  @override
  String get videoUrlOrIdPrompt => 'URL (https://...) または動画IDを入力してください。';

  @override
  String get wifiAuthOpen => 'オープン (暗号化なし)';

  @override
  String get wifiAuthType => 'セキュリティ';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => '非公開ネットワーク';

  @override
  String get wifiPassword => 'パスワード';

  @override
  String get wifiSsid => 'ネットワーク名 (SSID)';

  @override
  String get withSiri => 'Siriで操作';

  @override
  String get writeDumpConfirmButton => '書き込む';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes バイト) をユーザーメモリに書き込みます。既存データは上書きされます。';
  }

  @override
  String get writeDumpSubtitle => '保存したバイナリファイルをタグに書き込みます';

  @override
  String get writeDumpTitle => 'ダンプ書き込み (.bin)';

  @override
  String get writeHeroButton => '書き込み開始';

  @override
  String get writeHeroEyebrow => 'NDEFライター';

  @override
  String get writeHeroSubtitle => '複数のNDEFレコードを一度にタグへ書き込めます。';

  @override
  String get writeHeroTitle => 'タグに書き込む';

  @override
  String get writeHeroWriting => '書き込み中...';

  @override
  String get writeResultFailed => '処理失敗';

  @override
  String get writeResultSuccess => '処理成功';

  @override
  String get writeTemplates => '書き込みテンプレート';

  @override
  String get writeTemplatesSubtitle =>
      'よく使うNDEFデータをテンプレートとして保存し、いつでもワンタップで書き込めます。';

  @override
  String get yes => 'はい';
}
