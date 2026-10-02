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
  String get nfcPromptScan => 'Hold your device near the NFC tag to read it';

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
  String get statusCancelled => 'Operation cancelled.';

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
}
