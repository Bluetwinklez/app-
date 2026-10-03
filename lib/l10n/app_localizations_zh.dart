// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get addRecord => '添加记录';

  @override
  String get addToComposerList => '添加到写入列表';

  @override
  String get addToWriteList => '添加到写入列表';

  @override
  String get addressCannotBeEmpty => '地址不能为空。';

  @override
  String get advancedCommandsDesc =>
      '每行输入一条十六进制指令。例如：60 = GET_VERSION，30 04 = 读取第 4 页。错误的写入指令可能损坏标签。';

  @override
  String get advancedCommandsSubtitle => '向标签发送原始十六进制 (hex) 指令';

  @override
  String get advancedCommandsTitle => '高级 NFC 指令';

  @override
  String get appLinksDesc => '将此类链接写入标签后，触碰手机将弹出横幅并直达对应页面。';

  @override
  String get appLinksSection => '应用深度链接';

  @override
  String get appPackageName => 'Android 软件包名';

  @override
  String get appSettings => '应用设置';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => '触碰时自动运行';

  @override
  String get backupFileSizeExceeded => '备份文件大小超过 2 MiB。';

  @override
  String get backupHistoryMustBeList => '\"history\" 字段必须为数组列表。';

  @override
  String backupInvalidJson(String error) {
    return '无效的 JSON 格式: $error';
  }

  @override
  String get backupInvalidRuleNote => '无效的规则备注。';

  @override
  String get backupInvalidRuleSha => '无效的 64 位 SHA-256 哈希字符串。';

  @override
  String get backupInvalidTemplateId => '无效的模板 ID。';

  @override
  String get backupInvalidTemplateName => '无效的模板名称。';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return '历史条数超过限制 $max ($count)。';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return '标签规则数量超过限制 $max ($count)。';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return '模板数量超过限制 $max ($count)。';
  }

  @override
  String get backupMissingSchemaVersion => '缺少 \"schemaVersion\" 字段。';

  @override
  String get backupRecordMustBeObject => '每个 NDEF 记录必须为 JSON 对象。';

  @override
  String get backupRestoreSubtitle => '将模板、标签备注及历史记录导出为 JSON 文件或合并导入。';

  @override
  String get backupRestoreTitle => '备份与恢复 (JSON)';

  @override
  String get backupRootMustBeObject => '备份根节点必须为 JSON 对象。';

  @override
  String get backupRuleMustBeObject => '每条规则必须为 JSON 对象。';

  @override
  String get backupSchemaVersionMustBeInt => '\"schemaVersion\" 字段必须为整数。';

  @override
  String backupSizeExceeded(int bytes) {
    return '备份数据大小超过 2 MiB 限制 ($bytes 字节)。';
  }

  @override
  String get backupTagRulesMustBeList => '\"tagRules\" 字段必须为数组列表。';

  @override
  String get backupTemplateMustBeObject => '每个模板必须为 JSON 对象。';

  @override
  String get backupTemplatesMustBeList => '\"templates\" 字段必须为数组列表。';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return '不支持的备份架构版本: $version。';
  }

  @override
  String cameraError(String error) {
    return '无法启动相机。请前往 设置 > 隐私 > 相机 开启权限。\n($error)';
  }

  @override
  String get cancel => '取消';

  @override
  String get catBusiness => '商务';

  @override
  String get catCar => '车载';

  @override
  String get catHome => '家庭';

  @override
  String get catOther => '其他';

  @override
  String get catPersonal => '个人';

  @override
  String get catWork => '工作';

  @override
  String get categoryLabel => '分类';

  @override
  String get chooseFromGallery => '从相册选择';

  @override
  String get clear => '清除';

  @override
  String get clearAll => '全部清除';

  @override
  String get clearConfirmMessage => '此操作将清除标签上的所有 NDEF 记录并写入一条空记录。是否继续？';

  @override
  String get clearConfirmTitle => '重置标签内容';

  @override
  String get clearHistory => '清空历史';

  @override
  String get clearTagSubtitle => '删除所有记录并写入空 NDEF';

  @override
  String get clearTagTitle => '清空标签';

  @override
  String get close => '关闭';

  @override
  String get commandsEmptyError => '请输入至少一条指令。';

  @override
  String get commandsLabel => '指令列表';

  @override
  String get confirmClearHistoryContent => '设备上保存的所有扫描历史将被删除，确认继续吗？';

  @override
  String get confirmClearHistoryTitle => '清除扫描历史';

  @override
  String get confirmClearTemplatesContent => '所有已保存的模板将被删除，确认继续吗？';

  @override
  String get confirmClearTemplatesTitle => '清除模板';

  @override
  String get contactCompany => '公司 / 机构';

  @override
  String get contactEmail => '电子邮箱';

  @override
  String get contactFullName => '姓名';

  @override
  String get contactPhone => '联系电话';

  @override
  String get contactTitle => '职位 / 头衔';

  @override
  String get contactWebsite => '个人网站';

  @override
  String get copy => '复制';

  @override
  String get copyTagUid => '复制 UID';

  @override
  String get copyToComposer => '复制到写入列表';

  @override
  String get csvInvalidAddress => '无效地址。';

  @override
  String get csvInvalidEmail => '无效邮箱。';

  @override
  String get csvInvalidLocation => '请输入正确的经纬度 (例如 location,41.0082,28.9784)。';

  @override
  String csvMaxRowsExceeded(int max) {
    return '最多允许导入 $max 条记录；其余行已忽略。';
  }

  @override
  String csvRowEmptyValue(int row) {
    return '第 $row 行：内容为空。';
  }

  @override
  String csvRowError(String error, int row) {
    return '第 $row 行：$error';
  }

  @override
  String csvUnknownType(String type) {
    return '未知类型“$type”。';
  }

  @override
  String get csvWifiPasswordLength => 'Wi-Fi 密码长度须为 8 至 63 个字符。';

  @override
  String get delete => '删除';

  @override
  String get deleteTemplateTooltip => '删除模板';

  @override
  String get deviceNameTooLong => '设备名称过长。';

  @override
  String get dismiss => '忽略';

  @override
  String get editRecordTitle => '编辑记录';

  @override
  String get emailRecipient => '收件人邮箱';

  @override
  String get exportBackup => '导出';

  @override
  String get facetimePrompt => '请输入电话号码或 Apple ID 邮箱。';

  @override
  String fieldCannotBeEmpty(String field) {
    return '“$field”不能为空。';
  }

  @override
  String get flashlight => '手电筒';

  @override
  String get formatMemorySubtitle => '为 NDEF 准备芯片（空白或损坏标签）';

  @override
  String get formatMemoryTitle => '格式化内存';

  @override
  String get idTooLarge => 'ID 长度不能超过 255 字节';

  @override
  String get importBackup => '导入 (合并)';

  @override
  String get inAppTagRules => '标签本地规则';

  @override
  String get invalidHexId => '无效的十六进制 ID 字符串';

  @override
  String get invalidHexPayload => '无效的十六进制 Payload 字符串';

  @override
  String get invalidHexType => '无效的十六进制 Type 字符串';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get linkCopied => '链接已复制';

  @override
  String get linkHistoryDesc => '打开历史记录页面';

  @override
  String get linkScanDesc => '打开应用并直接开启扫描';

  @override
  String get linkToolsDesc => '打开工具箱页面';

  @override
  String get linkWriteDesc => '打开写入编辑器页面';

  @override
  String get locationLabel => '位置在哪？';

  @override
  String get lockAcknowledge => '我已知晓此操作无法撤销';

  @override
  String get lockTagSubtitle => '永久设为只读状态（不可逆）';

  @override
  String get lockTagTitle => '锁定标签';

  @override
  String get manage => '管理';

  @override
  String get navHistory => '历史';

  @override
  String get navHistoryTitle => '历史记录';

  @override
  String get navRead => '读取';

  @override
  String get navReadTitle => '读取标签';

  @override
  String get navSettings => '设置';

  @override
  String get navSettingsTitle => '模板与设置';

  @override
  String get navTools => '工具';

  @override
  String get navToolsTitle => '工具箱';

  @override
  String get navWrite => '写入';

  @override
  String get navWriteTitle => '写入标签';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条记录',
    );
    return '$_temp0';
  }

  @override
  String get nfcPromptClear => '请贴近标签以重置清空内容';

  @override
  String get nfcPromptLock => '请贴近标签以永久锁定';

  @override
  String get nfcPromptScan => '将标签靠近手机顶部';

  @override
  String get nfcPromptWrite => '请贴近 NFC 标签以写入数据';

  @override
  String get no => '否';

  @override
  String get noTemplates => '暂无已保存的模板。\n在“写入”页面创建记录即可另存为模板。';

  @override
  String get noteLabel => '备注';

  @override
  String get onboardingContinue => '继续';

  @override
  String get onboardingSkip => '跳过';

  @override
  String get onboardingStart => '立即开始';

  @override
  String get onboardingStep1Body => '点击底部蓝色按钮并将手机贴近 NFC 标签。内容、容量与序列号瞬间呈现。';

  @override
  String get onboardingStep1Title => '贴近读取';

  @override
  String get onboardingStep2Body =>
      '在“写入”页面点击“添加记录”：网址、Wi-Fi、电子名片、社交主页应有尽有。模板助您秒速搞定。';

  @override
  String get onboardingStep2Title => '随心写入';

  @override
  String get onboardingStep3Body => '分析内存、配置密码、锁定或格式化标签。尽在“工具”专区。';

  @override
  String get onboardingStep3Title => '专业工具';

  @override
  String get onboardingStep4Body => '为标签添加名称、备注与照片存入个人标签库。可在“设置”中随心切换语言。';

  @override
  String get onboardingStep4Title => '管理标签库';

  @override
  String optionalField(String label) {
    return '$label (选填)';
  }

  @override
  String get passwordError => '请输入恰好 4 个字符或 8 位十六进制数字。';

  @override
  String get passwordHint => '4 个字符 (例如 1234) 或 8 位十六进制';

  @override
  String get passwordLabel => '密码';

  @override
  String get paste => '粘贴';

  @override
  String get phoneNumber => '电话号码';

  @override
  String get phoneWithCountryCode => '请输入带国际区号的号码 (例如 8613812345678)。';

  @override
  String get presetAppDownloadDesc => '为 Android 用户自动唤起或引导安装您的应用。';

  @override
  String get presetAppDownloadTitle => '应用推广下载';

  @override
  String get presetBusinessCardDesc =>
      '分享您的联系人名片；Android 会提示保存，iPhone 需用 NFC 应用打开。';

  @override
  String get presetBusinessCardTitle => '电子名片';

  @override
  String get presetDirectionsDesc => '在地图中精准定位商铺或活动地址。';

  @override
  String get presetDirectionsTitle => '导航与地点标记';

  @override
  String get presetEmergencyDesc => '血型、紧急联系人与关键就医注意事项。';

  @override
  String get presetEmergencyTitle => '急救信息卡 (ICE)';

  @override
  String get presetGoogleReviewDesc => '引导顾客直接进入您的店铺好评页面。';

  @override
  String get presetGoogleReviewTitle => 'Google 评价直达';

  @override
  String get presetGuestWifiDesc => 'Android 手机一碰即连；iPhone 需用 NFC 应用查看信息。';

  @override
  String get presetGuestWifiTitle => '访客 Wi-Fi 标签';

  @override
  String get presetInstagramDesc => '触碰后自动打开您的 Instagram 个人主页。';

  @override
  String get presetInstagramTitle => 'Instagram 主页';

  @override
  String get presetMenuLinkDesc => '张贴在餐桌上，顾客扫一下即可立刻浏览菜单。';

  @override
  String get presetMenuLinkTitle => '电子菜单标签';

  @override
  String get presetPetTagDesc => '走失时好心人触碰即可一键拨通主人电话。';

  @override
  String get presetPetTagTitle => '宠物防走失牌';

  @override
  String get presetShortcutDesc => '联动 iPhone 快捷指令或直接唤起应用内功能。';

  @override
  String get presetShortcutTitle => '快捷指令触发器';

  @override
  String get presetWebsiteDesc => '一触即达任意指定的官方网页。';

  @override
  String get presetWebsiteTitle => '网站引流跳转';

  @override
  String get presetWhatsappDesc => '无需将号码存入通讯录即可直接发起会话。';

  @override
  String get presetWhatsappTitle => 'WhatsApp 免加好友';

  @override
  String get qrCode => '二维码';

  @override
  String qrContentChars(int chars) {
    return '内容 ($chars 字符):';
  }

  @override
  String get qrContentEmpty => '待生成的二维码内容为空。';

  @override
  String qrContentTooLarge(int chars) {
    return '内容对于二维码过大 ($chars 字符，最多支持 2048 字符)。';
  }

  @override
  String get qrFrameInstructions => '将二维码置于框内。网址、Wi-Fi 与纯文本二维码将直接转换为 NDEF 记录。';

  @override
  String qrGenerationFailed(String error) {
    return '生成二维码失败: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return '二维码预览: $title';
  }

  @override
  String get qrScanTitle => '扫描二维码';

  @override
  String get qrSecurityNote =>
      '二维码预览仅支持可读的纯文本和网页链接。\n\n出于隐私和安全考虑，Wi-Fi 密码与二进制数据不会自动生成二维码。';

  @override
  String get qrUserOnlyNote => '仅在用户主动触发时展示。';

  @override
  String get rawRecordDetailsTitle => '记录详情 (只读)';

  @override
  String get rawRecordEditorTitle => '编辑原始 NDEF 记录';

  @override
  String get readHeroButton => '开始扫描';

  @override
  String get readMemorySubtitle => '逐页查看原始内存；复制或保存为 .bin';

  @override
  String get readMemoryTitle => '读取内存';

  @override
  String get readyTemplates => '预置模板';

  @override
  String get recordTypeCalendar => '日历日程 (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return '自定义 MIME ($mime)';
  }

  @override
  String get recordTypeEmail => '电子邮件';

  @override
  String get recordTypeLocation => '地理坐标 / GPS';

  @override
  String get recordTypePhone => '电话号码';

  @override
  String get recordTypeSmartPoster => '智能海报 (Smart Poster)';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return '损坏或不完整的智能海报 ($bytes 字节)';
  }

  @override
  String get recordTypeSmartPosterInvalid => '智能海报 (无效负载)';

  @override
  String get recordTypeSms => '短信内容';

  @override
  String get recordTypeText => '文本记录';

  @override
  String get recordTypeUnknown => '未知记录';

  @override
  String get recordTypeUrl => '网页链接 (URL)';

  @override
  String get recordTypeVCard => '联系人名片 (vCard)';

  @override
  String get recordTypeWifi => 'Wi-Fi 网络配置 (WSC)';

  @override
  String get recordTypeWifiCorrupt => '损坏的 WSC 数据';

  @override
  String get redo => '重做';

  @override
  String get removePasswordSubtitle => '使用已知密码解除写入保护';

  @override
  String get removePasswordTitle => '移除密码';

  @override
  String get rewriteTag => '重新写入';

  @override
  String ruleDeleteConfirm(String note) {
    return '确定删除带有备注“$note”的标签规则吗？';
  }

  @override
  String get ruleNoteDialogTitle => '编辑标签备注';

  @override
  String get ruleNoteLabel => '应用内备注 / 说明';

  @override
  String get save => '保存';

  @override
  String get saveAsTemplate => '另存为模板';

  @override
  String get saveBin => '保存 .bin';

  @override
  String get saveLocalHistory => '保存本地扫描历史';

  @override
  String get saveLocalHistorySubtitle => '关闭后不保存扫描记录。开启时仅将成功的扫描保存至本地。';

  @override
  String get scanFabLabel => '扫描标签';

  @override
  String get scannedTag => '已扫描标签';

  @override
  String get searchQueryCannotBeEmpty => '搜索内容不能为空。';

  @override
  String get securityRestriction => '安全限制';

  @override
  String get send => '发送';

  @override
  String get setPasswordSubtitle => '设置密码以防止他人随意修改标签内容';

  @override
  String get setPasswordTitle => '设置密码';

  @override
  String get shortcutAutomationNote => '注意：自动化绑定于标签序列号 (UID)，即使更换标签内容也能正常工作。';

  @override
  String get shortcutStep1 => '打开“快捷指令”App，轻点底部的“自动化”。';

  @override
  String get shortcutStep2 => '轻点“新建自动化” (+) → 选择“NFC”。';

  @override
  String get shortcutStep3 => '轻点“扫描”，将标签贴近 iPhone 顶部并命名。';

  @override
  String get shortcutStep4 => '勾选“立即运行”，然后添加所需操作（开灯、播放音乐、发送信息等）。';

  @override
  String get shortcutStep5 => '若要唤起本应用，可选择“扫描标签”或“写入标签”作为操作。';

  @override
  String get shortcutsGuideSubtitle => '触碰标签自动触发流程，或通过 Siri 语音免提扫描。';

  @override
  String get shortcutsGuideTitle => 'Siri 与快捷指令';

  @override
  String get siriPhraseScan => '“嘿 Siri，用 NFC Tag Master 扫描标签”';

  @override
  String get siriPhraseWrite => '“嘿 Siri，用 NFC Tag Master 写入标签”';

  @override
  String get siriShortcutsNote => '指令同样会展示在“快捷指令”App 及 Spotlight 搜索中。';

  @override
  String get smsMessage => '短信内容';

  @override
  String get socialUsername => '用户名 / 账号';

  @override
  String get sourceSelectPrompt => '从何处获取标签内容？';

  @override
  String get statusCancelled => '已取消';

  @override
  String statusClearError(String error) {
    return '格式化错误: $error';
  }

  @override
  String statusClearFailed(String error) {
    return '清除失败: $error';
  }

  @override
  String get statusClearSuccess => '标签内容已成功清除。';

  @override
  String get statusClearing => '清除模式就绪，请贴近标签...';

  @override
  String statusLockError(String error) {
    return '锁定错误: $error';
  }

  @override
  String statusLockFailed(String error) {
    return '锁定失败: $error';
  }

  @override
  String get statusLockSuccess => '标签已永久锁定为只读。';

  @override
  String get statusLocking => '锁定模式就绪，请贴近标签...';

  @override
  String get statusNfcDisabled => 'NFC 已关闭，请在系统设置中启用。';

  @override
  String get statusNfcNotSupported => '此设备不支持 NFC 硬件。';

  @override
  String get statusNfcUnavailable => 'NFC 当前不可用。';

  @override
  String get statusReady => '就绪';

  @override
  String statusScanError(String error) {
    return '扫描错误: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return '标签读取成功 ($id)。';
  }

  @override
  String get statusScanning => '正在扫描... 请将手机贴近标签。';

  @override
  String statusUnexpectedError(String error) {
    return '意外错误: $error';
  }

  @override
  String statusWriteError(String error) {
    return '写入错误: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return '写入未能完成: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return '写入并校验成功！($bytes 字节)';
  }

  @override
  String get statusWriting => '写入模式已就绪，请贴近目标标签...';

  @override
  String get systemLanguage => '系统语言';

  @override
  String get tabContact => '电子名片 (vCard)';

  @override
  String get tabCustomMime => '自定义 MIME';

  @override
  String get tabEmail => '电子邮件';

  @override
  String get tabPhone => '电话呼叫';

  @override
  String get tabSms => '短信发送';

  @override
  String get tabText => '纯文本';

  @override
  String get tabUrl => '网页链接';

  @override
  String get tabWifi => 'Wi-Fi 配置';

  @override
  String get tagInfoTitle => '标签信息';

  @override
  String get tagLibraryTitle => '我的标签库';

  @override
  String tagRulesCount(int count) {
    return '已存规则 / 备注数: $count';
  }

  @override
  String get tagRulesSubtitle => '根据 NDEF 内容的 SHA-256 哈希匹配仅展示对应备注，不触发额外操作。';

  @override
  String get tagWritable => '可写入';

  @override
  String get takePhoto => '拍照';

  @override
  String get templateNameHint => '模板名称';

  @override
  String get toolsExpertSection => '高级';

  @override
  String get toolsFooterNote =>
      '内存、密码和高级指令工具适用于 NTAG213/215/216 及 MIFARE Ultralight EV1 标签。';

  @override
  String get toolsMemorySection => '内存';

  @override
  String get toolsSecuritySection => '安全';

  @override
  String get toolsTagSection => '标签';

  @override
  String get typeTooLarge => 'Type 长度不能超过 255 字节';

  @override
  String get undo => '撤销';

  @override
  String get unknownChip16Pages => '未知芯片 (前 16 页)';

  @override
  String get urlSafetyInvalidUrl => '无效或不可解析的 URL 格式。';

  @override
  String get urlSafetyIpv4 => '目标地址直接使用了 IPv4 地址而非标准域名。';

  @override
  String get urlSafetyIpv6 => '目标地址直接使用了 IPv6 地址。';

  @override
  String get urlSafetyMissingScheme => '缺少 URL 协议前缀 (http/https 等)。';

  @override
  String urlSafetyNonStandardPort(String port) {
    return '非标准网络端口 (端口: $port)。';
  }

  @override
  String get urlSafetyPunycode => '检测到国际化域名 / Punycode (\"xn--\")，可能存在同形异义攻击。';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return '非标准 URL 协议: \"$scheme\"。';
  }

  @override
  String get urlSafetyUnencrypted => '未加密的明文连接 (http://)。';

  @override
  String get urlSafetyUserInfo => 'URL 中包含用户认证凭据 (userinfo)，存在仿冒风险。';

  @override
  String get usernameCannotBeEmpty => '用户名不能为空。';

  @override
  String get usernameNoSpaces => '用户名不能包含空格。';

  @override
  String get validAndroidPackage => '请输入有效的 Android 软件包名 (例如 com.whatsapp)。';

  @override
  String get validBluetoothMac => '请输入有效的蓝牙 MAC 地址 (例如 00:11:22:AA:BB:CC)。';

  @override
  String get validVideoUrl => '请输入有效的视频链接。';

  @override
  String get validWebAddress => '请输入有效的网络地址 (例如 https://example.com/file.pdf)。';

  @override
  String get verificationNotChecked => '未检查';

  @override
  String get verificationPassed => '通过';

  @override
  String get videoUrlCannotBeEmpty => '视频链接不能为空。';

  @override
  String get videoUrlOrIdPrompt => '请输入网址 (https://...) 或视频 ID。';

  @override
  String get wifiAuthOpen => '开放网络 (无密码)';

  @override
  String get wifiPassword => '密码';

  @override
  String get wifiSsid => '网络名称 (SSID)';

  @override
  String get withSiri => '使用 Siri';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes 字节) 将被写入用户内存。UID 及配置页面将保持不变。现有数据将被覆盖。';
  }

  @override
  String get writeDumpSubtitle => '将已保存的内存镜像写入标签';

  @override
  String get writeDumpTitle => '写入镜像 (.bin)';

  @override
  String get writeHeroTitle => '写入标签';

  @override
  String get writeHeroWriting => '正在写入...';

  @override
  String get writeResultFailed => '操作失败';

  @override
  String get writeResultSuccess => '操作成功';

  @override
  String get writeTemplates => '写入模板';

  @override
  String get writeTemplatesSubtitle => '将常用的 NDEF 数据保存为模板，随时一键写入标签。';

  @override
  String get unknown => '未知';

  @override
  String get error => '错误';

  @override
  String get nfcPromptReady => '靠近标签';

  @override
  String get invalidResponseFormat => '收到无效的响应格式';

  @override
  String get nfcReadError => 'NFC读取错误';

  @override
  String get invalidPlatformResponse => '从平台收到无效响应';

  @override
  String get writeFailed => '写入失败';

  @override
  String get lockFailed => '锁定失败';

  @override
  String get failedToConnectTag => '无法连接到标签';

  @override
  String get invalidTagResponse => '来自标签的无效响应';

  @override
  String get commandFailed => '命令失败';

  @override
  String get ndefTypeOrIdTooLong => 'NDEF类型或ID超过255字节';

  @override
  String get ndefUnsupportedOrInvalidRecord => '不支持或无效的NDEF记录';

  @override
  String get ndefMissingTypeLength => '缺少NDEF类型长度';

  @override
  String get ndefMissingPayloadLength => '缺少NDEF载荷长度';

  @override
  String get ndefMissingIdLength => '缺少NDEF ID长度';

  @override
  String get ndefMissingType => '缺少NDEF类型';

  @override
  String get ndefMissingId => '缺少NDEF ID';

  @override
  String get ndefMissingPayload => '缺少NDEF载荷';

  @override
  String get unprotected => '(无密码)';

  @override
  String get binaryDataPreview => '(二进制数据)';

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
  String get tnfUnknown => '5: Unknown (未知)';

  @override
  String get tnfUnchanged => '6: Unchanged (分块NDEF)';

  @override
  String get tnfReserved => '7: Reserved (保留)';

  @override
  String get ntagUnsupportedChip =>
      '此操作仅在NTAG213/215/216和MIFARE Ultralight EV1标签上受支持。';

  @override
  String ntagPageReadFailed(String page) {
    return '无法读取第$page页（标签未响应或区域受保护）。';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return '无法写入第$page页: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return '无法写入第$page页（标签拒绝；可能已锁定或受密码保护）。';
  }

  @override
  String ntagProtectedArea(String page) {
    return '无法读取第$page页之后的内容；此区域可能受密码保护。';
  }

  @override
  String get ntagPasswordPackSize => '密码必须为4字节，PACK必须为2字节。';

  @override
  String get ntagPasswordSize => '密码必须为4字节。';

  @override
  String get ntagPasswordWrongOrAuthFailed => '密码错误或标签拒绝了身份验证。';

  @override
  String get ntagPasswordWrong => '密码错误。';

  @override
  String get ntagCcInvalid => '标签的CC区域写入了非NDEF值；此OTP区域无法格式化。';

  @override
  String get ntagDumpTooShort => '转储文件太短；不包含用户数据。';

  @override
  String get ntagInvalidHex => '请输入有效的十六进制值（例如：30 04）。';

  @override
  String get googleReviewFieldLabel => '评价链接或Place ID';

  @override
  String get menuLinkFieldLabel => '菜单链接';

  @override
  String get menuTitleHint => '我们的菜单';

  @override
  String get petName => '宠物名字';

  @override
  String get ownerPhone => '主人电话';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return '你好，我是$pet！请致电我的主人：$phone$note';
  }

  @override
  String get bloodType => '血型';

  @override
  String get allergies => '过敏 / 药物';

  @override
  String get emergencyContact => '紧急联系人';

  @override
  String get emergencyInfo => '紧急信息';

  @override
  String emergencyBlood(String blood) {
    return '血型: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return '过敏: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return '紧急情况下拨打：$contact';
  }

  @override
  String get storeLink => '应用商店链接';

  @override
  String get link => '链接';

  @override
  String get title => '标题';

  @override
  String get webAddress => '网址';

  @override
  String get address => '地址';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return '模板: 已添加$added个，已更新$updated个';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return '标签备注/规则: 已添加$added条，已更新$updated条';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return '因设备上禁用了扫描历史而跳过: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return '历史: 已添加$added条，已跳过$skipped条';
  }

  @override
  String get backupSummaryNoNewData => '未找到要导入的新数据（与现有记录匹配）。';

  @override
  String backupFieldMustBeString(String field) {
    return '$field必须是字符串。';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field必须是有效日期。';
  }

  @override
  String get rawTypeHexLabel => '类型（十六进制字节）';

  @override
  String get rawIdHexLabel => 'ID（十六进制字节，可选）';

  @override
  String get rawPayloadHexLabel => '有效载荷（十六进制字节）';

  @override
  String get rawOptionalHexHint => '可选的十六进制字节';

  @override
  String get saveChanges => '保存更改';

  @override
  String get edit => '编辑';

  @override
  String get clearAllButton => '全部清除';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip：已读取 $count 页';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip 格式化成功';
  }

  @override
  String get ntagInvalidDumpFile => '无效的转储文件（必须是 4 字节的倍数，32-1024 字节）。';

  @override
  String ntagPagesWritten(int count) {
    return '已写入 $count 页';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip：密码保护已启用';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip：密码已解除';
  }

  @override
  String get memoryDumpCopied => '内存转储已复制';

  @override
  String ntagCommandsSent(int count) {
    return '已发送 $count 条命令';
  }

  @override
  String get emptyResponse => '（空响应）';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages 页 · $bytes 字节';
  }

  @override
  String get composeTextEmpty => '文本内容不能为空。';

  @override
  String get composeTextTooLong => '文本过长（最多5000个字符）。';

  @override
  String get composeUrlInvalid =>
      '请输入有效地址（例如：https://example.com 或 app:// 链接）。';

  @override
  String get composeUrlTooLong => 'URL过长（最多2000个字符）。';

  @override
  String get composeEmailInvalid => '请输入有效的电子邮件地址（例如：name@domain.com）。';

  @override
  String get composePhoneInvalid => '请输入有效的电话号码（例如：+905551234567）。';

  @override
  String get composeSmsPhoneInvalid => '请输入有效的收件人电话号码。';

  @override
  String get composeLatInvalid => '纬度必须介于 -90 到 +90 之间。';

  @override
  String get composeLngInvalid => '经度必须介于 -180 到 +180 之间。';

  @override
  String get composeVcardNameEmpty => '联系人姓名不能为空。';

  @override
  String get composeVcardNameTooLong => '联系人姓名过长（最多200个字符）。';

  @override
  String get composeVcardEmailInvalid => '请输入有效的电子邮件地址。';

  @override
  String get composeVcardPhoneInvalid => '请输入有效的电话号码。';

  @override
  String get composeVcardUrlInvalid => '请输入有效的网址（例如：https://...）。';

  @override
  String get composeCalSummaryEmpty => '活动标题不能为空。';

  @override
  String get composeCalSummaryTooLong => '活动标题过长（最多250个字符）。';

  @override
  String get composeCalDateInvalid => '结束时间必须晚于开始时间。';

  @override
  String get composeSpUriInvalid => '请输入有效的目标URL（例如：https://...）。';

  @override
  String get composeSpLangInvalid => '请输入有效的ISO语言代码（例如：zh, en）。';

  @override
  String get composeMimeTypeInvalid =>
      '请输入有效的MIME类型（例如：application/json, text/plain）。';

  @override
  String get composeMimeHexInvalid => '请输入有效的十六进制字符串（偶数个十六进制字符）。';

  @override
  String get composeMimePayloadTooLarge => '有效载荷过大（最多10 KB）。';

  @override
  String get composeWifiSsidEmpty => '网络名称（SSID）不能为空。';

  @override
  String get composeWifiPasswordRequired => '加密网络需要提供Wi-Fi密码。';

  @override
  String get composeWifiPasswordLength => 'WPA/WPA2密码长度必须在8到63个字符之间。';

  @override
  String get composeEditNdefRecord => '编辑 NDEF 记录';

  @override
  String get composeNewNdefRecord => '创建新 NDEF 记录';

  @override
  String get quickLinksHeader => '快捷链接';

  @override
  String get quickLinkCustomUri => '自定义 URI';

  @override
  String get quickLinkSocial => '社交网络';

  @override
  String get quickLinkVideo => '视频';

  @override
  String get quickLinkSearch => '搜索';

  @override
  String get quickLinkFile => '文件';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime 音频';

  @override
  String get quickLinkAddress => '地址';

  @override
  String get quickLinkPayment => '支付链接';

  @override
  String get quickLinkApp => '应用程序 (Android)';

  @override
  String get updateRecord => '更新记录';

  @override
  String get addToList => '添加到列表';

  @override
  String get quickCustomUriError =>
      '请输入包含协议架构的地址（例如：spotify:track:... 或 myapp://page）。';

  @override
  String get quickFileEmptyMessage => '请输入文件链接。';

  @override
  String get quickPaymentEmptyMessage => '请输入支付链接。';

  @override
  String get quickCustomUriDesc => '可输入任何带协议架构的地址；手机将打开支持该地址的应用程序。';

  @override
  String get quickSocialLabel => '社交网络';

  @override
  String get quickVideoLabel => '视频链接';

  @override
  String get quickVideoHint => 'https://youtu.be/... 或视频 ID';

  @override
  String get quickVideoDesc => '可输入 YouTube、Vimeo 等链接，或仅输入 YouTube 视频 ID。';

  @override
  String get quickSearchHint => '例如：北京天气';

  @override
  String get quickFileLabel => '文件链接';

  @override
  String get quickFileDesc =>
      '由于标签容量较小，因此写入的是网络链接而非文件本身（Google Drive、Dropbox 等）。';

  @override
  String get quickPhoneOrAppleId => '电话或 Apple ID';

  @override
  String get quickFacetimeVideoDesc => '触碰标签的 iPhone 将发起 FaceTime 视频通话。';

  @override
  String get quickFacetimeAudioDesc => '触碰标签的 iPhone 仅发起 FaceTime 语音通话。';

  @override
  String get quickMapProvider => '地图应用';

  @override
  String get quickAddressHint => '例如：北京市长安街1号';

  @override
  String get quickPaymentDesc => '可使用 PayPal.me、Stripe 等支付链接。银行卡信息绝不会写入标签。';

  @override
  String get quickAppDesc =>
      'Android 手机触碰时会打开该应用（未安装则打开 Play 商店）。iPhone 会忽略此记录类型；对于 iPhone 请添加 App Store 链接作为 URL。';

  @override
  String get quickDeviceNameOptional => '设备名称（可选）';

  @override
  String get quickSpeakerHint => '例如：扬声器';

  @override
  String get quickBluetoothDesc => 'Android 手机触碰时会建议与该设备配对。iPhone 不支持蓝牙配对标签。';

  @override
  String get composeTextContent => '文本内容';

  @override
  String get composeTextHint => '请输入要写入的文本';

  @override
  String get composeEmailSubjectOptional => '主题（可选）';

  @override
  String get composeEmailBodyOptional => '正文内容（可选）';

  @override
  String get composeSmsRecipient => '收件人电话号码';

  @override
  String get composeSmsHint => '要发送的短信内容...';

  @override
  String get composeVcardFullName => '全名（显示名称） *';

  @override
  String get composeVcardNameHint => '张三';

  @override
  String get composeVcardNote => '备注 / 说明';

  @override
  String get composeCalTitle => '活动标题 *';

  @override
  String get composeCalTitleHint => '项目会议';

  @override
  String get composeCalLocationHint => '2号会议室或线上';

  @override
  String get composeCalDesc => '活动说明';

  @override
  String get composeCalStartEndTime => '开始和结束时间：';

  @override
  String get composeSpTitleLabel => '标题（显示文本）';

  @override
  String get composeSpTitleHint => '公司宣传册';

  @override
  String get composeMimeTypeLabel => 'MIME 类型 *';

  @override
  String get composeDataFormat => '数据格式：';

  @override
  String get composeFormatHex => '十六进制 (Hex)';

  @override
  String get composeMimeHexBytes => '十六进制字节 *';

  @override
  String get composeMimeTextPayload => '有效载荷文本 (UTF-8) *';

  @override
  String get composeWifiWarningTitle => '安全与平台提示：';

  @override
  String get composeWifiWarningBody =>
      '• 写入标签的 Wi-Fi 密码以明文形式存储，任何人都可以轻易读取。\n• 不保证触碰标签后自动加入网络；根据系统和设备支持情况可能需要用户确认。';

  @override
  String get composeWifiSsidLabel => '网络名称 (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => '安全类型（身份验证）';

  @override
  String get composeWifiOpenNetwork => '开放网络（无密码）';

  @override
  String get composeWifiPasswordLabel => 'Wi-Fi 密码 *';

  @override
  String get composeWifiEncryptionLabel => '加密类型';

  @override
  String get composeWifiAesRecommended => 'AES（推荐）';

  @override
  String get quickSearchTextLabel => '搜索文本';

  @override
  String get readTagMemoryPrompt => '将标签贴近手机以读取内存';

  @override
  String get readingTagMemoryStatus => '正在读取内存...';

  @override
  String get formatTagConfirmTitle => '格式化内存';

  @override
  String get formatTagConfirmMessage => '标签上的数据将被删除并准备为初始空白 NDEF。是否继续？';

  @override
  String get formatButton => '格式化';

  @override
  String get formatTagPrompt => '将要格式化的标签贴近手机';

  @override
  String get formattingStatus => '正在格式化...';

  @override
  String filePickerFailed(String error) {
    return '文件选择器打开失败：$error';
  }

  @override
  String get writeButton => '写入';

  @override
  String get writeDumpPrompt => '将要写入转储文件的标签贴近手机';

  @override
  String get writingDumpStatus => '正在写入转储文件...';

  @override
  String get setPasswordWarning => '如果忘记密码，将无法再次更改标签内容。读取仍对所有人开放。';

  @override
  String get setPasswordAction => '设置密码';

  @override
  String get setPasswordPrompt => '将要设置密码的标签贴近手机';

  @override
  String get settingPasswordStatus => '正在设置密码...';

  @override
  String get removePasswordPromptMessage => '输入先前在标签上设置的密码。';

  @override
  String get remove => '移除';

  @override
  String get removePasswordPrompt => '将要移除密码的标签贴近手机';

  @override
  String get removingPasswordStatus => '正在移除密码...';

  @override
  String get sendCommandsPrompt => '将要发送命令的标签贴近手机';

  @override
  String get sendingCommandsStatus => '正在发送命令...';

  @override
  String get sendButton => '发送';

  @override
  String get tagNoteEditTitle => '编辑标签备注';

  @override
  String get tagNoteInputLabel => '应用内备注 / 说明';

  @override
  String get tagNoteInputHint => '例如：会议室信息或仓储货架 #12';

  @override
  String get tagNoteDeleteTitle => '删除标签备注';

  @override
  String get clearAllTagRulesTitle => '删除所有备注';

  @override
  String get clearAllTagRulesConfirm => '将删除所有已保存的应用内标签备注。是否确认？';

  @override
  String get deleteAll => '全部删除';

  @override
  String get tagRulesExplanation => '仅对与 NDEF SHA-256 摘要匹配的标签显示保存的备注。不会触发外部操作。';

  @override
  String get noTagRulesDefined => '尚未定义标签备注。';

  @override
  String lastUpdated(String time) {
    return '最后更新：$time';
  }

  @override
  String get tagLibraryNoMatch => '未找到匹配您搜索的标签。';

  @override
  String get tagLibraryAddToLibrary => '添加到库';

  @override
  String get name => '名称';

  @override
  String get tagLibraryAddTag => '添加标签';

  @override
  String get all => '全部';

  @override
  String tagLibraryPhotoError(String error) {
    return '未能选取照片：$error';
  }

  @override
  String get tagLibraryDeleteTitle => '删除标签';

  @override
  String get tagLibraryNameHint => '例如：办公室钥匙扣';

  @override
  String get tagLibraryNoTagContent => '此记录中无标签内容。';

  @override
  String get tagLibrarySourceLastScanned => '最后扫描';

  @override
  String get tagLibraryEmpty => '暂无已保存的标签。';

  @override
  String get tagLibrarySourceEmpty => '空记录';

  @override
  String get tagLibraryNamePrompt => '请输入标签名称';

  @override
  String get tagLibrarySearchHint => '按名称、分类或位置搜索...';

  @override
  String get tagLibrarySourceWriteList => '写入列表';

  @override
  String get tagLibraryLocationHint => '例如：办公桌、大门';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return '确定要从库中删除标签“$name”吗？';
  }

  @override
  String get noContent => '无内容';

  @override
  String tagLibraryRecordSummary(num count) {
    return '$count 条 NDEF 记录';
  }

  @override
  String get tagLibraryEditTag => '编辑标签';

  @override
  String get rawTypeHexHint => '41 (A) 或 55 (U) 等';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context：“records”字段必须是一个列表。';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context：单个项目最多可包含 $max 条 NDEF 记录。';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - 记录 #$index 不是有效对象。';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - 记录 #$index：无效的 TNF 值 ($tnf)。';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - 记录 #$index：“type”必须是 Base64 字符串。';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - 记录 #$index：“type”不是有效的 Base64 数据 ($error)。';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - 记录 #$index：“id”必须是 Base64 字符串。';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - 记录 #$index：“id”不是有效的 Base64 数据 ($error)。';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - 记录 #$index：“payload”必须是 Base64 字符串。';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - 记录 #$index：“payload”不是有效的 Base64 数据 ($error)。';
  }

  @override
  String get composerUndoSnack => '已撤销上次更改。';

  @override
  String get composerRedoSnack => '已重做更改。';

  @override
  String get noRecordsToCopy => '没有可复制的 NDEF 记录。';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '已复制 $count 条 NDEF 记录 ($bytes B) 到剪贴板。\n（仅复制 NDEF 内容；UID 或加密扇区绝不会被克隆）';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source：已添加 $count 条记录。';
  }

  @override
  String get tagEmptyNoRecordsToImport => '标签为空；没有可导入的记录。';

  @override
  String get sourceTag => '来自标签';

  @override
  String get sourceQr => '来自二维码';

  @override
  String filePickerError(String error) {
    return '无法打开文件选择器：$error';
  }

  @override
  String get csvFileTooLarge => 'CSV 文件过大（最多512 KB）。';

  @override
  String get noRecordsFound => '未找到记录';

  @override
  String get someRowsSkipped => '部分行已跳过';

  @override
  String get expectedFormat => '预期格式：';

  @override
  String get noClipboardContent => '剪贴板上没有复制的 NDEF 内容。';

  @override
  String get pasteFromClipboardTitle => '从 NDEF 剪贴板粘贴';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return '剪贴板数据：$count 条记录，$bytes 字节 ($source)';
  }

  @override
  String get clipboardPastePrompt => '您想替换当前记录还是追加到末尾？';

  @override
  String get pasteOverwriteOption => '覆盖（替换）';

  @override
  String pasteOverwriteSubtitle(num count) {
    return '将删除当前的 $count 条记录并替换为剪贴板内容（需确认）。';
  }

  @override
  String get pasteEmptySubtitle => '剪贴板内容被放入编写器。';

  @override
  String get pasteAppendOption => '追加到末尾';

  @override
  String get pasteAppendSubtitle => '保留现有记录，剪贴板中的记录将追加到列表末尾。';

  @override
  String recordsAddedToComposer(num count) {
    return '已添加 $count 条记录。';
  }

  @override
  String get confirmOverwriteTitle => '是否覆盖记录？';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return '现有 $currentCount 条记录。将被替换为剪贴板中的 $newCount 条记录。是否继续？';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return '记录已替换为 $count 条新记录。';
  }

  @override
  String get yesReplace => '是的，替换';

  @override
  String recordsImportedToComposer(num count) {
    return '已导入 $count 条记录。';
  }

  @override
  String get noContentToCopy => '未找到要复制的 NDEF 内容。';

  @override
  String recordsCopiedAndStaged(num count) {
    return '已复制 $count 条 NDEF 记录并添加到编写器（已复制内容，UID 未克隆）。';
  }

  @override
  String get noContentToRewrite => '未找到要重新写入的 NDEF 内容。';

  @override
  String get rewriteTagTitle => '重新写入标签';

  @override
  String get importantNotice => '重要提示：';

  @override
  String get rewriteNotice1 => '• 此操作将完全覆盖目标标签上的现有 NDEF 内容；不会追加到末尾。\n';

  @override
  String get rewriteNotice2 => '• 目标标签必须是可写（未锁定）的 NDEF 标签。\n';

  @override
  String get rewriteNotice3 => '• 不会静默写入上一个标签；需要新的 NFC 触碰。';

  @override
  String get rewriteInstruction => '准备好目标标签，点击“轻触并写入”，然后将标签贴近手机背面。';

  @override
  String get tapAndWrite => '轻触并写入';

  @override
  String get rewritePromptMessage => '将目标标签贴近设备（内容将被完全更新）';

  @override
  String get writeVerifiedTitle => '写入验证成功';

  @override
  String get writeVerifiedDesc => 'NDEF 内容已成功写入目标标签并已验证。';

  @override
  String get writeVerifiedHint => '您可以开始下一次扫描以验证或比较写入的数据。';

  @override
  String get scanAndCompareNow => '立即扫描并比较';

  @override
  String get contentMatchesExactly => '内容完全匹配';

  @override
  String get differenceDetected => '检测到差异';

  @override
  String get compareMatchDesc => '目标标签上的 NDEF 消息与写入的源 NDEF 消息逐字节完全一致。';

  @override
  String get compareDiffDesc => '读取的数据与预期数据存在差异。请检查标签是否已锁定或为其他标签。';

  @override
  String get batchEmptyComposerError => '在开始批量写入之前，请先添加至少一条记录。';

  @override
  String get batchWriteTitle => '批量标签写入';

  @override
  String get batchWriteSubtitle => '依次将相同的 NDEF 内容写入多个标签。';

  @override
  String get attention => '注意：';

  @override
  String get batchNotice1 => '• 为防止意外重复写入，每次写入均需通过“写入下一个”显式触发。\n';

  @override
  String get batchNotice2 => '• 不会进行自动连续扫描；必须物理更换每个标签。';

  @override
  String get batchStartButton => '开始批量写入';

  @override
  String get batchControlPanelTitle => '批量写入控制面板';

  @override
  String get batchCancelOrClose => '取消 / 关闭';

  @override
  String get batchAllCompleted => '所有标签尝试均已完成！';

  @override
  String batchStats(String ok, String failed, String left) {
    return '成功：$ok | 失败：$failed | 剩余：$left';
  }

  @override
  String get waitingForTag => '等待标签...';

  @override
  String get batchFinishButton => '完成批量写入';

  @override
  String get writeError => '写入错误';

  @override
  String get batchConfirmCancelTitle => '取消批量写入';

  @override
  String get batchConfirmCancelMessage => '是否终止批量写入会话？已写入的标签将保留；剩余标签不会被写入。';

  @override
  String get cancelled => '已取消';

  @override
  String get batchCancelledSnack => '批量写入已取消。编写器内容已保留。';

  @override
  String get cancelAndClose => '取消并关闭';

  @override
  String get urlSafetyOfflineAnalysisTitle => '离线 URL 分析';

  @override
  String get urlSafetyScheme => '架构 (协议)：';

  @override
  String get urlSafetyPort => '端口：';

  @override
  String get urlSafetyUserInfoLabel => '用户信息：';

  @override
  String get urlSafetyIpLiteral => '直接 IP 地址：';

  @override
  String get urlSafetyDomain => '否（域名）';

  @override
  String get urlSafetyPunycodeLabel => '国际化域名 / Punycode (xn--)：';

  @override
  String get urlSafetyHomoglyphRisk => '是（疑似同形异义攻击）';

  @override
  String get urlSafetyWarningsHeader => '安全 / 警告提示：';

  @override
  String get urlSafetyDisclaimer => '注意：此分析完全基于本地离线规则。不保证在线检测恶意软件。URL 不会自动打开。';

  @override
  String get templateSaveEmptyError => '在另存为模板之前请先添加记录。';

  @override
  String templateDefaultName(String n) {
    return '模板 $n';
  }

  @override
  String get templateNameSample => '例如：公司网站与联系方式';

  @override
  String get templateSavedSnack => '模板已保存。';

  @override
  String get ruleNoteRequiresNdef => '标签必须至少包含一条 NDEF 记录才能添加备注。';

  @override
  String get ruleNoteAddTitle => '添加自定义标签备注';

  @override
  String get ruleNoteDigestExplanation =>
      '此备注绑定到标签 NDEF SHA-256 摘要。重新扫描时仅显示此说明；不会触发外部操作。';

  @override
  String get ruleNoteSavedSnack => '标签备注已保存。';

  @override
  String get ruleNoteDeleteConfirm => '此标签的应用内备注将被删除。是否继续？';

  @override
  String get ruleNoteDeletedSnack => '标签备注已删除。';

  @override
  String get backupExportTitle => '导出备份';

  @override
  String get backupExportWarningTitle => '隐私与安全警告';

  @override
  String get backupExportWarningBody =>
      '导出的备份文件 (JSON) 为纯文本格式。可能包含 Wi-Fi 密码或联系人等敏感数据。请妥善保存并在分享时保持谨慎。';

  @override
  String get backupIncludedItems => '包含的项目：';

  @override
  String backupTemplatesCount(String count) {
    return '• 模板：$count';
  }

  @override
  String backupRulesCount(String count) {
    return '• 标签备注/规则：$count';
  }

  @override
  String get backupIncludeHistoryOptional => '包含扫描历史记录（可选）';

  @override
  String backupHistoryCount(String count) {
    return '$count 条历史记录';
  }

  @override
  String get backupHistoryDisabled => '此设备上已禁用扫描历史记录';

  @override
  String get backupExportAndShare => '导出并分享';

  @override
  String get backupFileNameLabel => 'NFC Tag Master 备份文件';

  @override
  String get backupFileShareSubject => 'NFC Tag Master 模板与数据备份 (JSON)';

  @override
  String get backupExportSuccessSnack => '备份文件已成功导出并分享。';

  @override
  String get backupExportCancelled => '导出分享已取消。';

  @override
  String get backupImportTitle => '导入备份';

  @override
  String get backupMergeRuleTitle => '安全与合并规则';

  @override
  String get backupMergeRule1 => '• 导入基于合并 (MERGE) 逻辑运行；您现有的记录绝不会被删除。\n';

  @override
  String get backupMergeRule2 => '• 备份文件可能包含 Wi-Fi 密码或个人数据；仅加载来自受信任来源的文件。\n';

  @override
  String get backupMergeRule3 => '• 文件大小限制：2 MiB。加载前会对数据进行严格的架构和 Base64 验证。';

  @override
  String get backupSelectFilePrompt => '请选择要合并的有效 .json 备份文件。';

  @override
  String get selectFileButton => '选择文件';

  @override
  String get fileSelectionCancelled => '文件选择已取消。';

  @override
  String get backupFileExceedsLimit => '所选文件超出了允许的 2 MiB 限制。';

  @override
  String fileReadError(String error) {
    return '文件读取错误：$error';
  }

  @override
  String backupValidationError(String error) {
    return '备份验证错误：$error';
  }

  @override
  String get backupHistoryDetectedTitle => '检测到扫描历史记录';

  @override
  String get backupHistoryDetectedPrompt =>
      '是否要导入历史记录并启用该功能？还是跳过历史记录仅导入模板和标签备注？';

  @override
  String get backupSkipHistoryOption => '跳过历史记录（仅加载模板和备注）';

  @override
  String get backupEnableHistoryOption => '启用历史记录并加载';

  @override
  String get nfcReadyStatus => 'NFC 已就绪';

  @override
  String get nfcReadyDesc => 'NFC 硬件处于活动状态并可随时使用';

  @override
  String get nfcDisabledStatus => 'NFC 已关闭';

  @override
  String get nfcDisabledDesc => 'NFC 已关闭。请在设备设置中开启。';

  @override
  String get template => '模板';

  @override
  String get nfcScannerTitle => 'NFC 扫描仪';

  @override
  String get composeRecord => '创建记录';

  @override
  String get protectOrRemove => '保护 / 移除';

  @override
  String get previousScans => '历史扫描';

  @override
  String get noScannedTagYet => '尚未扫描任何 NFC 标签';

  @override
  String get tapScanPrompt => '轻触“开始扫描”并将标签贴近手机。';

  @override
  String get ndefCopyAndRewriteTitle => 'NDEF 内容复制与重新写入';

  @override
  String get savedTagNoteHeader => '已保存的标签备注（应用内规则）';

  @override
  String get tagNoteOrRule => '标签备注 / 规则';

  @override
  String get editNote => '编辑备注';

  @override
  String get deleteNote => '删除备注';

  @override
  String get tagNoteDigestNotice => '此备注与精确 NDEF 字节的 SHA-256 摘要相匹配。不会触发外部操作。';

  @override
  String get addCustomTagNotePrompt => '您可以为此 NDEF 内容添加自定义本地备注或说明。';

  @override
  String get addNoteToThisTag => '为此标签添加备注';

  @override
  String get ndefSupport => 'NDEF 支持：';

  @override
  String get usedSpace => '已用空间：';

  @override
  String get freeSpace => '剩余空间：';

  @override
  String get noNdefMessageOnTag => '未在标签上找到已保存的 NDEF 消息。';

  @override
  String get hideDetails => '隐藏详情';

  @override
  String get advancedRecordInspector => '记录检查器（高级）';

  @override
  String get ndefRecordInspectorTitle => '高级 NDEF 记录检查器';

  @override
  String get inspectorType => '类型：';

  @override
  String get inspectorPayloadLength => '有效载荷长度：';

  @override
  String get inspectorRawHexPreview => '原始十六进制预览（受限）：';

  @override
  String get ndefRecordsToWriteTitle => '要写入的 NDEF 记录';

  @override
  String get pasteFromClipboardAction => '从剪贴板粘贴（替换 / 追加）';

  @override
  String get importAction => '导入';

  @override
  String get importFromTagAction => '从 NFC 标签导入';

  @override
  String get importFromQrAction => '从二维码导入';

  @override
  String get importFromCsvAction => '从 CSV 文件导入';

  @override
  String get composerEmptyDescription =>
      '您可以将文本、网页链接、Wi-Fi、电话、电子邮件、联系人卡片等写入标签。';

  @override
  String get urlSafetyReview => 'URL 检查';

  @override
  String get inspector => '检查器';

  @override
  String get typeLabel => '类型：';

  @override
  String get payloadLabel => '有效载荷：';

  @override
  String get writeAndVerify => '写入标签并验证';

  @override
  String get batchWriteButtonLabel => '批量标签写入 (2..100 个标签)';

  @override
  String get clearTagButtonLabel => '重置标签（清除内容）';

  @override
  String get confirmWriteTitle => '确认写入标签';

  @override
  String get confirmWriteMessage1 => '此操作将完全覆盖目标标签上的现有 NDEF 内容。';

  @override
  String get confirmWriteMessage2 => '请确保目标标签可写（未锁定）。写入后将自动验证标签内容。';

  @override
  String get yesWrite => '是的，写入';

  @override
  String get scanHistoryDisabledTitle => '扫描历史记录已关闭';

  @override
  String get scanHistoryDisabledDesc => '出于隐私考虑，默认不保存扫描历史记录。您可以在“设置”选项卡中启用它。';

  @override
  String get enableHistory => '启用历史记录';

  @override
  String get historySearchHint => '按 UID、文本或类型搜索（例如：URL、Wi-Fi、04A1...）';

  @override
  String get noHistoryYet => '暂无保存的扫描历史记录。';

  @override
  String get tryDifferentQuery => '请尝试其他 UID、文本内容或记录类型。';

  @override
  String get clearSearch => '清除搜索';

  @override
  String get deleteThisRecord => '删除此记录';

  @override
  String get qrPreview => 'QR 预览';

  @override
  String get lockTagConfirmTitle => '永久锁定标签';

  @override
  String get lockTagWarning2 => '请务必先确认已写入正确的内容。';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'QR码预览';

  @override
  String get unknownParentheses => '(未知)';

  @override
  String get ok => '确定';

  @override
  String rewriteSourceUid(String uid) {
    return '源 UID：$uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return '待写入记录：$count';
  }

  @override
  String rewriteFailed(String message) {
    return '重写失败：$message';
  }

  @override
  String writtenRecordsCount(String count) {
    return '已写入记录：$count';
  }

  @override
  String scannedTagUid(String uid) {
    return '已扫描标签 UID：$uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return '已写入数据：$count 条（$bytes 字节）';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return '已扫描数据：$count 条（$bytes 字节）';
  }

  @override
  String batchTargetCount(String count) {
    return '目标标签数：$count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return '写入列表：$count 条（$bytes 字节）';
  }

  @override
  String batchNext(String current, String total) {
    return '下一个：标签 #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return '成功（$message）';
  }

  @override
  String batchAttemptFailed(String message) {
    return '失败：$message';
  }

  @override
  String batchAttemptLabel(String n) {
    return '标签 #$n：';
  }

  @override
  String batchTapToWrite(String n) {
    return '轻触并写入标签 #$n';
  }

  @override
  String batchPrompt(String current, String total) {
    return '批量写入：请靠近标签 #$current / $total';
  }

  @override
  String batchWrittenVerified(String count) {
    return '已写入并验证 $count 条记录';
  }

  @override
  String templateLoaded(String name) {
    return '已将“$name”中的记录加入写入列表。';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'NDEF 内容摘要（SHA-256）：\n$sha';
  }

  @override
  String exportError(String error) {
    return '导出错误：$error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return '备份包含 $count 条扫描历史，但此设备已关闭历史记录。\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return '导入成功：\n$summary';
  }

  @override
  String mergeError(String error) {
    return '合并错误：$error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'NDEF 剪贴板：$count 条（$bytes B）- $source';
  }

  @override
  String get heroScanSubtitle => '将标签靠近手机顶部，即可立即看到内容、容量和序列号。';

  @override
  String lastTagLabel(String uid) {
    return '上一个标签：$uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return '扫描错误：$message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count 条（$bytes 字节）- 仅复制 NDEF 数据，不复制 UID。';
  }

  @override
  String tagSourceLabel(String uid) {
    return '标签 $uid';
  }

  @override
  String errorWithMessage(String message) {
    return '错误：$message';
  }

  @override
  String readRecordsHeader(String count) {
    return '已读取的 NDEF 记录（$count）';
  }

  @override
  String composedRecordsHeader(String count) {
    return '待写入的 NDEF 记录（$count）';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return '注意：负载为 $bytes 字节，仅显示前 64 字节。';
  }

  @override
  String composerTotals(String bytes, String count) {
    return '总大小：$bytes 字节 | 记录：$count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return '写入并验证（$bytes 字节）';
  }

  @override
  String savedScansCount(String count) {
    return '已保存的扫描：$count';
  }

  @override
  String historyNoResults(String query) {
    return '未找到“$query”的结果。';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count 条';
  }

  @override
  String historyCapacity(String max, String used) {
    return '容量：$max B | 已用：$used B';
  }

  @override
  String historySourceLabel(String uid) {
    return '历史 UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count 条 | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return '已保存规则/备注：$count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return '已写入字节：$bytes | 验证：$verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return '锁定后标签将变为只读：内容永远无法修改或擦除，锁定也无法解除。$more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return '消息大小：$bytes 字节';
  }

  @override
  String bytesShort(String bytes) {
    return '字节：$bytes B';
  }

  @override
  String bytesValue(String bytes) {
    return '$bytes 字节';
  }

  @override
  String bytesOfCapacity(String bytes, String max) {
    return '$bytes / $max 字节';
  }

  @override
  String get valueNone => '无';

  @override
  String get valueYesIp => '是（IP 地址）';

  @override
  String get nfcMissingShort => '无 NFC';

  @override
  String get clearClipboard => '清空剪贴板';

  @override
  String get statLibrary => '标签库';

  @override
  String get scanTagTitle => '扫描标签';

  @override
  String get readingInProgress => '正在读取...';

  @override
  String get rawMemorySubtitle => '原始内存';

  @override
  String get copyToClipboard => '复制到剪贴板';

  @override
  String get serialUidLabel => '序列号（UID）：';

  @override
  String get totalCapacityLabel => '总容量：';

  @override
  String get technologiesLabel => '技术：';

  @override
  String get idLabel => '标识（ID）：';

  @override
  String get undoTooltip => '撤销';

  @override
  String get clearComposer => '清空列表';

  @override
  String composerTotalSize(String bytes) {
    return '总大小：$bytes 字节';
  }

  @override
  String get yesClear => '是的，清除';

  @override
  String get ssidTooLong => 'SSID 最多 32 字节。';

  @override
  String get locationPlace => '地点';

  @override
  String get targetWebUrl => '目标网址 *';

  @override
  String get languageCodeLabel => '语言代码（ISO 639-1）*';

  @override
  String get utf8Text => 'UTF-8 文本';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF：$tnf，大小：$bytes 字节';
  }

  @override
  String get quickGallerySubtitle => '一键即用';

  @override
  String get quickLibraryTitle => '我的标签';

  @override
  String get quickLibrarySubtitle => '已保存标签';

  @override
  String get saveToLibrary => '保存到标签库';

  @override
  String libraryMatch(String name) {
    return '标签库中：$name';
  }

  @override
  String tagChipLabel(String chip) {
    return '芯片：$chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return '制造商：$name';
  }

  @override
  String get settingsLibrarySubtitle => '带名称、备注和照片的标签';

  @override
  String get showOnboardingAgain => '再次显示介绍';

  @override
  String get importFromGallery => '从现成模板添加';

  @override
  String get appearanceTitle => '外观';

  @override
  String get themeSystem => '跟随系统';

  @override
  String get themeLight => '浅色';

  @override
  String get themeDark => '深色';

  @override
  String get valuePresentRisky => '存在（可能有风险）';

  @override
  String get supportedValue => '支持';

  @override
  String get notSupportedValue => '不支持';

  @override
  String get nfcUnsupportedDesc => '此设备不支持 NFC';

  @override
  String get ndefTrailingData => 'NDEF 消息后有多余数据';

  @override
  String get ndefMissingEnd => 'NDEF 消息缺少结尾';

  @override
  String vcardPhoneShort(String value) {
    return '电话：$value';
  }

  @override
  String vcardEmailShort(String value) {
    return '邮箱：$value';
  }

  @override
  String vcardOrgShort(String value) {
    return '单位：$value';
  }

  @override
  String get pageUidLock => 'UID / 锁定';

  @override
  String get pageData => '数据';

  @override
  String get pageLock => '锁定';

  @override
  String memoryPageLine(String page) {
    return '页 $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp（电话）';

  @override
  String get mapApple => 'Apple 地图';

  @override
  String get mapGoogle => 'Google 地图';

  @override
  String get whatsappMessageHint => '你好，我想了解一下';

  @override
  String get facetimeTargetHint => '+8613812345678 或 name@icloud.com';

  @override
  String get bluetoothMacLabel => '蓝牙 MAC 地址';

  @override
  String get webAddressUrlLabel => '网址（URL）';

  @override
  String get latitudeLabel => '纬度（Lat）';

  @override
  String get longitudeLabel => '经度（Lng）';

  @override
  String get emailAddressLabel => '电子邮箱';

  @override
  String get websiteLabel => '网站';

  @override
  String get wifiAuthWpa2Home => 'WPA2 个人（家庭/办公标准）';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 个人（混合）';

  @override
  String get hostLabel => '主机：';

  @override
  String get readOnlyLocked => '只读（已锁定）';

  @override
  String get redoTooltip => '重做';

  @override
  String historyFoundCount(String found, String total) {
    return '找到：$found / $total';
  }

  @override
  String get addToWriteListShort => '加入写入列表';

  @override
  String get mimeTypeHint => 'application/json 或 text/plain';

  @override
  String get hapticsToggle => '触感反馈';

  @override
  String get hapticsToggleSubtitle => '读取或写入完成时短暂振动';

  @override
  String get soundsToggle => '声音';

  @override
  String get soundsToggleSubtitle => '结果时播放短促系统音';

  @override
  String get backupLibraryMustBeList => '标签库必须是列表。';

  @override
  String get backupInvalidLibraryEntry => '标签库条目无效。';

  @override
  String backupMaxLibraryExceeded(String max) {
    return '标签库最多 $max 条。';
  }

  @override
  String backupSummaryLibrary(String added) {
    return '标签库：新增 $added';
  }

  @override
  String backupLibraryCount(String count) {
    return '• 标签库：$count（不含照片）';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return '上个标签：$bytes / $max B';
  }

  @override
  String get contentTooLargeForChips => '内容超出常见标签容量；请缩短文本或使用短链接。';

  @override
  String get tagReportTitle => '标签报告';

  @override
  String get tagReportSubtitle => '芯片、锁定、密码和占用';

  @override
  String get tagReportPrompt => '请靠近要检查的标签';

  @override
  String get tagReportBusy => '正在检查标签...';

  @override
  String tagReportDone(String chip) {
    return '报告已生成：$chip';
  }

  @override
  String get unknownChip => '未知芯片';

  @override
  String get yes => '是';

  @override
  String get reportChip => '芯片';

  @override
  String get reportNdefFormatted => '已格式化为 NDEF';

  @override
  String get reportWritable => '可写入';

  @override
  String get reportStaticLock => '静态锁';

  @override
  String get reportDynamicLock => '动态锁';

  @override
  String get reportPassword => '密码保护';

  @override
  String get reportReadProtected => '读取受保护';

  @override
  String get reportNdefUsage => 'NDEF 占用';

  @override
  String get reportVerdictWritable => '标签可写入';

  @override
  String get reportVerdictRestricted => '标签有限制';

  @override
  String get reportCopied => '报告已复制';

  @override
  String get compareTagsTitle => '比较两个标签';

  @override
  String get compareTagsSubtitle => '检查副本是否与原件一致';

  @override
  String get compareStepFirst => '先扫描第一个（原始）标签。';

  @override
  String get compareStepSecond => '现在扫描第二个标签。';

  @override
  String get compareIdentical => '内容一致';

  @override
  String get compareDifferent => '内容不同';

  @override
  String get compareSameTag => '同一标签被扫描了两次。';

  @override
  String get compareDifferentTags => '两个不同的标签。';

  @override
  String get compareRecordSame => '相同';

  @override
  String get compareRecordChanged => '不同';

  @override
  String get compareRecordOnlyFirst => '仅在 A';

  @override
  String get compareRecordOnlySecond => '仅在 B';

  @override
  String get compareBothEmpty => '两个标签都为空。';

  @override
  String capacityExceededShort(String needed, String max) {
    return '内容过大：$needed / $max 字节';
  }

  @override
  String get verifyFailedAfterWrite => '无法验证写入数据；请将标签保持更久。';

  @override
  String get blankTagTitle => '标签尚未准备好';

  @override
  String get blankTagBody =>
      '此标签为新标签，尚未格式化为 NDEF。应用可一次性完成准备并写入内容（NTAG 和 MIFARE Ultralight）。';

  @override
  String get blankTagAction => '准备并写入';

  @override
  String get shareTag => '分享';

  @override
  String get shareAsText => '以文本分享';

  @override
  String get shareAsFile => '以文件分享（.json）';

  @override
  String get shareAsFileSubtitle => '可在其他设备上原样写入';

  @override
  String get importFromJsonFile => '从标签文件（.json）';

  @override
  String get invalidTagFile => '标签文件无效。';

  @override
  String get continuousScanTitle => '连续扫描';

  @override
  String get continuousScanSubtitle => '依次扫描标签，并以 CSV 分享列表';

  @override
  String continuousScanCount(String count) {
    return '已扫描 $count 个标签';
  }

  @override
  String get exportCsv => '以 CSV 分享';

  @override
  String get clearList => '清空列表';

  @override
  String get csvColumnTime => '时间';

  @override
  String get csvColumnRecords => '记录';

  @override
  String get csvColumnContent => '内容';

  @override
  String get csvColumnCapacity => '容量（B）';

  @override
  String get csvColumnUsed => '已用（B）';

  @override
  String get batchSerialToggle => '添加序列号';

  @override
  String batchSerialHint(String token) {
    return '在记录中写入 $token，编号会填入该处；否则会为每个标签另加一条带编号的文本记录。';
  }

  @override
  String get batchSerialPrefix => '前缀';

  @override
  String get batchSerialStart => '起始';

  @override
  String get batchSerialDigits => '位数';

  @override
  String batchSerialPreview(String first, String last) {
    return '首个：$first · 末个：$last';
  }

  @override
  String get batchFromCsvButton => '从 CSV 文件（每行一个标签）';

  @override
  String get batchCsvTitle => '从 CSV 批量写入';

  @override
  String batchCsvSummary(String count) {
    return '将写入 $count 个标签，每个标签按顺序写入 CSV 的一行。';
  }

  @override
  String batchCsvTruncated(String max) {
    return '批量写入最多使用 $max 行，其余已跳过。';
  }

  @override
  String get cloneTagTitle => '克隆标签';

  @override
  String get cloneTagSubtitle => '读取一个标签并将内容写入其他标签';

  @override
  String get cloneSourceStep => '第 1 步：扫描源标签。仅复制 NDEF 内容，UID 无法克隆。';

  @override
  String get cloneSourceEmpty => '源标签没有可复制的 NDEF 记录。';

  @override
  String get cloneReadyTitle => '已读取源标签';

  @override
  String cloneReadySummary(String count, String bytes) {
    return '将复制 $count 条记录（$bytes 字节）。请选择要写入的标签数量。';
  }

  @override
  String get cloneEditFirst => '先编辑';

  @override
  String get tapPreviewTitle => '手机触碰时会发生什么？';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => '标签为空，不会发生任何事。';

  @override
  String tapIosUrl(String target) {
    return '会出现通知，点按后在 Safari 或对应应用中打开 $target。';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target 会直接在浏览器或对应应用中打开。';
  }

  @override
  String tapIosApp(String target) {
    return '会出现通知；若已安装应用，将通过“$target”打开。';
  }

  @override
  String tapAndroidApp(String target) {
    return '若已安装应用，将通过“$target”打开。';
  }

  @override
  String tapIosCall(String target) {
    return '会出现通知，点按即拨打 $target。';
  }

  @override
  String tapAndroidCall(String target) {
    return '电话应用将打开并填入 $target。';
  }

  @override
  String tapIosSms(String target) {
    return '会出现通知，“信息”将打开发给 $target 的新信息。';
  }

  @override
  String tapAndroidSms(String target) {
    return '短信应用将打开并发给 $target。';
  }

  @override
  String tapIosEmail(String target) {
    return '会出现通知，“邮件”将打开发给 $target 的新邮件。';
  }

  @override
  String tapAndroidEmail(String target) {
    return '邮件应用将打开并发给 $target。';
  }

  @override
  String get tapIosMap =>
      'iPhone 不会自动打开“geo:”位置，请改用 Apple 或 Google 地图链接（快捷链接）。';

  @override
  String get tapAndroidMap => '地图应用将在此位置打开。';

  @override
  String get tapIosNeedsApp => 'iPhone 不会自动处理此内容，需要用 NFC 应用读取。';

  @override
  String get tapAndroidText => '大多数手机不会有反应，或在系统界面显示文本。';

  @override
  String get tapAndroidContact => '会提示添加联系人。';

  @override
  String get tapAndroidWifi => '会提示加入网络（Android 10 及以上）。';

  @override
  String get tapAndroidCalendar => '若日历应用支持，会提示添加该日程。';

  @override
  String get tapAndroidOther => '仅当安装了支持此内容的应用时才会打开。';

  @override
  String tapIgnoredRecords(String count) {
    return '手机只执行第一条记录，其余 $count 条可在 NFC 应用中查看。';
  }

  @override
  String get tapIosRequirement => 'iPhone XS 及更新机型在解锁且未打开相机/钱包时可后台读取。';

  @override
  String get galleryCatBusiness => '商务';

  @override
  String get galleryCatSocial => '社交';

  @override
  String get galleryCatHome => '家居';

  @override
  String get galleryCatPersonal => '个人';

  @override
  String get galleryCatAutomation => '自动化';

  @override
  String get galleryFavorites => '收藏';

  @override
  String get gallerySearchHint => '搜索模板...';

  @override
  String get galleryNoResults => '没有匹配的模板。';

  @override
  String get galleryAddFavorite => '加入收藏';

  @override
  String get galleryRemoveFavorite => '取消收藏';

  @override
  String get presetEventTitle => '活动邀请';

  @override
  String get presetEventDesc => '以 iCalendar 格式写入活动，Android 可将其添加到日历。';

  @override
  String get eventNameLabel => '活动名称';

  @override
  String get eventDateLabel => '日期（YYYY-MM-DD）';

  @override
  String get eventTimeLabel => '时间（HH:MM）';

  @override
  String get eventDateTimeInvalid => '日期或时间无效。示例：2026-12-31 和 19:00';

  @override
  String get presetLuggageTitle => '行李牌';

  @override
  String get presetLuggageDesc => '若遗失，拾到的人可轻松联系您。';

  @override
  String luggageMessage(String name, String contact) {
    return '此行李属于 $name。如拾到请联系：$contact';
  }

  @override
  String get presetPlaylistTitle => '播放列表';

  @override
  String get presetPlaylistDesc => '打开 Spotify、Apple Music 或 YouTube 播放列表。';

  @override
  String get playlistLinkLabel => '播放列表链接';

  @override
  String get presetEmailMeTitle => '给我发邮件';

  @override
  String get presetEmailMeDesc => '打开一封发给您的新邮件，主题已填好。';

  @override
  String get presetCallMeTitle => '给我打电话';

  @override
  String get presetCallMeDesc => '触碰的手机会拨打您的号码。';

  @override
  String get presetRunShortcutTitle => '运行快捷指令';

  @override
  String get presetRunShortcutDesc => '运行指定的 iPhone 快捷指令：开灯、播放音乐、切换专注模式…';

  @override
  String get shortcutNameLabel => '快捷指令名称';

  @override
  String get recipesSection => '现成的自动化方案';

  @override
  String get recipesIntro =>
      '在“快捷指令”中按下方名称创建快捷指令并添加操作，然后关联到 NFC 自动化，或用“添加到标签”写入运行链接。';

  @override
  String get recipeAddToTag => '添加到标签';

  @override
  String get recipeBedTitle => '晚安';

  @override
  String get recipeBedActions => '床头：开启睡眠专注 · 设闹钟 · 关灯';

  @override
  String get recipeCarTitle => '驾车模式';

  @override
  String get recipeCarActions => '车载支架：驾驶专注 · 导航回家 · 播放音乐';

  @override
  String get recipeDoorTitle => '我到家了';

  @override
  String get recipeDoorActions => '门口：开灯 · 打开 Wi-Fi · 给家人发“我到家了”';

  @override
  String get recipeDeskTitle => '专注时间';

  @override
  String get recipeDeskActions => '书桌：工作专注 · 25 分钟计时 · 专注歌单';

  @override
  String get recipeGymTitle => '锻炼';

  @override
  String get recipeGymActions => '健身包：开始锻炼 · 运动歌单 · 勿扰模式';

  @override
  String get recipeKitchenTitle => '厨房计时器';

  @override
  String get recipeKitchenActions => '厨房：10 分钟计时 · 打开购物清单';

  @override
  String get libraryLabelsField => '标签/文件夹（用逗号分隔）';

  @override
  String get libraryLabelsHint => '办公室, 2楼';

  @override
  String librarySaveFailed(String error) {
    return '无法保存：$error';
  }

  @override
  String get csvColumnLabels => '标签';

  @override
  String get firstNameLabel => '名';

  @override
  String get lastNameLabel => '姓';

  @override
  String get wifiPasswordMinHint => '至少 8 个字符';

  @override
  String get emailExampleHint => 'name@example.com';

  @override
  String get wifiSsidExampleHint => 'Home_WiFi_5G';

  @override
  String get nfcErrUnavailable => '此设备不支持 NFC 或 NFC 已关闭。';

  @override
  String get nfcErrBusy => '另一个 NFC 操作正在进行，请等待完成。';

  @override
  String get nfcErrCancelled => '操作已取消。';

  @override
  String get nfcErrAppPaused => '应用转入后台，操作已取消。';

  @override
  String get nfcErrUnsupportedTag => '不支持此类型的标签。';

  @override
  String get nfcErrNtagOnly => '此工具仅适用于 NTAG / MIFARE Ultralight 标签。';

  @override
  String get nfcErrNotNdefRead => '检测到标签，但不是 NDEF 格式。';

  @override
  String get nfcErrNotNdefWrite => '标签不是 NDEF 格式，此手机无法直接写入 NDEF。';

  @override
  String get nfcErrReadOnly => '标签为只读（已锁定），无法写入。';

  @override
  String get nfcErrNoData => '没有可写入的数据。';

  @override
  String nfcErrCapacity(String required, String max) {
    return '标签空间不足：需要 $required 字节，可用 $max 字节。';
  }

  @override
  String get nfcErrCapacityShort => '标签空间不足。';

  @override
  String get nfcErrVerify => '校验失败：读回的数据与写入的不一致。';

  @override
  String get nfcErrConnectionLost => '与标签的连接中断，请保持不动后重试。';

  @override
  String get nfcErrAlreadyLocked => '标签已锁定（只读）。';

  @override
  String get nfcErrLockNotNdef => '标签不是 NDEF 格式，请先写入记录再锁定。';

  @override
  String get nfcErrLockNotSupported => '此类型的标签不支持锁定。';

  @override
  String get nfcSheetConnected => '标签已连接，正在处理...';

  @override
  String get nfcSheetReadOk => '标签已读取！';

  @override
  String get nfcSheetEmptyRead => '已读取空标签！';

  @override
  String get nfcSheetMultipleTags => '检测到多个标签，请只靠近一个。';

  @override
  String get nfcSheetWriteVerified => '已写入并校验！';

  @override
  String get nfcSheetWritten => '已写入标签！';

  @override
  String get nfcSheetLocked => '标签已永久锁定！';

  @override
  String get nfcWriteDone => '已成功写入标签。';

  @override
  String get errorWidgetMessage => '无法显示此部分，请返回后重试。';

  @override
  String get nfcErrTimeout => '超时未检测到标签。请将标签靠近手机顶部后重试。';

  @override
  String get aboutTitle => '关于';

  @override
  String aboutVersion(String version) {
    return '版本 $version';
  }

  @override
  String get privacySummary => '您的数据只保存在本设备：无账号、无服务器、无广告或跟踪。';

  @override
  String get whatsNewTitle => '新功能';

  @override
  String get whatsNew110 =>
      '• 14 种语言、深色模式和全新设计\n• 带分类、搜索和收藏的现成模板\n• 批量写入：序列号、CSV 和标签克隆\n• “触碰时会发生什么？”预览与容量提醒\n• 带照片、备注和标签的标签库\n• 标签报告、对比、连续扫描和 CSV 导出\n• Siri、快捷指令和现成自动化方案';

  @override
  String lastBackupAt(String date) {
    return '上次备份：$date';
  }

  @override
  String get noBackupYet => '尚未备份。';

  @override
  String get backupStale => '上次备份已超过 30 天，建议重新备份。';

  @override
  String get backupICloudTip => '提示：在共享菜单中选择“存储到文件”→ iCloud 云盘即可保存到 iCloud。';

  @override
  String get dragToReorder => '拖动以排序';

  @override
  String get modeTitle => '模式';

  @override
  String get modeNormal => '标准';

  @override
  String get modeCompat => '兼容';

  @override
  String get modeNormalDesc => '标准：全部功能开启；写入后会回读校验。';

  @override
  String get modeCompatDesc => '兼容：写入后不回读。在部分老旧或不稳定的标签上更可靠。';

  @override
  String get rateApp => '为应用评分';

  @override
  String get rateAppUnavailable => '暂时无法显示评分窗口（TestFlight 中不会出现）。';

  @override
  String get chipsTitle => 'NFC 芯片';

  @override
  String get chipsSubtitle => '该买哪种标签？容量与手机支持';

  @override
  String get chipsIntro => '可用字节是可写入的 NDEF 内容上限。新手推荐 NTAG215。';

  @override
  String chipsUsable(String bytes) {
    return '可用：$bytes 字节';
  }

  @override
  String get chipsReadWrite => '读写';

  @override
  String get chipsReadOnlyNdef => '仅限 NDEF 格式';

  @override
  String get chipsNotSupported => '不支持';

  @override
  String get chipsNxpOnly => '仅限 NXP 芯片手机';

  @override
  String get chipUseSmall => '单个链接、短文本、Wi-Fi；最便宜';

  @override
  String get chipUseMedium => '名片、多条记录；amiibo 手办';

  @override
  String get chipUseLarge => '长内容、详细名片';

  @override
  String get chipUseSecure => '防伪认证（商品、票务）';

  @override
  String get chipUseTicket => '交通与活动票';

  @override
  String get chipUseAccess => '门禁卡、酒店房卡';

  @override
  String get chipUseIndustrial => '图书馆、仓库与工业标签；读取距离更远';

  @override
  String get chipUseJapan => '在日本常见（交通、支付）';

  @override
  String get chipUseLegacy => '旧型号；不建议用于新项目';

  @override
  String templateVarsHint(String date, String time, String counter) {
    return '提示：在文本或链接中写入 $date、$time、$counter，写入时会自动填充。';
  }

  @override
  String templateVarsPreview(String date, String time, String counter) {
    return '写入时：$date · $time · 计数 $counter';
  }

  @override
  String get libraryWriteToTag => '写入标签';

  @override
  String libraryWritePrompt(String name) {
    return '靠近标签以写入“$name”';
  }

  @override
  String get presetSmartCardTitle => '智能名片';

  @override
  String get presetSmartCardDesc => '一个标签同时包含网站、名片和可选 Wi-Fi，手机会先打开网站。';

  @override
  String get presetLostItemTitle => '失物招领';

  @override
  String get presetLostItemDesc => '拾到的人触碰即可打开发给您的短信草稿。';

  @override
  String get lostItemNameLabel => '物品（如钥匙、钱包）';

  @override
  String lostItemSms(String item) {
    return '你好，我捡到了你的$item。';
  }

  @override
  String lostItemText(String item, String name) {
    return '此$item属于$name，如拾到请联系。';
  }

  @override
  String get presetVoiceTitle => '语音留言';

  @override
  String get presetVoiceDesc => '贴在礼物或盒子上：一碰即播放语音或歌曲。';

  @override
  String get voiceLinkLabel => '音频链接（iCloud、Drive、SoundCloud…）';

  @override
  String get logbookTitle => '记录簿';

  @override
  String get logbookSubtitle => '考勤、服药、盘点：每次触碰都记录时间';

  @override
  String get logbookNew => '新建记录簿';

  @override
  String get logbookName => '记录簿名称';

  @override
  String get logbookKindAttendance => '考勤';

  @override
  String get logbookKindMedication => '服药';

  @override
  String get logbookKindInventory => '库存盘点';

  @override
  String get logbookKindCustom => '其他';

  @override
  String get logbookEmpty => '还没有记录簿。可以新建“3A 班考勤”或“晚间服药”。';

  @override
  String get logbookScanButton => '扫描并记录';

  @override
  String logbookEntryAdded(String label) {
    return '已记录：$label';
  }

  @override
  String get logbookNoEntries => '暂无记录。';

  @override
  String logbookToday(String count, String tags) {
    return '今天：$count 条 · $tags 个不同标签';
  }

  @override
  String logbookMedTaken(String time) {
    return '今天已服用 ✓（最近：$time）';
  }

  @override
  String get logbookMedNotTaken => '今天尚未服用';

  @override
  String logbookInventorySummary(String count) {
    return '已盘点 $count 个不同标签';
  }

  @override
  String logbookDeleteConfirm(String name) {
    return '删除记录簿“$name”及其所有记录？';
  }

  @override
  String logbookEntries(String count) {
    return '$count 条';
  }

  @override
  String lastSeenAt(String date) {
    return '最后一次：$date';
  }

  @override
  String get neverSeen => '尚未扫描';

  @override
  String get sortLongestUnseen => '最久未见';

  @override
  String get unseen30Days => '30 天以上未见';

  @override
  String get inventoryCardTitle => '此标签在你的标签库中';

  @override
  String scanReportLine(String unique, String dup, String empty) {
    return '$unique 个不同标签 · $dup 个重复 · $empty 个空白';
  }

  @override
  String get printSheet => '可打印标签页（PDF）';

  @override
  String get phishDangerTitle => '警告：可能是仿冒网站';

  @override
  String get phishCautionTitle => '打开前请检查此链接';

  @override
  String phishLookalike(String brand) {
    return '地址看起来像 $brand，但不是其官方域名。';
  }

  @override
  String phishBrandInSubdomain(String brand) {
    return '“$brand”被放在另一个域名前面，真实网站并非它。';
  }

  @override
  String phishBrandInName(String brand) {
    return '域名包含“$brand”，但不是官方网站。';
  }

  @override
  String phishShortener(String host) {
    return '短链接（$host）：真实地址被隐藏。';
  }

  @override
  String phishRiskyTld(String tld) {
    return '“.$tld”后缀常被钓鱼网站使用。';
  }

  @override
  String get phishDisclaimer => '此检查基于离线线索，不能保证网站安全。';

  @override
  String get backupEncrypt => '用密码保护';

  @override
  String get backupEncryptHint => '备份使用 AES-256 加密，忘记密码将无法打开。';

  @override
  String get backupPassword => '密码';

  @override
  String get backupPasswordRepeat => '确认密码';

  @override
  String backupPasswordTooShort(String min) {
    return '密码至少需要 $min 个字符。';
  }

  @override
  String get backupPasswordMismatch => '两次密码不一致。';

  @override
  String get backupEncryptedPrompt => '此备份受密码保护，请输入密码。';

  @override
  String get backupWrongPassword => '密码错误。';

  @override
  String get backupDecryptFailed => '无法解密，文件可能已损坏。';

  @override
  String get appLockTitle => '应用锁';

  @override
  String get appLockSubtitle => '打开时需要面容 ID、触控 ID 或设备密码';

  @override
  String get appLockUnavailable => '此设备未设置屏幕锁。';

  @override
  String get appLockLocked => '应用已锁定';

  @override
  String get appLockUnlock => '解锁';

  @override
  String get appLockReason => '以打开标签库和历史记录';

  @override
  String get sigTitle => '签名标签';

  @override
  String get sigSubtitle => '有人改动内容时能察觉';

  @override
  String get sigExplain =>
      '写入的标签会附加用你的密钥生成的签名记录。用本应用读取时，任何改动都会被发现。可与同事共享密钥；没有密钥就无法伪造签名。不会阻止他人读取。';

  @override
  String get sigCreateKey => '创建密钥';

  @override
  String get sigCopyKey => '复制密钥（共享）';

  @override
  String get sigImportKey => '粘贴密钥';

  @override
  String get sigImportInvalid => '剪贴板中没有有效密钥。';

  @override
  String sigKeyReady(String id) {
    return '密钥已就绪（$id）';
  }

  @override
  String get sigSignOnWrite => '签名我写入的标签';

  @override
  String get sigValid => '签名有效';

  @override
  String get sigInvalid => '签名无效：内容已被改动';

  @override
  String get sigOtherKey => '由其他密钥签名';

  @override
  String get sigReplaceKeyConfirm => '替换当前密钥？用旧密钥签名的标签将显示为“其他密钥”。';

  @override
  String get amiiboTitle => 'amiibo 信息';

  @override
  String get amiiboSubtitle => '手办/卡片 ID 与系列（只读）';

  @override
  String get amiiboPrompt => '请靠近 amiibo 手办或卡片';

  @override
  String amiiboNotNtag215(String chip) {
    return '这不是 amiibo（$chip）；amiibo 使用 NTAG215。';
  }

  @override
  String get amiiboNotFound => '已读取 NTAG215，但没有 amiibo 数据。';

  @override
  String amiiboSeries(String series) {
    return '系列：$series';
  }

  @override
  String amiiboType(String type) {
    return '类型：$type';
  }

  @override
  String get amiiboFigure => '手办';

  @override
  String get amiiboCard => '卡片';

  @override
  String get amiiboYarn => '毛线';

  @override
  String get amiiboLookup => '在线查询名称（amiiboapi.com）';

  @override
  String memoryEditPage(String page) {
    return '编辑第 $page 页（4 字节十六进制）';
  }

  @override
  String get memoryEditHint => '点按用户页即可编辑。';

  @override
  String memoryEditPrompt(String page) {
    return '靠近同一标签以写入第 $page 页';
  }

  @override
  String memoryPageWritten(String page) {
    return '第 $page 页已写入。';
  }

  @override
  String get memoryUidMismatch => '检测到不同标签，未写入。';

  @override
  String memoryReadSpeed(String ms, String rate) {
    return '读取耗时：$ms 毫秒（$rate 字节/秒）';
  }

  @override
  String get simpleModeTitle => '简易模式';

  @override
  String get simpleModeSubtitle => '大按钮；儿童和老人一碰即读';

  @override
  String get simpleScan => '读取标签';

  @override
  String get simpleHint => '将标签靠近手机顶部。';

  @override
  String get simpleCall => '拨打';

  @override
  String get simpleMessage => '发送信息';

  @override
  String get simpleOpen => '打开';

  @override
  String get simpleEmail => '写邮件';

  @override
  String get simpleMap => '在地图中打开';

  @override
  String get simpleExit => '长按返回普通视图';

  @override
  String get simpleNothing => '此标签没有可显示的内容。';

  @override
  String whatsNew120(String date, String time, String counter) {
    return '• 记录簿：考勤、服药与库存\n• 安全：面容 ID 锁、加密备份、签名标签、仿冒网站警告\n• 模板变量（$date、$time、$counter）及从标签库写入\n• 新模板：智能名片、失物招领、语音留言\n• 带二维码的可打印标签页（PDF）\n• 简易模式、amiibo 信息、字节编辑器、NFC 芯片指南\n• 拖动排序与兼容模式';
  }

  @override
  String get logbookKindTimeClock => '签到 / 签退（考勤）';

  @override
  String get logbookCheckIn => '签到';

  @override
  String get logbookCheckOut => '签退';

  @override
  String logbookCheckedIn(String label) {
    return '已签到：$label';
  }

  @override
  String logbookCheckedOut(String label) {
    return '已签退：$label';
  }

  @override
  String logbookPresentNow(String count) {
    return '当前在场：$count';
  }

  @override
  String logbookWorkedToday(String duration) {
    return '今日合计：$duration';
  }

  @override
  String get logbookWorkedPerPerson => '今日时长';

  @override
  String durationHm(String h, String m) {
    return '$h 小时 $m 分';
  }

  @override
  String get csvColumnDirection => '方向';

  @override
  String get libraryCheckEvery => '检查间隔';

  @override
  String get libraryCheckNone => '无';

  @override
  String libraryCheckDays(String days) {
    return '每 $days 天';
  }

  @override
  String get libraryCheckHint => '若在此期间内未扫描，标签将标记为待检查（灭火器、滤芯、浇花等）。';

  @override
  String get libraryCheckDue => '需要检查';

  @override
  String libraryCheckNext(String date) {
    return '下次检查：$date';
  }

  @override
  String libraryDueFilter(String count) {
    return '待检查（$count）';
  }

  @override
  String libraryCheckRecorded(String date) {
    return '已记录检查 · 下次：$date';
  }

  @override
  String cloneWarning(String name) {
    return '此内容已保存在标签库的“$name”中，但 UID 不同。此标签可能是复制品。';
  }

  @override
  String get doctorTitle => 'NDEF 诊断';

  @override
  String get doctorButton => '诊断';

  @override
  String get doctorTooShort => '未能完整读取内存；请将标签多停留一会再试。';

  @override
  String get doctorNoCc => '标签尚未为 NDEF 准备（空白）。使用 工具 →“NDEF 格式化”或直接写入。';

  @override
  String get doctorVersion => 'NDEF 版本字节异常；部分手机可能无法读取。';

  @override
  String get doctorReadRestricted => '读取权限受限；手机可能不显示内容。';

  @override
  String get doctorReadOnly => '标签为只读（已锁定），无法更改内容。';

  @override
  String get doctorNoNdef => '内存中没有 NDEF 块。重新写入标签即可修复。';

  @override
  String get doctorEmpty => '标签已准备好，但为空。';

  @override
  String get doctorOverflow => '长度字段超出内存范围，内容已损坏。请重新写入。';

  @override
  String doctorExceeds(String bytes) {
    return '消息（$bytes 字节）超过标签声明的容量，可能被截断读取。';
  }

  @override
  String get doctorNoTerminator => '缺少结束标记 (FE)。多数手机仍可读取；重新写入可修复。';

  @override
  String get doctorUnknownTlv => '内存中有无法识别的数据块，读取可能在此中断。';

  @override
  String doctorBadRecord(String n) {
    return '第 $n 条记录格式错误（头部或长度）。请重新写入。';
  }

  @override
  String doctorHealthy(String count) {
    return '一切正常：$count 条记录写入正确。';
  }

  @override
  String get libraryImportTitle => '从表格导入';

  @override
  String get libraryImportHint =>
      '从 Excel、Numbers 或 Google 表格复制行并粘贴到此处。列：名称、内容（链接或文本）、位置、标签、备注、UID。如有标题行，将按列名匹配。';

  @override
  String libraryImportPreview(String count) {
    return '将添加 $count 个标签';
  }

  @override
  String libraryImportSkipped(String dupes, String invalid) {
    return '跳过 $dupes 行（UID 已存在），$invalid 行（无名称）';
  }

  @override
  String get libraryImportPaste => '从剪贴板粘贴';

  @override
  String get libraryImportAdd => '添加';

  @override
  String libraryImportDone(String count) {
    return '已向标签库添加 $count 个标签';
  }
}
