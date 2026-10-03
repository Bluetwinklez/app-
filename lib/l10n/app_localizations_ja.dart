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
  String get backupFileSizeExceeded => 'バックアップファイルが 2 MiB を超えています。';

  @override
  String get backupHistoryMustBeList => '\"history\" は配列である必要があります。';

  @override
  String backupInvalidJson(String error) {
    return '無効なJSON形式です: $error';
  }

  @override
  String get backupInvalidRuleNote => '無効なメモ文字列です。';

  @override
  String get backupInvalidRuleSha => '無効なSHA-256ハッシュ文字列です。';

  @override
  String get backupInvalidTemplateId => '無効なテンプレートIDです。';

  @override
  String get backupInvalidTemplateName => '無効なテンプレート名です。';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return '履歴数が上限の $max 件を超えています ($count)。';
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
  String get clearConfirmMessage => 'タグ上のすべてのNDEFレコードが消去されます。続行しますか？';

  @override
  String get clearConfirmTitle => 'タグ内容の初期化';

  @override
  String get clearHistory => '履歴を削除';

  @override
  String get clearTagSubtitle => '全レコードを消去して空のNDEFを書き込みます';

  @override
  String get clearTagTitle => 'タグを消去';

  @override
  String get close => '閉じる';

  @override
  String get commandsEmptyError => 'コマンドを1つ以上入力してください。';

  @override
  String get commandsLabel => 'コマンド';

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
  String get contactPhone => '電話番号';

  @override
  String get contactTitle => '役職 / 部署';

  @override
  String get contactWebsite => 'Webサイト';

  @override
  String get copy => 'コピー';

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
  String get deleteTemplateTooltip => 'テンプレートを削除';

  @override
  String get deviceNameTooLong => 'デバイス名が長すぎます。';

  @override
  String get dismiss => '閉じる';

  @override
  String get editRecordTitle => 'レコードを編集';

  @override
  String get emailRecipient => '宛先メールアドレス';

  @override
  String get exportBackup => 'エクスポート';

  @override
  String get facetimePrompt => '電話番号またはApple IDのメールアドレスを入力してください。';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" は必須項目です。';
  }

  @override
  String get flashlight => 'ライト';

  @override
  String get formatMemorySubtitle => 'NDEF用に初期化します (未フォーマットや破損タグ)';

  @override
  String get formatMemoryTitle => 'メモリをフォーマット';

  @override
  String get idTooLarge => 'IDの長さは255バイト以内です';

  @override
  String get importBackup => 'インポート (結合)';

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
  String get locationLabel => '設置場所';

  @override
  String get lockAcknowledge => 'この操作は取り消せないことを理解しました';

  @override
  String get lockTagSubtitle => 'タグを恒久的に読み取り専用にします (解除不可)';

  @override
  String get lockTagTitle => 'タグをロック';

  @override
  String get manage => '管理';

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
  String get nfcPromptClear => '初期化するタグを近づけてください';

  @override
  String get nfcPromptLock => '永久ロックするタグを近づけてください';

  @override
  String get nfcPromptScan => 'タグをスマートフォンの上部に近づけてください';

  @override
  String get nfcPromptWrite => 'データを書き込むタグを近づけてください';

  @override
  String get no => 'いいえ';

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
  String get presetBusinessCardDesc =>
      '連絡先カードを共有。Androidは保存を提案し、iPhoneではNFCアプリで開きます。';

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
  String get presetGuestWifiDesc => 'Androidはタッチで接続、iPhoneではNFCアプリで情報を表示します。';

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
  String get rawRecordDetailsTitle => 'レコード詳細 (読み取り専用)';

  @override
  String get rawRecordEditorTitle => '生のNDEFレコード編集';

  @override
  String get readHeroButton => 'スキャン開始';

  @override
  String get readMemorySubtitle => 'ページ単位の生メモリ表示; コピーまたは .bin 保存';

  @override
  String get readMemoryTitle => 'メモリ読み取り';

  @override
  String get readyTemplates => '既製テンプレート';

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
  String get redo => 'やり直し';

  @override
  String get removePasswordSubtitle => '設定済みパスワードを入力して保護を解除';

  @override
  String get removePasswordTitle => 'パスワード解除';

  @override
  String get rewriteTag => '再書き込み';

  @override
  String ruleDeleteConfirm(String note) {
    return 'メモ \"$note\" のルールを削除しますか？';
  }

  @override
  String get ruleNoteDialogTitle => 'タグのメモを編集';

  @override
  String get ruleNoteLabel => 'ローカルメモ / ラベル';

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
  String get scanFabLabel => 'タグをスキャン';

  @override
  String get scannedTag => 'スキャンしたタグ';

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
  String get socialUsername => 'ユーザー名';

  @override
  String get sourceSelectPrompt => 'どこからタグデータを取得しますか？';

  @override
  String get statusCancelled => 'キャンセルされました';

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
  String get tabContact => '連絡先 (vCard)';

  @override
  String get tabCustomMime => '独自MIME';

  @override
  String get tabEmail => 'メール';

  @override
  String get tabPhone => '電話番号';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabText => 'テキスト';

  @override
  String get tabUrl => 'Web URL';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => 'タグ情報';

  @override
  String get tagLibraryTitle => 'タグライブラリ';

  @override
  String tagRulesCount(int count) {
    return '登録ルール / メモ数: $count';
  }

  @override
  String get tagRulesSubtitle => 'NDEFバイト列のSHA-256ハッシュに基づいて一致するメモのみを表示します。';

  @override
  String get tagWritable => '書き込み可能';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get templateNameHint => 'テンプレート名';

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
  String get verificationNotChecked => '未確認';

  @override
  String get verificationPassed => '合格';

  @override
  String get videoUrlCannotBeEmpty => '動画リンクを入力してください。';

  @override
  String get videoUrlOrIdPrompt => 'URL (https://...) または動画IDを入力してください。';

  @override
  String get wifiAuthOpen => 'オープン (暗号化なし)';

  @override
  String get wifiPassword => 'パスワード';

  @override
  String get wifiSsid => 'ネットワーク名 (SSID)';

  @override
  String get withSiri => 'Siriで操作';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes バイト) をユーザーメモリに書き込みます。既存データは上書きされます。';
  }

  @override
  String get writeDumpSubtitle => '保存したバイナリファイルをタグに書き込みます';

  @override
  String get writeDumpTitle => 'ダンプ書き込み (.bin)';

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
  String get unknown => '不明';

  @override
  String get error => 'エラー';

  @override
  String get nfcPromptReady => 'タグを近づけてください';

  @override
  String get invalidResponseFormat => '無効な応答形式を受信しました';

  @override
  String get nfcReadError => 'NFC読み取りエラー';

  @override
  String get invalidPlatformResponse => 'プラットフォームから無効な応答を受信しました';

  @override
  String get writeFailed => '書き込みに失敗しました';

  @override
  String get lockFailed => 'ロックに失敗しました';

  @override
  String get failedToConnectTag => 'タグに接続できませんでした';

  @override
  String get invalidTagResponse => 'タグからの無効な応答';

  @override
  String get commandFailed => 'コマンドが失敗しました';

  @override
  String get ndefTypeOrIdTooLong => 'NDEFタイプまたはIDが255バイトを超えています';

  @override
  String get ndefUnsupportedOrInvalidRecord => 'サポートされていないか無効なNDEFレコード';

  @override
  String get ndefMissingTypeLength => 'NDEFタイプ長がありません';

  @override
  String get ndefMissingPayloadLength => 'NDEFペイロード長がありません';

  @override
  String get ndefMissingIdLength => 'NDEF ID長がありません';

  @override
  String get ndefMissingType => 'NDEFタイプがありません';

  @override
  String get ndefMissingId => 'NDEF IDがありません';

  @override
  String get ndefMissingPayload => 'NDEFペイロードがありません';

  @override
  String get unprotected => '(パスワードなし)';

  @override
  String get binaryDataPreview => '(バイナリデータ)';

  @override
  String get emptyValue => '(空)';

  @override
  String get tnfEmpty => '0: Empty (空)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (不明)';

  @override
  String get tnfUnchanged => '6: Unchanged (チャンク化NDEF)';

  @override
  String get tnfReserved => '7: Reserved (予約済み)';

  @override
  String get ntagUnsupportedChip =>
      'この操作はNTAG213/215/216およびMIFARE Ultralight EV1タグでのみサポートされています。';

  @override
  String ntagPageReadFailed(String page) {
    return 'ページ$pageを読み取れませんでした（タグが応答しないか領域が保護されています）。';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'ページ$pageに書き込めませんでした: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'ページ$pageに書き込めませんでした（タグが拒否しました。ロックまたはパスワード保護の可能性があります）。';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'ページ$page以降を読み取れませんでした。この領域はパスワードで保護されている可能性があります。';
  }

  @override
  String get ntagPasswordPackSize => 'パスワードは4バイト、PACKは2バイトである必要があります。';

  @override
  String get ntagPasswordSize => 'パスワードは4バイトである必要があります。';

  @override
  String get ntagPasswordWrongOrAuthFailed => 'パスワードが正しくないか、タグが認証を拒否しました。';

  @override
  String get ntagPasswordWrong => 'パスワードが正しくありません。';

  @override
  String get ntagCcInvalid => 'タグのCC領域にNDEF以外の値が書き込まれています。このOTP領域はフォーマットできません。';

  @override
  String get ntagDumpTooShort => 'ダンプファイルが短すぎます。ユーザーデータが含まれていません。';

  @override
  String get ntagInvalidHex => '有効な16進数値を入力してください（例: 30 04）。';

  @override
  String get googleReviewFieldLabel => 'レビューリンクまたはPlace ID';

  @override
  String get menuLinkFieldLabel => 'メニューリンク';

  @override
  String get menuTitleHint => 'メニュー';

  @override
  String get petName => 'ペットの名前';

  @override
  String get ownerPhone => '飼い主の電話番号';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'こんにちは、$petです！飼い主に電話してください: $phone$note';
  }

  @override
  String get bloodType => '血液型';

  @override
  String get allergies => 'アレルギー / 服用薬';

  @override
  String get emergencyContact => '緊急連絡先';

  @override
  String get emergencyInfo => '緊急情報';

  @override
  String emergencyBlood(String blood) {
    return '血液型: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'アレルギー: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return '緊急時の連絡先: $contact';
  }

  @override
  String get storeLink => 'ストアリンク';

  @override
  String get link => 'リンク';

  @override
  String get title => 'タイトル';

  @override
  String get webAddress => 'ウェブアドレス';

  @override
  String get address => '住所';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'テンプレート: $added件追加、$updated件更新';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'タグノート/ルール: $added件追加、$updated件更新';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return '履歴がデバイスで無効なためスキップされました: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return '履歴: $added件追加、$skipped件スキップ';
  }

  @override
  String get backupSummaryNoNewData => 'インポートする新しいデータが見つかりませんでした（既存のレコードと一致）。';

  @override
  String backupFieldMustBeString(String field) {
    return '$fieldは文字列である必要があります。';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$fieldは有効な日付である必要があります。';
  }

  @override
  String get rawTypeHexLabel => 'タイプ（16進バイト）';

  @override
  String get rawIdHexLabel => 'ID（16進バイト、オプション）';

  @override
  String get rawPayloadHexLabel => 'ペイロード（16進バイト）';

  @override
  String get rawOptionalHexHint => '任意の16進バイト';

  @override
  String get saveChanges => '変更を保存';

  @override
  String get edit => '編集';

  @override
  String get clearAllButton => 'すべて消去';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: $count ページ読み取り完了';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip がフォーマットされました';
  }

  @override
  String get ntagInvalidDumpFile =>
      '無効なダンプファイル (4 バイトの倍数、32～1024 バイトである必要があります)。';

  @override
  String ntagPagesWritten(int count) {
    return '$count ページ書き込み完了';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: パスワード保護が有効化されました';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: パスワードが解除されました';
  }

  @override
  String get memoryDumpCopied => 'メモリダンプをコピーしました';

  @override
  String ntagCommandsSent(int count) {
    return '$count 件のコマンドを送信しました';
  }

  @override
  String get emptyResponse => '(空の応答)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages ページ · $bytes バイト';
  }

  @override
  String get composeTextEmpty => 'テキストコンテンツを空にすることはできません。';

  @override
  String get composeTextTooLong => 'テキストが長すぎます（最大5000文字）。';

  @override
  String get composeUrlInvalid =>
      '有効なアドレスを入力してください（例：https://example.com または app:// リンク）。';

  @override
  String get composeUrlTooLong => 'URLが長すぎます（最大2000文字）。';

  @override
  String get composeEmailInvalid => '有効なメールアドレスを入力してください（例：name@domain.com）。';

  @override
  String get composePhoneInvalid => '有効な電話番号を入力してください（例：+905551234567）。';

  @override
  String get composeSmsPhoneInvalid => '有効な受信者電話番号を入力してください。';

  @override
  String get composeLatInvalid => '緯度は -90 から +90 の間でなければなりません。';

  @override
  String get composeLngInvalid => '経度は -180 から +180 の間でなければなりません。';

  @override
  String get composeVcardNameEmpty => '連絡先名またはフルネームを空にすることはできません。';

  @override
  String get composeVcardNameTooLong => '連絡先名が長すぎます（最大200文字）。';

  @override
  String get composeVcardEmailInvalid => '有効なメールアドレスを入力してください。';

  @override
  String get composeVcardPhoneInvalid => '有効な電話番号を入力してください。';

  @override
  String get composeVcardUrlInvalid => '有効なWebアドレスを入力してください（例：https://...）。';

  @override
  String get composeCalSummaryEmpty => 'イベントのタイトルを空にすることはできません。';

  @override
  String get composeCalSummaryTooLong => 'イベントのタイトルが長すぎます（最大250文字）。';

  @override
  String get composeCalDateInvalid => '終了時間は開始時間より後である必要があります。';

  @override
  String get composeSpUriInvalid => '有効なターゲットURLを入力してください（例：https://...）。';

  @override
  String get composeSpLangInvalid => '有効なISO言語コードを入力してください（例：ja, en）。';

  @override
  String get composeMimeTypeInvalid =>
      '有効なMIMEタイプを入力してください（例：application/json、text/plain）。';

  @override
  String get composeMimeHexInvalid => '有効な16進数文字列を入力してください（偶数の16進文字）。';

  @override
  String get composeMimePayloadTooLarge => 'ペイロードサイズが大きすぎます（最大10 KB）。';

  @override
  String get composeWifiSsidEmpty => 'ネットワーク名（SSID）を空にすることはできません。';

  @override
  String get composeWifiPasswordRequired => '暗号化ネットワークにはWi-Fiパスワードが必要です。';

  @override
  String get composeWifiPasswordLength => 'WPA/WPA2パスワードは8〜63文字である必要があります。';

  @override
  String get composeEditNdefRecord => 'NDEFレコードを編集';

  @override
  String get composeNewNdefRecord => '新しいNDEFレコードを作成';

  @override
  String get quickLinksHeader => 'クイックリンク';

  @override
  String get quickLinkCustomUri => 'カスタムURI';

  @override
  String get quickLinkSocial => 'ソーシャルネットワーク';

  @override
  String get quickLinkVideo => '動画';

  @override
  String get quickLinkSearch => '検索';

  @override
  String get quickLinkFile => 'ファイル';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime オーディオ';

  @override
  String get quickLinkAddress => '住所';

  @override
  String get quickLinkPayment => '支払いリンク';

  @override
  String get quickLinkApp => 'アプリ (Android)';

  @override
  String get updateRecord => 'レコードを更新';

  @override
  String get addToList => 'リストに追加';

  @override
  String get quickCustomUriError =>
      'スキームを含むアドレスを入力してください（例：spotify:track:... または myapp://page）。';

  @override
  String get quickFileEmptyMessage => 'ファイルのリンクを入力してください。';

  @override
  String get quickPaymentEmptyMessage => '支払いリンクを入力してください。';

  @override
  String get quickCustomUriDesc => 'スキームで始まるアドレスを入力できます。電話は対応するアプリを開きます。';

  @override
  String get quickSocialLabel => 'ソーシャルネットワーク';

  @override
  String get quickVideoLabel => '動画リンク';

  @override
  String get quickVideoHint => 'https://youtu.be/... または動画ID';

  @override
  String get quickVideoDesc => 'YouTube、Vimeoなどのリンク、またはYouTube動画IDのみを入力できます。';

  @override
  String get quickSearchHint => '例：東京の天気';

  @override
  String get quickFileLabel => 'ファイルリンク';

  @override
  String get quickFileDesc =>
      'タグ容量が小さいため、ファイル自体ではなくWebリンクを書き込みます（Google Drive、Dropboxなど）。';

  @override
  String get quickPhoneOrAppleId => '電話番号またはApple ID';

  @override
  String get quickFacetimeVideoDesc => 'タグにタッチしたiPhoneはFaceTimeビデオ通話を開始します。';

  @override
  String get quickFacetimeAudioDesc => 'タグにタッチしたiPhoneはFaceTime音声通話のみを開始します。';

  @override
  String get quickMapProvider => 'マップアプリ';

  @override
  String get quickAddressHint => '例：東京都千代田区1-1';

  @override
  String get quickPaymentDesc =>
      'PayPal.me、Stripeなどの支払いリンクを使用できます。カード情報は決してタグに書き込まれません。';

  @override
  String get quickAppDesc =>
      'Android端末はタッチ時にこのアプリを開きます（未インストールの場合はPlayストア）。iPhoneはこのタイプを無視します。App StoreリンクをURLとして追加してください。';

  @override
  String get quickDeviceNameOptional => 'デバイス名（省略可能）';

  @override
  String get quickSpeakerHint => '例：スピーカー';

  @override
  String get quickBluetoothDesc =>
      'Android端末はタッチ時にこのデバイスとのペアリングを提案します。iPhoneはBluetoothペアリングタグをサポートしていません。';

  @override
  String get composeTextContent => 'テキスト内容';

  @override
  String get composeTextHint => '書き込みたいテキストを入力してください';

  @override
  String get composeEmailSubjectOptional => '件名（省略可能）';

  @override
  String get composeEmailBodyOptional => '本文（省略可能）';

  @override
  String get composeSmsRecipient => '受信者電話番号';

  @override
  String get composeSmsHint => '送信するSMSメッセージ...';

  @override
  String get composeVcardFullName => 'フルネーム（表示名） *';

  @override
  String get composeVcardNameHint => '山田 太郎';

  @override
  String get composeVcardNote => 'メモ / 説明';

  @override
  String get composeCalTitle => 'イベントタイトル *';

  @override
  String get composeCalTitleHint => 'プロジェクト会議';

  @override
  String get composeCalLocationHint => '会議室2またはオンライン';

  @override
  String get composeCalDesc => 'イベントの説明';

  @override
  String get composeCalStartEndTime => '開始および終了時間：';

  @override
  String get composeSpTitleLabel => 'タイトル（表示テキスト）';

  @override
  String get composeSpTitleHint => '会社案内パンフレット';

  @override
  String get composeMimeTypeLabel => 'MIMEタイプ *';

  @override
  String get composeDataFormat => 'データ形式: ';

  @override
  String get composeFormatHex => '16進数（Hex）';

  @override
  String get composeMimeHexBytes => '16進数バイト *';

  @override
  String get composeMimeTextPayload => 'ペイロードテキスト（UTF-8） *';

  @override
  String get composeWifiWarningTitle => 'セキュリティおよびプラットフォームの注意：';

  @override
  String get composeWifiWarningBody =>
      '• タグに書き込まれたWi-Fiパスワードは平文で保存され、誰でも簡単に読み取ることができます。\n• タッチ時の自動ネットワーク接続は保証されません。ユーザーの確認が必要な場合があります。';

  @override
  String get composeWifiSsidLabel => 'ネットワーク名（SSID） *';

  @override
  String get composeWifiAuthTypeLabel => 'セキュリティタイプ（認証）';

  @override
  String get composeWifiOpenNetwork => 'オープンネットワーク（なし）';

  @override
  String get composeWifiPasswordLabel => 'Wi-Fiパスワード *';

  @override
  String get composeWifiEncryptionLabel => '暗号化タイプ';

  @override
  String get composeWifiAesRecommended => 'AES（推奨）';

  @override
  String get quickSearchTextLabel => '検索テキスト';

  @override
  String get readTagMemoryPrompt => 'メモリを読み取るにはタグを電話に近づけてください';

  @override
  String get readingTagMemoryStatus => 'メモリを読み取っています...';

  @override
  String get formatTagConfirmTitle => 'メモリをフォーマット';

  @override
  String get formatTagConfirmMessage => 'タグのデータは消去され、空のNDEFとして初期化されます。続行しますか？';

  @override
  String get formatButton => '初期化';

  @override
  String get formatTagPrompt => 'フォーマットするタグを近づけてください';

  @override
  String get formattingStatus => 'フォーマット中...';

  @override
  String filePickerFailed(String error) {
    return 'ファイル選択に失敗しました：$error';
  }

  @override
  String get writeButton => '書き込み';

  @override
  String get writeDumpPrompt => 'ダンプを書き込むタグを近づけてください';

  @override
  String get writingDumpStatus => 'ダンプ書き込み中...';

  @override
  String get setPasswordWarning => 'パスワードを忘れると、内容を二度と変更できなくなります。読み取りは誰でも可能です。';

  @override
  String get setPasswordAction => 'パスワードを設定';

  @override
  String get setPasswordPrompt => 'パスワードを設定するタグを近づけてください';

  @override
  String get settingPasswordStatus => 'パスワード設定中...';

  @override
  String get removePasswordPromptMessage => 'タグに以前設定したパスワードを入力してください。';

  @override
  String get remove => '削除';

  @override
  String get removePasswordPrompt => 'パスワードを解除するタグを近づけてください';

  @override
  String get removingPasswordStatus => 'パスワード解除中...';

  @override
  String get sendCommandsPrompt => 'コマンドを送信するタグを近づけてください';

  @override
  String get sendingCommandsStatus => 'コマンド送信中...';

  @override
  String get sendButton => '送信';

  @override
  String get tagNoteEditTitle => 'タグメモを編集';

  @override
  String get tagNoteInputLabel => 'アプリ内メモ / 説明';

  @override
  String get tagNoteInputHint => '例：会議室情報または保管棚 #12';

  @override
  String get tagNoteDeleteTitle => 'タグメモを削除';

  @override
  String get clearAllTagRulesTitle => 'すべてのメモを削除';

  @override
  String get clearAllTagRulesConfirm => '保存されたすべてのアプリ内タグメモが削除されます。よろしいですか？';

  @override
  String get deleteAll => 'すべて削除';

  @override
  String get tagRulesExplanation =>
      'NDEF SHA-256ダイジェストに一致するタグには保存されたメモのみが表示されます。外部操作は実行されません。';

  @override
  String get noTagRulesDefined => 'タグメモはまだ定義されていません。';

  @override
  String lastUpdated(String time) {
    return '最終更新：$time';
  }

  @override
  String get tagLibraryNoMatch => '検索に一致するタグが見つかりませんでした。';

  @override
  String get tagLibraryAddToLibrary => 'ライブラリに追加';

  @override
  String get name => '名前';

  @override
  String get tagLibraryAddTag => 'タグを追加';

  @override
  String get all => 'すべて';

  @override
  String tagLibraryPhotoError(String error) {
    return '写真を選択できませんでした：$error';
  }

  @override
  String get tagLibraryDeleteTitle => 'タグを削除';

  @override
  String get tagLibraryNameHint => '例：オフィスのキーホルダー';

  @override
  String get tagLibraryNoTagContent => 'このレコードにタグコンテンツはありません。';

  @override
  String get tagLibrarySourceLastScanned => '最後にスキャン';

  @override
  String get tagLibraryEmpty => '保存されたタグはまだありません。';

  @override
  String get tagLibrarySourceEmpty => '空のレコード';

  @override
  String get tagLibraryNamePrompt => 'タグ名を入力してください';

  @override
  String get tagLibrarySearchHint => '名前、カテゴリ、または場所で検索...';

  @override
  String get tagLibrarySourceWriteList => '書き込みリスト';

  @override
  String get tagLibraryLocationHint => '例：デスク、玄関';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return 'タグ「$name」をライブラリから削除してもよろしいですか？';
  }

  @override
  String get noContent => 'コンテンツなし';

  @override
  String tagLibraryRecordSummary(num count) {
    return '$count NDEFレコード';
  }

  @override
  String get tagLibraryEditTag => 'タグを編集';

  @override
  String get rawTypeHexHint => '41 (A) または 55 (U) など';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context：「records」フィールドはリストである必要があります。';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context：アイテムには最大 $max 個の NDEF レコードを含めることができます。';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - レコード #$index は有効なオブジェクトではありません。';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - レコード #$index：無効なTNF値（$tnf）。';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - レコード #$index：「type」はBase64文字列である必要があります。';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - レコード #$index：「type」は有効なBase64データではありません（$error）。';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - レコード #$index：「id」はBase64文字列である必要があります。';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - レコード #$index：「id」は有効なBase64データではありません（$error）。';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - レコード #$index：「payload」はBase64文字列である必要があります。';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - レコード #$index：「payload」は有効なBase64データではありません（$error）。';
  }

  @override
  String get composerUndoSnack => '最後の変更を元に戻しました。';

  @override
  String get composerRedoSnack => '変更をやり直しました。';

  @override
  String get noRecordsToCopy => 'コピーするNDEFレコードがありません。';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count 件のNDEFレコード（$bytes B）がクリップボードにコピーされました。\n（NDEFコンテンツのみコピーされます。UIDや暗号化セクターは複製されません）';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source：$count 件のレコードを追加しました。';
  }

  @override
  String get tagEmptyNoRecordsToImport => 'タグは空です。インポートするレコードがありません。';

  @override
  String get sourceTag => 'タグから';

  @override
  String get sourceQr => 'QRコードから';

  @override
  String filePickerError(String error) {
    return 'ファイル選択を開けません: $error';
  }

  @override
  String get csvFileTooLarge => 'CSVファイルが大きすぎます（最大512 KB）。';

  @override
  String get noRecordsFound => 'レコードが見つかりません';

  @override
  String get someRowsSkipped => '一部の行がスキップされました';

  @override
  String get expectedFormat => '期待される形式：';

  @override
  String get noClipboardContent => 'クリップボードにコピーされたNDEFコンテンツはありません。';

  @override
  String get pasteFromClipboardTitle => 'NDEFクリップボードから貼り付け';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'クリップボードのデータ：$count 件のレコード、$bytes バイト（$source）';
  }

  @override
  String get clipboardPastePrompt => '現在のレコードを置き換えますか、それとも末尾に追加しますか？';

  @override
  String get pasteOverwriteOption => '上書き（置換）';

  @override
  String pasteOverwriteSubtitle(num count) {
    return '現在の $count 件のレコードが削除され、クリップボードの内容に置き換えられます（確認が必要）。';
  }

  @override
  String get pasteEmptySubtitle => 'クリップボードの内容が入力されます。';

  @override
  String get pasteAppendOption => '末尾に追加';

  @override
  String get pasteAppendSubtitle => '現在のレコードは保持され、クリップボードのレコードがリストの末尾に追加されます。';

  @override
  String recordsAddedToComposer(num count) {
    return '$count 件のレコードを追加しました。';
  }

  @override
  String get confirmOverwriteTitle => 'レコードを上書きしますか？';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return '現在 $currentCount 件のレコードがあります。クリップボードの $newCount 件に置き換わります。続行しますか？';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'レコードが $count 件の新しいレコードに置き換わりました。';
  }

  @override
  String get yesReplace => 'はい、置き換える';

  @override
  String recordsImportedToComposer(num count) {
    return '$count 件のレコードをインポートしました。';
  }

  @override
  String get noContentToCopy => 'コピーするNDEFコンテンツが見つかりませんでした。';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count 件のNDEFレコードがコピーされ、追加されました（内容はコピーされますがUIDは複製されません）。';
  }

  @override
  String get noContentToRewrite => '再書き込みするNDEFコンテンツが見つかりませんでした。';

  @override
  String get rewriteTagTitle => 'タグを再書き込み';

  @override
  String get importantNotice => '重要なお知らせ：';

  @override
  String get rewriteNotice1 => '• この操作は既存のNDEFコンテンツを完全に上書きします（追加ではありません）。\n';

  @override
  String get rewriteNotice2 => '• 対象のタグは書き込み可能（ロック解除）なNDEFタグである必要があります。\n';

  @override
  String get rewriteNotice3 => '• 前のタグに自動で書き込むことはありません。新しいNFCタッチが必要です。';

  @override
  String get rewriteInstruction => '対象タグを用意し、「タッチして書き込み」を押してからタグを近づけてください。';

  @override
  String get tapAndWrite => 'タッチして書き込み';

  @override
  String get rewritePromptMessage => '対象タグをデバイスに近づけてください（内容は完全に更新されます）';

  @override
  String get writeVerifiedTitle => '書き込み検証完了';

  @override
  String get writeVerifiedDesc => 'NDEFコンテンツが対象タグに正常に書き込まれ、検証されました。';

  @override
  String get writeVerifiedHint => '次のスキャンを開始して、書き込まれたデータを確認・比較できます。';

  @override
  String get scanAndCompareNow => '今すぐスキャンして比較';

  @override
  String get contentMatchesExactly => 'コンテンツが完全に一致しています';

  @override
  String get differenceDetected => '相違点が検出されました';

  @override
  String get compareMatchDesc => '対象タグのNDEFメッセージは書き込まれたソースとバイト単位で完全に一致しています。';

  @override
  String get compareDiffDesc =>
      '読み取られたデータと書き込みデータに相違があります。タグがロックされていないか確認してください。';

  @override
  String get batchEmptyComposerError => '一括書き込みを開始する前に、少なくとも1つのレコードを追加してください。';

  @override
  String get batchWriteTitle => 'タグの一括書き込み';

  @override
  String get batchWriteSubtitle => '同じNDEFコンテンツを複数のタグに連続して書き込みます。';

  @override
  String get attention => '注意：';

  @override
  String get batchNotice1 => '• 誤って同じタグに重複書き込みしないよう、各書き込みは「次を書き込む」で開始されます。\n';

  @override
  String get batchNotice2 => '• 自動連続スキャンは行われません。各タグを物理的に交換する必要があります。';

  @override
  String get batchStartButton => '一括書き込みを開始';

  @override
  String get batchControlPanelTitle => '一括書き込みコントロールパネル';

  @override
  String get batchCancelOrClose => 'キャンセル / 閉じる';

  @override
  String get batchAllCompleted => 'すべてのタグの試行が完了しました！';

  @override
  String batchStats(String ok, String failed, String left) {
    return '成功: $ok | 失敗: $failed | 残り: $left';
  }

  @override
  String get waitingForTag => 'タグを待機中...';

  @override
  String get batchFinishButton => '一括書き込みを終了';

  @override
  String get writeError => '書き込みエラー';

  @override
  String get batchConfirmCancelTitle => '一括書き込みをキャンセル';

  @override
  String get batchConfirmCancelMessage =>
      '一括書き込みセッションを終了しますか？これまでに書き込まれたタグは保持されます。';

  @override
  String get cancelled => 'キャンセルされました';

  @override
  String get batchCancelledSnack => '一括書き込みがキャンセルされました。作成中の内容は保持されました。';

  @override
  String get cancelAndClose => 'キャンセルして閉じる';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'オフラインURL分析';

  @override
  String get urlSafetyScheme => 'スキーム（プロトコル）：';

  @override
  String get urlSafetyPort => 'ポート：';

  @override
  String get urlSafetyUserInfoLabel => 'ユーザー情報：';

  @override
  String get urlSafetyIpLiteral => '直接IPアドレス：';

  @override
  String get urlSafetyDomain => 'いいえ（ドメイン名）';

  @override
  String get urlSafetyPunycodeLabel => '国際 / Punycode (xn--)：';

  @override
  String get urlSafetyHomoglyphRisk => 'はい（ホモグリフの疑い）';

  @override
  String get urlSafetyWarningsHeader => 'セキュリティ / 警告アラート：';

  @override
  String get urlSafetyDisclaimer =>
      '注意：オフラインルールによる分析です。オンラインのマルウェア検査ではありません。URLは自動で開きません。';

  @override
  String get templateSaveEmptyError => 'テンプレートとして保存する前にレコードを追加してください。';

  @override
  String templateDefaultName(String n) {
    return 'テンプレート $n';
  }

  @override
  String get templateNameSample => '例：会社のWebサイトと連絡先';

  @override
  String get templateSavedSnack => 'テンプレートを保存しました。';

  @override
  String get ruleNoteRequiresNdef =>
      'メモを追加するには、タグに少なくとも1つのNDEFレコードが含まれている必要があります。';

  @override
  String get ruleNoteAddTitle => 'カスタムタグメモを追加';

  @override
  String get ruleNoteDigestExplanation =>
      'このメモはNDEFのSHA-256ダイジェストに関連付けられます。スキャン時にこの説明のみが表示されます。';

  @override
  String get ruleNoteSavedSnack => 'タグメモを保存しました。';

  @override
  String get ruleNoteDeleteConfirm => 'このタグに登録されたアプリ内メモが削除されます。続行しますか？';

  @override
  String get ruleNoteDeletedSnack => 'タグメモを削除しました。';

  @override
  String get backupExportTitle => 'バックアップをエクスポート';

  @override
  String get backupExportWarningTitle => 'プライバシーおよびセキュリティの警告';

  @override
  String get backupExportWarningBody =>
      'エクスポートされたバックアップ（JSON）は平文です。Wi-Fiパスワードや個人情報が含まれる可能性があります。安全に保管してください。';

  @override
  String get backupIncludedItems => '含まれる項目：';

  @override
  String backupTemplatesCount(String count) {
    return '• テンプレート: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• タグのメモ/ルール: $count';
  }

  @override
  String get backupIncludeHistoryOptional => 'スキャン履歴を含める（省略可能）';

  @override
  String backupHistoryCount(String count) {
    return '履歴 $count件';
  }

  @override
  String get backupHistoryDisabled => 'このデバイスではスキャン履歴が無効です';

  @override
  String get backupExportAndShare => 'エクスポートして共有';

  @override
  String get backupFileNameLabel => 'NFC Tag Master バックアップファイル';

  @override
  String get backupFileShareSubject => 'NFC Tag Master テンプレートとデータのバックアップ（JSON）';

  @override
  String get backupExportSuccessSnack => 'バックアップファイルが正常にエクスポートされ、共有されました。';

  @override
  String get backupExportCancelled => 'エクスポートの共有がキャンセルされました。';

  @override
  String get backupImportTitle => 'バックアップをインポート';

  @override
  String get backupMergeRuleTitle => 'セキュリティおよびマージポリシー';

  @override
  String get backupMergeRule1 => '• インポートはマージ方式で行われます。既存のレコードは決して削除されません。\n';

  @override
  String get backupMergeRule2 =>
      '• Wi-Fiパスワード等が含まれる可能性があるため、信頼できるソースからのみ読み込んでください。\n';

  @override
  String get backupMergeRule3 =>
      '• ファイルサイズ制限：2 MiB。読み込み前に厳密なスキーマとBase64検証が行われます。';

  @override
  String get backupSelectFilePrompt => 'マージする有効な .json バックアップファイルを選択してください。';

  @override
  String get selectFileButton => 'ファイルを選択';

  @override
  String get fileSelectionCancelled => 'ファイル選択がキャンセルされました。';

  @override
  String get backupFileExceedsLimit => '選択したファイルは許可されている2 MiBの制限を超えています。';

  @override
  String fileReadError(String error) {
    return 'ファイル読み込みエラー: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'バックアップ検証エラー: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'スキャン履歴が検出されました';

  @override
  String get backupHistoryDetectedPrompt =>
      '履歴もインポートして有効にしますか？それともスキップしてテンプレートとメモのみを読み込みますか？';

  @override
  String get backupSkipHistoryOption => '履歴をスキップ（テンプレートとメモのみ読み込む）';

  @override
  String get backupEnableHistoryOption => '履歴を有効にして読み込む';

  @override
  String get nfcReadyStatus => 'NFC準備完了';

  @override
  String get nfcReadyDesc => 'NFCハードウェアはアクティブで利用可能です';

  @override
  String get nfcDisabledStatus => 'NFC無効';

  @override
  String get nfcDisabledDesc => 'NFCがオフです。端末の設定からオンにしてください。';

  @override
  String get template => 'テンプレート';

  @override
  String get nfcScannerTitle => 'NFCスキャナー';

  @override
  String get composeRecord => 'レコードを作成';

  @override
  String get protectOrRemove => '保護 / 解除';

  @override
  String get previousScans => '前回のスキャン';

  @override
  String get noScannedTagYet => 'スキャンされたNFCタグはまだありません';

  @override
  String get tapScanPrompt => '「スキャンを開始」をタップして、タグを電話に近づけてください。';

  @override
  String get ndefCopyAndRewriteTitle => 'NDEFコンテンツのコピーと再書き込み';

  @override
  String get savedTagNoteHeader => '保存されたタグメモ（アプリ内ルール）';

  @override
  String get tagNoteOrRule => 'タグメモ / ルール';

  @override
  String get editNote => 'メモを編集';

  @override
  String get deleteNote => 'メモを削除';

  @override
  String get tagNoteDigestNotice =>
      'このメモは正確なNDEFバイトのSHA-256ダイジェストと一致します。外部操作は起動しません。';

  @override
  String get addCustomTagNotePrompt => 'このNDEFコンテンツにカスタムのローカルメモや説明を追加できます。';

  @override
  String get addNoteToThisTag => 'このタグにメモを追加';

  @override
  String get ndefSupport => 'NDEFサポート：';

  @override
  String get usedSpace => '使用済み容量：';

  @override
  String get freeSpace => '空き容量：';

  @override
  String get noNdefMessageOnTag => 'タグに保存されたNDEFメッセージが見つかりませんでした。';

  @override
  String get hideDetails => '詳細を非表示';

  @override
  String get advancedRecordInspector => 'レコードインスペクター（高度）';

  @override
  String get ndefRecordInspectorTitle => '高度なNDEFレコードインスペクター';

  @override
  String get inspectorType => 'タイプ：';

  @override
  String get inspectorPayloadLength => 'ペイロード長：';

  @override
  String get inspectorRawHexPreview => '生Hexプレビュー（制限あり）：';

  @override
  String get ndefRecordsToWriteTitle => '書き込むNDEFレコード';

  @override
  String get pasteFromClipboardAction => 'クリップボードから貼り付け（置換 / 追加）';

  @override
  String get importAction => 'インポート';

  @override
  String get importFromTagAction => 'NFCタグからインポート';

  @override
  String get importFromQrAction => 'QRコードからインポート';

  @override
  String get importFromCsvAction => 'CSVファイルからインポート';

  @override
  String get composerEmptyDescription =>
      'テキスト、Webリンク、Wi-Fi、電話、メール、連絡先カードなどをタグに書き込めます。';

  @override
  String get urlSafetyReview => 'URL確認';

  @override
  String get inspector => 'インスペクター';

  @override
  String get typeLabel => 'タイプ：';

  @override
  String get payloadLabel => 'ペイロード：';

  @override
  String get writeAndVerify => 'タグに書き込んで検証';

  @override
  String get batchWriteButtonLabel => 'タグの一括書き込み（2〜100枚）';

  @override
  String get clearTagButtonLabel => 'タグをリセット（内容を消去）';

  @override
  String get confirmWriteTitle => 'タグへの書き込みを確認';

  @override
  String get confirmWriteMessage1 => 'この操作は対象タグの既存のNDEFコンテンツを完全に上書きします。';

  @override
  String get confirmWriteMessage2 =>
      '対象タグが書き込み可能（ロック解除）であることを確認してください。自動検証されます。';

  @override
  String get yesWrite => 'はい、書き込む';

  @override
  String get scanHistoryDisabledTitle => 'スキャン履歴は無効です';

  @override
  String get scanHistoryDisabledDesc =>
      'プライバシー保護のため、履歴はデフォルトで保存されません。設定タブから有効にできます。';

  @override
  String get enableHistory => '履歴を有効にする';

  @override
  String get historySearchHint => 'UID、テキスト、またはタイプで検索（例：URL、Wi-Fi、04A1...）';

  @override
  String get noHistoryYet => '保存されたスキャン履歴はまだありません。';

  @override
  String get tryDifferentQuery => '別のUID、テキスト内容、またはレコードタイプをお試しください。';

  @override
  String get clearSearch => '検索をクリア';

  @override
  String get deleteThisRecord => 'このレコードを削除';

  @override
  String get qrPreview => 'QRプレビュー';

  @override
  String get lockTagConfirmTitle => 'タグを永久にロック';

  @override
  String get lockTagWarning2 => '最初に正しいコンテンツを書き込んだことを確認してください。';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'QRコードプレビュー';

  @override
  String get unknownParentheses => '(不明)';

  @override
  String get ok => 'OK';

  @override
  String rewriteSourceUid(String uid) {
    return '元のUID: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return '書き込むレコード: $count';
  }

  @override
  String rewriteFailed(String message) {
    return '再書き込みに失敗: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return '書き込んだレコード: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'スキャンしたタグのUID: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return '書き込んだデータ: $count件 ($bytesバイト)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'スキャンしたデータ: $count件 ($bytesバイト)';
  }

  @override
  String batchTargetCount(String count) {
    return '対象タグ数: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return '書き込みリスト: $count件 ($bytesバイト)';
  }

  @override
  String batchNext(String current, String total) {
    return '次: タグ #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return '成功 ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return '失敗: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'タグ #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'タグ #$n をタッチして書き込む';
  }

  @override
  String batchPrompt(String current, String total) {
    return '一括書き込み: タグ #$current / $total をかざしてください';
  }

  @override
  String batchWrittenVerified(String count) {
    return '$count件を書き込み・検証しました';
  }

  @override
  String templateLoaded(String name) {
    return '「$name」のレコードを書き込みリストに追加しました。';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'NDEFコンテンツのダイジェスト (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return 'エクスポートエラー: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'バックアップに履歴が$count件ありますが、この端末では履歴がオフです。\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'インポート完了:\n$summary';
  }

  @override
  String mergeError(String error) {
    return '統合エラー: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'NDEFクリップボード: $count件 ($bytes B) - $source';
  }

  @override
  String get heroScanSubtitle => 'タグをスマホの上部にかざすと、内容・容量・シリアル番号がすぐに表示されます。';

  @override
  String lastTagLabel(String uid) {
    return '前回のタグ: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'スキャンエラー: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count件 ($bytesバイト) - NDEFデータのみコピーし、UIDはコピーしません。';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'タグ $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'エラー: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return '読み取ったNDEFレコード ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return '書き込むNDEFレコード ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return '注: ペイロードは$bytesバイトのため、先頭64バイトのみ表示しています。';
  }

  @override
  String composerTotals(String bytes, String count) {
    return '合計サイズ: $bytesバイト | レコード: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return '書き込んで検証 ($bytesバイト)';
  }

  @override
  String savedScansCount(String count) {
    return '保存済みスキャン: $count';
  }

  @override
  String historyNoResults(String query) {
    return '「$query」の結果はありません。';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count件';
  }

  @override
  String historyCapacity(String max, String used) {
    return '容量: $max B | 使用: $used B';
  }

  @override
  String historySourceLabel(String uid) {
    return '履歴 UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count件 | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return '保存済みルール/メモ: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return '書き込みバイト: $bytes | 検証: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'ロックしたタグは読み取り専用になり、内容の変更・消去やロック解除は二度とできません。$more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'メッセージサイズ: $bytesバイト';
  }

  @override
  String bytesShort(String bytes) {
    return 'バイト: $bytes B';
  }

  @override
  String bytesValue(String bytes) {
    return '$bytesバイト';
  }

  @override
  String bytesOfCapacity(String bytes, String max) {
    return '$bytes / $maxバイト';
  }

  @override
  String get valueNone => 'なし';

  @override
  String get valueYesIp => 'はい (IPアドレス)';

  @override
  String get nfcMissingShort => 'NFCなし';

  @override
  String get clearClipboard => 'クリップボードを消去';

  @override
  String get statLibrary => 'ライブラリ';

  @override
  String get scanTagTitle => 'タグをスキャン';

  @override
  String get readingInProgress => '読み取り中...';

  @override
  String get rawMemorySubtitle => '生メモリ';

  @override
  String get copyToClipboard => 'クリップボードにコピー';

  @override
  String get serialUidLabel => 'シリアル (UID):';

  @override
  String get totalCapacityLabel => '総容量:';

  @override
  String get technologiesLabel => '技術:';

  @override
  String get idLabel => '識別子 (ID):';

  @override
  String get undoTooltip => '元に戻す';

  @override
  String get clearComposer => 'リストを消去';

  @override
  String composerTotalSize(String bytes) {
    return '合計サイズ: $bytesバイト';
  }

  @override
  String get yesClear => 'はい、消去';

  @override
  String get ssidTooLong => 'SSIDは最大32バイトです。';

  @override
  String get locationPlace => '場所';

  @override
  String get targetWebUrl => 'リンク先URL *';

  @override
  String get languageCodeLabel => '言語コード (ISO 639-1) *';

  @override
  String get utf8Text => 'UTF-8テキスト';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf, サイズ: $bytesバイト';
  }

  @override
  String get quickGallerySubtitle => 'ワンタップで完成';

  @override
  String get quickLibraryTitle => 'マイタグ';

  @override
  String get quickLibrarySubtitle => '保存したタグ';

  @override
  String get saveToLibrary => 'ライブラリに保存';

  @override
  String libraryMatch(String name) {
    return 'ライブラリ内: $name';
  }

  @override
  String tagChipLabel(String chip) {
    return 'チップ: $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return 'メーカー: $name';
  }

  @override
  String get settingsLibrarySubtitle => '名前・メモ・写真付きのタグ';

  @override
  String get showOnboardingAgain => '紹介をもう一度表示';

  @override
  String get importFromGallery => 'テンプレートから追加';

  @override
  String get appearanceTitle => '外観';

  @override
  String get themeSystem => 'システム';

  @override
  String get themeLight => 'ライト';

  @override
  String get themeDark => 'ダーク';

  @override
  String get valuePresentRisky => 'あり (危険な可能性)';

  @override
  String get supportedValue => '対応';

  @override
  String get notSupportedValue => '非対応';

  @override
  String get nfcUnsupportedDesc => 'この端末はNFCに対応していません';

  @override
  String get ndefTrailingData => 'NDEFメッセージの後に余分なデータがあります';

  @override
  String get ndefMissingEnd => 'NDEFメッセージの終端がありません';

  @override
  String vcardPhoneShort(String value) {
    return '電話: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'メール: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return '会社: $value';
  }

  @override
  String get pageUidLock => 'UID / ロック';

  @override
  String get pageData => 'データ';

  @override
  String get pageLock => 'ロック';

  @override
  String memoryPageLine(String page) {
    return 'ページ $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (電話)';

  @override
  String get mapApple => 'Appleマップ';

  @override
  String get mapGoogle => 'Googleマップ';

  @override
  String get whatsappMessageHint => 'こんにちは、詳しく知りたいです';

  @override
  String get facetimeTargetHint => '+819012345678 または name@icloud.com';

  @override
  String get bluetoothMacLabel => 'Bluetooth MACアドレス';

  @override
  String get webAddressUrlLabel => 'Webアドレス (URL)';

  @override
  String get latitudeLabel => '緯度 (Lat)';

  @override
  String get longitudeLabel => '経度 (Lng)';

  @override
  String get emailAddressLabel => 'メールアドレス';

  @override
  String get websiteLabel => 'Webサイト';

  @override
  String get wifiAuthWpa2Home => 'WPA2 パーソナル (家庭/オフィス標準)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 パーソナル (混在)';

  @override
  String get hostLabel => 'ホスト:';

  @override
  String get readOnlyLocked => '読み取り専用 (ロック済み)';

  @override
  String get redoTooltip => 'やり直す';

  @override
  String historyFoundCount(String found, String total) {
    return '見つかった件数: $found / $total';
  }

  @override
  String get addToWriteListShort => '書き込みリストへ';

  @override
  String get mimeTypeHint => 'application/json または text/plain';

  @override
  String get hapticsToggle => '触覚フィードバック';

  @override
  String get hapticsToggleSubtitle => '読み取り・書き込み完了時に短く振動';

  @override
  String get soundsToggle => 'サウンド';

  @override
  String get soundsToggleSubtitle => '結果時に短いシステム音を鳴らす';

  @override
  String get backupLibraryMustBeList => 'タグライブラリはリストである必要があります。';

  @override
  String get backupInvalidLibraryEntry => '無効なライブラリ項目です。';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'ライブラリは最大$max件です。';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'ライブラリ: $added件追加';
  }

  @override
  String backupLibraryCount(String count) {
    return '• タグライブラリ: $count (写真を除く)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return '前回のタグ: $bytes / $max B';
  }

  @override
  String get contentTooLargeForChips =>
      '一般的なタグには大きすぎます。テキストを短くするか短縮リンクを使ってください。';

  @override
  String get tagReportTitle => 'タグレポート';

  @override
  String get tagReportSubtitle => 'チップ・ロック・パスワード・使用量';

  @override
  String get tagReportPrompt => '確認するタグをかざしてください';

  @override
  String get tagReportBusy => 'タグを確認中...';

  @override
  String tagReportDone(String chip) {
    return 'レポート完成: $chip';
  }

  @override
  String get unknownChip => '不明なチップ';

  @override
  String get yes => 'はい';

  @override
  String get reportChip => 'チップ';

  @override
  String get reportNdefFormatted => 'NDEFフォーマット済み';

  @override
  String get reportWritable => '書き込み可能';

  @override
  String get reportStaticLock => '静的ロック';

  @override
  String get reportDynamicLock => '動的ロック';

  @override
  String get reportPassword => 'パスワード保護';

  @override
  String get reportReadProtected => '読み取り保護';

  @override
  String get reportNdefUsage => 'NDEF使用量';

  @override
  String get reportVerdictWritable => 'タグは書き込み可能です';

  @override
  String get reportVerdictRestricted => 'タグに制限があります';

  @override
  String get reportCopied => 'レポートをコピーしました';

  @override
  String get compareTagsTitle => '2つのタグを比較';

  @override
  String get compareTagsSubtitle => 'コピーが元と一致するか確認';

  @override
  String get compareStepFirst => 'まず1つ目 (元) のタグを読み取ります。';

  @override
  String get compareStepSecond => '次に2つ目のタグを読み取ります。';

  @override
  String get compareIdentical => '内容は一致しています';

  @override
  String get compareDifferent => '内容が異なります';

  @override
  String get compareSameTag => '同じタグを2回読み取りました。';

  @override
  String get compareDifferentTags => '2つの異なるタグです。';

  @override
  String get compareRecordSame => '同じ';

  @override
  String get compareRecordChanged => '異なる';

  @override
  String get compareRecordOnlyFirst => 'Aのみ';

  @override
  String get compareRecordOnlySecond => 'Bのみ';

  @override
  String get compareBothEmpty => 'どちらのタグも空です。';

  @override
  String capacityExceededShort(String needed, String max) {
    return '内容が大きすぎます: $needed / $maxバイト';
  }

  @override
  String get verifyFailedAfterWrite => '書き込みを検証できません。タグを長めにかざしてください。';

  @override
  String get blankTagTitle => 'タグはまだ準備できていません';

  @override
  String get blankTagBody =>
      'このタグは新品でNDEF未フォーマットです。アプリで準備して内容を1回のタッチで書き込めます (NTAG・MIFARE Ultralight)。';

  @override
  String get blankTagAction => '準備して書き込む';

  @override
  String get shareTag => '共有';

  @override
  String get shareAsText => 'テキストで共有';

  @override
  String get shareAsFile => 'ファイルで共有 (.json)';

  @override
  String get shareAsFileSubtitle => '別の端末でそのまま書き込めます';

  @override
  String get importFromJsonFile => 'タグファイルから (.json)';

  @override
  String get invalidTagFile => '無効なタグファイルです。';

  @override
  String get continuousScanTitle => '連続スキャン';

  @override
  String get continuousScanSubtitle => 'タグを続けて読み取り、リストをCSVで共有';

  @override
  String continuousScanCount(String count) {
    return '$count個のタグを読み取り';
  }

  @override
  String get exportCsv => 'CSVで共有';

  @override
  String get clearList => 'リストを消去';

  @override
  String get csvColumnTime => '時刻';

  @override
  String get csvColumnRecords => 'レコード';

  @override
  String get csvColumnContent => '内容';

  @override
  String get csvColumnCapacity => '容量 (B)';

  @override
  String get csvColumnUsed => '使用 (B)';

  @override
  String get batchSerialToggle => '連番を追加';

  @override
  String batchSerialHint(String token) {
    return 'レコードに $token を入れるとそこに番号が入ります。ない場合は番号入りのテキストレコードが各タグに追加されます。';
  }

  @override
  String get batchSerialPrefix => '接頭辞';

  @override
  String get batchSerialStart => '開始';

  @override
  String get batchSerialDigits => '桁数';

  @override
  String batchSerialPreview(String first, String last) {
    return '最初: $first · 最後: $last';
  }

  @override
  String get batchFromCsvButton => 'CSVから (1行=1タグ)';

  @override
  String get batchCsvTitle => 'CSVから一括書き込み';

  @override
  String batchCsvSummary(String count) {
    return '$count枚のタグに書き込みます。各タグにCSVの1行が順番に書き込まれます。';
  }

  @override
  String batchCsvTruncated(String max) {
    return '一括書き込みでは最大$max行まで使用します。残りはスキップしました。';
  }

  @override
  String get cloneTagTitle => 'タグを複製';

  @override
  String get cloneTagSubtitle => 'タグを読み取り、内容を他のタグに書き込みます';

  @override
  String get cloneSourceStep =>
      'ステップ1: コピー元のタグを読み取ります。複製されるのはNDEF内容のみで、UIDは複製できません。';

  @override
  String get cloneSourceEmpty => 'コピー元のタグにNDEFレコードがありません。';

  @override
  String get cloneReadyTitle => '読み取り完了';

  @override
  String cloneReadySummary(String count, String bytes) {
    return '$count件のレコード ($bytesバイト) をコピーします。書き込むタグの数を選んでください。';
  }

  @override
  String get cloneEditFirst => '先に編集';

  @override
  String get tapPreviewTitle => 'スマホをかざすとどうなる？';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'タグは空です。何も起こりません。';

  @override
  String tapIosUrl(String target) {
    return '通知が表示され、タップすると$targetがSafariまたは対応アプリで開きます。';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$targetがブラウザまたは対応アプリで直接開きます。';
  }

  @override
  String tapIosApp(String target) {
    return '通知が表示され、アプリがインストール済みなら「$target」で開きます。';
  }

  @override
  String tapAndroidApp(String target) {
    return 'アプリがインストール済みなら「$target」で開きます。';
  }

  @override
  String tapIosCall(String target) {
    return '通知が表示され、タップすると$targetに発信します。';
  }

  @override
  String tapAndroidCall(String target) {
    return '電話アプリが$targetで開きます。';
  }

  @override
  String tapIosSms(String target) {
    return '通知が表示され、メッセージで$target宛の新規メッセージが開きます。';
  }

  @override
  String tapAndroidSms(String target) {
    return 'メッセージアプリが$target宛で開きます。';
  }

  @override
  String tapIosEmail(String target) {
    return '通知が表示され、メールで$target宛の新規メールが開きます。';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'メールアプリが$target宛で開きます。';
  }

  @override
  String get tapIosMap =>
      'iPhoneは「geo:」の位置を自動では開きません。AppleマップかGoogleマップのリンクを使ってください (クイックリンク)。';

  @override
  String get tapAndroidMap => '地図アプリがこの場所で開きます。';

  @override
  String get tapIosNeedsApp => 'iPhoneはこの内容に対して自動では何もしません。NFCアプリで読み取る必要があります。';

  @override
  String get tapAndroidText => '多くの端末では何も起きないか、システム画面にテキストが表示されます。';

  @override
  String get tapAndroidContact => '連絡先の追加が提案されます。';

  @override
  String get tapAndroidWifi => 'ネットワークへの接続が提案されます (Android 10以降)。';

  @override
  String get tapAndroidCalendar => 'カレンダーアプリが対応していれば、予定の追加が提案されます。';

  @override
  String get tapAndroidOther => '対応アプリがインストールされている場合のみ開きます。';

  @override
  String tapIgnoredRecords(String count) {
    return 'スマホが実行するのは最初のレコードのみです。残り$count件はNFCアプリで表示されます。';
  }

  @override
  String get tapIosRequirement =>
      'iPhone XS以降は、ロック解除中かつカメラ/ウォレットを開いていないときにバックグラウンドで読み取ります。';

  @override
  String get galleryCatBusiness => 'ビジネス';

  @override
  String get galleryCatSocial => 'ソーシャル';

  @override
  String get galleryCatHome => 'ホーム';

  @override
  String get galleryCatPersonal => 'パーソナル';

  @override
  String get galleryCatAutomation => 'オートメーション';

  @override
  String get galleryFavorites => 'お気に入り';

  @override
  String get gallerySearchHint => 'テンプレートを検索...';

  @override
  String get galleryNoResults => '一致するテンプレートはありません。';

  @override
  String get galleryAddFavorite => 'お気に入りに追加';

  @override
  String get galleryRemoveFavorite => 'お気に入りから削除';

  @override
  String get presetEventTitle => 'イベント招待';

  @override
  String get presetEventDesc => '予定をiCalendar形式で書き込みます。Androidではカレンダーに追加できます。';

  @override
  String get eventNameLabel => 'イベント名';

  @override
  String get eventDateLabel => '日付 (YYYY-MM-DD)';

  @override
  String get eventTimeLabel => '時刻 (HH:MM)';

  @override
  String get eventDateTimeInvalid => '日付または時刻が無効です。例: 2026-12-31 と 19:00';

  @override
  String get presetLuggageTitle => '手荷物タグ';

  @override
  String get presetLuggageDesc => '紛失時に拾った人があなたに連絡できます。';

  @override
  String luggageMessage(String name, String contact) {
    return 'この荷物は$nameのものです。見つけたらご連絡ください: $contact';
  }

  @override
  String get presetPlaylistTitle => 'プレイリスト';

  @override
  String get presetPlaylistDesc => 'Spotify・Apple Music・YouTubeのプレイリストを開きます。';

  @override
  String get playlistLinkLabel => 'プレイリストのリンク';

  @override
  String get presetEmailMeTitle => 'メールを送る';

  @override
  String get presetEmailMeDesc => '件名入りの新規メールを開きます。';

  @override
  String get presetCallMeTitle => '電話をかける';

  @override
  String get presetCallMeDesc => 'かざしたスマホからあなたに発信します。';

  @override
  String get presetRunShortcutTitle => 'ショートカットを実行';

  @override
  String get presetRunShortcutDesc =>
      '指定したiPhoneのショートカットを実行: 照明オン、音楽再生、集中モード変更など';

  @override
  String get shortcutNameLabel => 'ショートカット名';

  @override
  String get recipesSection => 'オートメーションのレシピ';

  @override
  String get recipesIntro =>
      'ショートカットAppで下の名前のショートカットを作り、アクションを追加します。NFCオートメーションに設定するか、「タグに追加」で実行用リンクを書き込みます。';

  @override
  String get recipeAddToTag => 'タグに追加';

  @override
  String get recipeBedTitle => 'おやすみ';

  @override
  String get recipeBedActions => '枕元: 睡眠集中モード · アラーム設定 · 消灯';

  @override
  String get recipeCarTitle => 'カーモード';

  @override
  String get recipeCarActions => '車載ホルダー: 運転集中モード · 自宅への経路 · 音楽再生';

  @override
  String get recipeDoorTitle => 'ただいま';

  @override
  String get recipeDoorActions => '玄関: 照明オン · Wi-Fiオン · 家族に「ただいま」と送信';

  @override
  String get recipeDeskTitle => '集中タイム';

  @override
  String get recipeDeskActions => 'デスク: 仕事集中モード · 25分タイマー · 集中用プレイリスト';

  @override
  String get recipeGymTitle => 'ワークアウト';

  @override
  String get recipeGymActions => 'ジムバッグ: ワークアウト開始 · プレイリスト · おやすみモード';

  @override
  String get recipeKitchenTitle => 'キッチンタイマー';

  @override
  String get recipeKitchenActions => 'キッチン: 10分タイマー · 買い物リストを開く';

  @override
  String get libraryLabelsField => 'ラベル / フォルダ (カンマ区切り)';

  @override
  String get libraryLabelsHint => 'オフィス, 2階';

  @override
  String librarySaveFailed(String error) {
    return '保存できませんでした: $error';
  }

  @override
  String get csvColumnLabels => 'ラベル';

  @override
  String get firstNameLabel => '名';

  @override
  String get lastNameLabel => '姓';

  @override
  String get wifiPasswordMinHint => '8文字以上';

  @override
  String get emailExampleHint => 'name@example.com';

  @override
  String get wifiSsidExampleHint => 'Home_WiFi_5G';

  @override
  String get nfcErrUnavailable => 'この端末ではNFCを使用できないか、オフになっています。';

  @override
  String get nfcErrBusy => '別のNFC処理が実行中です。終了をお待ちください。';

  @override
  String get nfcErrCancelled => '操作はキャンセルされました。';

  @override
  String get nfcErrAppPaused => 'アプリがバックグラウンドに移ったため操作はキャンセルされました。';

  @override
  String get nfcErrUnsupportedTag => 'このタグの種類には対応していません。';

  @override
  String get nfcErrNtagOnly => 'このツールはNTAG / MIFARE Ultralightタグ専用です。';

  @override
  String get nfcErrNotNdefRead => 'タグを検出しましたが、NDEF形式ではありません。';

  @override
  String get nfcErrNotNdefWrite => 'タグがNDEF形式ではないため、このスマホから直接NDEFを書き込めません。';

  @override
  String get nfcErrReadOnly => 'タグは読み取り専用 (ロック済み) で書き込めません。';

  @override
  String get nfcErrNoData => '書き込むデータがありません。';

  @override
  String nfcErrCapacity(String required, String max) {
    return 'タグの容量不足: $requiredバイト必要、最大$maxバイト。';
  }

  @override
  String get nfcErrCapacityShort => 'タグの容量が足りません。';

  @override
  String get nfcErrVerify => '検証失敗: 読み戻したデータが一致しません。';

  @override
  String get nfcErrConnectionLost => 'タグとの接続が切れました。動かさずにもう一度お試しください。';

  @override
  String get nfcErrAlreadyLocked => 'タグはすでにロックされています (読み取り専用)。';

  @override
  String get nfcErrLockNotNdef => 'タグがNDEF形式ではありません。ロック前にレコードを書き込んでください。';

  @override
  String get nfcErrLockNotSupported => 'このタグの種類はロックに対応していません。';

  @override
  String get nfcSheetConnected => 'タグに接続しました。処理中...';

  @override
  String get nfcSheetReadOk => 'タグを読み取りました!';

  @override
  String get nfcSheetEmptyRead => '空のタグを読み取りました!';

  @override
  String get nfcSheetMultipleTags => '複数のタグを検出しました。1枚だけかざしてください。';

  @override
  String get nfcSheetWriteVerified => '書き込みと検証が完了しました!';

  @override
  String get nfcSheetWritten => 'タグに書き込みました!';

  @override
  String get nfcSheetLocked => 'タグは完全にロックされました!';

  @override
  String get nfcWriteDone => 'タグへの書き込みに成功しました。';

  @override
  String get errorWidgetMessage => 'この部分を表示できませんでした。戻ってもう一度お試しください。';

  @override
  String get nfcErrTimeout => '時間内にタグが見つかりませんでした。スマホの上部にかざしてもう一度お試しください。';

  @override
  String get aboutTitle => 'このアプリについて';

  @override
  String aboutVersion(String version) {
    return 'バージョン $version';
  }

  @override
  String get privacySummary => 'データはこの端末内にのみ保存されます。アカウント・サーバー・広告・トラッキングはありません。';

  @override
  String get whatsNewTitle => '新機能';

  @override
  String get whatsNew110 =>
      '• 14言語、ダークモード、新デザイン\n• カテゴリ・検索・お気に入り付きテンプレート\n• 連番・CSV・タグ複製による一括書き込み\n• 「かざすとどうなる？」プレビューと容量警告\n• 写真・メモ・ラベル付きタグライブラリ\n• タグレポート、比較、連続スキャン、CSV書き出し\n• Siri、ショートカット、オートメーションのレシピ';

  @override
  String lastBackupAt(String date) {
    return '前回のバックアップ: $date';
  }

  @override
  String get noBackupYet => 'まだバックアップがありません。';

  @override
  String get backupStale => '前回のバックアップから30日以上経っています。新しく作成しましょう。';

  @override
  String get backupICloudTip =>
      'ヒント: 共有メニューで「\"ファイル\"に保存」→ iCloud Driveを選ぶとiCloudに保管できます。';

  @override
  String get dragToReorder => 'ドラッグで並べ替え';

  @override
  String get modeTitle => 'モード';

  @override
  String get modeNormal => '通常';

  @override
  String get modeCompat => '互換性';

  @override
  String get modeNormalDesc => '通常: すべて有効。書き込んだタグは読み戻して検証します。';

  @override
  String get modeCompatDesc =>
      '互換性: 書き込み後の読み戻しを行いません。古いタグや不安定なタグで書き込みが安定する場合があります。';

  @override
  String get rateApp => 'アプリを評価';

  @override
  String get rateAppUnavailable => '今は評価画面を表示できません (TestFlightでは表示されません)。';

  @override
  String get chipsTitle => 'NFCチップ';

  @override
  String get chipsSubtitle => 'どのタグを買う？容量と対応状況';

  @override
  String get chipsIntro => '使用可能バイトはNDEFで書ける最大量です。初めてならNTAG215がおすすめです。';

  @override
  String chipsUsable(String bytes) {
    return '使用可能: $bytesバイト';
  }

  @override
  String get chipsReadWrite => '読み書き';

  @override
  String get chipsReadOnlyNdef => 'NDEF形式のみ';

  @override
  String get chipsNotSupported => '非対応';

  @override
  String get chipsNxpOnly => 'NXPチップ搭載機のみ';

  @override
  String get chipUseSmall => 'リンク1つ、短文、Wi-Fi。最安';

  @override
  String get chipUseMedium => '名刺、複数レコード。amiiboフィギュア';

  @override
  String get chipUseLarge => '長い内容、詳しい名刺';

  @override
  String get chipUseSecure => '偽造防止の認証 (商品、チケット)';

  @override
  String get chipUseTicket => '交通・イベントのチケット';

  @override
  String get chipUseAccess => '入退室カード、ホテルのカードキー';

  @override
  String get chipUseIndustrial => '図書館・倉庫・産業用。読取距離が長い';

  @override
  String get chipUseJapan => '日本で一般的 (交通、決済)';

  @override
  String get chipUseLegacy => '旧式。新規には非推奨';

  @override
  String templateVarsHint(String date, String time, String counter) {
    return 'ヒント: テキストやリンクに$date・$time・$counterを入れると書き込み時に自動入力されます。';
  }

  @override
  String templateVarsPreview(String date, String time, String counter) {
    return '書き込み時: $date · $time · カウンター $counter';
  }

  @override
  String get libraryWriteToTag => 'タグに書き込む';

  @override
  String libraryWritePrompt(String name) {
    return '「$name」を書き込むタグをかざしてください';
  }

  @override
  String get presetSmartCardTitle => 'スマートカード';

  @override
  String get presetSmartCardDesc =>
      '1枚のタグにWebサイト・名刺・Wi-Fi (任意)。スマホはまずサイトを開きます。';

  @override
  String get presetLostItemTitle => '落とし物タグ';

  @override
  String get presetLostItemDesc => '拾った人がかざすと、あなた宛てのSMSが用意されます。';

  @override
  String get lostItemNameLabel => '品物 (例: 鍵、財布)';

  @override
  String lostItemSms(String item) {
    return 'こんにちは。あなたの$itemを拾いました。';
  }

  @override
  String lostItemText(String item, String name) {
    return 'この$itemは$nameのものです。見つけたらご連絡ください。';
  }

  @override
  String get presetVoiceTitle => 'ボイスメッセージ';

  @override
  String get presetVoiceDesc => 'プレゼントや箱に。かざすとボイスメモや曲が再生されます。';

  @override
  String get voiceLinkLabel => '音声リンク (iCloud、Drive、SoundCloud…)';

  @override
  String get logbookTitle => '記録帳';

  @override
  String get logbookSubtitle => '出欠・服薬・在庫: タッチごとに時刻を記録';

  @override
  String get logbookNew => '新しい記録帳';

  @override
  String get logbookName => '記録帳の名前';

  @override
  String get logbookKindAttendance => '出欠';

  @override
  String get logbookKindMedication => '服薬';

  @override
  String get logbookKindInventory => '在庫確認';

  @override
  String get logbookKindCustom => 'その他';

  @override
  String get logbookEmpty => '記録帳はまだありません。「3年A組出欠」「夜の薬」などを作成しましょう。';

  @override
  String get logbookScanButton => '読み取って記録';

  @override
  String logbookEntryAdded(String label) {
    return '記録しました: $label';
  }

  @override
  String get logbookNoEntries => 'まだ記録がありません。';

  @override
  String logbookToday(String count, String tags) {
    return '今日: $count件 · $tags種類のタグ';
  }

  @override
  String logbookMedTaken(String time) {
    return '今日は服用済み ✓ (最終: $time)';
  }

  @override
  String get logbookMedNotTaken => '今日はまだ服用していません';

  @override
  String logbookInventorySummary(String count) {
    return '$count種類のタグを確認';
  }

  @override
  String logbookDeleteConfirm(String name) {
    return '記録帳「$name」とすべての記録を削除しますか？';
  }

  @override
  String logbookEntries(String count) {
    return '$count件';
  }

  @override
  String lastSeenAt(String date) {
    return '最終確認: $date';
  }

  @override
  String get neverSeen => '未読み取り';

  @override
  String get sortLongestUnseen => '長く未確認の順';

  @override
  String get unseen30Days => '30日以上未確認';

  @override
  String get inventoryCardTitle => 'このタグはライブラリにあります';

  @override
  String scanReportLine(String unique, String dup, String empty) {
    return '$unique種類 · 再読取 $dup · 空 $empty';
  }
}
