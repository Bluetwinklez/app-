// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get addRecord => 'Add Record';

  @override
  String get addRule => 'Add Rule';

  @override
  String get addTag => 'Add Tag';

  @override
  String get addToComposerList => 'Add to Write List';

  @override
  String get addToWriteList => 'Add to write list';

  @override
  String get addressCannotBeEmpty => 'Address cannot be empty.';

  @override
  String get advancedCommandsDesc =>
      'Enter one hex command per line. E.g.: 60 = GET_VERSION, 30 04 = read from page 4. Incorrect write commands may permanently damage the tag.';

  @override
  String get advancedCommandsSubtitle =>
      'Sends raw hexadecimal commands directly to tag';

  @override
  String get advancedCommandsTitle => 'Advanced NFC Commands';

  @override
  String get allRulesCleared => 'All rules cleared';

  @override
  String get appLinksDesc =>
      'Writing these deep links to tags allows tapping the tag to notify and open the app on the respective screen.';

  @override
  String get appLinksSection => 'App Links';

  @override
  String get appPackageName => 'Android Package Name';

  @override
  String get appSettings => 'App Settings';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'Run automatically on tap';

  @override
  String get backupExportSuccess => 'Backup file successfully saved';

  @override
  String get backupFileSizeExceeded => 'Backup file size exceeds 2 MiB limit.';

  @override
  String get backupHistoryMustBeList => '\"history\" field must be a list.';

  @override
  String backupImportFailed(String error) {
    return 'Failed to import backup: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'Backup imported successfully: added $templates templates, $rules rules, $history history entries';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'Record id is not valid Base64: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Record payload is not valid Base64: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Record type is not valid Base64: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'Invalid JSON format: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Tag rule note must be a valid string.';

  @override
  String get backupInvalidRuleSha =>
      'Tag rule ndefSha256 must be a valid 64-character hex string.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'Template createdAt must be valid ISO-8601: $date';
  }

  @override
  String get backupInvalidTemplateId => 'Template id must be a valid string.';

  @override
  String get backupInvalidTemplateName =>
      'Template name must be a valid string.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'Invalid TNF value ($tnf). Must be an integer between 0 and 7.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'History count exceeds limit of $max ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'Records count exceeds limit of $max ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'Tag rules count exceeds limit of $max ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'Templates count exceeds limit of $max ($count).';
  }

  @override
  String get backupMissingSchemaVersion =>
      'Missing \"schemaVersion\" field in backup.';

  @override
  String get backupRecordMustBeObject =>
      'Each NDEF record must be a JSON object.';

  @override
  String get backupRecordsMustBeList => 'Template records must be a list.';

  @override
  String get backupRestoreSubtitle =>
      'Backup your templates, tag notes, and optional scan history in versioned JSON format or merge with existing data.';

  @override
  String get backupRestoreTitle => 'Backup & Restore (JSON)';

  @override
  String get backupRootMustBeObject => 'Backup root must be a JSON object.';

  @override
  String get backupRuleMustBeObject => 'Each tag rule must be a JSON object.';

  @override
  String get backupSchemaVersionMustBeInt =>
      '\"schemaVersion\" field must be an integer.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'Backup payload exceeds 2 MiB limit ($bytes bytes).';
  }

  @override
  String get backupTagRulesMustBeList => '\"tagRules\" field must be a list.';

  @override
  String get backupTemplateMustBeObject =>
      'Each template must be a JSON object.';

  @override
  String get backupTemplatesMustBeList => '\"templates\" field must be a list.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'Unsupported backup schema version: $version.';
  }

  @override
  String get batchWrite => 'Batch Write';

  @override
  String get bluetoothDeviceName => 'Device Name (Optional)';

  @override
  String get bluetoothMac => 'Bluetooth MAC Address';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'Bytes Written: $bytes | Verification: $status';
  }

  @override
  String cameraError(String error) {
    return 'Unable to open camera. Grant permission in Settings > Privacy > Camera.\n($error)';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get catBusiness => 'Business';

  @override
  String get catCar => 'Car';

  @override
  String get catHome => 'Home';

  @override
  String get catOther => 'Other';

  @override
  String get catPersonal => 'Personal';

  @override
  String get catWork => 'Work';

  @override
  String get categoryLabel => 'Category';

  @override
  String get chooseFromGallery => 'Choose from gallery';

  @override
  String get clear => 'Clear';

  @override
  String get clearAll => 'Clear All';

  @override
  String get clearAllRulesConfirm =>
      'All saved in-app tag notes will be deleted. Proceed?';

  @override
  String get clearConfirmButton => 'Yes, Clear';

  @override
  String get clearConfirmMessage =>
      'This operation will erase all NDEF records on the tag and write an empty record. Do you wish to proceed?';

  @override
  String get clearConfirmTitle => 'Reset Tag Content';

  @override
  String get clearHistory => 'Clear History';

  @override
  String get clearList => 'Clear List';

  @override
  String get clearTagSubtitle => 'Deletes all records and writes an empty NDEF';

  @override
  String get clearTagTitle => 'Clear Tag';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records ready on clipboard',
      one: '1 record ready on clipboard',
    );
    return '$_temp0 ($bytes B) · $source';
  }

  @override
  String get close => 'Close';

  @override
  String get commandsEmptyError => 'Please enter at least one command.';

  @override
  String get commandsLabel => 'Commands';

  @override
  String get composeRecordTitle => 'Add New Record';

  @override
  String get confirmClearHistoryContent =>
      'All scan history saved on this device will be deleted. Are you sure?';

  @override
  String get confirmClearHistoryTitle => 'Clear Scan History';

  @override
  String get confirmClearTemplatesContent =>
      'All saved write templates will be deleted. Are you sure?';

  @override
  String get confirmClearTemplatesTitle => 'Clear Templates';

  @override
  String get contactCompany => 'Company / Organization';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactFullName => 'Full Name';

  @override
  String get contactNote => 'Note';

  @override
  String get contactPhone => 'Phone';

  @override
  String get contactTitle => 'Job Title';

  @override
  String get contactWebsite => 'Website';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records',
      one: '1 record',
    );
    return 'Content: $_temp0 · $content';
  }

  @override
  String get copy => 'Copy';

  @override
  String get copyAllRecords => 'Copy All Records';

  @override
  String get copyTagUid => 'Copy UID';

  @override
  String get copyToComposer => 'Copy to write list';

  @override
  String get csvInvalidAddress => 'invalid address.';

  @override
  String get csvInvalidEmail => 'invalid email address.';

  @override
  String get csvInvalidLocation =>
      'enter latitude and longitude for location (e.g. location,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'Maximum $max records can be imported; remaining lines skipped.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'Line $row: value is empty.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'Line $row: $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'unknown type \"$type\".';
  }

  @override
  String get csvWifiPasswordLength => 'Wi-Fi password must be 8-63 characters.';

  @override
  String get delete => 'Delete';

  @override
  String deleteTagConfirmContent(String name) {
    return 'Delete \"$name\" from library? The physical tag will not be changed.';
  }

  @override
  String get deleteTagConfirmTitle => 'Delete Tag';

  @override
  String get deleteTemplateTooltip => 'Delete Template';

  @override
  String get deviceNameTooLong => 'Device name is too long.';

  @override
  String get dismiss => 'Dismiss';

  @override
  String get editRecordTitle => 'Edit Record';

  @override
  String get editRule => 'Edit Rule';

  @override
  String get editTag => 'Edit Tag';

  @override
  String get emailBody => 'Email Body';

  @override
  String get emailRecipient => 'Recipient Email';

  @override
  String get emailSubject => 'Subject';

  @override
  String get emptyComposerSubtitle =>
      'Tap \"Add Record\" to create Web URLs, Text, Wi-Fi, Contacts, and more.';

  @override
  String get emptyComposerTitle => 'No records added yet';

  @override
  String get emptyHistorySubtitle =>
      'When you scan tags, your history will appear here.';

  @override
  String get emptyHistoryTitle => 'No scan history yet';

  @override
  String get emptyLibrary =>
      'No saved tags yet.\nScan a tag and save it here with a name and photo.';

  @override
  String get eventDescription => 'Description';

  @override
  String get eventEnd => 'End Time';

  @override
  String get eventLocation => 'Location / Venue';

  @override
  String get eventStart => 'Start Time';

  @override
  String get eventTitle => 'Event Title';

  @override
  String get exportBackup => 'Export';

  @override
  String get facetimePrompt => 'Enter phone number or Apple ID email address.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" cannot be empty.';
  }

  @override
  String get fieldTextPrompt => 'Text to write to tag';

  @override
  String get fieldUrlPrompt => 'Website URL (https://...)';

  @override
  String get fileUrl => 'File URL';

  @override
  String get filterAll => 'All';

  @override
  String get flashlight => 'Flashlight';

  @override
  String get formatConfirmButton => 'Format';

  @override
  String get formatConfirmMessage =>
      'Existing data on the tag will be erased and formatted as a blank NDEF tag. Proceed?';

  @override
  String get formatMemorySubtitle =>
      'Prepares tag for NDEF (empty or corrupted tags)';

  @override
  String get formatMemoryTitle => 'Format Memory';

  @override
  String get hardwareAvailable => 'NFC Hardware Ready';

  @override
  String get hardwareDisabled => 'NFC Disabled';

  @override
  String get hardwareNotSupported => 'NFC Not Supported';

  @override
  String get historyFilteredEmpty => 'No history matching your search found.';

  @override
  String get idTooLarge => 'ID length cannot exceed 255 bytes';

  @override
  String get importBackup => 'Import (Merge)';

  @override
  String get importCsv => 'Import CSV';

  @override
  String get inAppTagRules => 'In-App Tag Rules';

  @override
  String get invalidHexId => 'Invalid Hex ID string';

  @override
  String get invalidHexPayload => 'Invalid Hex payload string';

  @override
  String get invalidHexType => 'Invalid Hex type string';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get latitude => 'Latitude (Lat)';

  @override
  String get linkCopied => 'Link copied';

  @override
  String get linkHistoryDesc => 'Opens scan history';

  @override
  String get linkScanDesc => 'Opens app and launches scanner';

  @override
  String get linkToolsDesc => 'Opens the tools screen';

  @override
  String get linkWriteDesc => 'Opens the write composer screen';

  @override
  String get loadToComposerTooltip => 'Load into Composer';

  @override
  String get locationHint => 'E.g.: Fridge door';

  @override
  String get locationLabel => 'Where is it?';

  @override
  String get lockAcknowledge =>
      'I understand that this action cannot be undone';

  @override
  String get lockButton => 'Lock';

  @override
  String get lockTagSubtitle =>
      'Permanently makes tag read-only (irreversible)';

  @override
  String get lockTagTitle => 'Lock Tag';

  @override
  String get lockWarning =>
      'A locked tag becomes permanently read-only: its content CANNOT be changed, erased, or unlocked. Make sure the content is correct first.';

  @override
  String get longitude => 'Longitude (Lng)';

  @override
  String get manage => 'Manage';

  @override
  String get matchedRule => 'Matched Rule / Note';

  @override
  String get mimePayloadHex => 'Payload Hex / Text';

  @override
  String get mimeTypeLabel => 'MIME Type';

  @override
  String get nameRequired => 'Please provide a name for the tag.';

  @override
  String get navHistory => 'History';

  @override
  String get navHistoryTitle => 'History';

  @override
  String get navRead => 'Read';

  @override
  String get navReadTitle => 'Read Tag';

  @override
  String get navSettings => 'Settings';

  @override
  String get navSettingsTitle => 'Templates & Settings';

  @override
  String get navTools => 'Tools';

  @override
  String get navToolsTitle => 'Tools';

  @override
  String get navWrite => 'Write';

  @override
  String get navWriteTitle => 'Write Tag';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Records',
      one: '1 Record',
    );
    return '$_temp0';
  }

  @override
  String get ndefRecordsTitle => 'NDEF Records';

  @override
  String get nfcPromptClear => 'Hold the tag near your device to reset it';

  @override
  String get nfcPromptLock => 'Hold the tag near to permanently lock it';

  @override
  String get nfcPromptScan => 'Hold tag near the top of your phone';

  @override
  String get nfcPromptWrite => 'Hold the NFC tag near to save data';

  @override
  String get no => 'No';

  @override
  String get noContentInTag => 'No tag content attached to this entry.';

  @override
  String get noLibraryMatches => 'No tags matching your search.';

  @override
  String get noRecordsOnTag => 'No NDEF records found on tag.';

  @override
  String get noTemplates =>
      'No write templates saved yet.\nCreate records in the \"Write Tag\" tab to save them as templates.';

  @override
  String get noteLabel => 'Note';

  @override
  String get onboardingContinue => 'Continue';

  @override
  String get onboardingSkip => 'Skip';

  @override
  String get onboardingStart => 'Get Started';

  @override
  String get onboardingStep1Body =>
      'Tap the blue button below and hold the top of your phone near the tag. Content, capacity, and serial number appear instantly.';

  @override
  String get onboardingStep1Title => 'Scan a tag';

  @override
  String get onboardingStep2Body =>
      'In the \"Write\" tab, tap \"Add Record\": web links, Wi-Fi, business cards, social media, and more. Ready templates make it effortless.';

  @override
  String get onboardingStep2Title => 'Write anything';

  @override
  String get onboardingStep3Body =>
      'Inspect raw memory, configure passwords, lock tags, or format them. All inside the \"Tools\" tab.';

  @override
  String get onboardingStep3Title => 'Expert tools';

  @override
  String get onboardingStep4Body =>
      'Save written tags with names, notes, and photos in your library. Change language and appearance in Settings anytime.';

  @override
  String get onboardingStep4Title => 'Organize your tags';

  @override
  String optionalField(String label) {
    return '$label (optional)';
  }

  @override
  String pageN(int page) {
    return 'Page $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'Data';

  @override
  String get pageRoleLock => 'Lock';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / Lock';

  @override
  String get passwordDialogAction => 'Set Password';

  @override
  String get passwordDialogTitle => 'Set Password';

  @override
  String get passwordDialogWarning =>
      'If you forget this password, the tag content cannot be changed again. Reading remains open to everyone.';

  @override
  String get passwordError =>
      'Please enter exactly 4 characters or 8 hex digits.';

  @override
  String get passwordHint => '4 characters (e.g. 1234) or 8 hex digits';

  @override
  String get passwordLabel => 'Password';

  @override
  String get paste => 'Paste';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get phoneWithCountryCode =>
      'Enter phone number with country code (e.g. 15551112233).';

  @override
  String get presetAppDownloadDesc =>
      'Opens or prompts Android users to install your app.';

  @override
  String get presetAppDownloadTitle => 'App Download Link';

  @override
  String get presetBusinessCardDesc =>
      'Adds your contact card to the address book when tapped.';

  @override
  String get presetBusinessCardTitle => 'Digital Business Card';

  @override
  String get presetDirectionsDesc => 'Pins a venue or address on the map.';

  @override
  String get presetDirectionsTitle => 'Directions / Map Pin';

  @override
  String get presetEmergencyDesc =>
      'Blood type, emergency contacts, and vital medical notes.';

  @override
  String get presetEmergencyTitle => 'Emergency ICE Card';

  @override
  String get presetGoogleReviewDesc =>
      'Directs customers straight to your Google review page.';

  @override
  String get presetGoogleReviewTitle => 'Google Review Link';

  @override
  String get presetGuestWifiDesc =>
      'Guests connect to the network without typing a password.';

  @override
  String get presetGuestWifiTitle => 'Guest Wi-Fi Card';

  @override
  String get presetInstagramDesc =>
      'Opens your Instagram profile directly on tap.';

  @override
  String get presetInstagramTitle => 'Instagram Profile';

  @override
  String get presetMenuLinkDesc =>
      'Stick on tables so customers view the menu instantly.';

  @override
  String get presetMenuLinkTitle => 'Restaurant Menu';

  @override
  String get presetPetTagDesc =>
      'Allows finders to call you immediately if your pet gets lost.';

  @override
  String get presetPetTagTitle => 'Pet Collar Tag';

  @override
  String get presetShortcutDesc =>
      'Launches iPhone Shortcuts or deep links into the app.';

  @override
  String get presetShortcutTitle => 'Shortcuts Trigger';

  @override
  String get presetWebsiteDesc => 'Directs users to any web destination.';

  @override
  String get presetWebsiteTitle => 'Website Link';

  @override
  String get presetWhatsappDesc =>
      'Starts a chat without saving the number to contacts.';

  @override
  String get presetWhatsappTitle => 'WhatsApp Direct Chat';

  @override
  String get qrCode => 'QR Code';

  @override
  String qrContentChars(int chars) {
    return 'Content ($chars Characters):';
  }

  @override
  String get qrContentEmpty => 'Content to encode in QR code is empty.';

  @override
  String qrContentTooLarge(int chars) {
    return 'Content size is too large for QR code ($chars characters, maximum 2048 supported).';
  }

  @override
  String get qrFrameInstructions =>
      'Position QR code within frame. Web links, Wi-Fi, and text QR codes will be converted into records.';

  @override
  String qrGenerationFailed(String error) {
    return 'Failed to generate QR code: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'QR Code Preview: $title';
  }

  @override
  String get qrScanTitle => 'Scan QR Code';

  @override
  String get qrSecurityNote =>
      'QR preview is strictly supported for readable Plain Text and Web URLs.\n\nWi-Fi passwords, vCards, or raw binary payloads are not converted into QR codes for privacy and security.';

  @override
  String get qrUserOnlyNote =>
      'Opened only on user request. No automated execution.';

  @override
  String get rawInspection => 'Detailed Inspection';

  @override
  String get rawRecordDetailsTitle => 'Record Details (Read-Only)';

  @override
  String get rawRecordEditorTitle => 'Edit Raw NDEF Record';

  @override
  String get readHeroButton => 'Start Scan';

  @override
  String get readHeroEyebrow => 'NFC READER';

  @override
  String get readHeroScanning => 'Scanning...';

  @override
  String get readHeroSubtitle =>
      'Hold the top of your phone near an NFC tag to read all its NDEF records and hardware details.';

  @override
  String get readHeroTitle => 'Scan Tag';

  @override
  String get readMemorySubtitle =>
      'Page-by-page raw memory; copy or save as .bin';

  @override
  String get readMemoryTitle => 'Read Memory';

  @override
  String get readyTemplates => 'Ready Templates';

  @override
  String get recordCopied => 'Record content copied';

  @override
  String recordIndex(int index) {
    return 'Record #$index';
  }

  @override
  String get recordTypeCalendar => 'Calendar Event (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'Custom MIME ($mime)';
  }

  @override
  String get recordTypeEmail => 'Email Record';

  @override
  String get recordTypeLocation => 'Location / GPS';

  @override
  String get recordTypePhone => 'Phone Number';

  @override
  String get recordTypeSmartPoster => 'Smart Poster';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'Corrupt or incomplete smart poster payload ($bytes bytes)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'Smart Poster (Invalid Payload)';

  @override
  String get recordTypeSms => 'SMS Record';

  @override
  String get recordTypeText => 'Text Record';

  @override
  String get recordTypeUnknown => 'Unknown Record';

  @override
  String get recordTypeUrl => 'Web Link (URL)';

  @override
  String get recordTypeVCard => 'Contact Card (vCard)';

  @override
  String get recordTypeWifi => 'Wi-Fi Configuration (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'Corrupted or unrecognized WSC payload';

  @override
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records copied to clipboard',
      one: '1 record copied to clipboard',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'Redo';

  @override
  String get removePasswordDialogTitle => 'Remove Password';

  @override
  String get removePasswordDialogWarning =>
      'Enter the existing password configured on this tag.';

  @override
  String get removePasswordSubtitle =>
      'Removes protection using known password';

  @override
  String get removePasswordTitle => 'Remove Password';

  @override
  String get removePhoto => 'Remove';

  @override
  String get rewriteTag => 'Rewrite';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Tag rule with note \"$note\" will be deleted. Proceed?';
  }

  @override
  String get ruleDeleted => 'Rule deleted';

  @override
  String get ruleNoteDialogTitle => 'Edit Tag Note';

  @override
  String get ruleNoteHint => 'E.g.: Storage Shelf #4 or Meeting Room';

  @override
  String get ruleNoteLabel => 'In-App Note / Label';

  @override
  String get ruleSaved => 'Rule saved';

  @override
  String get save => 'Save';

  @override
  String get saveAsTemplate => 'Save as Template';

  @override
  String get saveBin => 'Save .bin';

  @override
  String get saveLocalHistory => 'Save Local Scan History';

  @override
  String get saveLocalHistorySubtitle =>
      'When off, scans are not kept on the device. When enabled, successful scans are saved locally. Failed scans are never stored.';

  @override
  String get saveTemplateDialogTitle => 'Save as Template';

  @override
  String get saveToLibrary => 'Save to Library';

  @override
  String get scanFabLabel => 'Scan tag';

  @override
  String get scanQrToRecord => 'Scan QR Code';

  @override
  String get scannedTag => 'Scanned Tag';

  @override
  String get searchEngine => 'Search Engine';

  @override
  String get searchHistoryHint => 'Search history (UID, content, type)...';

  @override
  String get searchLibraryHint => 'Search name, note, location, or content';

  @override
  String get searchQuery => 'Search Query';

  @override
  String get searchQueryCannotBeEmpty => 'Search query cannot be empty.';

  @override
  String get securityRestriction => 'Security Restriction';

  @override
  String get send => 'Send';

  @override
  String get setPasswordSubtitle =>
      'Protects tag content against unauthorized writing';

  @override
  String get setPasswordTitle => 'Set Password';

  @override
  String get shareRecords => 'Share Records';

  @override
  String get shortcutAutomationNote =>
      'Note: Automations link to the tag serial number and work even if the tag content changes.';

  @override
  String get shortcutStep1 =>
      'Open Shortcuts app and tap \"Automation\" at the bottom.';

  @override
  String get shortcutStep2 => 'Tap \"New Automation\" (+) → choose \"NFC\".';

  @override
  String get shortcutStep3 =>
      'Tap \"Scan\", hold tag near the top of iPhone, and give it a name.';

  @override
  String get shortcutStep4 =>
      'Select \"Run Immediately\", then add desired actions (turn on lights, play music, send message…).';

  @override
  String get shortcutStep5 =>
      'To open this app, choose \"Scan Tag\" or \"Write Tag\" as the action.';

  @override
  String get shortcutsGuideSubtitle =>
      'Trigger actions automatically when tapping a tag or ask Siri to scan tags hands-free.';

  @override
  String get shortcutsGuideTitle => 'Siri & Shortcuts';

  @override
  String get siriPhraseScan => '\"Hey Siri, scan tag with NFC Tag Master\"';

  @override
  String get siriPhraseWrite => '\"Hey Siri, write tag with NFC Tag Master\"';

  @override
  String get siriShortcutsNote =>
      'These commands also appear in the Shortcuts app and Spotlight search.';

  @override
  String get smsMessage => 'Message Text';

  @override
  String get socialNetwork => 'Platform';

  @override
  String get socialUsername => 'Username / Handle';

  @override
  String get sourceComposer => 'Records in write list';

  @override
  String get sourceEmpty => 'No content (note only)';

  @override
  String get sourceLastScan => 'Last scanned tag';

  @override
  String get sourceSelectPrompt => 'Where should tag content be taken from?';

  @override
  String get statusCancelled => 'Cancelled';

  @override
  String statusClearError(String error) {
    return 'Format error: $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'Format failed: $error';
  }

  @override
  String get statusClearSuccess => 'Tag content successfully cleared.';

  @override
  String get statusClearing => 'Format mode active. Bring the tag close...';

  @override
  String statusLockError(String error) {
    return 'Lock error: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'Lock failed: $error';
  }

  @override
  String get statusLockSuccess => 'Tag permanently locked (read-only).';

  @override
  String get statusLocking => 'Lock mode active. Bring the tag close...';

  @override
  String get statusNfcDisabled =>
      'NFC is turned off. Please enable NFC in system settings.';

  @override
  String get statusNfcNotSupported =>
      'NFC hardware is not available or supported on this device.';

  @override
  String get statusNfcUnavailable => 'NFC is currently unavailable.';

  @override
  String get statusReady => 'Ready';

  @override
  String statusScanError(String error) {
    return 'Scan Error: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'Tag successfully read ($id).';
  }

  @override
  String get statusScanning => 'Scanning tag... Hold your phone near the tag.';

  @override
  String statusUnexpectedError(String error) {
    return 'Unexpected error: $error';
  }

  @override
  String statusWriteError(String error) {
    return 'Write error: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'Write could not be completed: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return 'Write and verification successful! ($bytes bytes)';
  }

  @override
  String get statusWriting =>
      'Write mode active. Bring the target NFC tag close...';

  @override
  String get systemLanguage => 'System language';

  @override
  String get tabApp => 'Application';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'Calendar';

  @override
  String get tabContact => 'Contact (vCard)';

  @override
  String get tabCustomMime => 'Custom MIME';

  @override
  String get tabEmail => 'Email';

  @override
  String get tabFile => 'File';

  @override
  String get tabLocation => 'Location';

  @override
  String get tabPhone => 'Phone';

  @override
  String get tabSearch => 'Search';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'Social Media';

  @override
  String get tabText => 'Text';

  @override
  String get tabUrl => 'Web URL';

  @override
  String get tabVideo => 'Video';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'Capacity';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max bytes ($available bytes free)';
  }

  @override
  String get tagInfoTitle => 'Tag Information';

  @override
  String get tagLibraryTitle => 'My Tag Library';

  @override
  String get tagNameHint => 'E.g.: Kitchen tag';

  @override
  String get tagNameLabel => 'Name';

  @override
  String get tagReadOnly => 'Read-Only (Locked)';

  @override
  String tagRulesCount(int count) {
    return 'Saved Rules / Notes: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Only matching notes are displayed based on the exact SHA-256 hash of the NDEF payload. Does not perform external actions.';

  @override
  String get tagSerialNumber => 'Serial Number (UID)';

  @override
  String get tagTechnology => 'Technology';

  @override
  String get tagType => 'Type';

  @override
  String get tagUidCopied => 'Tag UID copied';

  @override
  String get tagWritable => 'Writable';

  @override
  String get takePhoto => 'Take photo';

  @override
  String get templateGalleryTitle => 'Ready Templates';

  @override
  String get templateNameHint => 'Template Name';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Records',
      one: '1 Record',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'Template successfully saved';

  @override
  String get toolsExpertSection => 'Expert';

  @override
  String get toolsFooterNote =>
      'Memory, password and command tools work with NTAG213/215/216 and MIFARE Ultralight EV1 tags. Keep tag near phone until finished.';

  @override
  String get toolsMemorySection => 'Memory';

  @override
  String get toolsSecuritySection => 'Security';

  @override
  String get toolsTagSection => 'Tag';

  @override
  String get totalBytes => 'Total Size';

  @override
  String get typeTooLarge => 'Type length cannot exceed 255 bytes';

  @override
  String get undo => 'Undo';

  @override
  String get unknownChip16Pages => 'Unknown chip (first 16 pages)';

  @override
  String get urlSafetyInvalidUrl => 'Invalid or unparseable URL format.';

  @override
  String get urlSafetyIpv4 =>
      'Destination contains raw IPv4 address rather than a domain name.';

  @override
  String get urlSafetyIpv6 => 'Destination contains raw IPv6 address.';

  @override
  String get urlSafetyMissingScheme =>
      'URL protocol scheme (http/https etc.) is missing or undefined.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'Non-standard network port (Port: $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'Internationalized domain / Punycode detected (\"xn--\"). Potential homograph attack.';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'Non-standard URL scheme: \"$scheme\". May trigger unexpected apps.';
  }

  @override
  String get urlSafetyUnencrypted =>
      'Unencrypted connection (http://). Data is transmitted in plaintext.';

  @override
  String get urlSafetyUserInfo =>
      'URL contains authentication credentials (userinfo). Potential phishing indicator.';

  @override
  String get usernameCannotBeEmpty => 'Username cannot be empty.';

  @override
  String get usernameNoSpaces => 'Username cannot contain spaces.';

  @override
  String get validAndroidPackage =>
      'Enter a valid Android package name (e.g. com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'Enter a valid Bluetooth MAC address (e.g. 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'Please enter a valid video link.';

  @override
  String get validWebAddress =>
      'Please enter a valid web address (e.g. https://example.com/file.pdf).';

  @override
  String get verificationNotChecked => 'Not checked';

  @override
  String get verificationPassed => 'Passed';

  @override
  String get videoUrlCannotBeEmpty => 'Video link cannot be empty.';

  @override
  String get videoUrlOrId => 'Video URL or YouTube Video ID';

  @override
  String get videoUrlOrIdPrompt =>
      'Enter video link (https://...) or YouTube video ID.';

  @override
  String get wifiAuthOpen => 'Open (Unsecured)';

  @override
  String get wifiAuthType => 'Security Type';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'Hidden Network';

  @override
  String get wifiPassword => 'Password';

  @override
  String get wifiSsid => 'Network Name (SSID)';

  @override
  String get withSiri => 'With Siri';

  @override
  String get writeDumpConfirmButton => 'Write';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes bytes) will be written to tag user memory. UID, lock and config pages are preserved. Existing tag data will be overwritten.';
  }

  @override
  String get writeDumpSubtitle => 'Writes saved binary memory dump to tag';

  @override
  String get writeDumpTitle => 'Write Dump (.bin)';

  @override
  String get writeHeroButton => 'Start Writing';

  @override
  String get writeHeroEyebrow => 'NDEF WRITER';

  @override
  String get writeHeroSubtitle =>
      'Compose multiple NDEF records and write them to the target NFC tag in one go.';

  @override
  String get writeHeroTitle => 'Write to Tag';

  @override
  String get writeHeroWriting => 'Writing...';

  @override
  String get writeResultFailed => 'Operation Failed';

  @override
  String get writeResultSuccess => 'Operation Successful';

  @override
  String get writeTemplates => 'Write Templates';

  @override
  String get writeTemplatesSubtitle =>
      'Save frequently used NDEF records as templates to quickly write them to tags anytime.';

  @override
  String get yes => 'Yes';

  @override
  String get unknown => 'Unknown';

  @override
  String get error => 'Error';

  @override
  String get nfcPromptReady => 'Hold tag near phone';

  @override
  String get invalidResponseFormat => 'Invalid response format received';

  @override
  String get nfcReadError => 'NFC read error';

  @override
  String get invalidPlatformResponse =>
      'Invalid response received from platform';

  @override
  String get writeFailed => 'Writing failed';

  @override
  String get lockFailed => 'Locking failed';

  @override
  String get failedToConnectTag => 'Could not connect to tag';

  @override
  String get invalidTagResponse => 'Invalid response from tag';

  @override
  String get commandFailed => 'Command failed';

  @override
  String get ndefTypeOrIdTooLong => 'NDEF type or ID exceeds 255 bytes';

  @override
  String get ndefUnsupportedOrInvalidRecord =>
      'Unsupported or invalid NDEF record';

  @override
  String get ndefMissingTypeLength => 'Missing NDEF type length';

  @override
  String get ndefMissingPayloadLength => 'Missing NDEF payload length';

  @override
  String get ndefMissingIdLength => 'Missing NDEF ID length';

  @override
  String get ndefMissingType => 'Missing NDEF type';

  @override
  String get ndefMissingId => 'Missing NDEF ID';

  @override
  String get ndefMissingPayload => 'Missing NDEF payload';

  @override
  String get unprotected => '(No password)';

  @override
  String get binaryDataPreview => '(Binary Data)';

  @override
  String get emptyValue => '(Empty)';

  @override
  String get tnfEmpty => '0: Empty';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown';

  @override
  String get tnfUnchanged => '6: Unchanged (Chunked NDEF)';

  @override
  String get tnfReserved => '7: Reserved';

  @override
  String get ntagUnsupportedChip =>
      'This operation is only supported on NTAG213/215/216 and MIFARE Ultralight EV1 tags.';

  @override
  String ntagPageReadFailed(String page) {
    return 'Could not read page $page (tag did not respond or area is protected).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'Could not write page $page: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'Could not write page $page (tag rejected; may be locked or password protected).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'Could not read beyond page $page; this area may be password protected.';
  }

  @override
  String get ntagPasswordPackSize =>
      'Password must be 4 bytes and PACK must be 2 bytes.';

  @override
  String get ntagPasswordSize => 'Password must be 4 bytes.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'Incorrect password or tag rejected authentication.';

  @override
  String get ntagPasswordWrong => 'Incorrect password.';

  @override
  String get ntagCcInvalid =>
      'The tag\'s CC area has a non-NDEF value; this OTP area cannot be formatted.';

  @override
  String get ntagDumpTooShort =>
      'Dump file is too short; contains no user data.';

  @override
  String get ntagInvalidHex => 'Enter a valid hex string (e.g.: 30 04).';

  @override
  String get googleReviewFieldLabel => 'Review Link or Place ID';

  @override
  String get menuLinkFieldLabel => 'Menu Link';

  @override
  String get menuTitleHint => 'Our Menu';

  @override
  String get petName => 'Pet\'s Name';

  @override
  String get ownerPhone => 'Owner\'s Phone';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'Hi, I am $pet! Please call my owner: $phone$note';
  }

  @override
  String get bloodType => 'Blood Type';

  @override
  String get allergies => 'Allergies / Medications';

  @override
  String get emergencyContact => 'Emergency Contact';

  @override
  String get emergencyInfo => 'EMERGENCY INFO';

  @override
  String emergencyBlood(String blood) {
    return 'Blood type: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'Allergies: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'In case of emergency call: $contact';
  }

  @override
  String get storeLink => 'Store Link';

  @override
  String get link => 'Link';

  @override
  String get title => 'Title';

  @override
  String get webAddress => 'Web address';

  @override
  String get address => 'Address';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'Templates: $added added, $updated updated';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'Tag Notes/Rules: $added added, $updated updated';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'Scan history skipped because history is disabled on device: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'History: $added added, $skipped existing/skipped';
  }

  @override
  String get backupSummaryNoNewData =>
      'No new data to import (matched existing records).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field must be a string.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field must be a valid date.';
  }

  @override
  String get rawTypeHexLabel => 'Type (Hex Bytes)';

  @override
  String get rawIdHexLabel => 'ID (Hex Bytes, optional)';

  @override
  String get rawPayloadHexLabel => 'Payload (Hex Bytes)';

  @override
  String get rawOptionalHexHint => 'Optional hex bytes';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get edit => 'Edit';

  @override
  String get clearAllButton => 'Clear All';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: $count pages read';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip formatted';
  }

  @override
  String get ntagInvalidDumpFile =>
      'Invalid dump file (must be multiple of 4 bytes, 32–1024 bytes).';

  @override
  String ntagPagesWritten(int count) {
    return '$count pages written';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: password protection enabled';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: password removed';
  }

  @override
  String get memoryDumpCopied => 'Memory dump copied';

  @override
  String ntagCommandsSent(int count) {
    return '$count commands sent';
  }

  @override
  String get emptyResponse => '(empty response)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages pages · $bytes bytes';
  }

  @override
  String get composeTextEmpty => 'Text content cannot be empty.';

  @override
  String get composeTextTooLong => 'Text is too long (max 5000 characters).';

  @override
  String get composeUrlInvalid =>
      'Enter a valid address (e.g. https://example.com or app:// link).';

  @override
  String get composeUrlTooLong => 'URL is too long (max 2000 characters).';

  @override
  String get composeEmailInvalid =>
      'Enter a valid email address (e.g. name@domain.com).';

  @override
  String get composePhoneInvalid =>
      'Enter a valid phone number (e.g. +905551234567).';

  @override
  String get composeSmsPhoneInvalid => 'Enter a valid recipient phone number.';

  @override
  String get composeLatInvalid => 'Latitude must be between -90 and +90.';

  @override
  String get composeLngInvalid => 'Longitude must be between -180 and +180.';

  @override
  String get composeVcardNameEmpty =>
      'Contact name or full name cannot be empty.';

  @override
  String get composeVcardNameTooLong =>
      'Contact name is too long (max 200 characters).';

  @override
  String get composeVcardEmailInvalid => 'Enter a valid email address.';

  @override
  String get composeVcardPhoneInvalid => 'Enter a valid phone number.';

  @override
  String get composeVcardUrlInvalid =>
      'Enter a valid web address (e.g. https://...).';

  @override
  String get composeCalSummaryEmpty => 'Event title cannot be empty.';

  @override
  String get composeCalSummaryTooLong =>
      'Event title is too long (max 250 characters).';

  @override
  String get composeCalDateInvalid => 'End time must be after start time.';

  @override
  String get composeSpUriInvalid =>
      'Enter a valid target URL (e.g. https://...).';

  @override
  String get composeSpLangInvalid =>
      'Enter a valid ISO language code (e.g. tr, en).';

  @override
  String get composeMimeTypeInvalid =>
      'Enter a valid MIME type (e.g. application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'Enter a valid hex string (even number of hex characters).';

  @override
  String get composeMimePayloadTooLarge =>
      'Payload size is too large (max 10 KB).';

  @override
  String get composeWifiSsidEmpty => 'Network name (SSID) cannot be empty.';

  @override
  String get composeWifiPasswordRequired =>
      'Wi-Fi password is required for encrypted networks.';

  @override
  String get composeWifiPasswordLength =>
      'WPA/WPA2 password must be between 8 and 63 characters.';

  @override
  String get composeEditNdefRecord => 'Edit NDEF Record';

  @override
  String get composeNewNdefRecord => 'Create New NDEF Record';

  @override
  String get quickLinksHeader => 'Quick Links';

  @override
  String get quickLinkCustomUri => 'Custom URI';

  @override
  String get quickLinkSocial => 'Social Networks';

  @override
  String get quickLinkVideo => 'Video';

  @override
  String get quickLinkSearch => 'Search';

  @override
  String get quickLinkFile => 'File';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime Audio';

  @override
  String get quickLinkAddress => 'Address';

  @override
  String get quickLinkPayment => 'Payment Link';

  @override
  String get quickLinkApp => 'App (Android)';

  @override
  String get updateRecord => 'Update Record';

  @override
  String get addToList => 'Add to List';

  @override
  String get quickCustomUriError =>
      'Enter an address with a scheme (e.g. spotify:track:... or myapp://page).';

  @override
  String get quickFileEmptyMessage => 'Enter the file link.';

  @override
  String get quickPaymentEmptyMessage => 'Enter the payment link.';

  @override
  String get quickCustomUriDesc =>
      'Any address starting with a scheme can be entered; the phone opens the supporting app.';

  @override
  String get quickSocialLabel => 'Social Network';

  @override
  String get quickVideoLabel => 'Video Link';

  @override
  String get quickVideoHint => 'https://youtu.be/... or video ID';

  @override
  String get quickVideoDesc =>
      'YouTube, Vimeo, etc. link or only YouTube video ID can be entered.';

  @override
  String get quickSearchHint => 'e.g. Istanbul weather';

  @override
  String get quickFileLabel => 'File Link';

  @override
  String get quickFileDesc =>
      'Due to small tag capacity, the web link is written instead of the file itself (Google Drive, Dropbox, etc.).';

  @override
  String get quickPhoneOrAppleId => 'Phone or Apple ID';

  @override
  String get quickFacetimeVideoDesc =>
      'An iPhone tapping the tag starts a FaceTime video call.';

  @override
  String get quickFacetimeAudioDesc =>
      'An iPhone tapping the tag starts a FaceTime audio call only.';

  @override
  String get quickMapProvider => 'Map App';

  @override
  String get quickAddressHint => 'e.g. 10 Downing Street, London';

  @override
  String get quickPaymentDesc =>
      'Payment links like PayPal.me, Papara, Stripe can be used. Card info is never written to the tag.';

  @override
  String get quickAppDesc =>
      'Android phones open this app on tap (or Play Store if not installed). iPhone ignores this record type; add App Store link as URL for iPhone.';

  @override
  String get quickDeviceNameOptional => 'Device Name (optional)';

  @override
  String get quickSpeakerHint => 'e.g. Speaker';

  @override
  String get quickBluetoothDesc =>
      'Android phones suggest pairing with this device on tap. iPhone does not support Bluetooth pairing tags.';

  @override
  String get composeTextContent => 'Text Content';

  @override
  String get composeTextHint => 'Enter the text you want to write';

  @override
  String get composeEmailSubjectOptional => 'Subject (optional)';

  @override
  String get composeEmailBodyOptional => 'Message Body (optional)';

  @override
  String get composeSmsRecipient => 'Recipient Phone Number';

  @override
  String get composeSmsHint => 'SMS message to send...';

  @override
  String get composeVcardFullName => 'Full Name (Display Name) *';

  @override
  String get composeVcardNameHint => 'John Doe';

  @override
  String get composeVcardNote => 'Note / Description';

  @override
  String get composeCalTitle => 'Event Title *';

  @override
  String get composeCalTitleHint => 'Project Meeting';

  @override
  String get composeCalLocationHint => 'Meeting Room 2 or Online';

  @override
  String get composeCalDesc => 'Event Description';

  @override
  String get composeCalStartEndTime => 'Start and End Time:';

  @override
  String get composeSpTitleLabel => 'Title (Display Text)';

  @override
  String get composeSpTitleHint => 'Company Brochure';

  @override
  String get composeMimeTypeLabel => 'MIME Type *';

  @override
  String get composeDataFormat => 'Data Format: ';

  @override
  String get composeFormatHex => 'Hex';

  @override
  String get composeMimeHexBytes => 'Hex Bytes *';

  @override
  String get composeMimeTextPayload => 'Payload Text (UTF-8) *';

  @override
  String get composeWifiWarningTitle => 'Security and Platform Notice:';

  @override
  String get composeWifiWarningBody =>
      '• The Wi-Fi password written to the tag is stored in plain text and can be read easily by anyone.\n• Tapping the tag may not automatically connect iPhones or Android devices; user confirmation or network selection might be required.';

  @override
  String get composeWifiSsidLabel => 'Network Name (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'Security Type (Authentication)';

  @override
  String get composeWifiOpenNetwork => 'Open Network (None)';

  @override
  String get composeWifiPasswordLabel => 'Wi-Fi Password *';

  @override
  String get composeWifiEncryptionLabel => 'Encryption Type';

  @override
  String get composeWifiAesRecommended => 'AES (Recommended)';

  @override
  String get quickSearchTextLabel => 'Search Query';

  @override
  String get readTagMemoryPrompt => 'Hold tag near phone to read memory';

  @override
  String get readingTagMemoryStatus => 'Reading memory...';

  @override
  String get formatTagConfirmTitle => 'Format Memory';

  @override
  String get formatTagConfirmMessage =>
      'Data on tag will be deleted and tag prepared as blank NDEF. Continue?';

  @override
  String get formatButton => 'Format';

  @override
  String get formatTagPrompt => 'Hold tag to format';

  @override
  String get formattingStatus => 'Formatting...';

  @override
  String filePickerFailed(String error) {
    return 'File picker failed: $error';
  }

  @override
  String get writeButton => 'Write';

  @override
  String get writeDumpPrompt => 'Hold tag to write dump';

  @override
  String get writingDumpStatus => 'Writing dump...';

  @override
  String get setPasswordWarning =>
      'If you forget the password, you cannot change tag contents again. Reading remains open to everyone.';

  @override
  String get setPasswordAction => 'Set Password';

  @override
  String get setPasswordPrompt => 'Hold tag to set password';

  @override
  String get settingPasswordStatus => 'Setting password...';

  @override
  String get removePasswordPromptMessage =>
      'Enter the password previously set on the tag.';

  @override
  String get remove => 'Remove';

  @override
  String get removePasswordPrompt => 'Hold tag to remove password';

  @override
  String get removingPasswordStatus => 'Removing password...';

  @override
  String get sendCommandsPrompt => 'Hold tag to send commands';

  @override
  String get sendingCommandsStatus => 'Sending commands...';

  @override
  String get sendButton => 'Send';

  @override
  String get tagNoteEditTitle => 'Edit Tag Note';

  @override
  String get tagNoteInputLabel => 'In-App Note / Description';

  @override
  String get tagNoteInputHint => 'e.g. Meeting Room Info or Storage Shelf #12';

  @override
  String get tagNoteDeleteTitle => 'Delete Tag Note';

  @override
  String get clearAllTagRulesTitle => 'Delete All Notes';

  @override
  String get clearAllTagRulesConfirm =>
      'All saved in-app tag notes will be deleted. Do you confirm?';

  @override
  String get deleteAll => 'Delete All';

  @override
  String get tagRulesExplanation =>
      'Only the saved note is shown for tags matching the NDEF SHA-256 digest. No external action is triggered.';

  @override
  String get noTagRulesDefined => 'No tag notes defined yet.';

  @override
  String lastUpdated(String time) {
    return 'Last updated: $time';
  }

  @override
  String get tagLibraryNoMatch => 'No tags matched your search.';

  @override
  String get tagLibraryAddToLibrary => 'Add to Library';

  @override
  String get name => 'Name';

  @override
  String get tagLibraryAddTag => 'Add Tag';

  @override
  String get all => 'All';

  @override
  String tagLibraryPhotoError(String error) {
    return 'Failed to pick photo: $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'Delete Tag';

  @override
  String get tagLibraryNameHint => 'e.g. Office Keychain';

  @override
  String get tagLibraryNoTagContent => 'No tag content in this record.';

  @override
  String get tagLibrarySourceLastScanned => 'Last Scanned';

  @override
  String get tagLibraryEmpty => 'No saved tags yet.';

  @override
  String get tagLibrarySourceEmpty => 'Empty Record';

  @override
  String get tagLibraryNamePrompt => 'Please enter a tag name';

  @override
  String get tagLibrarySearchHint => 'Search by name, category, or location...';

  @override
  String get tagLibrarySourceWriteList => 'Write List';

  @override
  String get tagLibraryLocationHint => 'e.g. Desk, Front Door';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return 'Are you sure you want to delete tag \"$name\" from the library?';
  }

  @override
  String get noContent => 'No content';

  @override
  String tagLibraryRecordSummary(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count NDEF records',
      one: '1 NDEF record',
    );
    return '$_temp0';
  }

  @override
  String get tagLibraryEditTag => 'Edit Tag';

  @override
  String get rawTypeHexHint => '41 (A) or 55 (U) etc.';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: \"records\" field must be a list.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: An item can have at most $max NDEF records.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - Record #$index is not a valid object.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - Record #$index: Invalid TNF value ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - Record #$index: \"type\" must be a Base64 string.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - Record #$index: \"type\" is not valid Base64 data ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - Record #$index: \"id\" must be a Base64 string.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - Record #$index: \"id\" is not valid Base64 data ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - Record #$index: \"payload\" must be a Base64 string.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - Record #$index: \"payload\" is not valid Base64 data ($error).';
  }

  @override
  String get composerUndoSnack => 'Last composer change undone.';

  @override
  String get composerRedoSnack => 'Composer change redone.';

  @override
  String get noRecordsToCopy => 'No NDEF records to copy.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count NDEF records ($bytes B) copied to clipboard.\n(Only NDEF content is copied; UID or encrypted sectors are never cloned)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: $count records added.';
  }

  @override
  String get tagEmptyNoRecordsToImport => 'Tag is empty; no records to import.';

  @override
  String get sourceTag => 'From Tag';

  @override
  String get sourceQr => 'From QR code';

  @override
  String filePickerError(String error) {
    return 'Could not open file picker: $error';
  }

  @override
  String get csvFileTooLarge => 'CSV file is too large (max 512 KB).';

  @override
  String get noRecordsFound => 'No records found';

  @override
  String get someRowsSkipped => 'Some rows skipped';

  @override
  String get expectedFormat => 'Expected format:';

  @override
  String get noClipboardContent => 'No copied NDEF content on clipboard.';

  @override
  String get pasteFromClipboardTitle => 'Paste from NDEF Clipboard';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'Clipboard Data: $count records, $bytes bytes ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      'Do you want to replace current records or append to the end?';

  @override
  String get pasteOverwriteOption => 'Overwrite (Replace)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'Current $count records will be deleted and replaced with clipboard content (confirmation required).';
  }

  @override
  String get pasteEmptySubtitle => 'Clipboard content placed into composer.';

  @override
  String get pasteAppendOption => 'Append to End';

  @override
  String get pasteAppendSubtitle =>
      'Current records are preserved; clipboard records are added to the end of the list.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count records added to composer.';
  }

  @override
  String get confirmOverwriteTitle => 'Overwrite Records?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'There are $currentCount records in composer. They will be replaced with $newCount records from clipboard. Continue?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'Composer records replaced with $count records.';
  }

  @override
  String get yesReplace => 'Yes, Replace';

  @override
  String recordsImportedToComposer(num count) {
    return '$count records imported to composer.';
  }

  @override
  String get noContentToCopy => 'No NDEF content found to copy.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count NDEF records copied to clipboard and added to composer (Content copied, UID is not cloned).';
  }

  @override
  String get noContentToRewrite => 'No NDEF content found to rewrite.';

  @override
  String get rewriteTagTitle => 'Rewrite Tag';

  @override
  String get importantNotice => 'IMPORTANT NOTICE:';

  @override
  String get rewriteNotice1 =>
      '• This operation COMPLETELY OVERWRITES existing NDEF content on target tag; does not append.\n';

  @override
  String get rewriteNotice2 =>
      '• The target tag must be a writable (unlocked) NDEF tag.\n';

  @override
  String get rewriteNotice3 =>
      '• Operation will not silently write to previous tag; a new NFC tap is required.';

  @override
  String rewriteSourceUidLabel(String uid) {
    return 'Source UID: $uid';
  }

  @override
  String rewriteRecordCountLabel(num count) {
    return 'Record Count to Write: $count';
  }

  @override
  String get rewriteInstruction =>
      'Prepare target tag, tap \"Tap and Write\", then hold tag near back of phone.';

  @override
  String get tapAndWrite => 'Tap and Write';

  @override
  String get rewritePromptMessage =>
      'Hold target tag near device (Content will be completely renewed)';

  @override
  String rewriteFailedMessage(String error) {
    return 'Rewrite failed: $error';
  }

  @override
  String get writeVerifiedTitle => 'Write Verified';

  @override
  String get writeVerifiedDesc =>
      'NDEF content was successfully written and verified on target tag.';

  @override
  String writtenRecordCount(num count) {
    return 'Written Record Count: $count';
  }

  @override
  String get writeVerifiedHint =>
      'You can start next scan to verify or compare written data.';

  @override
  String get scanAndCompareNow => 'Scan and Compare Now';

  @override
  String get contentMatchesExactly => 'Content Matches Exactly';

  @override
  String get differenceDetected => 'Difference Detected';

  @override
  String compareScannedUid(String uid) {
    return 'Scanned Tag UID: $uid';
  }

  @override
  String compareWrittenData(num count, num bytes) {
    return 'Written Data: $count records ($bytes Bytes)';
  }

  @override
  String compareScannedData(num count, num bytes) {
    return 'Scanned Data: $count records ($bytes Bytes)';
  }

  @override
  String get compareMatchDesc =>
      'Target tag NDEF message matches written source NDEF message byte for byte.';

  @override
  String get compareDiffDesc =>
      'There is a difference between read data and intended data. Check if tag is locked or a different tag.';

  @override
  String get batchEmptyComposerError =>
      'Add at least one record to composer before starting batch write.';

  @override
  String get batchWriteTitle => 'Batch Tag Writing';

  @override
  String get batchWriteSubtitle =>
      'Write the same NDEF content to multiple tags sequentially.';

  @override
  String get attention => 'ATTENTION:';

  @override
  String get batchNotice1 =>
      '• To prevent accidental double writes, each write must be explicitly triggered by \"Write Next\".\n';

  @override
  String get batchNotice2 =>
      '• Automatic sequential scanning is not performed; tags must be physically swapped.';

  @override
  String batchTargetCountLabel(num count) {
    return 'Target Tag Count: $count';
  }

  @override
  String batchComposerSummary(num count, num bytes) {
    return 'Composer Records: $count ($bytes Bytes)';
  }

  @override
  String get batchStartButton => 'Start Batch Writing';

  @override
  String get batchControlPanelTitle => 'Batch Writing Control Panel';

  @override
  String get batchCancelOrClose => 'Cancel / Close';

  @override
  String get batchAllCompleted => 'All tag attempts completed!';

  @override
  String batchNextTag(num current, num total) {
    return 'Next: Tag #$current / $total';
  }

  @override
  String batchStats(num success, num fail, num remaining) {
    return 'Success: $success | Failed: $fail | Remaining: $remaining';
  }

  @override
  String batchSuccessMsg(String message) {
    return 'Success ($message)';
  }

  @override
  String batchFailMsg(String message) {
    return 'Failed: $message';
  }

  @override
  String tagNumberLabel(num index) {
    return 'Tag #$index: ';
  }

  @override
  String get waitingForTag => 'Waiting for Tag...';

  @override
  String tapToWriteForTag(num index) {
    return 'Tap and Write for Tag #$index';
  }

  @override
  String get batchFinishButton => 'Finish Batch Writing';

  @override
  String batchPromptMessage(num current, num total) {
    return 'Batch Write: Hold tag #$current / $total near device';
  }

  @override
  String batchTagSuccessSummary(num count) {
    return '$count records written and verified';
  }

  @override
  String get writeError => 'Write error';

  @override
  String get batchConfirmCancelTitle => 'Cancel Batch Writing';

  @override
  String get batchConfirmCancelMessage =>
      'Terminate batch write session? Tags written so far are preserved; remaining tags will not be written.';

  @override
  String get cancelled => 'Cancelled';

  @override
  String get batchCancelledSnack =>
      'Batch write cancelled. Your composer content was preserved.';

  @override
  String get cancelAndClose => 'Cancel and Close';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'Offline URL Analysis';

  @override
  String get urlSafetyScheme => 'Scheme (Protocol):';

  @override
  String get urlSafetyPort => 'Port:';

  @override
  String get urlSafetyUserInfoLabel => 'User Info:';

  @override
  String get urlSafetyIpLiteral => 'Direct IP Address (IP Literal):';

  @override
  String get urlSafetyDomain => 'No (Domain name)';

  @override
  String get urlSafetyPunycodeLabel => 'International / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => 'Yes (Suspected homoglyph)';

  @override
  String get urlSafetyWarningsHeader => 'Security / Warning Alerts:';

  @override
  String get urlSafetyDisclaimer =>
      'NOTE: This analysis uses offline heuristics. It does not scan online for malware/viruses. The URL is not opened automatically.';

  @override
  String templateLoadedToComposer(String name) {
    return 'Records from template \"$name\" loaded into composer.';
  }

  @override
  String get templateSaveEmptyError => 'Add records before saving as template.';

  @override
  String templateDefaultName(num index) {
    return 'Template $index';
  }

  @override
  String get templateNameSample => 'e.g. Company Website & Contact';

  @override
  String get templateSavedSnack => 'Template saved.';

  @override
  String get ruleNoteRequiresNdef =>
      'Tag must contain at least one NDEF record to add a note.';

  @override
  String get ruleNoteAddTitle => 'Add Custom Tag Note';

  @override
  String get ruleNoteDigestExplanation =>
      'This note binds to tag NDEF SHA-256 digest. Scanning the tag only shows this description; no external actions triggered.';

  @override
  String ruleNoteShaSummary(String sha) {
    return 'NDEF Content Digest (SHA-256):\n$sha';
  }

  @override
  String get ruleNoteSavedSnack => 'Tag note saved.';

  @override
  String get ruleNoteDeleteTitle => 'Delete Tag Note';

  @override
  String get ruleNoteDeleteConfirm =>
      'The in-app note for this tag will be deleted. Continue?';

  @override
  String get ruleNoteDeletedSnack => 'Tag note deleted.';

  @override
  String get backupExportTitle => 'Export Backup';

  @override
  String get backupExportWarningTitle => 'PRIVACY AND SECURITY WARNING';

  @override
  String get backupExportWarningBody =>
      'The exported backup file (JSON) is plain text. It may contain sensitive data such as Wi-Fi passwords, contact cards, or emails. Keep it secure and share carefully.';

  @override
  String get backupIncludedItems => 'Items to Include:';

  @override
  String backupTemplatesCount(num count) {
    return '• Templates: $count';
  }

  @override
  String backupRulesCount(num count) {
    return '• In-App Tag Notes/Rules: $count';
  }

  @override
  String get backupIncludeHistoryOptional => 'Include Scan History (Optional)';

  @override
  String backupHistoryCount(num count) {
    return '$count history records';
  }

  @override
  String get backupHistoryDisabled => 'Scan history is disabled on this device';

  @override
  String get backupExportAndShare => 'Export and Share';

  @override
  String get backupFileNameLabel => 'NFC Tag Master Backup File';

  @override
  String get backupFileShareSubject =>
      'NFC Tag Master templates and data backup (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'Backup file successfully exported and shared.';

  @override
  String get backupExportCancelled => 'Export sharing cancelled.';

  @override
  String backupExportError(String error) {
    return 'Export error: $error';
  }

  @override
  String get backupImportTitle => 'Import Backup';

  @override
  String get backupMergeRuleTitle => 'SECURITY AND MERGE POLICY';

  @override
  String get backupMergeRule1 =>
      '• Import operates via MERGE; your existing records are NEVER deleted.\n';

  @override
  String get backupMergeRule2 =>
      '• Backup files may contain Wi-Fi passwords or personal data; load only from trusted sources.\n';

  @override
  String get backupMergeRule3 =>
      '• File size limit: 2 MiB. Data undergoes strict schema and Base64 validation before loading.';

  @override
  String get backupSelectFilePrompt =>
      'Select a valid .json backup file to merge.';

  @override
  String get selectFileButton => 'Select File';

  @override
  String get fileSelectionCancelled => 'File selection cancelled.';

  @override
  String get backupFileExceedsLimit =>
      'Selected file exceeds the allowed 2 MiB limit.';

  @override
  String fileReadError(String error) {
    return 'File read error: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Backup validation error: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Scan History Detected';

  @override
  String backupHistoryDetectedMsg(num count) {
    return 'Backup contains $count history records, but history is disabled on this device.\n\n';
  }

  @override
  String get backupHistoryDetectedPrompt =>
      'Do you want to import history and enable it? Or skip history and only import templates and notes?';

  @override
  String get backupSkipHistoryOption =>
      'Skip History (Load Only Templates and Notes)';

  @override
  String get backupEnableHistoryOption => 'Enable History and Load';

  @override
  String backupImportSuccessWithSummary(String summary) {
    return 'Import Successful:\n$summary';
  }

  @override
  String backupMergeError(String error) {
    return 'Merge error: $error';
  }

  @override
  String get nfcReadyStatus => 'NFC Ready';

  @override
  String get nfcReadyDesc => 'NFC hardware is active and ready to use';

  @override
  String get nfcDisabledStatus => 'NFC Disabled';

  @override
  String get nfcDisabledDesc =>
      'NFC is turned off. Please turn it on in device settings.';

  @override
  String ndefClipboardBanner(num count, num bytes, String source) {
    return 'NDEF Clipboard: $count records ($bytes B) - $source';
  }

  @override
  String get template => 'Template';

  @override
  String get nfcScannerTitle => 'NFC Scanner';

  @override
  String lastScannedTagId(String id) {
    return 'Last tag: $id';
  }

  @override
  String get composeRecord => 'Create record';

  @override
  String get protectOrRemove => 'Protect / remove';

  @override
  String get previousScans => 'Previous scans';

  @override
  String scanErrorWithMsg(String error) {
    return 'Scan error: $error';
  }

  @override
  String get noScannedTagYet => 'No NFC tags scanned yet';

  @override
  String get tapScanPrompt =>
      'Tap \"Start Scan\" and hold the tag near your phone.';

  @override
  String get ndefCopyAndRewriteTitle => 'NDEF Content Copy and Rewrite';

  @override
  String ndefCopyNotice(num count, num bytes) {
    return '$count records ($bytes Bytes) - Only NDEF data is processed, UID is not cloned.';
  }

  @override
  String tagIdHeader(String id) {
    return 'Tag $id';
  }

  @override
  String get savedTagNoteHeader => 'Saved Tag Note (In-App Rule)';

  @override
  String get tagNoteOrRule => 'Tag Note / Rule';

  @override
  String get editNote => 'Edit Note';

  @override
  String get deleteNote => 'Delete Note';

  @override
  String get tagNoteDigestNotice =>
      'This note matches SHA-256 digest of exact NDEF bytes. Does not trigger external actions.';

  @override
  String get addCustomTagNotePrompt =>
      'You can add a custom local note or description for this NDEF content.';

  @override
  String get addNoteToThisTag => 'Add Note to This Tag';

  @override
  String get ndefSupport => 'NDEF Support:';

  @override
  String get usedSpace => 'Used Space:';

  @override
  String get freeSpace => 'Free Space:';

  @override
  String errorWithMsg(String error) {
    return 'Error: $error';
  }

  @override
  String get noNdefMessageOnTag => 'No NDEF message found on tag.';

  @override
  String readNdefRecordsHeader(num count) {
    return 'Read NDEF Records ($count)';
  }

  @override
  String stagedNdefRecordsHeader(num count) {
    return 'Composed NDEF Records ($count)';
  }

  @override
  String get hideDetails => 'Hide Details';

  @override
  String get advancedRecordInspector => 'Record Inspector (Advanced)';

  @override
  String get ndefRecordInspectorTitle => 'NDEF Record Inspector (Advanced)';

  @override
  String get inspectorType => 'Type:';

  @override
  String get inspectorPayloadLength => 'Payload Length:';

  @override
  String get inspectorRawHexPreview => 'Raw Hex Preview (Limited):';

  @override
  String inspectorPayloadTruncated(num length) {
    return 'Note: Payload is $length bytes; showing first 64 bytes.';
  }

  @override
  String get ndefRecordsToWriteTitle => 'NDEF Records to Write';

  @override
  String get pasteFromClipboardAction =>
      'Paste from Clipboard (Replace / Append)';

  @override
  String get importAction => 'Import';

  @override
  String get importFromTagAction => 'Import from NFC tag';

  @override
  String get importFromQrAction => 'Import from QR code';

  @override
  String get importFromCsvAction => 'Import from CSV file';

  @override
  String composerTotalSizeAndCount(num bytes, num count) {
    return 'Total Size: $bytes Bytes | Record Count: $count';
  }

  @override
  String get composerEmptyDescription =>
      'You can write text, web links, Wi-Fi, phone, email, contact cards, and more to tags.';

  @override
  String get urlSafetyReview => 'URL Review';

  @override
  String get inspector => 'Inspector';

  @override
  String get typeLabel => 'Type:';

  @override
  String get payloadLabel => 'Payload:';

  @override
  String get writeAndVerify => 'Write to Tag and Verify';

  @override
  String writeAndVerifyWithBytes(num bytes) {
    return 'Write to Tag and Verify ($bytes Bytes)';
  }

  @override
  String get batchWriteButtonLabel => 'Batch Tag Writing (2..100 Tags)';

  @override
  String get clearTagButtonLabel => 'Reset Tag (Clear Content)';

  @override
  String get confirmWriteTitle => 'Confirm Writing to Tag';

  @override
  String get confirmWriteMessage1 =>
      'This operation COMPLETELY OVERWRITES existing NDEF content on target tag.';

  @override
  String confirmWriteRecordCount(num count) {
    return 'Record Count to Write: $count';
  }

  @override
  String get confirmWriteMessage2 =>
      'Ensure target tag is writable (unlocked). Content will be automatically verified after writing.';

  @override
  String get yesWrite => 'Yes, Write';

  @override
  String get scanHistoryDisabledTitle => 'Scan History Disabled';

  @override
  String get scanHistoryDisabledDesc =>
      'For privacy, scan history is not saved by default. You can enable it in the settings tab.';

  @override
  String get enableHistory => 'Enable History';

  @override
  String get historySearchHint =>
      'Search by UID, text, or type (e.g. URL, Wi-Fi, 04A1...)';

  @override
  String historyScansCount(num count) {
    return 'Saved Scans: $count';
  }

  @override
  String get noHistoryYet => 'No scan history saved yet.';

  @override
  String noHistoryResultsForQuery(String query) {
    return 'No results found for \"$query\".';
  }

  @override
  String get tryDifferentQuery =>
      'Try a different UID, text content, or record type.';

  @override
  String get clearSearch => 'Clear Search';

  @override
  String historyItemHeader(String time, num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Records',
      one: '1 Record',
    );
    return '$time | $_temp0';
  }

  @override
  String get deleteThisRecord => 'Delete this record';

  @override
  String historyCapacitySummary(num cap, num used) {
    return 'Capacity: ${cap}B | Used: ${used}B';
  }

  @override
  String historyUidHeader(String uid) {
    return 'History UID $uid';
  }

  @override
  String get qrPreview => 'QR Preview';

  @override
  String templateRecordCountWithDate(num count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Records',
      one: '1 Record',
    );
    return '$_temp0 | $date';
  }

  @override
  String writeVerificationSummary(num bytes, String status) {
    return 'Bytes Written: $bytes | Verification: $status';
  }

  @override
  String get lockTagConfirmTitle => 'Permanently Lock Tag';

  @override
  String get lockTagWarning1 =>
      'A locked tag becomes read-only: content CANNOT be modified, deleted, or unlocked.';

  @override
  String get lockTagWarning2 =>
      'Make sure you wrote the correct content first.';

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
  String get qrPreviewTooltip => 'QR Code Preview';

  @override
  String get unknownParentheses => '(Unknown)';

  @override
  String get ok => 'OK';
}
