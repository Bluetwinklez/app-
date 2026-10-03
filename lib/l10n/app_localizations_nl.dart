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
  String get backupFileSizeExceeded => 'Back-upbestand is groter dan 2 MiB.';

  @override
  String get backupHistoryMustBeList => 'Veld \"history\" moet een lijst zijn.';

  @override
  String backupInvalidJson(String error) {
    return 'Ongeldig JSON-formaat: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Ongeldige regelnotitie.';

  @override
  String get backupInvalidRuleSha => 'Ongeldige 64-teken SHA-256 hash.';

  @override
  String get backupInvalidTemplateId => 'Ongeldige sjabloon-ID.';

  @override
  String get backupInvalidTemplateName => 'Ongeldige sjabloonnaam.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Aantal geschiedenisitems overschrijdt limiet van $max ($count).';
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
  String get clearConfirmMessage =>
      'Deze bewerking wist alle NDEF-records en schrijft een leeg record. Doorgaan?';

  @override
  String get clearConfirmTitle => 'Tag-inhoud resetten';

  @override
  String get clearHistory => 'Geschiedenis wissen';

  @override
  String get clearTagSubtitle => 'Wist alle records en schrijft een lege NDEF';

  @override
  String get clearTagTitle => 'Tag wissen';

  @override
  String get close => 'Sluiten';

  @override
  String get commandsEmptyError => 'Voer ten minste één commando in.';

  @override
  String get commandsLabel => 'Commando\'s';

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
  String get contactPhone => 'Telefoonnummer';

  @override
  String get contactTitle => 'Functie';

  @override
  String get contactWebsite => 'Website';

  @override
  String get copy => 'Kopiëren';

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
  String get deleteTemplateTooltip => 'Sjabloon verwijderen';

  @override
  String get deviceNameTooLong => 'Apparaatnaam is te lang.';

  @override
  String get dismiss => 'Negeren';

  @override
  String get editRecordTitle => 'Record bewerken';

  @override
  String get emailRecipient => 'Ontvanger';

  @override
  String get exportBackup => 'Exporteren';

  @override
  String get facetimePrompt => 'Voer telefoonnummer of Apple ID e-mail in.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" mag niet leeg zijn.';
  }

  @override
  String get flashlight => 'Zaklamp';

  @override
  String get formatMemorySubtitle =>
      'Bereidt voor op NDEF (lege of beschadigde tags)';

  @override
  String get formatMemoryTitle => 'Geheugen formatteren';

  @override
  String get idTooLarge => 'ID-lengte mag niet groter zijn dan 255 bytes';

  @override
  String get importBackup => 'Importeren (Samenvoegen)';

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
  String get locationLabel => 'Waar geplaatst?';

  @override
  String get lockAcknowledge =>
      'Ik begrijp dat deze actie niet ongedaan kan worden gemaakt';

  @override
  String get lockTagSubtitle =>
      'Maakt de tag permanent alleen-lezen (onomkeerbaar)';

  @override
  String get lockTagTitle => 'Tag vergrendelen';

  @override
  String get manage => 'Beheren';

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
  String get nfcPromptClear => 'Houd de tag dichtbij om te resetten';

  @override
  String get nfcPromptLock =>
      'Houd de tag dichtbij om permanent te vergrendelen';

  @override
  String get nfcPromptScan => 'Houd de tag bij de bovenkant van je telefoon';

  @override
  String get nfcPromptWrite => 'Houd de NFC-tag dichtbij om op te slaan';

  @override
  String get no => 'Nee';

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
      'Deelt je contactkaart; Android biedt opslaan aan, op iPhone opent een NFC-app hem.';

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
      'Android-telefoons verbinden met één tik; op iPhone toont een NFC-app de gegevens.';

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
  String get rawRecordDetailsTitle => 'Recorddetails (Alleen-lezen)';

  @override
  String get rawRecordEditorTitle => 'Ruw NDEF-record bewerken';

  @override
  String get readHeroButton => 'Start scan';

  @override
  String get readMemorySubtitle =>
      'Ruw geheugen pagina voor pagina; kopiëren of opslaan als .bin';

  @override
  String get readMemoryTitle => 'Geheugen lezen';

  @override
  String get readyTemplates => 'Kant-en-klare sjablonen';

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
  String get redo => 'Opnieuw uitvoeren';

  @override
  String get removePasswordSubtitle =>
      'Verwijdert beveiliging met het bekende wachtwoord';

  @override
  String get removePasswordTitle => 'Wachtwoord verwijderen';

  @override
  String get rewriteTag => 'Opnieuw schrijven';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Regel met notitie \"$note\" verwijderen?';
  }

  @override
  String get ruleNoteDialogTitle => 'Tag-notitie bewerken';

  @override
  String get ruleNoteLabel => 'In-app notitie / Label';

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
  String get scanFabLabel => 'Tag scannen';

  @override
  String get scannedTag => 'Gescande tag';

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
  String get socialUsername => 'Gebruikersnaam';

  @override
  String get sourceSelectPrompt => 'Waar moet de inhoud vandaan komen?';

  @override
  String get statusCancelled => 'Geannuleerd';

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
  String get tabContact => 'Contact (vCard)';

  @override
  String get tabCustomMime => 'Aangepaste MIME';

  @override
  String get tabEmail => 'E-mail';

  @override
  String get tabPhone => 'Telefoon';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabText => 'Tekst';

  @override
  String get tabUrl => 'Web-URL';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => 'Tag-informatie';

  @override
  String get tagLibraryTitle => 'Mijn tagbibliotheek';

  @override
  String tagRulesCount(int count) {
    return 'Opgeslagen regels / notities: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Toont alleen de opgeslagen notitie op basis van de exacte SHA-256-hash van de NDEF-bytes.';

  @override
  String get tagWritable => 'Beschrijfbaar';

  @override
  String get takePhoto => 'Foto maken';

  @override
  String get templateNameHint => 'Sjabloonnaam';

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
  String get videoUrlOrIdPrompt => 'Voer link (https://...) of video-ID in.';

  @override
  String get wifiAuthOpen => 'Open (Onbeveiligd)';

  @override
  String get wifiPassword => 'Wachtwoord';

  @override
  String get wifiSsid => 'Netwerknaam (SSID)';

  @override
  String get withSiri => 'Met Siri';

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
  String get unknown => 'Onbekend';

  @override
  String get error => 'Fout';

  @override
  String get nfcPromptReady => 'Houd tag dichtbij';

  @override
  String get invalidResponseFormat => 'Ongeldig antwoordformaat ontvangen';

  @override
  String get nfcReadError => 'NFC-leesfout';

  @override
  String get invalidPlatformResponse =>
      'Ongeldig antwoord ontvangen van platform';

  @override
  String get writeFailed => 'Schrijven mislukt';

  @override
  String get lockFailed => 'Vergrendelen mislukt';

  @override
  String get failedToConnectTag => 'Kon geen verbinding maken met tag';

  @override
  String get invalidTagResponse => 'Ongeldig antwoord van tag';

  @override
  String get commandFailed => 'Opdracht mislukt';

  @override
  String get ndefTypeOrIdTooLong => 'NDEF-type of ID overschrijdt 255 bytes';

  @override
  String get ndefUnsupportedOrInvalidRecord =>
      'Niet-ondersteund of ongeldig NDEF-record';

  @override
  String get ndefMissingTypeLength => 'Ontbrekende NDEF-typelengte';

  @override
  String get ndefMissingPayloadLength => 'Ontbrekende NDEF-payloadlengte';

  @override
  String get ndefMissingIdLength => 'Ontbrekende NDEF-ID-lengte';

  @override
  String get ndefMissingType => 'Ontbrekend NDEF-type';

  @override
  String get ndefMissingId => 'Ontbrekende NDEF-ID';

  @override
  String get ndefMissingPayload => 'Ontbrekende NDEF-payload';

  @override
  String get unprotected => '(Zonder wachtwoord)';

  @override
  String get binaryDataPreview => '(Binaire gegevens)';

  @override
  String get emptyValue => '(Leeg)';

  @override
  String get tnfEmpty => '0: Empty (Leeg)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (Onbekend)';

  @override
  String get tnfUnchanged => '6: Unchanged (Onafgebroken NDEF)';

  @override
  String get tnfReserved => '7: Reserved (Gereserveerd)';

  @override
  String get ntagUnsupportedChip =>
      'Deze bewerking wordt alleen ondersteund op NTAG213/215/216 en MIFARE Ultralight EV1 tags.';

  @override
  String ntagPageReadFailed(String page) {
    return 'Kon pagina $page niet lezen (tag reageerde niet of gebied is beveiligd).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'Kon pagina $page niet schrijven: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'Kon pagina $page niet schrijven (geweigerd; vergrendeld of beveiligd).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'Kon na pagina $page niet lezen; dit gebied is mogelijk met een wachtwoord beveiligd.';
  }

  @override
  String get ntagPasswordPackSize =>
      'Wachtwoord moet 4 bytes zijn en PACK 2 bytes.';

  @override
  String get ntagPasswordSize => 'Wachtwoord moet 4 bytes zijn.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'Onjuist wachtwoord of tag heeft verificatie geweigerd.';

  @override
  String get ntagPasswordWrong => 'Onjuist wachtwoord.';

  @override
  String get ntagCcInvalid =>
      'CC-gebied heeft een niet-NDEF-waarde; dit OTP-gebied kan niet worden geformatteerd.';

  @override
  String get ntagDumpTooShort =>
      'Dumpbestand is te kort; bevat geen gebruikersgegevens.';

  @override
  String get ntagInvalidHex =>
      'Voer een geldige hexadecimale waarde in (bijv.: 30 04).';

  @override
  String get googleReviewFieldLabel => 'Beoordelingslink of Place ID';

  @override
  String get menuLinkFieldLabel => 'Menulink';

  @override
  String get menuTitleHint => 'Ons menu';

  @override
  String get petName => 'Naam van huisdier';

  @override
  String get ownerPhone => 'Telefoon van eigenaar';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'Hallo, ik ben $pet! Bel alsjeblieft mijn eigenaar: $phone$note';
  }

  @override
  String get bloodType => 'Bloedgroep';

  @override
  String get allergies => 'Allergieën / Medicijnen';

  @override
  String get emergencyContact => 'Noodcontact';

  @override
  String get emergencyInfo => 'NOODINFORMATIE';

  @override
  String emergencyBlood(String blood) {
    return 'Bloedgroep: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'Allergieën: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'Bel in noodgeval: $contact';
  }

  @override
  String get storeLink => 'Store-link';

  @override
  String get link => 'Link';

  @override
  String get title => 'Titel';

  @override
  String get webAddress => 'Webadres';

  @override
  String get address => 'Adres';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'Sjablonen: $added toegevoegd, $updated bijgewerkt';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'Tagnotities/Regels: $added toegevoegd, $updated bijgewerkt';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'Scangeschiedenis overgeslagen omdat deze is uitgeschakeld: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'Geschiedenis: $added toegevoegd, $skipped overgeslagen';
  }

  @override
  String get backupSummaryNoNewData =>
      'Geen nieuwe gegevens gevonden om te importeren (overeenkomend met bestaande).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field moet een tekenreeks zijn.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field moet een geldige datum zijn.';
  }

  @override
  String get rawTypeHexLabel => 'Type (Hex-bytes)';

  @override
  String get rawIdHexLabel => 'ID (Hex-bytes, optioneel)';

  @override
  String get rawPayloadHexLabel => 'Payload (Hex-bytes)';

  @override
  String get rawOptionalHexHint => 'Optionele hex-bytes';

  @override
  String get saveChanges => 'Wijzigingen opslaan';

  @override
  String get edit => 'Bewerken';

  @override
  String get clearAllButton => 'Alles wissen';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: $count pagina\'s gelezen';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip geformatteerd';
  }

  @override
  String get ntagInvalidDumpFile =>
      'Ongeldig dumpbestand (moet een veelvoud van 4 bytes zijn, 32-1024 bytes).';

  @override
  String ntagPagesWritten(int count) {
    return '$count pagina\'s geschreven';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: wachtwoordbeveiliging ingeschakeld';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: wachtwoord verwijderd';
  }

  @override
  String get memoryDumpCopied => 'Geheugendump gekopieerd';

  @override
  String ntagCommandsSent(int count) {
    return '$count opdrachten verzonden';
  }

  @override
  String get emptyResponse => '(leeg antwoord)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages pagina\'s · $bytes bytes';
  }

  @override
  String get composeTextEmpty => 'Tekstinhoud mag niet leeg zijn.';

  @override
  String get composeTextTooLong => 'Tekst is te lang (maximaal 5000 tekens).';

  @override
  String get composeUrlInvalid =>
      'Voer een geldig adres in (bijv. https://example.com of app:// link).';

  @override
  String get composeUrlTooLong => 'URL is te lang (maximaal 2000 tekens).';

  @override
  String get composeEmailInvalid =>
      'Voer een geldig e-mailadres in (bijv. naam@domein.com).';

  @override
  String get composePhoneInvalid =>
      'Voer een geldig telefoonnummer in (bijv. +905551234567).';

  @override
  String get composeSmsPhoneInvalid =>
      'Voer een geldig telefoonnummer van de ontvanger in.';

  @override
  String get composeLatInvalid => 'Breedtegraad moet tussen -90 en +90 liggen.';

  @override
  String get composeLngInvalid =>
      'Lengtegraad moet tussen -180 en +180 liggen.';

  @override
  String get composeVcardNameEmpty => 'Contactnaam mag niet leeg zijn.';

  @override
  String get composeVcardNameTooLong =>
      'Contactnaam is te lang (maximaal 200 tekens).';

  @override
  String get composeVcardEmailInvalid => 'Voer een geldig e-mailadres in.';

  @override
  String get composeVcardPhoneInvalid => 'Voer een geldig telefoonnummer in.';

  @override
  String get composeVcardUrlInvalid =>
      'Voer een geldig webadres in (bijv. https://...).';

  @override
  String get composeCalSummaryEmpty => 'Evenementtitel mag niet leeg zijn.';

  @override
  String get composeCalSummaryTooLong =>
      'Evenementtitel is te lang (maximaal 250 tekens).';

  @override
  String get composeCalDateInvalid => 'Eindtijd moet na starttijd liggen.';

  @override
  String get composeSpUriInvalid =>
      'Voer een geldige doel-URL in (bijv. https://...).';

  @override
  String get composeSpLangInvalid =>
      'Voer een geldige ISO-taalcode in (bijv. nl, en).';

  @override
  String get composeMimeTypeInvalid =>
      'Voer een geldig MIME-type in (bijv. application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'Voer een geldige hex-tekenreeks in (even aantal hex-tekens).';

  @override
  String get composeMimePayloadTooLarge =>
      'Payload-grootte is te groot (maximaal 10 KB).';

  @override
  String get composeWifiSsidEmpty => 'Netwerknaam (SSID) mag niet leeg zijn.';

  @override
  String get composeWifiPasswordRequired =>
      'Wi-Fi-wachtwoord is vereist voor versleutelde netwerken.';

  @override
  String get composeWifiPasswordLength =>
      'WPA/WPA2-wachtwoord moet tussen 8 en 63 tekens lang zijn.';

  @override
  String get composeEditNdefRecord => 'NDEF-record bewerken';

  @override
  String get composeNewNdefRecord => 'Nieuw NDEF-record maken';

  @override
  String get quickLinksHeader => 'Snelle links';

  @override
  String get quickLinkCustomUri => 'Aangepaste URI';

  @override
  String get quickLinkSocial => 'Sociale netwerken';

  @override
  String get quickLinkVideo => 'Video';

  @override
  String get quickLinkSearch => 'Zoeken';

  @override
  String get quickLinkFile => 'Bestand';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime Audio';

  @override
  String get quickLinkAddress => 'Adres';

  @override
  String get quickLinkPayment => 'Betaallink';

  @override
  String get quickLinkApp => 'App (Android)';

  @override
  String get updateRecord => 'Record bijwerken';

  @override
  String get addToList => 'Toevoegen aan lijst';

  @override
  String get quickCustomUriError =>
      'Voer een adres met schema in (bijv. spotify:track:... of myapp://pagina).';

  @override
  String get quickFileEmptyMessage => 'Voer de bestandslink in.';

  @override
  String get quickPaymentEmptyMessage => 'Voer de betaallink in.';

  @override
  String get quickCustomUriDesc =>
      'Elk adres met een schema is mogelijk; de telefoon opent de ondersteunende app.';

  @override
  String get quickSocialLabel => 'Sociaal netwerk';

  @override
  String get quickVideoLabel => 'Videolink';

  @override
  String get quickVideoHint => 'https://youtu.be/... of video-ID';

  @override
  String get quickVideoDesc =>
      'YouTube-, Vimeo- enz. link of alleen YouTube-video-ID kan worden ingevoerd.';

  @override
  String get quickSearchHint => 'bijv. Weer Amsterdam';

  @override
  String get quickFileLabel => 'Bestandslink';

  @override
  String get quickFileDesc =>
      'Wegens beperkte tagcapaciteit wordt de weblink opgeslagen in plaats van het bestand zelf.';

  @override
  String get quickPhoneOrAppleId => 'Telefoon of Apple ID';

  @override
  String get quickFacetimeVideoDesc =>
      'Een iPhone die de tag aanraakt, start een FaceTime-videogesprek.';

  @override
  String get quickFacetimeAudioDesc =>
      'Een iPhone die de tag aanraakt, start alleen een FaceTime-audiogesprek.';

  @override
  String get quickMapProvider => 'Kaarten-app';

  @override
  String get quickAddressHint => 'bijv. Dam 1, Amsterdam';

  @override
  String get quickPaymentDesc =>
      'Betaallinks zoals PayPal.me, Stripe kunnen worden gebruikt. Kaartgegevens worden nooit op de tag geschreven.';

  @override
  String get quickAppDesc =>
      'Android-telefoons openen deze app bij aantikken (of Play Store). iPhone negeert dit type; voeg App Store-link als URL toe.';

  @override
  String get quickDeviceNameOptional => 'Apparaatnaam (optioneel)';

  @override
  String get quickSpeakerHint => 'bijv. Luidspreker';

  @override
  String get quickBluetoothDesc =>
      'Android-telefoons stellen koppeling voor bij aantikken. iPhone ondersteunt geen Bluetooth-koppelingstags.';

  @override
  String get composeTextContent => 'Tekstinhoud';

  @override
  String get composeTextHint => 'Voer de tekst in die u wilt schrijven';

  @override
  String get composeEmailSubjectOptional => 'Onderwerp (optioneel)';

  @override
  String get composeEmailBodyOptional => 'Berichttekst (optioneel)';

  @override
  String get composeSmsRecipient => 'Telefoonnummer ontvanger';

  @override
  String get composeSmsHint => 'Te verzenden sms-bericht...';

  @override
  String get composeVcardFullName => 'Volledige naam (weergavenaam) *';

  @override
  String get composeVcardNameHint => 'Jan Jansen';

  @override
  String get composeVcardNote => 'Notitie / beschrijving';

  @override
  String get composeCalTitle => 'Evenementtitel *';

  @override
  String get composeCalTitleHint => 'Projectvergadering';

  @override
  String get composeCalLocationHint => 'Vergaderruimte 2 of online';

  @override
  String get composeCalDesc => 'Evenementbeschrijving';

  @override
  String get composeCalStartEndTime => 'Begin- en eindtijd:';

  @override
  String get composeSpTitleLabel => 'Titel (weergavetekst)';

  @override
  String get composeSpTitleHint => 'Bedrijfsbrochure';

  @override
  String get composeMimeTypeLabel => 'MIME-type *';

  @override
  String get composeDataFormat => 'Gegevensindeling: ';

  @override
  String get composeFormatHex => 'Hexadecimaal';

  @override
  String get composeMimeHexBytes => 'Hex-bytes *';

  @override
  String get composeMimeTextPayload => 'Payload-tekst (UTF-8) *';

  @override
  String get composeWifiWarningTitle => 'Beveiligings- en platformmelding:';

  @override
  String get composeWifiWarningBody =>
      '• Het Wi-Fi-wachtwoord wordt als leesbare tekst opgeslagen en kan door iedereen worden gelezen.\n• Automatische verbinding is niet gegarandeerd; gebruikersbevestiging kan vereist zijn.';

  @override
  String get composeWifiSsidLabel => 'Netwerknaam (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'Beveiligingstype (authenticatie)';

  @override
  String get composeWifiOpenNetwork => 'Open netwerk (geen)';

  @override
  String get composeWifiPasswordLabel => 'Wi-Fi-wachtwoord *';

  @override
  String get composeWifiEncryptionLabel => 'Versleutelingstype';

  @override
  String get composeWifiAesRecommended => 'AES (aanbevolen)';

  @override
  String get quickSearchTextLabel => 'Te zoeken tekst';

  @override
  String get readTagMemoryPrompt =>
      'Houd de tag bij de telefoon om het geheugen te lezen';

  @override
  String get readingTagMemoryStatus => 'Geheugen lezen...';

  @override
  String get formatTagConfirmTitle => 'Geheugen formatteren';

  @override
  String get formatTagConfirmMessage =>
      'Gegevens op de tag worden gewist en voorbereid als blanco NDEF. Doorgaan?';

  @override
  String get formatButton => 'Formatteren';

  @override
  String get formatTagPrompt => 'Houd tag bij telefoon om te formatteren';

  @override
  String get formattingStatus => 'Formatteren...';

  @override
  String filePickerFailed(String error) {
    return 'Bestandskiezer mislukt: $error';
  }

  @override
  String get writeButton => 'Schrijven';

  @override
  String get writeDumpPrompt => 'Houd tag bij telefoon om dump te schrijven';

  @override
  String get writingDumpStatus => 'Dump schrijven...';

  @override
  String get setPasswordWarning =>
      'Als u het wachtwoord vergeet, kunt u de inhoud niet meer wijzigen. Lezen blijft voor iedereen open.';

  @override
  String get setPasswordAction => 'Wachtwoord instellen';

  @override
  String get setPasswordPrompt =>
      'Houd tag bij telefoon om wachtwoord in te stellen';

  @override
  String get settingPasswordStatus => 'Wachtwoord instellen...';

  @override
  String get removePasswordPromptMessage =>
      'Voer het eerder ingestelde wachtwoord in.';

  @override
  String get remove => 'Verwijderen';

  @override
  String get removePasswordPrompt =>
      'Houd tag bij telefoon om wachtwoord te verwijderen';

  @override
  String get removingPasswordStatus => 'Wachtwoord verwijderen...';

  @override
  String get sendCommandsPrompt =>
      'Houd tag bij telefoon om commando\'s te sturen';

  @override
  String get sendingCommandsStatus => 'Commando\'s verzenden...';

  @override
  String get sendButton => 'Verzenden';

  @override
  String get tagNoteEditTitle => 'Tag-notitie bewerken';

  @override
  String get tagNoteInputLabel => 'In-app notitie / beschrijving';

  @override
  String get tagNoteInputHint =>
      'bijv. Vergaderruimte-info of Magazijnstelling #12';

  @override
  String get tagNoteDeleteTitle => 'Tag-notitie verwijderen';

  @override
  String get clearAllTagRulesTitle => 'Alle notities verwijderen';

  @override
  String get clearAllTagRulesConfirm =>
      'Alle opgeslagen in-app tagnotities worden gewist. Bevestigen?';

  @override
  String get deleteAll => 'Alles verwijderen';

  @override
  String get tagRulesExplanation =>
      'Alleen de opgeslagen notitie wordt weergegeven voor tags die overeenkomen met de NDEF SHA-256-digest.';

  @override
  String get noTagRulesDefined => 'Nog geen tagnotities gedefinieerd.';

  @override
  String lastUpdated(String time) {
    return 'Laatst bijgewerkt: $time';
  }

  @override
  String get tagLibraryNoMatch => 'Geen tags gevonden voor uw zoekopdracht.';

  @override
  String get tagLibraryAddToLibrary => 'Toevoegen aan bibliotheek';

  @override
  String get name => 'Naam';

  @override
  String get tagLibraryAddTag => 'Tag toevoegen';

  @override
  String get all => 'Alle';

  @override
  String tagLibraryPhotoError(String error) {
    return 'Foto kiezen mislukt: $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'Tag verwijderen';

  @override
  String get tagLibraryNameHint => 'bijv. Kantoorsleutelhanger';

  @override
  String get tagLibraryNoTagContent => 'Geen taginhoud in dit record.';

  @override
  String get tagLibrarySourceLastScanned => 'Laatst gescand';

  @override
  String get tagLibraryEmpty => 'Nog geen opgeslagen tags.';

  @override
  String get tagLibrarySourceEmpty => 'Leeg record';

  @override
  String get tagLibraryNamePrompt => 'Voer een tagnaam in';

  @override
  String get tagLibrarySearchHint => 'Zoeken op naam, categorie of locatie...';

  @override
  String get tagLibrarySourceWriteList => 'Schrijflijst';

  @override
  String get tagLibraryLocationHint => 'bijv. Bureau, Voordeur';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return 'Weet u zeker dat u tag \"$name\" uit de bibliotheek wilt verwijderen?';
  }

  @override
  String get noContent => 'Geen inhoud';

  @override
  String tagLibraryRecordSummary(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count NDEF-records',
      one: '1 NDEF-record',
    );
    return '$_temp0';
  }

  @override
  String get tagLibraryEditTag => 'Tag bewerken';

  @override
  String get rawTypeHexHint => '41 (A) of 55 (U) enz.';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: Veld \"records\" moet een lijst zijn.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: Een item mag maximaal $max NDEF-records bevatten.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - Record #$index is geen geldig object.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - Record #$index: Ongeldige TNF-waarde ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - Record #$index: \"type\" moet een Base64-tekenreeks zijn.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - Record #$index: \"type\" is geen geldige Base64-data ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - Record #$index: \"id\" moet een Base64-tekenreeks zijn.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - Record #$index: \"id\" is geen geldige Base64-data ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - Record #$index: \"payload\" moet een Base64-tekenreeks zijn.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - Record #$index: \"payload\" is geen geldige Base64-data ($error).';
  }

  @override
  String get composerUndoSnack => 'Laatste wijziging ongedaan gemaakt.';

  @override
  String get composerRedoSnack => 'Wijziging opnieuw toegepast.';

  @override
  String get noRecordsToCopy => 'Geen NDEF-records om te kopiëren.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count NDEF-records ($bytes B) naar klembord gekopieerd.\n(Alleen NDEF-inhoud wordt gekopieerd; UID of gecodeerde sectoren worden nooit gekloond)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: $count records toegevoegd.';
  }

  @override
  String get tagEmptyNoRecordsToImport =>
      'Tag is leeg; geen records om te importeren.';

  @override
  String get sourceTag => 'Van tag';

  @override
  String get sourceQr => 'Van QR-code';

  @override
  String filePickerError(String error) {
    return 'Kan bestandskiezer niet openen: $error';
  }

  @override
  String get csvFileTooLarge => 'CSV-bestand is te groot (maximaal 512 KB).';

  @override
  String get noRecordsFound => 'Geen records gevonden';

  @override
  String get someRowsSkipped => 'Sommige rijen overgeslagen';

  @override
  String get expectedFormat => 'Verwachte indeling:';

  @override
  String get noClipboardContent => 'Geen NDEF-inhoud op het klembord.';

  @override
  String get pasteFromClipboardTitle => 'Plakken van NDEF-klembord';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'Klembordgegevens: $count records, $bytes bytes ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      'Wilt u de huidige records vervangen of toevoegen aan het einde?';

  @override
  String get pasteOverwriteOption => 'Overschrijven (Vervangen)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'Huidige $count records worden gewist en vervangen door klembord (bevestiging vereist).';
  }

  @override
  String get pasteEmptySubtitle =>
      'Klembord-inhoud wordt in de opsteller geplaatst.';

  @override
  String get pasteAppendOption => 'Toevoegen aan einde';

  @override
  String get pasteAppendSubtitle =>
      'Bestaande records blijven behouden; klembord-records worden aan het einde toegevoegd.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count records toegevoegd.';
  }

  @override
  String get confirmOverwriteTitle => 'Records overschrijven?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'Er zijn $currentCount records. Ze worden vervangen door $newCount records van het klembord. Doorgaan?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'Records vervangen door $count nieuwe records.';
  }

  @override
  String get yesReplace => 'Ja, vervangen';

  @override
  String recordsImportedToComposer(num count) {
    return '$count records geïmporteerd.';
  }

  @override
  String get noContentToCopy => 'Geen NDEF-inhoud gevonden om te kopiëren.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count NDEF-records gekopieerd en toegevoegd (Inhoud gekopieerd, UID niet gekloond).';
  }

  @override
  String get noContentToRewrite =>
      'Geen NDEF-inhoud gevonden om te herschrijven.';

  @override
  String get rewriteTagTitle => 'Tag herschrijven';

  @override
  String get importantNotice => 'BELANGRIJKE KENNISGEVING:';

  @override
  String get rewriteNotice1 =>
      '• Deze bewerking OVERSCHRIJFT de bestaande NDEF-inhoud volledig; voegt niet toe.\n';

  @override
  String get rewriteNotice2 =>
      '• De doeltag moet een beschrijfbare (ontgrendelde) NDEF-tag zijn.\n';

  @override
  String get rewriteNotice3 =>
      '• Schrijft niet stilletjes naar de vorige tag; een nieuwe NFC-aanraking is vereist.';

  @override
  String get rewriteInstruction =>
      'Bereid de tag voor, tik op \"Aantikken en schrijven\" en houd de tag bij de telefoon.';

  @override
  String get tapAndWrite => 'Aantikken en schrijven';

  @override
  String get rewritePromptMessage =>
      'Houd de doeltag bij het apparaat (inhoud wordt volledig vernieuwd)';

  @override
  String get writeVerifiedTitle => 'Schrijven geverifieerd';

  @override
  String get writeVerifiedDesc =>
      'NDEF-inhoud is succesvol geschreven en geverifieerd op de tag.';

  @override
  String get writeVerifiedHint =>
      'U kunt de volgende scan starten om geschreven gegevens te verifiëren.';

  @override
  String get scanAndCompareNow => 'Nu scannen en vergelijken';

  @override
  String get contentMatchesExactly => 'Inhoud komt exact overeen';

  @override
  String get differenceDetected => 'Verschil gedetecteerd';

  @override
  String get compareMatchDesc =>
      'Het NDEF-bericht op de tag komt byte voor byte overeen met de bron.';

  @override
  String get compareDiffDesc =>
      'Verschil tussen gelezen en beoogde gegevens. Controleer of de tag vergrendeld is.';

  @override
  String get batchEmptyComposerError =>
      'Voeg ten minste één record toe voordat u batchgewijs schrijft.';

  @override
  String get batchWriteTitle => 'Batchgewijs tags schrijven';

  @override
  String get batchWriteSubtitle =>
      'Schrijf dezelfde NDEF-inhoud achtereenvolgens naar meerdere tags.';

  @override
  String get attention => 'LET OP:';

  @override
  String get batchNotice1 =>
      '• Om dubbel schrijven te voorkomen, wordt elke schrijfactie gestart met \"Volgende schrijven\".\n';

  @override
  String get batchNotice2 =>
      '• Geen automatische continue scans; tags moeten fysiek worden gewisseld.';

  @override
  String get batchStartButton => 'Batch-schrijven starten';

  @override
  String get batchControlPanelTitle => 'Bedieningspaneel batch-schrijven';

  @override
  String get batchCancelOrClose => 'Annuleren / Sluiten';

  @override
  String get batchAllCompleted => 'Alle tag-pogingen voltooid!';

  @override
  String batchStats(String ok, String failed, String left) {
    return 'Gelukt: $ok | Mislukt: $failed | Resterend: $left';
  }

  @override
  String get waitingForTag => 'Wachten op tag...';

  @override
  String get batchFinishButton => 'Batch-schrijven afronden';

  @override
  String get writeError => 'Schrijffout';

  @override
  String get batchConfirmCancelTitle => 'Batch-schrijven annuleren';

  @override
  String get batchConfirmCancelMessage =>
      'Batch-sessie beëindigen? Reeds geschreven tags blijven behouden; resterende tags worden niet geschreven.';

  @override
  String get cancelled => 'Geannuleerd';

  @override
  String get batchCancelledSnack =>
      'Batch-schrijven geannuleerd. Uw inhoud is bewaard.';

  @override
  String get cancelAndClose => 'Annuleren en sluiten';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'Offline URL-analyse';

  @override
  String get urlSafetyScheme => 'Schema (Protocol):';

  @override
  String get urlSafetyPort => 'Poort:';

  @override
  String get urlSafetyUserInfoLabel => 'Gebruikersinfo:';

  @override
  String get urlSafetyIpLiteral => 'Direct IP-adres:';

  @override
  String get urlSafetyDomain => 'Nee (Domeinnaam)';

  @override
  String get urlSafetyPunycodeLabel => 'Internationaal / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => 'Ja (Verdachte homoglyfe)';

  @override
  String get urlSafetyWarningsHeader =>
      'Beveiligings- / waarschuwingsmeldingen:';

  @override
  String get urlSafetyDisclaimer =>
      'OPMERKING: Offline analyse. Geen online malwarecontrole. URL wordt niet automatisch geopend.';

  @override
  String get templateSaveEmptyError =>
      'Voeg records toe voordat u opslaat als sjabloon.';

  @override
  String templateDefaultName(String n) {
    return 'Sjabloon $n';
  }

  @override
  String get templateNameSample => 'bijv. Bedrijfswebsite & Contact';

  @override
  String get templateSavedSnack => 'Sjabloon opgeslagen.';

  @override
  String get ruleNoteRequiresNdef =>
      'Tag moet ten minste één NDEF-record bevatten om een notitie toe te voegen.';

  @override
  String get ruleNoteAddTitle => 'Aangepaste tagnotitie toevoegen';

  @override
  String get ruleNoteDigestExplanation =>
      'Gekoppeld aan NDEF SHA-256-digest. Toont alleen deze beschrijving bij scannen.';

  @override
  String get ruleNoteSavedSnack => 'Tag-notitie opgeslagen.';

  @override
  String get ruleNoteDeleteConfirm =>
      'De in-app notitie voor deze tag wordt verwijderd. Doorgaan?';

  @override
  String get ruleNoteDeletedSnack => 'Tag-notitie verwijderd.';

  @override
  String get backupExportTitle => 'Backup exporteren';

  @override
  String get backupExportWarningTitle => 'PRIVACY- EN VEILIGHEIDSWAARSCHUWING';

  @override
  String get backupExportWarningBody =>
      'Het exportbestand (JSON) is platte tekst. Het kan gevoelige gegevens bevatten zoals Wi-Fi-wachtwoorden. Veilig bewaren.';

  @override
  String get backupIncludedItems => 'Op te nemen items:';

  @override
  String backupTemplatesCount(String count) {
    return '• Sjablonen: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• Tagnotities/-regels: $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Scan-geschiedenis opnemen (optioneel)';

  @override
  String backupHistoryCount(String count) {
    return '$count geschiedenisitems';
  }

  @override
  String get backupHistoryDisabled =>
      'Scangeschiedenis is uitgeschakeld op dit apparaat';

  @override
  String get backupExportAndShare => 'Exporteren en delen';

  @override
  String get backupFileNameLabel => 'NFC Tag Master back-upbestand';

  @override
  String get backupFileShareSubject =>
      'NFC Tag Master sjabloon- en gegevensback-up (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'Back-upbestand succesvol geëxporteerd en gedeeld.';

  @override
  String get backupExportCancelled => 'Export delen geannuleerd.';

  @override
  String get backupImportTitle => 'Backup importeren';

  @override
  String get backupMergeRuleTitle => 'BEVEILIGINGS- EN SAMENVOEGINGSBELEID';

  @override
  String get backupMergeRule1 =>
      '• Importeren werkt via SAMENVOEGEN; bestaande gegevens worden NOOIT gewist.\n';

  @override
  String get backupMergeRule2 =>
      '• Bestanden kunnen Wi-Fi-wachtwoorden bevatten; laad alleen van vertrouwde bronnen.\n';

  @override
  String get backupMergeRule3 =>
      '• Maximale bestandsgrootte: 2 MiB. Strikte schema- en Base64-validatie vóór het laden.';

  @override
  String get backupSelectFilePrompt =>
      'Selecteer een geldig .json-back-upbestand om samen te voegen.';

  @override
  String get selectFileButton => 'Bestand kiezen';

  @override
  String get fileSelectionCancelled => 'Bestandsselectie geannuleerd.';

  @override
  String get backupFileExceedsLimit =>
      'Geselecteerd bestand overschrijdt de toegestane limiet van 2 MiB.';

  @override
  String fileReadError(String error) {
    return 'Fout bij lezen bestand: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Fout bij controle back-up: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Scangeschiedenis gedetecteerd';

  @override
  String get backupHistoryDetectedPrompt =>
      'Wilt u de geschiedenis importeren en inschakelen? Of alleen sjablonen en notities laden?';

  @override
  String get backupSkipHistoryOption =>
      'Geschiedenis overslaan (alleen sjablonen en notities laden)';

  @override
  String get backupEnableHistoryOption => 'Geschiedenis inschakelen en laden';

  @override
  String get nfcReadyStatus => 'NFC gereed';

  @override
  String get nfcReadyDesc => 'NFC-hardware is actief en klaar voor gebruik';

  @override
  String get nfcDisabledStatus => 'NFC uitgeschakeld';

  @override
  String get nfcDisabledDesc =>
      'NFC is uitgeschakeld. Schakel het in via apparaatinstellingen.';

  @override
  String get template => 'Sjabloon';

  @override
  String get nfcScannerTitle => 'NFC-scanner';

  @override
  String get composeRecord => 'Record maken';

  @override
  String get protectOrRemove => 'Beveiligen / verwijderen';

  @override
  String get previousScans => 'Eerdere scans';

  @override
  String get noScannedTagYet => 'Nog geen NFC-tag gescand';

  @override
  String get tapScanPrompt =>
      'Tik op \"Scan starten\" en houd de tag bij uw telefoon.';

  @override
  String get ndefCopyAndRewriteTitle => 'NDEF-inhoud kopiëren en herschrijven';

  @override
  String get savedTagNoteHeader => 'Opgeslagen tagnotitie (in-app regel)';

  @override
  String get tagNoteOrRule => 'Tagnotitie / regel';

  @override
  String get editNote => 'Notitie bewerken';

  @override
  String get deleteNote => 'Notitie verwijderen';

  @override
  String get tagNoteDigestNotice =>
      'Komt overeen met de SHA-256-digest van de exacte NDEF-bytes. Start geen externe acties.';

  @override
  String get addCustomTagNotePrompt =>
      'U kunt een aangepaste lokale notitie toevoegen voor deze NDEF-inhoud.';

  @override
  String get addNoteToThisTag => 'Notitie aan deze tag toevoegen';

  @override
  String get ndefSupport => 'NDEF-ondersteuning:';

  @override
  String get usedSpace => 'Gebruikte ruimte:';

  @override
  String get freeSpace => 'Vrije ruimte:';

  @override
  String get noNdefMessageOnTag => 'Geen NDEF-bericht gevonden op tag.';

  @override
  String get hideDetails => 'Details verbergen';

  @override
  String get advancedRecordInspector => 'Record-inspecteur (Geavanceerd)';

  @override
  String get ndefRecordInspectorTitle => 'NDEF-recordinspecteur (Geavanceerd)';

  @override
  String get inspectorType => 'Type:';

  @override
  String get inspectorPayloadLength => 'Payload-lengte:';

  @override
  String get inspectorRawHexPreview => 'Ruwe Hex-preview (beperkt):';

  @override
  String get ndefRecordsToWriteTitle => 'Te schrijven NDEF-records';

  @override
  String get pasteFromClipboardAction =>
      'Plakken van klembord (Vervangen / Toevoegen)';

  @override
  String get importAction => 'Importeren';

  @override
  String get importFromTagAction => 'Importeren van NFC-tag';

  @override
  String get importFromQrAction => 'Importeren van QR-code';

  @override
  String get importFromCsvAction => 'Importeren uit CSV-bestand';

  @override
  String get composerEmptyDescription =>
      'U kunt tekst, weblinks, Wi-Fi, telefoon, e-mail, contactkaarten en meer schrijven.';

  @override
  String get urlSafetyReview => 'URL-beoordeling';

  @override
  String get inspector => 'Inspecteur';

  @override
  String get typeLabel => 'Type:';

  @override
  String get payloadLabel => 'Payload:';

  @override
  String get writeAndVerify => 'Naar tag schrijven en verifiëren';

  @override
  String get batchWriteButtonLabel => 'Batch-tag schrijven (2..100 tags)';

  @override
  String get clearTagButtonLabel => 'Tag resetten (inhoud wissen)';

  @override
  String get confirmWriteTitle => 'Schrijven naar tag bevestigen';

  @override
  String get confirmWriteMessage1 =>
      'Deze bewerking OVERSCHRIJFT de bestaande NDEF-inhoud van de doeltag volledig.';

  @override
  String get confirmWriteMessage2 =>
      'Zorg dat de tag beschrijfbaar is. De inhoud wordt na het schrijven geverifieerd.';

  @override
  String get yesWrite => 'Ja, schrijven';

  @override
  String get scanHistoryDisabledTitle => 'Scangeschiedenis uitgeschakeld';

  @override
  String get scanHistoryDisabledDesc =>
      'Wegens privacy wordt geschiedenis standaard niet opgeslagen. Schakel in via instellingen.';

  @override
  String get enableHistory => 'Geschiedenis inschakelen';

  @override
  String get historySearchHint =>
      'Zoeken op UID, tekst of type (bijv. URL, Wi-Fi, 04A1...)';

  @override
  String get noHistoryYet => 'Nog geen scangeschiedenis opgeslagen.';

  @override
  String get tryDifferentQuery =>
      'Probeer een andere UID, tekstinhoud of recordtype.';

  @override
  String get clearSearch => 'Zoekopdracht wissen';

  @override
  String get deleteThisRecord => 'Dit record verwijderen';

  @override
  String get qrPreview => 'QR-preview';

  @override
  String get lockTagConfirmTitle => 'Tag permanent vergrendelen';

  @override
  String get lockTagWarning2 =>
      'Zorg dat u eerst de juiste inhoud heeft geschreven.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'QR-code voorbeeld';

  @override
  String get unknownParentheses => '(Onbekend)';

  @override
  String get ok => 'OK';

  @override
  String rewriteSourceUid(String uid) {
    return 'Bron-UID: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return 'Te schrijven records: $count';
  }

  @override
  String rewriteFailed(String message) {
    return 'Herschrijven mislukt: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return 'Geschreven records: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'UID gescande tag: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return 'Geschreven data: $count records ($bytes bytes)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'Gescande data: $count records ($bytes bytes)';
  }

  @override
  String batchTargetCount(String count) {
    return 'Doeltags: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return 'Schrijflijst: $count records ($bytes bytes)';
  }

  @override
  String batchNext(String current, String total) {
    return 'Volgende: tag #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return 'Gelukt ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return 'Mislukt: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'Tag #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'Tik en schrijf tag #$n';
  }

  @override
  String batchPrompt(String current, String total) {
    return 'Batch schrijven: houd tag #$current / $total bij de telefoon';
  }

  @override
  String batchWrittenVerified(String count) {
    return '$count records geschreven en geverifieerd';
  }

  @override
  String templateLoaded(String name) {
    return 'Records uit \"$name\" zijn aan de schrijflijst toegevoegd.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'NDEF-inhoudsdigest (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return 'Exportfout: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'De back-up bevat $count scanitems, maar de geschiedenis staat uit op dit apparaat.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'Import geslaagd:\n$summary';
  }

  @override
  String mergeError(String error) {
    return 'Fout bij samenvoegen: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'NDEF-klembord: $count records ($bytes B) - $source';
  }

  @override
  String get heroScanSubtitle =>
      'Houd de tag bij de bovenkant van je telefoon; inhoud, capaciteit en serienummer verschijnen direct.';

  @override
  String lastTagLabel(String uid) {
    return 'Laatste tag: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'Scanfout: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count records ($bytes bytes) - alleen NDEF-data, de UID wordt niet gekopieerd.';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'Tag $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'Fout: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return 'Gelezen NDEF-records ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return 'Te schrijven NDEF-records ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return 'Let op: de payload is $bytes bytes, alleen de eerste 64 worden getoond.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return 'Totale grootte: $bytes bytes | Records: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return 'Schrijven en controleren ($bytes bytes)';
  }

  @override
  String savedScansCount(String count) {
    return 'Opgeslagen scans: $count';
  }

  @override
  String historyNoResults(String query) {
    return 'Geen resultaten voor \"$query\".';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count records';
  }

  @override
  String historyCapacity(String max, String used) {
    return 'Capaciteit: $max B | Gebruikt: $used B';
  }

  @override
  String historySourceLabel(String uid) {
    return 'Geschiedenis UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count records | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return 'Opgeslagen regels/notities: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return 'Geschreven bytes: $bytes | Verificatie: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'Een vergrendelde tag wordt alleen-lezen: de inhoud kan NOOIT meer worden gewijzigd of gewist en de vergrendeling is DEFINITIEF. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'Berichtgrootte: $bytes bytes';
  }

  @override
  String bytesShort(String bytes) {
    return 'Bytes: $bytes B';
  }

  @override
  String bytesValue(String bytes) {
    return '$bytes bytes';
  }

  @override
  String bytesOfCapacity(String bytes, String max) {
    return '$bytes / $max bytes';
  }

  @override
  String get valueNone => 'Geen';

  @override
  String get valueYesIp => 'Ja (IP-adres)';

  @override
  String get nfcMissingShort => 'Geen NFC';

  @override
  String get clearClipboard => 'Klembord wissen';

  @override
  String get statLibrary => 'Bibliotheek';

  @override
  String get scanTagTitle => 'Tag scannen';

  @override
  String get readingInProgress => 'Lezen...';

  @override
  String get rawMemorySubtitle => 'Ruw geheugen';

  @override
  String get copyToClipboard => 'Naar klembord kopiëren';

  @override
  String get serialUidLabel => 'Serienr. (UID):';

  @override
  String get totalCapacityLabel => 'Totale capaciteit:';

  @override
  String get technologiesLabel => 'Technologieën:';

  @override
  String get idLabel => 'Identificatie (ID):';

  @override
  String get undoTooltip => 'Ongedaan maken';

  @override
  String get clearComposer => 'Lijst wissen';

  @override
  String composerTotalSize(String bytes) {
    return 'Totale grootte: $bytes bytes';
  }

  @override
  String get yesClear => 'Ja, wissen';

  @override
  String get ssidTooLong => 'SSID mag maximaal 32 bytes zijn.';

  @override
  String get locationPlace => 'Locatie';

  @override
  String get targetWebUrl => 'Doel-URL *';

  @override
  String get languageCodeLabel => 'Taalcode (ISO 639-1) *';

  @override
  String get utf8Text => 'UTF-8-tekst';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf, grootte: $bytes bytes';
  }

  @override
  String get quickGallerySubtitle => 'Klaar met één tik';

  @override
  String get quickLibraryTitle => 'Mijn tags';

  @override
  String get quickLibrarySubtitle => 'Opgeslagen tags';

  @override
  String get saveToLibrary => 'Opslaan in bibliotheek';

  @override
  String libraryMatch(String name) {
    return 'In bibliotheek: $name';
  }

  @override
  String tagChipLabel(String chip) {
    return 'Chip: $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return 'Fabrikant: $name';
  }

  @override
  String get settingsLibrarySubtitle =>
      'Je tags met namen, notities en foto\'s';

  @override
  String get showOnboardingAgain => 'Introductie opnieuw tonen';

  @override
  String get importFromGallery => 'Toevoegen uit sjablonen';

  @override
  String get appearanceTitle => 'Weergave';

  @override
  String get themeSystem => 'Systeem';

  @override
  String get themeLight => 'Licht';

  @override
  String get themeDark => 'Donker';

  @override
  String get valuePresentRisky => 'Aanwezig (mogelijk riskant)';

  @override
  String get supportedValue => 'Ondersteund';

  @override
  String get notSupportedValue => 'Niet ondersteund';

  @override
  String get nfcUnsupportedDesc => 'NFC wordt niet ondersteund op dit apparaat';

  @override
  String get ndefTrailingData => 'Extra gegevens na het NDEF-bericht';

  @override
  String get ndefMissingEnd => 'Einde van NDEF-bericht ontbreekt';

  @override
  String vcardPhoneShort(String value) {
    return 'Tel.: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'E-mail: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return 'Bedrijf: $value';
  }

  @override
  String get pageUidLock => 'UID / Vergrendeling';

  @override
  String get pageData => 'Data';

  @override
  String get pageLock => 'Vergrendeling';

  @override
  String memoryPageLine(String page) {
    return 'Pagina $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (telefoon)';

  @override
  String get mapApple => 'Apple Kaarten';

  @override
  String get mapGoogle => 'Google Maps';

  @override
  String get whatsappMessageHint => 'Hallo, ik wil graag informatie';

  @override
  String get facetimeTargetHint => '+31612345678 of naam@icloud.com';

  @override
  String get bluetoothMacLabel => 'Bluetooth-MAC-adres';

  @override
  String get webAddressUrlLabel => 'Webadres (URL)';

  @override
  String get latitudeLabel => 'Breedtegraad (Lat)';

  @override
  String get longitudeLabel => 'Lengtegraad (Lng)';

  @override
  String get emailAddressLabel => 'E-mailadres';

  @override
  String get websiteLabel => 'Website';

  @override
  String get wifiAuthWpa2Home => 'WPA2 Personal (standaard thuis/kantoor)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 Personal (gemengd)';

  @override
  String get hostLabel => 'Host:';

  @override
  String get readOnlyLocked => 'Alleen-lezen (vergrendeld)';

  @override
  String get redoTooltip => 'Opnieuw';

  @override
  String historyFoundCount(String found, String total) {
    return 'Gevonden: $found / $total';
  }

  @override
  String get addToWriteListShort => 'Naar schrijflijst';

  @override
  String get mimeTypeHint => 'application/json of text/plain';

  @override
  String get hapticsToggle => 'Trillen';

  @override
  String get hapticsToggleSubtitle => 'Korte trilling na lezen of schrijven';

  @override
  String get soundsToggle => 'Geluiden';

  @override
  String get soundsToggleSubtitle => 'Kort systeemgeluid bij het resultaat';

  @override
  String get backupLibraryMustBeList =>
      'De tagbibliotheek moet een lijst zijn.';

  @override
  String get backupInvalidLibraryEntry => 'Ongeldig bibliotheekitem.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'De bibliotheek mag maximaal $max items bevatten.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'Bibliotheek: $added toegevoegd';
  }

  @override
  String backupLibraryCount(String count) {
    return '• Tagbibliotheek: $count (zonder foto\'s)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return 'Laatste tag: $bytes / $max B';
  }

  @override
  String get contentTooLargeForChips =>
      'Te groot voor gangbare tags; kort de tekst in of gebruik een korte link.';

  @override
  String get tagReportTitle => 'Tagrapport';

  @override
  String get tagReportSubtitle =>
      'Chip, vergrendelingen, wachtwoord en gebruik';

  @override
  String get tagReportPrompt => 'Houd de tag tegen de telefoon';

  @override
  String get tagReportBusy => 'Tag wordt gecontroleerd...';

  @override
  String tagReportDone(String chip) {
    return 'Rapport klaar: $chip';
  }

  @override
  String get unknownChip => 'Onbekende chip';

  @override
  String get yes => 'Ja';

  @override
  String get reportChip => 'Chip';

  @override
  String get reportNdefFormatted => 'NDEF-geformatteerd';

  @override
  String get reportWritable => 'Beschrijfbaar';

  @override
  String get reportStaticLock => 'Statische vergrendeling';

  @override
  String get reportDynamicLock => 'Dynamische vergrendeling';

  @override
  String get reportPassword => 'Wachtwoordbeveiliging';

  @override
  String get reportReadProtected => 'Leesbeveiligd';

  @override
  String get reportNdefUsage => 'NDEF-gebruik';

  @override
  String get reportVerdictWritable => 'Tag is klaar om te schrijven';

  @override
  String get reportVerdictRestricted => 'Tag heeft beperkingen';

  @override
  String get reportCopied => 'Rapport gekopieerd';

  @override
  String get compareTagsTitle => 'Twee tags vergelijken';

  @override
  String get compareTagsSubtitle =>
      'Controleer of een kopie gelijk is aan het origineel';

  @override
  String get compareStepFirst => 'Scan eerst de eerste (originele) tag.';

  @override
  String get compareStepSecond => 'Scan nu de tweede tag.';

  @override
  String get compareIdentical => 'Inhoud komt overeen';

  @override
  String get compareDifferent => 'Inhoud verschilt';

  @override
  String get compareSameTag => 'Dezelfde tag is twee keer gescand.';

  @override
  String get compareDifferentTags => 'Twee verschillende tags.';

  @override
  String get compareRecordSame => 'Gelijk';

  @override
  String get compareRecordChanged => 'Anders';

  @override
  String get compareRecordOnlyFirst => 'Alleen op A';

  @override
  String get compareRecordOnlySecond => 'Alleen op B';

  @override
  String get compareBothEmpty => 'Beide tags zijn leeg.';

  @override
  String capacityExceededShort(String needed, String max) {
    return 'Inhoud te groot: $needed / $max bytes';
  }

  @override
  String get verifyFailedAfterWrite =>
      'Geschreven data niet bevestigd; houd de tag langer vast.';

  @override
  String get blankTagTitle => 'Tag is nog niet klaar';

  @override
  String get blankTagBody =>
      'Deze tag is nieuw en niet geformatteerd voor NDEF. De app kan hem voorbereiden en de inhoud in één keer schrijven (NTAG en MIFARE Ultralight).';

  @override
  String get blankTagAction => 'Voorbereiden en schrijven';

  @override
  String get shareTag => 'Delen';

  @override
  String get shareAsText => 'Delen als tekst';

  @override
  String get shareAsFile => 'Delen als bestand (.json)';

  @override
  String get shareAsFileSubtitle =>
      'Records kunnen exact op een ander apparaat worden geschreven';

  @override
  String get importFromJsonFile => 'Uit tagbestand (.json)';

  @override
  String get invalidTagFile => 'Ongeldig tagbestand.';

  @override
  String get continuousScanTitle => 'Doorlopend scannen';

  @override
  String get continuousScanSubtitle =>
      'Scan tags na elkaar en deel de lijst als CSV';

  @override
  String continuousScanCount(String count) {
    return '$count tags gescand';
  }

  @override
  String get exportCsv => 'Delen als CSV';

  @override
  String get clearList => 'Lijst wissen';

  @override
  String get csvColumnTime => 'Tijd';

  @override
  String get csvColumnRecords => 'Records';

  @override
  String get csvColumnContent => 'Inhoud';

  @override
  String get csvColumnCapacity => 'Capaciteit (B)';

  @override
  String get csvColumnUsed => 'Gebruikt (B)';

  @override
  String get batchSerialToggle => 'Serienummers toevoegen';

  @override
  String batchSerialHint(String token) {
    return 'Zet $token in een record om het nummer daar te plaatsen; anders krijgt elke tag een apart tekstrecord met het nummer.';
  }

  @override
  String get batchSerialPrefix => 'Voorvoegsel';

  @override
  String get batchSerialStart => 'Start';

  @override
  String get batchSerialDigits => 'Cijfers';

  @override
  String batchSerialPreview(String first, String last) {
    return 'Eerste: $first · Laatste: $last';
  }

  @override
  String get batchFromCsvButton => 'Uit CSV-bestand (één rij per tag)';

  @override
  String get batchCsvTitle => 'Batchgewijs schrijven uit CSV';

  @override
  String batchCsvSummary(String count) {
    return 'Er worden $count tags beschreven. Elke tag krijgt op volgorde één rij uit de CSV.';
  }

  @override
  String batchCsvTruncated(String max) {
    return 'Batchgewijs schrijven gebruikt maximaal $max rijen; de rest is overgeslagen.';
  }

  @override
  String get cloneTagTitle => 'Tag klonen';

  @override
  String get cloneTagSubtitle =>
      'Lees een tag en schrijf de inhoud naar andere tags';

  @override
  String get cloneSourceStep =>
      'Stap 1: scan de brontag. Alleen de NDEF-inhoud wordt gekopieerd; de UID kan niet worden gekloond.';

  @override
  String get cloneSourceEmpty =>
      'De brontag heeft geen NDEF-records om te kopiëren.';

  @override
  String get cloneReadyTitle => 'Bron gelezen';

  @override
  String cloneReadySummary(String count, String bytes) {
    return '$count records ($bytes bytes) worden gekopieerd. Kies hoeveel tags.';
  }

  @override
  String get cloneEditFirst => 'Eerst bewerken';

  @override
  String get tapPreviewTitle => 'Wat gebeurt er als een telefoon tikt?';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'De tag is leeg; er gebeurt niets.';

  @override
  String tapIosUrl(String target) {
    return 'Er verschijnt een melding; tikken opent $target in Safari of de bijbehorende app.';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target opent direct in de browser of de bijbehorende app.';
  }

  @override
  String tapIosApp(String target) {
    return 'Er verschijnt een melding; de app opent via \"$target\" als die geïnstalleerd is.';
  }

  @override
  String tapAndroidApp(String target) {
    return 'De app opent via \"$target\" als die geïnstalleerd is.';
  }

  @override
  String tapIosCall(String target) {
    return 'Er verschijnt een melding; tikken belt $target.';
  }

  @override
  String tapAndroidCall(String target) {
    return 'De telefoon-app opent met $target.';
  }

  @override
  String tapIosSms(String target) {
    return 'Er verschijnt een melding; Berichten opent een nieuw bericht aan $target.';
  }

  @override
  String tapAndroidSms(String target) {
    return 'De berichten-app opent voor $target.';
  }

  @override
  String tapIosEmail(String target) {
    return 'Er verschijnt een melding; Mail opent een nieuwe e-mail aan $target.';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'De e-mailapp opent voor $target.';
  }

  @override
  String get tapIosMap =>
      'De iPhone opent \"geo:\"-locaties niet vanzelf. Gebruik een Apple- of Google Maps-link (Snelle links).';

  @override
  String get tapAndroidMap => 'De kaarten-app opent op deze locatie.';

  @override
  String get tapIosNeedsApp =>
      'De iPhone doet hier zelf niets mee; lees het met een NFC-app.';

  @override
  String get tapAndroidText =>
      'Op de meeste telefoons gebeurt er niets of verschijnt de tekst op een systeemscherm.';

  @override
  String get tapAndroidContact => 'Het biedt aan het contact toe te voegen.';

  @override
  String get tapAndroidWifi =>
      'Het biedt aan verbinding te maken met het netwerk (Android 10 en hoger).';

  @override
  String get tapAndroidCalendar =>
      'Als de agenda-app het ondersteunt, biedt die aan het evenement toe te voegen.';

  @override
  String get tapAndroidOther =>
      'Opent alleen als er een geschikte app is geïnstalleerd.';

  @override
  String tapIgnoredRecords(String count) {
    return 'Telefoons voeren alleen het eerste record uit; de andere $count zijn zichtbaar in NFC-apps.';
  }

  @override
  String get tapIosRequirement =>
      'iPhone XS en nieuwer lezen op de achtergrond als ze ontgrendeld zijn en Camera/Wallet niet open is.';

  @override
  String get galleryCatBusiness => 'Zakelijk';

  @override
  String get galleryCatSocial => 'Sociaal';

  @override
  String get galleryCatHome => 'Thuis';

  @override
  String get galleryCatPersonal => 'Persoonlijk';

  @override
  String get galleryCatAutomation => 'Automatisering';

  @override
  String get galleryFavorites => 'Favorieten';

  @override
  String get gallerySearchHint => 'Sjablonen zoeken...';

  @override
  String get galleryNoResults => 'Geen overeenkomende sjablonen.';

  @override
  String get galleryAddFavorite => 'Aan favorieten toevoegen';

  @override
  String get galleryRemoveFavorite => 'Uit favorieten verwijderen';

  @override
  String get presetEventTitle => 'Evenementuitnodiging';

  @override
  String get presetEventDesc =>
      'Schrijft het evenement als iCalendar; Android kan het aan de agenda toevoegen.';

  @override
  String get eventNameLabel => 'Naam evenement';

  @override
  String get eventDateLabel => 'Datum (JJJJ-MM-DD)';

  @override
  String get eventTimeLabel => 'Tijd (UU:MM)';

  @override
  String get eventDateTimeInvalid =>
      'Ongeldige datum of tijd. Voorbeeld: 2026-12-31 en 19:00';

  @override
  String get presetLuggageTitle => 'Bagagelabel';

  @override
  String get presetLuggageDesc =>
      'Raakt hij kwijt, dan kan de vinder je makkelijk bereiken.';

  @override
  String luggageMessage(String name, String contact) {
    return 'Deze bagage is van $name. Gevonden? Neem contact op: $contact';
  }

  @override
  String get presetPlaylistTitle => 'Afspeellijst';

  @override
  String get presetPlaylistDesc =>
      'Opent een Spotify-, Apple Music- of YouTube-afspeellijst.';

  @override
  String get playlistLinkLabel => 'Link naar afspeellijst';

  @override
  String get presetEmailMeTitle => 'Mail mij';

  @override
  String get presetEmailMeDesc =>
      'Opent een nieuwe e-mail aan jou met een vast onderwerp.';

  @override
  String get presetCallMeTitle => 'Bel mij';

  @override
  String get presetCallMeDesc => 'De telefoon belt jouw nummer.';

  @override
  String get presetRunShortcutTitle => 'Opdracht uitvoeren';

  @override
  String get presetRunShortcutDesc =>
      'Voert de genoemde iPhone-opdracht uit: lampen aan, muziek starten, Focus wijzigen...';

  @override
  String get shortcutNameLabel => 'Naam van opdracht';

  @override
  String get recipesSection => 'Kant-en-klare automatiseringen';

  @override
  String get recipesIntro =>
      'Maak in Opdrachten een opdracht met de naam hieronder en voeg de acties toe. Koppel die daarna aan een NFC-automatisering of gebruik \"Aan tag toevoegen\" om een startlink te schrijven.';

  @override
  String get recipeAddToTag => 'Aan tag toevoegen';

  @override
  String get recipeBedTitle => 'Welterusten';

  @override
  String get recipeBedActions =>
      'Nachtkastje: Slaapfocus aan · wekker zetten · lampen uit';

  @override
  String get recipeCarTitle => 'Automodus';

  @override
  String get recipeCarActions =>
      'Autohouder: Rijfocus · route naar huis · muziek starten';

  @override
  String get recipeDoorTitle => 'Ik ben thuis';

  @override
  String get recipeDoorActions =>
      'Voordeur: lampen aan · wifi aan · familie \"Ik ben thuis\" sturen';

  @override
  String get recipeDeskTitle => 'Focustijd';

  @override
  String get recipeDeskActions =>
      'Bureau: Werkfocus · timer van 25 min · focusafspeellijst';

  @override
  String get recipeGymTitle => 'Training';

  @override
  String get recipeGymActions =>
      'Sporttas: training starten · afspeellijst · Niet storen';

  @override
  String get recipeKitchenTitle => 'Keukentimer';

  @override
  String get recipeKitchenActions =>
      'Keuken: timer van 10 min · boodschappenlijst openen';

  @override
  String get libraryLabelsField => 'Labels / mappen (komma-gescheiden)';

  @override
  String get libraryLabelsHint => 'kantoor, 2e verdieping';

  @override
  String librarySaveFailed(String error) {
    return 'Opslaan mislukt: $error';
  }

  @override
  String get csvColumnLabels => 'Labels';

  @override
  String get firstNameLabel => 'Voornaam';

  @override
  String get lastNameLabel => 'Achternaam';

  @override
  String get wifiPasswordMinHint => 'Minimaal 8 tekens';

  @override
  String get emailExampleHint => 'naam@voorbeeld.nl';

  @override
  String get wifiSsidExampleHint => 'Thuis_WiFi_5G';

  @override
  String get nfcErrUnavailable =>
      'NFC is niet beschikbaar of staat uit op dit apparaat.';

  @override
  String get nfcErrBusy => 'Er loopt al een NFC-actie; wacht tot die klaar is.';

  @override
  String get nfcErrCancelled => 'De actie is geannuleerd.';

  @override
  String get nfcErrAppPaused =>
      'De actie is geannuleerd omdat de app naar de achtergrond ging.';

  @override
  String get nfcErrUnsupportedTag => 'Dit tagtype wordt niet ondersteund.';

  @override
  String get nfcErrNtagOnly =>
      'Deze tool werkt alleen met NTAG / MIFARE Ultralight-tags.';

  @override
  String get nfcErrNotNdefRead => 'Tag gevonden, maar niet in NDEF-formaat.';

  @override
  String get nfcErrNotNdefWrite =>
      'De tag is niet NDEF-geformatteerd; deze telefoon kan er niet direct NDEF naar schrijven.';

  @override
  String get nfcErrReadOnly => 'De tag is alleen-lezen (vergrendeld).';

  @override
  String get nfcErrNoData => 'Er zijn geen gegevens om te schrijven.';

  @override
  String nfcErrCapacity(String required, String max) {
    return 'Te weinig ruimte: $required bytes nodig, $max beschikbaar.';
  }

  @override
  String get nfcErrCapacityShort => 'Te weinig ruimte op de tag.';

  @override
  String get nfcErrVerify =>
      'Verificatie mislukt: teruggelezen gegevens komen niet overeen.';

  @override
  String get nfcErrConnectionLost =>
      'Verbinding met de tag verbroken; houd hem stil en probeer opnieuw.';

  @override
  String get nfcErrAlreadyLocked => 'De tag is al vergrendeld (alleen-lezen).';

  @override
  String get nfcErrLockNotNdef =>
      'De tag is niet NDEF-geformatteerd; schrijf eerst een record.';

  @override
  String get nfcErrLockNotSupported =>
      'Dit tagtype kan niet worden vergrendeld.';

  @override
  String get nfcSheetConnected => 'Tag verbonden, bezig...';

  @override
  String get nfcSheetReadOk => 'Tag gelezen!';

  @override
  String get nfcSheetEmptyRead => 'Lege tag gelezen!';

  @override
  String get nfcSheetMultipleTags =>
      'Meer dan één tag gevonden. Houd er maar één bij de telefoon.';

  @override
  String get nfcSheetWriteVerified => 'Geschreven en geverifieerd!';

  @override
  String get nfcSheetWritten => 'Naar de tag geschreven!';

  @override
  String get nfcSheetLocked => 'De tag is nu permanent vergrendeld!';

  @override
  String get nfcWriteDone => 'Succesvol naar de tag geschreven.';

  @override
  String get errorWidgetMessage =>
      'Dit onderdeel kon niet worden getoond. Ga terug en probeer het opnieuw.';

  @override
  String get nfcErrTimeout =>
      'De tijd is om, geen tag gevonden. Houd de tag bij de bovenkant van de telefoon en probeer opnieuw.';

  @override
  String get aboutTitle => 'Over';

  @override
  String aboutVersion(String version) {
    return 'Versie $version';
  }

  @override
  String get privacySummary =>
      'Je gegevens blijven op dit apparaat: geen account, geen server, geen advertenties of tracking.';

  @override
  String get whatsNewTitle => 'Wat is er nieuw';

  @override
  String get whatsNew110 =>
      '• 14 talen, donkere modus en nieuw ontwerp\n• Sjablonen met categorieën, zoeken en favorieten\n• Batchgewijs schrijven met serienummers, CSV en klonen\n• Voorbeeld \"Wat gebeurt er bij tikken?\" en capaciteitswaarschuwingen\n• Tagbibliotheek met foto\'s, notities en labels\n• Tagrapport, vergelijken, continu scannen en CSV-export\n• Siri, Opdrachten en automatiseringsrecepten';

  @override
  String lastBackupAt(String date) {
    return 'Laatste back-up: $date';
  }

  @override
  String get noBackupYet => 'Nog geen back-up.';

  @override
  String get backupStale =>
      'Je laatste back-up is ouder dan 30 dagen; maak een nieuwe.';

  @override
  String get backupICloudTip =>
      'Tip: kies in het deelmenu \"Bewaar in Bestanden\" → iCloud Drive.';

  @override
  String get dragToReorder => 'Sleep om te ordenen';

  @override
  String get modeTitle => 'Modus';

  @override
  String get modeNormal => 'Normaal';

  @override
  String get modeCompat => 'Compatibiliteit';

  @override
  String get modeNormalDesc =>
      'Normaal: alles aan; elke geschreven tag wordt teruggelezen en gecontroleerd.';

  @override
  String get modeCompatDesc =>
      'Compatibiliteit: geen terugleescontrole na schrijven. Betrouwbaarder bij sommige oude of lastige tags.';

  @override
  String get rateApp => 'App beoordelen';

  @override
  String get rateAppUnavailable =>
      'De beoordeling kon nu niet worden getoond (nooit in TestFlight).';

  @override
  String get chipsTitle => 'NFC-chips';

  @override
  String get chipsSubtitle => 'Welke tag kopen? Capaciteit en ondersteuning';

  @override
  String get chipsIntro =>
      'Bruikbare bytes = maximale NDEF-inhoud. NTAG215 is een goede keuze voor beginners.';

  @override
  String chipsUsable(String bytes) {
    return 'Bruikbaar: $bytes bytes';
  }

  @override
  String get chipsReadWrite => 'Lezen en schrijven';

  @override
  String get chipsReadOnlyNdef => 'Alleen als NDEF';

  @override
  String get chipsNotSupported => 'Niet ondersteund';

  @override
  String get chipsNxpOnly => 'Alleen telefoons met NXP-chip';

  @override
  String get chipUseSmall => 'Eén link, korte tekst, wifi; goedkoopst';

  @override
  String get chipUseMedium =>
      'Visitekaartjes, meerdere records; amiibo-figuren';

  @override
  String get chipUseLarge => 'Lange inhoud, uitgebreide visitekaartjes';

  @override
  String get chipUseSecure => 'Echtheidscontrole (producten, tickets)';

  @override
  String get chipUseTicket => 'Ov- en evenementtickets';

  @override
  String get chipUseAccess => 'Toegangs- en hotelpassen';

  @override
  String get chipUseIndustrial =>
      'Bibliotheek-, magazijn- en industriële tags; groter bereik';

  @override
  String get chipUseJapan => 'Gangbaar in Japan (ov, betalen)';

  @override
  String get chipUseLegacy => 'Verouderd type; niet aanbevolen';

  @override
  String templateVarsHint(String date, String time, String counter) {
    return 'Tip: $date, $time of $counter in tekst of link worden bij het schrijven ingevuld.';
  }

  @override
  String templateVarsPreview(String date, String time, String counter) {
    return 'Bij schrijven: $date · $time · teller $counter';
  }

  @override
  String get libraryWriteToTag => 'Naar tag schrijven';

  @override
  String libraryWritePrompt(String name) {
    return 'Houd een tag in de buurt om \"$name\" te schrijven';
  }
}
