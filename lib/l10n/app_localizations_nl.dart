// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get addRecord => 'Record toevoegen';

  @override
  String get addRule => 'Regel toevoegen';

  @override
  String get addTag => 'Tag toevoegen';

  @override
  String get addToComposerList => 'Toevoegen aan schrijflijst';

  @override
  String get addToWriteList => 'Toevoegen aan schrijflijst';

  @override
  String get addressCannotBeEmpty => 'Adres mag niet leeg zijn.';

  @override
  String get advancedCommandsDesc =>
      'Eén hex-commando per regel. Bijv: 60 = GET_VERSION, 30 04 = pagina 4 lezen. Foutieve commando\'s kunnen de tag beschadigen.';

  @override
  String get advancedCommandsSubtitle =>
      'Stuurt ruwe hexadecimale commando\'s naar de tag';

  @override
  String get advancedCommandsTitle => 'Geavanceerde NFC-commando\'s';

  @override
  String get allRulesCleared => 'Alle regels gewist';

  @override
  String get appLinksDesc =>
      'Geschreven naar een tag toont aanraking een melding en opent direct het gekozen scherm.';

  @override
  String get appLinksSection => 'Applicatielinks';

  @override
  String get appPackageName => 'Android pakketnaam';

  @override
  String get appSettings => 'App-instellingen';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'Automatisch uitvoeren bij aanraking';

  @override
  String get backupExportSuccess => 'Back-upbestand succesvol opgeslagen';

  @override
  String get backupFileSizeExceeded => 'Back-upbestand is groter dan 2 MiB.';

  @override
  String get backupHistoryMustBeList => 'Veld \"history\" moet een lijst zijn.';

  @override
  String backupImportFailed(String error) {
    return 'Importeren van back-up mislukt: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'Back-up succesvol geïmporteerd: $templates sjablonen, $rules regels, $history geschiedenisitems toegevoegd';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'Ongeldig Base64 voor ID: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Ongeldig Base64 voor payload: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Ongeldig Base64 voor type: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'Ongeldig JSON-formaat: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Ongeldige regelnotitie.';

  @override
  String get backupInvalidRuleSha => 'Ongeldige 64-teken SHA-256 hash.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'Ongeldige aanmaakdatum: $date';
  }

  @override
  String get backupInvalidTemplateId => 'Ongeldige sjabloon-ID.';

  @override
  String get backupInvalidTemplateName => 'Ongeldige sjabloonnaam.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'Ongeldige TNF-waarde ($tnf). Moet tussen 0 en 7 liggen.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Aantal geschiedenisitems overschrijdt limiet van $max ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'Aantal records overschrijdt limiet van $max ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'Aantal regels overschrijdt limiet van $max ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'Aantal sjablonen overschrijdt limiet van $max ($count).';
  }

  @override
  String get backupMissingSchemaVersion => 'Veld \"schemaVersion\" ontbreekt.';

  @override
  String get backupRecordMustBeObject =>
      'Elk NDEF-record moet een JSON-object zijn.';

  @override
  String get backupRecordsMustBeList => 'Records moeten een lijst zijn.';

  @override
  String get backupRestoreSubtitle =>
      'Exporteer sjablonen, notities en geschiedenis als JSON of voeg ze samen met bestaande gegevens.';

  @override
  String get backupRestoreTitle => 'Back-up & Herstel (JSON)';

  @override
  String get backupRootMustBeObject =>
      'Wortelelement moet een JSON-object zijn.';

  @override
  String get backupRuleMustBeObject => 'Elke regel moet een JSON-object zijn.';

  @override
  String get backupSchemaVersionMustBeInt =>
      'Veld \"schemaVersion\" moet een geheel getal zijn.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'Back-up overschrijdt limiet van 2 MiB ($bytes bytes).';
  }

  @override
  String get backupTagRulesMustBeList =>
      'Veld \"tagRules\" moet een lijst zijn.';

  @override
  String get backupTemplateMustBeObject =>
      'Elk sjabloon moet een JSON-object zijn.';

  @override
  String get backupTemplatesMustBeList =>
      'Veld \"templates\" moet een lijst zijn.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'Niet-ondersteunde schemaversie: $version.';
  }

  @override
  String get batchWrite => 'Batch-schrijven';

  @override
  String get bluetoothDeviceName => 'Apparaatnaam (Optioneel)';

  @override
  String get bluetoothMac => 'Bluetooth MAC-adres';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'Geschreven bytes: $bytes | Verificatie: $status';
  }

  @override
  String cameraError(String error) {
    return 'Kan camera niet openen. Geef toestemming in Instellingen > Privacy > Camera.\n($error)';
  }

  @override
  String get cancel => 'Annuleren';

  @override
  String get catBusiness => 'Zakelijk';

  @override
  String get catCar => 'Auto';

  @override
  String get catHome => 'Thuis';

  @override
  String get catOther => 'Overig';

  @override
  String get catPersonal => 'Persoonlijk';

  @override
  String get catWork => 'Werk';

  @override
  String get categoryLabel => 'Categorie';

  @override
  String get chooseFromGallery => 'Kies uit galerij';

  @override
  String get clear => 'Wissen';

  @override
  String get clearAll => 'Alles wissen';

  @override
  String get clearAllRulesConfirm => 'Alle opgeslagen notities wissen?';

  @override
  String get clearConfirmButton => 'Ja, wissen';

  @override
  String get clearConfirmMessage =>
      'Deze bewerking wist alle NDEF-records en schrijft een leeg record. Doorgaan?';

  @override
  String get clearConfirmTitle => 'Tag-inhoud resetten';

  @override
  String get clearHistory => 'Geschiedenis wissen';

  @override
  String get clearList => 'Lijst leegmaken';

  @override
  String get clearTagSubtitle => 'Wist alle records en schrijft een lege NDEF';

  @override
  String get clearTagTitle => 'Tag wissen';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records gereed op klembord',
      one: '1 record gereed op klembord',
    );
    return '$_temp0 ($bytes B) · $source';
  }

  @override
  String get close => 'Sluiten';

  @override
  String get commandsEmptyError => 'Voer ten minste één commando in.';

  @override
  String get commandsLabel => 'Commando\'s';

  @override
  String get composeRecordTitle => 'Nieuw record toevoegen';

  @override
  String get confirmClearHistoryContent =>
      'Alle scangeschiedenis op dit toestel wordt gewist. Weet u het zeker?';

  @override
  String get confirmClearHistoryTitle => 'Geschiedenis wissen';

  @override
  String get confirmClearTemplatesContent =>
      'Alle opgeslagen schrijfsjablonen worden gewist. Weet u het zeker?';

  @override
  String get confirmClearTemplatesTitle => 'Sjablonen wissen';

  @override
  String get contactCompany => 'Bedrijf / Organisatie';

  @override
  String get contactEmail => 'E-mailadres';

  @override
  String get contactFullName => 'Volledige naam';

  @override
  String get contactNote => 'Notitie';

  @override
  String get contactPhone => 'Telefoonnummer';

  @override
  String get contactTitle => 'Functie';

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
    return 'Inhoud: $_temp0 · $content';
  }

  @override
  String get copy => 'Kopiëren';

  @override
  String get copyAllRecords => 'Kopieer alle records';

  @override
  String get copyTagUid => 'UID kopiëren';

  @override
  String get copyToComposer => 'Kopieer naar schrijflijst';

  @override
  String get csvInvalidAddress => 'ongeldig adres.';

  @override
  String get csvInvalidEmail => 'ongeldig e-mailadres.';

  @override
  String get csvInvalidLocation =>
      'voer breedte- en lengtegraad in (bijv. locatie,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'Maximaal $max records geïmporteerd; overige regels overgeslagen.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'Regel $row: waarde is leeg.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'Regel $row: $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'onbekend type \"$type\".';
  }

  @override
  String get csvWifiPasswordLength =>
      'Wifi-wachtwoord moet 8-63 tekens lang zijn.';

  @override
  String get delete => 'Verwijderen';

  @override
  String deleteTagConfirmContent(String name) {
    return '\"$name\" uit de bibliotheek verwijderen? De fysieke tag verandert niet.';
  }

  @override
  String get deleteTagConfirmTitle => 'Tag verwijderen';

  @override
  String get deleteTemplateTooltip => 'Sjabloon verwijderen';

  @override
  String get deviceNameTooLong => 'Apparaatnaam is te lang.';

  @override
  String get dismiss => 'Negeren';

  @override
  String get editRecordTitle => 'Record bewerken';

  @override
  String get editRule => 'Regel bewerken';

  @override
  String get editTag => 'Tag bewerken';

  @override
  String get emailBody => 'Berichttekst';

  @override
  String get emailRecipient => 'Ontvanger';

  @override
  String get emailSubject => 'Onderwerp';

  @override
  String get emptyComposerSubtitle =>
      'Tik op \"Record toevoegen\" om URL\'s, tekst, wifi of contacten aan te maken.';

  @override
  String get emptyComposerTitle => 'Nog geen records toegevoegd';

  @override
  String get emptyHistorySubtitle => 'Gescande tags verschijnen hier.';

  @override
  String get emptyHistoryTitle => 'Nog geen geschiedenis';

  @override
  String get emptyLibrary =>
      'Nog geen tags opgeslagen.\nScan een tag en bewaar hem hier met naam en foto.';

  @override
  String get eventDescription => 'Beschrijving';

  @override
  String get eventEnd => 'Eindtijd';

  @override
  String get eventLocation => 'Locatie';

  @override
  String get eventStart => 'Begintijd';

  @override
  String get eventTitle => 'Titel van evenement';

  @override
  String get exportBackup => 'Exporteren';

  @override
  String get facetimePrompt => 'Voer telefoonnummer of Apple ID e-mail in.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" mag niet leeg zijn.';
  }

  @override
  String get fieldTextPrompt => 'Tekst om naar tag te schrijven';

  @override
  String get fieldUrlPrompt => 'Website-adres (https://...)';

  @override
  String get fileUrl => 'Bestands-URL';

  @override
  String get filterAll => 'Alle';

  @override
  String get flashlight => 'Zaklamp';

  @override
  String get formatConfirmButton => 'Formatteren';

  @override
  String get formatConfirmMessage =>
      'Bestaande gegevens worden gewist en geformatteerd als een lege NDEF-tag. Doorgaan?';

  @override
  String get formatMemorySubtitle =>
      'Bereidt voor op NDEF (lege of beschadigde tags)';

  @override
  String get formatMemoryTitle => 'Geheugen formatteren';

  @override
  String get hardwareAvailable => 'NFC-hardware gereed';

  @override
  String get hardwareDisabled => 'NFC uitgeschakeld';

  @override
  String get hardwareNotSupported => 'NFC niet ondersteund';

  @override
  String get historyFilteredEmpty =>
      'Geen overeenkomsten gevonden in geschiedenis.';

  @override
  String get idTooLarge => 'ID-lengte mag niet groter zijn dan 255 bytes';

  @override
  String get importBackup => 'Importeren (Samenvoegen)';

  @override
  String get importCsv => 'CSV importeren';

  @override
  String get inAppTagRules => 'In-app tag-regels';

  @override
  String get invalidHexId => 'Ongeldig hex-ID';

  @override
  String get invalidHexPayload => 'Ongeldige hex-payload';

  @override
  String get invalidHexType => 'Ongeldig hex-type';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get latitude => 'Breedtegraad (Lat)';

  @override
  String get linkCopied => 'Link gekopieerd';

  @override
  String get linkHistoryDesc => 'Opent de geschiedenis';

  @override
  String get linkScanDesc => 'Opent de app en start de scanner';

  @override
  String get linkToolsDesc => 'Opent het toolsscherm';

  @override
  String get linkWriteDesc => 'Opent het schrijfscherrm';

  @override
  String get loadToComposerTooltip => 'In editor laden';

  @override
  String get locationHint => 'Bijv.: Koelkastdeur';

  @override
  String get locationLabel => 'Waar geplaatst?';

  @override
  String get lockAcknowledge =>
      'Ik begrijp dat deze actie niet ongedaan kan worden gemaakt';

  @override
  String get lockButton => 'Vergrendelen';

  @override
  String get lockTagSubtitle =>
      'Maakt de tag permanent alleen-lezen (onomkeerbaar)';

  @override
  String get lockTagTitle => 'Tag vergrendelen';

  @override
  String get lockWarning =>
      'Een vergrendelde tag wordt permanent alleen-lezen: de inhoud kan NOOIT meer worden gewijzigd of ontgrendeld.';

  @override
  String get longitude => 'Lengtegraad (Lng)';

  @override
  String get manage => 'Beheren';

  @override
  String get matchedRule => 'Bijbehorende notitie';

  @override
  String get mimePayloadHex => 'Gegevens (Hex / Tekst)';

  @override
  String get mimeTypeLabel => 'MIME-type';

  @override
  String get nameRequired => 'Geef de tag een naam.';

  @override
  String get navHistory => 'Historie';

  @override
  String get navHistoryTitle => 'Geschiedenis';

  @override
  String get navRead => 'Lezen';

  @override
  String get navReadTitle => 'Tag lezen';

  @override
  String get navSettings => 'Opties';

  @override
  String get navSettingsTitle => 'Sjablonen & Instellingen';

  @override
  String get navTools => 'Tools';

  @override
  String get navToolsTitle => 'Gereedschappen';

  @override
  String get navWrite => 'Schrijven';

  @override
  String get navWriteTitle => 'Tag schrijven';

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
  String get ndefRecordsTitle => 'NDEF-records';

  @override
  String get nfcPromptClear => 'Houd de tag dichtbij om te resetten';

  @override
  String get nfcPromptLock =>
      'Houd de tag dichtbij om permanent te vergrendelen';

  @override
  String get nfcPromptScan => 'Houd het apparaat bij de NFC-tag om te lezen';

  @override
  String get nfcPromptWrite => 'Houd de NFC-tag dichtbij om op te slaan';

  @override
  String get no => 'Nee';

  @override
  String get noContentInTag => 'Geen tag-inhoud gekoppeld.';

  @override
  String get noLibraryMatches => 'Geen overeenkomende tags gevonden.';

  @override
  String get noRecordsOnTag => 'Geen NDEF-records op de tag gevonden.';

  @override
  String get noTemplates =>
      'Nog geen schrijfsjablonen opgeslagen.\nMaak records aan in het tabblad \"Schrijven\" om ze op te slaan.';

  @override
  String get noteLabel => 'Notitie';

  @override
  String get onboardingContinue => 'Doorgaan';

  @override
  String get onboardingSkip => 'Overslaan';

  @override
  String get onboardingStart => 'Aan de slag';

  @override
  String get onboardingStep1Body =>
      'Tik op de blauwe knop en houd uw telefoon bij de tag. Inhoud, capaciteit en serienummer verschijnen direct.';

  @override
  String get onboardingStep1Title => 'Scan een tag';

  @override
  String get onboardingStep2Body =>
      'Tik in \"Schrijven\" op \"Record toevoegen\": weblinks, wifi, contacten, sociale media en kant-en-klare sjablonen.';

  @override
  String get onboardingStep2Title => 'Schrijf naar wens';

  @override
  String get onboardingStep3Body =>
      'Inspecteer geheugen, stel wachtwoorden in, vergrendel tags of formatteer ze in \"Tools\".';

  @override
  String get onboardingStep3Title => 'Geavanceerde tools';

  @override
  String get onboardingStep4Body =>
      'Sla tags op met namen, notities en foto\'s in uw bibliotheek. Wijzig taal en weergave in Instellingen.';

  @override
  String get onboardingStep4Title => 'Beheer uw tags';

  @override
  String optionalField(String label) {
    return '$label (optioneel)';
  }

  @override
  String pageN(int page) {
    return 'Pagina $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'Gegevens';

  @override
  String get pageRoleLock => 'Vergrendeling';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / Vergrendeling';

  @override
  String get passwordDialogAction => 'Instellen';

  @override
  String get passwordDialogTitle => 'Wachtwoord instellen';

  @override
  String get passwordDialogWarning =>
      'Als u dit wachtwoord vergeet, kan de inhoud niet meer worden gewijzigd. Lezen blijft voor iedereen open.';

  @override
  String get passwordError => 'Voer precies 4 tekens of 8 hex-cijfers in.';

  @override
  String get passwordHint => '4 tekens (bijv. 1234) of 8 hex-cijfers';

  @override
  String get passwordLabel => 'Wachtwoord';

  @override
  String get paste => 'Plakken';

  @override
  String get phoneNumber => 'Telefoonnummer';

  @override
  String get phoneWithCountryCode =>
      'Voer nummer in met landcode (bijv. 31612345678).';

  @override
  String get presetAppDownloadDesc =>
      'Opent of nodigt Android-gebruikers uit de app te installeren.';

  @override
  String get presetAppDownloadTitle => 'App downloaden';

  @override
  String get presetBusinessCardDesc =>
      'Voegt contactgegevens toe aan het adresboek bij aanraking.';

  @override
  String get presetBusinessCardTitle => 'Digitaal visitekaartje';

  @override
  String get presetDirectionsDesc =>
      'Toont een adres of bestemming op de kaart.';

  @override
  String get presetDirectionsTitle => 'Routebeschrijving';

  @override
  String get presetEmergencyDesc =>
      'Bloedgroep, noodcontacten en belangrijke medische data.';

  @override
  String get presetEmergencyTitle => 'Noodkaart (ICE)';

  @override
  String get presetGoogleReviewDesc =>
      'Verwijst klanten rechtstreeks naar uw reviewpagina.';

  @override
  String get presetGoogleReviewTitle => 'Google Review link';

  @override
  String get presetGuestWifiDesc =>
      'Gasten verbinden direct zonder het wachtwoord te typen.';

  @override
  String get presetGuestWifiTitle => 'Gasten-wifi kaart';

  @override
  String get presetInstagramDesc =>
      'Opent direct uw Instagram-profiel bij aantikken.';

  @override
  String get presetInstagramTitle => 'Instagram-profiel';

  @override
  String get presetMenuLinkDesc =>
      'Plak op tafels zodat gasten de menukaart direct bekijken.';

  @override
  String get presetMenuLinkTitle => 'Restaurantmenu';

  @override
  String get presetPetTagDesc =>
      'Vinders kunnen u onmiddellijk bellen bij verlies.';

  @override
  String get presetPetTagTitle => 'Huisdierenpenning';

  @override
  String get presetShortcutDesc =>
      'Start Apple Opdrachten of specifieke app-functies.';

  @override
  String get presetShortcutTitle => 'Opdrachten-trigger';

  @override
  String get presetWebsiteDesc =>
      'Verwijst direct door naar elke gewenste webpagina.';

  @override
  String get presetWebsiteTitle => 'Websitelink';

  @override
  String get presetWhatsappDesc =>
      'Start een gesprek zonder het nummer eerst op te slaan.';

  @override
  String get presetWhatsappTitle => 'WhatsApp-chat';

  @override
  String get qrCode => 'QR-code';

  @override
  String qrContentChars(int chars) {
    return 'Inhoud ($chars tekens):';
  }

  @override
  String get qrContentEmpty => 'De te coderen inhoud is leeg.';

  @override
  String qrContentTooLarge(int chars) {
    return 'Inhoud is te groot voor QR-code ($chars tekens, max 2048).';
  }

  @override
  String get qrFrameInstructions =>
      'Plaats QR-code binnen het kader. Weblinks, wifi en tekst worden geconverteerd.';

  @override
  String qrGenerationFailed(String error) {
    return 'QR-code genereren mislukt: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'QR-code voorbeeld: $title';
  }

  @override
  String get qrScanTitle => 'QR-code scannen';

  @override
  String get qrSecurityNote =>
      'QR-voorbeeld is alleen beschikbaar voor leesbare tekst en weblinks.\n\nWifi-wachtwoorden en binaire gegevens worden om privacyredenen niet omgezet.';

  @override
  String get qrUserOnlyNote =>
      'Wordt alleen geopend op verzoek van de gebruiker.';

  @override
  String get rawInspection => 'Gedetailleerde inspectie';

  @override
  String get rawRecordDetailsTitle => 'Recorddetails (Alleen-lezen)';

  @override
  String get rawRecordEditorTitle => 'Ruw NDEF-record bewerken';

  @override
  String get readHeroButton => 'Start scan';

  @override
  String get readHeroEyebrow => 'NFC-LEZER';

  @override
  String get readHeroScanning => 'Scannen...';

  @override
  String get readHeroSubtitle =>
      'Houd de bovenkant van uw telefoon bij een NFC-tag om NDEF-records en chipdetails te lezen.';

  @override
  String get readHeroTitle => 'Tag scannen';

  @override
  String get readMemorySubtitle =>
      'Ruw geheugen pagina voor pagina; kopiëren of opslaan als .bin';

  @override
  String get readMemoryTitle => 'Geheugen lezen';

  @override
  String get readyTemplates => 'Kant-en-klare sjablonen';

  @override
  String get recordCopied => 'Record gekopieerd';

  @override
  String recordIndex(int index) {
    return 'Record #$index';
  }

  @override
  String get recordTypeCalendar => 'Agenda-item (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'Aangepaste MIME ($mime)';
  }

  @override
  String get recordTypeEmail => 'E-mailrecord';

  @override
  String get recordTypeLocation => 'Locatie / GPS';

  @override
  String get recordTypePhone => 'Telefoonnummer';

  @override
  String get recordTypeSmartPoster => 'Smart Poster';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'Beschadigd Smart Poster record ($bytes bytes)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'Smart Poster (Ongeldig)';

  @override
  String get recordTypeSms => 'SMS-record';

  @override
  String get recordTypeText => 'Tekstrecord';

  @override
  String get recordTypeUnknown => 'Onbekend record';

  @override
  String get recordTypeUrl => 'Webkoppeling (URL)';

  @override
  String get recordTypeVCard => 'Contactkaart (vCard)';

  @override
  String get recordTypeWifi => 'Wi-Fi-configuratie (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'Beschadigde WSC-payload';

  @override
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records gekopieerd',
      one: '1 record gekopieerd',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'Opnieuw uitvoeren';

  @override
  String get removePasswordDialogTitle => 'Wachtwoord verwijderen';

  @override
  String get removePasswordDialogWarning =>
      'Voer het huidige wachtwoord van de tag in.';

  @override
  String get removePasswordSubtitle =>
      'Verwijdert beveiliging met het bekende wachtwoord';

  @override
  String get removePasswordTitle => 'Wachtwoord verwijderen';

  @override
  String get removePhoto => 'Verwijderen';

  @override
  String get rewriteTag => 'Opnieuw schrijven';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Regel met notitie \"$note\" verwijderen?';
  }

  @override
  String get ruleDeleted => 'Regel verwijderd';

  @override
  String get ruleNoteDialogTitle => 'Tag-notitie bewerken';

  @override
  String get ruleNoteHint => 'Bijv.: Magazijnstelling #4 of Vergaderruimte';

  @override
  String get ruleNoteLabel => 'In-app notitie / Label';

  @override
  String get ruleSaved => 'Regel opgeslagen';

  @override
  String get save => 'Opslaan';

  @override
  String get saveAsTemplate => 'Opslaan als sjabloon';

  @override
  String get saveBin => '.bin opslaan';

  @override
  String get saveLocalHistory => 'Lokale scangeschiedenis opslaan';

  @override
  String get saveLocalHistorySubtitle =>
      'Uitgeschakeld worden scans niet bewaard. Ingeschakeld worden geslaagde scans lokaal bewaard.';

  @override
  String get saveTemplateDialogTitle => 'Opslaan als sjabloon';

  @override
  String get saveToLibrary => 'Opslaan in bibliotheek';

  @override
  String get scanFabLabel => 'Tag scannen';

  @override
  String get scanQrToRecord => 'Scan QR-code';

  @override
  String get scannedTag => 'Gescande tag';

  @override
  String get searchEngine => 'Zoekmachine';

  @override
  String get searchHistoryHint =>
      'Doorzoek geschiedenis (UID, inhoud, type)...';

  @override
  String get searchLibraryHint => 'Zoek op naam, notitie, locatie of inhoud';

  @override
  String get searchQuery => 'Zoekopdracht';

  @override
  String get searchQueryCannotBeEmpty => 'Zoekopdracht mag niet leeg zijn.';

  @override
  String get securityRestriction => 'Beveiligingsbeperking';

  @override
  String get send => 'Verzenden';

  @override
  String get setPasswordSubtitle =>
      'Beschermt tag-inhoud tegen ongeoorloofd schrijven';

  @override
  String get setPasswordTitle => 'Wachtwoord instellen';

  @override
  String get shareRecords => 'Records delen';

  @override
  String get shortcutAutomationNote =>
      'Let op: Automatisering koppelt aan het UID en werkt ook als de inhoud verandert.';

  @override
  String get shortcutStep1 =>
      'Open de Opdrachten-app en tik onderaan op \"Automatisering\".';

  @override
  String get shortcutStep2 =>
      'Tik op \"Nieuwe automatisering\" (+) → kies \"NFC\".';

  @override
  String get shortcutStep3 =>
      'Tik op \"Scannen\", houd de tag bij de iPhone en geef een naam.';

  @override
  String get shortcutStep4 =>
      'Kies \"Voer direct uit\" en voeg de gewenste acties toe.';

  @override
  String get shortcutStep5 =>
      'Om deze app te openen, kiest u \"Tag scannen\" of \"Tag schrijven\".';

  @override
  String get shortcutsGuideSubtitle =>
      'Start automatisch acties bij tag-aanraking of vraag Siri handsfree te scannen.';

  @override
  String get shortcutsGuideTitle => 'Siri & Opdrachten';

  @override
  String get siriPhraseScan => '\"Hé Siri, scan tag met NFC Tag Master\"';

  @override
  String get siriPhraseWrite =>
      '\"Hé Siri, schrijf naar tag met NFC Tag Master\"';

  @override
  String get siriShortcutsNote =>
      'Deze commando\'s zijn ook zichtbaar in de Opdrachten-app en Spotlight.';

  @override
  String get smsMessage => 'SMS-bericht';

  @override
  String get socialNetwork => 'Platform';

  @override
  String get socialUsername => 'Gebruikersnaam';

  @override
  String get sourceComposer => 'Records in schrijflijst';

  @override
  String get sourceEmpty => 'Zonder inhoud (alleen notitie)';

  @override
  String get sourceLastScan => 'Laatst gescande tag';

  @override
  String get sourceSelectPrompt => 'Waar moet de inhoud vandaan komen?';

  @override
  String get statusCancelled => 'Bewerking geannuleerd.';

  @override
  String statusClearError(String error) {
    return 'Formatteerfout: $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'Wissen mislukt: $error';
  }

  @override
  String get statusClearSuccess => 'Tag-inhoud succesvol gewist.';

  @override
  String get statusClearing => 'Wismodus actief. Houd tag dichtbij...';

  @override
  String statusLockError(String error) {
    return 'Vergrendelfout: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'Vergrendelen mislukt: $error';
  }

  @override
  String get statusLockSuccess => 'Tag permanent vergrendeld (alleen-lezen).';

  @override
  String get statusLocking => 'Vergrendelmodus actief. Houd tag dichtbij...';

  @override
  String get statusNfcDisabled =>
      'NFC staat uit. Schakel dit in via instellingen.';

  @override
  String get statusNfcNotSupported =>
      'NFC-hardware is niet aanwezig of ondersteund.';

  @override
  String get statusNfcUnavailable => 'NFC is momenteel niet beschikbaar.';

  @override
  String get statusReady => 'Gereed';

  @override
  String statusScanError(String error) {
    return 'Scanfout: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'Tag succesvol gelezen ($id).';
  }

  @override
  String get statusScanning => 'Tag scannen... Houd uw telefoon bij de tag.';

  @override
  String statusUnexpectedError(String error) {
    return 'Onverwachte fout: $error';
  }

  @override
  String statusWriteError(String error) {
    return 'Schrijffout: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'Schrijven niet voltooid: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return 'Schrijven en verificatie geslaagd! ($bytes bytes)';
  }

  @override
  String get statusWriting => 'Schrijfmodus actief. Houd doeltag dichtbij...';

  @override
  String get systemLanguage => 'Systeemtaal';

  @override
  String get tabApp => 'Applicatie';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'Agenda';

  @override
  String get tabContact => 'Contact (vCard)';

  @override
  String get tabCustomMime => 'Aangepaste MIME';

  @override
  String get tabEmail => 'E-mail';

  @override
  String get tabFile => 'Bestand';

  @override
  String get tabLocation => 'Locatie';

  @override
  String get tabPhone => 'Telefoon';

  @override
  String get tabSearch => 'Zoeken';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'Sociale media';

  @override
  String get tabText => 'Tekst';

  @override
  String get tabUrl => 'Web-URL';

  @override
  String get tabVideo => 'Video';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'Capaciteit';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max bytes ($available bytes vrij)';
  }

  @override
  String get tagInfoTitle => 'Tag-informatie';

  @override
  String get tagLibraryTitle => 'Mijn tagbibliotheek';

  @override
  String get tagNameHint => 'Bijv.: Keukentag';

  @override
  String get tagNameLabel => 'Naam';

  @override
  String get tagReadOnly => 'Alleen-lezen (Vergrendeld)';

  @override
  String tagRulesCount(int count) {
    return 'Opgeslagen regels / notities: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Toont alleen de opgeslagen notitie op basis van de exacte SHA-256-hash van de NDEF-bytes.';

  @override
  String get tagSerialNumber => 'Serienummer (UID)';

  @override
  String get tagTechnology => 'Technologie';

  @override
  String get tagType => 'Type';

  @override
  String get tagUidCopied => 'Tag-UID gekopieerd';

  @override
  String get tagWritable => 'Beschrijfbaar';

  @override
  String get takePhoto => 'Foto maken';

  @override
  String get templateGalleryTitle => 'Kant-en-klare sjablonen';

  @override
  String get templateNameHint => 'Sjabloonnaam';

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
  String get templateSaved => 'Sjabloon succesvol opgeslagen';

  @override
  String get toolsExpertSection => 'Geavanceerd';

  @override
  String get toolsFooterNote =>
      'Geheugen-, wachtwoord- en commandotools werken met NTAG213/215/216 en MIFARE Ultralight EV1 tags.';

  @override
  String get toolsMemorySection => 'Geheugen';

  @override
  String get toolsSecuritySection => 'Beveiliging';

  @override
  String get toolsTagSection => 'Tag';

  @override
  String get totalBytes => 'Totale grootte';

  @override
  String get typeTooLarge => 'Typelengte mag niet groter zijn dan 255 bytes';

  @override
  String get undo => 'Ongedaan maken';

  @override
  String get unknownChip16Pages => 'Onbekende chip (eerste 16 pagina\'s)';

  @override
  String get urlSafetyInvalidUrl => 'Ongeldig URL-formaat.';

  @override
  String get urlSafetyIpv4 => 'Bestemming bevat een direct IPv4-adres.';

  @override
  String get urlSafetyIpv6 => 'Bestemming bevat een direct IPv6-adres.';

  @override
  String get urlSafetyMissingScheme => 'URL-protocolschema ontbreekt.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'Niet-standaard netwerkpoort (Poort: $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'Geïnternationaliseerd domein / Punycode gedetecteerd (\"xn--\").';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'Niet-standaard URL-schema: \"$scheme\".';
  }

  @override
  String get urlSafetyUnencrypted => 'Onversleutelde verbinding (http://).';

  @override
  String get urlSafetyUserInfo =>
      'URL bevat inloggegevens (userinfo). Mogelijk phishing-risico.';

  @override
  String get usernameCannotBeEmpty => 'Gebruikersnaam mag niet leeg zijn.';

  @override
  String get usernameNoSpaces => 'Gebruikersnaam mag geen spaties bevatten.';

  @override
  String get validAndroidPackage =>
      'Voer een geldige Android pakketnaam in (bijv. com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'Voer een geldig Bluetooth MAC-adres in (bijv. 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'Voer een geldige videolink in.';

  @override
  String get validWebAddress =>
      'Voer een geldig webadres in (bijv. https://example.com/bestand.pdf).';

  @override
  String get verificationNotChecked => 'Niet gecontroleerd';

  @override
  String get verificationPassed => 'Geslaagd';

  @override
  String get videoUrlCannotBeEmpty => 'Videolink mag niet leeg zijn.';

  @override
  String get videoUrlOrId => 'Video-link of YouTube-ID';

  @override
  String get videoUrlOrIdPrompt => 'Voer link (https://...) of video-ID in.';

  @override
  String get wifiAuthOpen => 'Open (Onbeveiligd)';

  @override
  String get wifiAuthType => 'Beveiligingstype';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'Verborgen netwerk';

  @override
  String get wifiPassword => 'Wachtwoord';

  @override
  String get wifiSsid => 'Netwerknaam (SSID)';

  @override
  String get withSiri => 'Met Siri';

  @override
  String get writeDumpConfirmButton => 'Schrijven';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes bytes) wordt geschreven naar het gebruikersgeheugen. UID en instellingen blijven intact.';
  }

  @override
  String get writeDumpSubtitle =>
      'Schrijft opgeslagen binair geheugenbestand naar tag';

  @override
  String get writeDumpTitle => 'Dump schrijven (.bin)';

  @override
  String get writeHeroButton => 'Start schrijven';

  @override
  String get writeHeroEyebrow => 'NDEF-SCHRIJVER';

  @override
  String get writeHeroSubtitle =>
      'Stel meerdere NDEF-records samen en schrijf ze in één keer naar de tag.';

  @override
  String get writeHeroTitle => 'Naar tag schrijven';

  @override
  String get writeHeroWriting => 'Schrijven...';

  @override
  String get writeResultFailed => 'Bewerking mislukt';

  @override
  String get writeResultSuccess => 'Bewerking geslaagd';

  @override
  String get writeTemplates => 'Schrijfsjablonen';

  @override
  String get writeTemplatesSubtitle =>
      'Sla veelgebruikte NDEF-berichten op als sjabloon om ze snel naar tags te schrijven.';

  @override
  String get yes => 'Ja';
}
