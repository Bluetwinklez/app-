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
  String get addRule => '添加规则';

  @override
  String get addTag => '添加标签';

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
  String get allRulesCleared => '所有规则已清空';

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
  String get backupExportSuccess => '备份文件已成功保存';

  @override
  String get backupFileSizeExceeded => '备份文件大小超过 2 MiB。';

  @override
  String get backupHistoryMustBeList => '\"history\" 字段必须为数组列表。';

  @override
  String backupImportFailed(String error) {
    return '备份导入失败: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return '备份导入成功：新增 $templates 个模板、$rules 条规则、$history 条历史';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return '记录 ID 的 Base64 编码无效: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return '记录 Payload 的 Base64 编码无效: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return '记录 Type 的 Base64 编码无效: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return '无效的 JSON 格式: $error';
  }

  @override
  String get backupInvalidRuleNote => '无效的规则备注。';

  @override
  String get backupInvalidRuleSha => '无效的 64 位 SHA-256 哈希字符串。';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return '无效的创建时间: $date';
  }

  @override
  String get backupInvalidTemplateId => '无效的模板 ID。';

  @override
  String get backupInvalidTemplateName => '无效的模板名称。';

  @override
  String backupInvalidTnf(String tnf) {
    return '无效的 TNF 值 ($tnf)，必须在 0 至 7 之间。';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return '历史条数超过限制 $max ($count)。';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return '记录数量超过限制 $max ($count)。';
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
  String get backupRecordsMustBeList => '记录列表必须为数组。';

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
  String get batchWrite => '批量写入';

  @override
  String get bluetoothDeviceName => '设备名称 (选填)';

  @override
  String get bluetoothMac => '蓝牙 MAC 地址';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return '写入字节: $bytes | 校验: $status';
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
  String get clearAllRulesConfirm => '确定清空所有已保存的应用内标签备注吗？';

  @override
  String get clearConfirmButton => '确认清空';

  @override
  String get clearConfirmMessage => '此操作将清除标签上的所有 NDEF 记录并写入一条空记录。是否继续？';

  @override
  String get clearConfirmTitle => '重置标签内容';

  @override
  String get clearHistory => '清空历史';

  @override
  String get clearList => '清空列表';

  @override
  String get clearTagSubtitle => '删除所有记录并写入空 NDEF';

  @override
  String get clearTagTitle => '清空标签';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '剪贴板中有 $count 条记录就绪 ($bytes B) · $source',
    );
    return '$_temp0';
  }

  @override
  String get close => '关闭';

  @override
  String get commandsEmptyError => '请输入至少一条指令。';

  @override
  String get commandsLabel => '指令列表';

  @override
  String get composeRecordTitle => '添加记录';

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
  String get contactNote => '备注';

  @override
  String get contactPhone => '联系电话';

  @override
  String get contactTitle => '职位 / 头衔';

  @override
  String get contactWebsite => '个人网站';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '内容: $count 条记录 · $content',
    );
    return '$_temp0';
  }

  @override
  String get copy => '复制';

  @override
  String get copyAllRecords => '复制全部记录';

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
  String deleteTagConfirmContent(String name) {
    return '确定从标签库中删除“$name”吗？物理标签不受影响。';
  }

  @override
  String get deleteTagConfirmTitle => '删除标签';

  @override
  String get deleteTemplateTooltip => '删除模板';

  @override
  String get deviceNameTooLong => '设备名称过长。';

  @override
  String get dismiss => '忽略';

  @override
  String get editRecordTitle => '编辑记录';

  @override
  String get editRule => '编辑规则';

  @override
  String get editTag => '编辑标签';

  @override
  String get emailBody => '邮件正文';

  @override
  String get emailRecipient => '收件人邮箱';

  @override
  String get emailSubject => '邮件主题';

  @override
  String get emptyComposerSubtitle => '点击“添加记录”以创建网址、纯文本、Wi-Fi 或联系人信息。';

  @override
  String get emptyComposerTitle => '暂未添加记录';

  @override
  String get emptyHistorySubtitle => '扫描过的标签记录将展示在这里。';

  @override
  String get emptyHistoryTitle => '暂无扫描历史';

  @override
  String get emptyLibrary => '暂无已保存的标签。\n扫描标签后可在此附上照片和名称保存。';

  @override
  String get eventDescription => '详细说明';

  @override
  String get eventEnd => '结束时间';

  @override
  String get eventLocation => '地点 / 场所';

  @override
  String get eventStart => '开始时间';

  @override
  String get eventTitle => '日程标题';

  @override
  String get exportBackup => '导出';

  @override
  String get facetimePrompt => '请输入电话号码或 Apple ID 邮箱。';

  @override
  String fieldCannotBeEmpty(String field) {
    return '“$field”不能为空。';
  }

  @override
  String get fieldTextPrompt => '要写入标签的文本内容';

  @override
  String get fieldUrlPrompt => '网站地址 (https://...)';

  @override
  String get fileUrl => '文件直链 (URL)';

  @override
  String get filterAll => '全部';

  @override
  String get flashlight => '手电筒';

  @override
  String get formatConfirmButton => '格式化';

  @override
  String get formatConfirmMessage => '标签上的数据将被清除，并初始化为空的 NDEF 标签。是否继续？';

  @override
  String get formatMemorySubtitle => '为 NDEF 准备芯片（空白或损坏标签）';

  @override
  String get formatMemoryTitle => '格式化内存';

  @override
  String get hardwareAvailable => 'NFC 硬件就绪';

  @override
  String get hardwareDisabled => 'NFC 已关闭';

  @override
  String get hardwareNotSupported => '不支持 NFC';

  @override
  String get historyFilteredEmpty => '未检索到相匹配的历史记录。';

  @override
  String get idTooLarge => 'ID 长度不能超过 255 字节';

  @override
  String get importBackup => '导入 (合并)';

  @override
  String get importCsv => '导入 CSV';

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
  String get latitude => '纬度 (Lat)';

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
  String get loadToComposerTooltip => '载入到编辑器';

  @override
  String get locationHint => '例如：冰箱门上';

  @override
  String get locationLabel => '位置在哪？';

  @override
  String get lockAcknowledge => '我已知晓此操作无法撤销';

  @override
  String get lockButton => '锁定';

  @override
  String get lockTagSubtitle => '永久设为只读状态（不可逆）';

  @override
  String get lockTagTitle => '锁定标签';

  @override
  String get lockWarning => '锁定的标签将永久变为只读：其内容无法再被修改、删除或解锁。请务必确认内容正确。';

  @override
  String get longitude => '经度 (Lng)';

  @override
  String get manage => '管理';

  @override
  String get matchedRule => '匹配的备注';

  @override
  String get mimePayloadHex => '负载数据 (Hex / 文本)';

  @override
  String get mimeTypeLabel => 'MIME 类型';

  @override
  String get nameRequired => '请为标签输入名称。';

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
  String get ndefRecordsTitle => 'NDEF 记录';

  @override
  String get nfcPromptClear => '请贴近标签以重置清空内容';

  @override
  String get nfcPromptLock => '请贴近标签以永久锁定';

  @override
  String get nfcPromptScan => '请将手机背部贴近 NFC 标签以进行读取';

  @override
  String get nfcPromptWrite => '请贴近 NFC 标签以写入数据';

  @override
  String get no => '否';

  @override
  String get noContentInTag => '此条目暂无标签内容。';

  @override
  String get noLibraryMatches => '未找到匹配的标签。';

  @override
  String get noRecordsOnTag => '标签上未发现 NDEF 记录。';

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
  String pageN(int page) {
    return '第 $page 页';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => '数据';

  @override
  String get pageRoleLock => '锁定';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / 锁';

  @override
  String get passwordDialogAction => '设置密码';

  @override
  String get passwordDialogTitle => '设置密码';

  @override
  String get passwordDialogWarning => '若忘记此密码，标签内容将无法再次修改。读取功能对所有人保持开放。';

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
  String get presetBusinessCardDesc => '触碰手机即可将联系人名片存入通讯录。';

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
  String get presetGuestWifiDesc => '访客无需手动输入繁琐密码即可连入网络。';

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
  String get rawInspection => '详细原始检查';

  @override
  String get rawRecordDetailsTitle => '记录详情 (只读)';

  @override
  String get rawRecordEditorTitle => '编辑原始 NDEF 记录';

  @override
  String get readHeroButton => '开始扫描';

  @override
  String get readHeroEyebrow => 'NFC 读取器';

  @override
  String get readHeroScanning => '正在扫描...';

  @override
  String get readHeroSubtitle => '将手机顶部贴近 NFC 标签，快速读取所有 NDEF 记录和芯片信息。';

  @override
  String get readHeroTitle => '扫描标签';

  @override
  String get readMemorySubtitle => '逐页查看原始内存；复制或保存为 .bin';

  @override
  String get readMemoryTitle => '读取内存';

  @override
  String get readyTemplates => '预置模板';

  @override
  String get recordCopied => '记录内容已复制';

  @override
  String recordIndex(int index) {
    return '记录 #$index';
  }

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
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '已将 $count 条记录复制到剪贴板',
    );
    return '$_temp0';
  }

  @override
  String get redo => '重做';

  @override
  String get removePasswordDialogTitle => '移除密码';

  @override
  String get removePasswordDialogWarning => '请输入当前标签配置的密码。';

  @override
  String get removePasswordSubtitle => '使用已知密码解除写入保护';

  @override
  String get removePasswordTitle => '移除密码';

  @override
  String get removePhoto => '移除';

  @override
  String get rewriteTag => '重新写入';

  @override
  String ruleDeleteConfirm(String note) {
    return '确定删除带有备注“$note”的标签规则吗？';
  }

  @override
  String get ruleDeleted => '规则已删除';

  @override
  String get ruleNoteDialogTitle => '编辑标签备注';

  @override
  String get ruleNoteHint => '例如：仓库货架 #4 或 3号会议室';

  @override
  String get ruleNoteLabel => '应用内备注 / 说明';

  @override
  String get ruleSaved => '规则已保存';

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
  String get saveTemplateDialogTitle => '另存为模板';

  @override
  String get saveToLibrary => '存入标签库';

  @override
  String get scanFabLabel => '扫描标签';

  @override
  String get scanQrToRecord => '扫码转换';

  @override
  String get scannedTag => '已扫描标签';

  @override
  String get searchEngine => '搜索引擎';

  @override
  String get searchHistoryHint => '搜索历史 (UID、文本、类型)...';

  @override
  String get searchLibraryHint => '按名称、备注、地点或内容搜索';

  @override
  String get searchQuery => '搜索关键词';

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
  String get shareRecords => '分享记录';

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
  String get socialNetwork => '平台';

  @override
  String get socialUsername => '用户名 / 账号';

  @override
  String get sourceComposer => '写入列表中的记录';

  @override
  String get sourceEmpty => '无内容（仅备注）';

  @override
  String get sourceLastScan => '最近扫描的标签';

  @override
  String get sourceSelectPrompt => '从何处获取标签内容？';

  @override
  String get statusCancelled => '操作已取消。';

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
  String get tabApp => '应用直达';

  @override
  String get tabBluetooth => '蓝牙配对';

  @override
  String get tabCalendar => '日历日程';

  @override
  String get tabContact => '电子名片 (vCard)';

  @override
  String get tabCustomMime => '自定义 MIME';

  @override
  String get tabEmail => '电子邮件';

  @override
  String get tabFile => '文件直链';

  @override
  String get tabLocation => '地理坐标';

  @override
  String get tabPhone => '电话呼叫';

  @override
  String get tabSearch => '网络搜索';

  @override
  String get tabSms => '短信发送';

  @override
  String get tabSocial => '社交主页';

  @override
  String get tabText => '纯文本';

  @override
  String get tabUrl => '网页链接';

  @override
  String get tabVideo => '视频链接';

  @override
  String get tabWifi => 'Wi-Fi 配置';

  @override
  String get tagCapacity => '存储容量';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max 字节 (剩余 $available 字节)';
  }

  @override
  String get tagInfoTitle => '标签信息';

  @override
  String get tagLibraryTitle => '我的标签库';

  @override
  String get tagNameHint => '例如：厨房标签';

  @override
  String get tagNameLabel => '名称';

  @override
  String get tagReadOnly => '只读 (已锁定)';

  @override
  String tagRulesCount(int count) {
    return '已存规则 / 备注数: $count';
  }

  @override
  String get tagRulesSubtitle => '根据 NDEF 内容的 SHA-256 哈希匹配仅展示对应备注，不触发额外操作。';

  @override
  String get tagSerialNumber => '序列号 (UID)';

  @override
  String get tagTechnology => '通信技术';

  @override
  String get tagType => '类型';

  @override
  String get tagUidCopied => '标签 UID 已复制';

  @override
  String get tagWritable => '可写入';

  @override
  String get takePhoto => '拍照';

  @override
  String get templateGalleryTitle => '预置模板';

  @override
  String get templateNameHint => '模板名称';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 条记录',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => '模板保存成功';

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
  String get totalBytes => '总字节数';

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
  String get verificationNotChecked => '未校验';

  @override
  String get verificationPassed => '已通过';

  @override
  String get videoUrlCannotBeEmpty => '视频链接不能为空。';

  @override
  String get videoUrlOrId => '视频链接或 YouTube ID';

  @override
  String get videoUrlOrIdPrompt => '请输入网址 (https://...) 或视频 ID。';

  @override
  String get wifiAuthOpen => '开放网络 (无密码)';

  @override
  String get wifiAuthType => '加密方式';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => '隐藏网络';

  @override
  String get wifiPassword => '密码';

  @override
  String get wifiSsid => '网络名称 (SSID)';

  @override
  String get withSiri => '使用 Siri';

  @override
  String get writeDumpConfirmButton => '写入';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes 字节) 将被写入用户内存。UID 及配置页面将保持不变。现有数据将被覆盖。';
  }

  @override
  String get writeDumpSubtitle => '将已保存的内存镜像写入标签';

  @override
  String get writeDumpTitle => '写入镜像 (.bin)';

  @override
  String get writeHeroButton => '开始写入';

  @override
  String get writeHeroEyebrow => 'NDEF 写入器';

  @override
  String get writeHeroSubtitle => '组织多个 NDEF 记录，一次性快速写入到目标 NFC 标签。';

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
  String get yes => '是';
}
