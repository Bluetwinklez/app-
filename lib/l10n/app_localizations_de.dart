// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get addRecord => 'Eintrag hinzufügen';

  @override
  String get addRule => 'Regel hinzufügen';

  @override
  String get addTag => 'Tag hinzufügen';

  @override
  String get addToComposerList => 'Zur Schreibliste hinzufügen';

  @override
  String get addToWriteList => 'Zur Schreibliste hinzufügen';

  @override
  String get addressCannotBeEmpty => 'Adresse darf nicht leer sein.';

  @override
  String get advancedCommandsDesc =>
      'Ein Hex-Befehl pro Zeile. Z.B.: 60 = GET_VERSION, 30 04 = Seite 4 lesen. Falsche Schreibbefehle können den Tag beschädigen.';

  @override
  String get advancedCommandsSubtitle =>
      'Sendet hexadezimale Rohbefehle an den Tag';

  @override
  String get advancedCommandsTitle => 'Erweiterte NFC-Befehle';

  @override
  String get allRulesCleared => 'Alle Regeln gelöscht';

  @override
  String get appLinksDesc =>
      'Auf einen Tag geschrieben, öffnet eine Berührung die jeweilige Ansicht der App.';

  @override
  String get appLinksSection => 'App-Links';

  @override
  String get appPackageName => 'Android-Paketname';

  @override
  String get appSettings => 'App-Einstellungen';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'Automatisch bei Berührung ausführen';

  @override
  String get backupExportSuccess => 'Sicherungsdatei erfolgreich gespeichert';

  @override
  String get backupFileSizeExceeded => 'Sicherungsdatei überschreitet 2 MiB.';

  @override
  String get backupHistoryMustBeList =>
      'Feld \"history\" muss eine Liste sein.';

  @override
  String backupImportFailed(String error) {
    return 'Sicherung konnte nicht importiert werden: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'Sicherung importiert: $templates Vorlagen, $rules Regeln, $history Verlaufseinträge hinzugefügt';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'Ungültiges Base64 für ID: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Ungültiges Base64 für Nutzlast: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Ungültiges Base64 für Typ: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'Ungültiges JSON-Format: $error';
  }

  @override
  String get backupInvalidRuleNote =>
      'Regel-Notiz muss eine gültige Zeichenkette sein.';

  @override
  String get backupInvalidRuleSha =>
      'Regel-Hash muss ein gültiger 64-stelliger Hex-String sein.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'Ungültiges Datum für Vorlage: $date';
  }

  @override
  String get backupInvalidTemplateId =>
      'Vorlagen-ID muss eine gültige Zeichenkette sein.';

  @override
  String get backupInvalidTemplateName =>
      'Vorlagenname muss eine gültige Zeichenkette sein.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'Ungültiger TNF-Wert ($tnf). Muss zwischen 0 und 7 liegen.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Verlaufsanzahl überschreitet Limit $max ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'Eintragsanzahl überschreitet Limit $max ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'Regelanzahl überschreitet Limit $max ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'Vorlagenanzahl überschreitet Limit $max ($count).';
  }

  @override
  String get backupMissingSchemaVersion => 'Feld \"schemaVersion\" fehlt.';

  @override
  String get backupRecordMustBeObject =>
      'Jeder NDEF-Eintrag muss ein JSON-Objekt sein.';

  @override
  String get backupRecordsMustBeList =>
      'Vorlageneinträge müssen eine Liste sein.';

  @override
  String get backupRestoreSubtitle =>
      'Sichern oder übertragen Sie Ihre Vorlagen, Notizen und den Verlauf als JSON.';

  @override
  String get backupRestoreTitle => 'Sicherung & Wiederherstellung (JSON)';

  @override
  String get backupRootMustBeObject =>
      'Wurzelelement muss ein JSON-Objekt sein.';

  @override
  String get backupRuleMustBeObject => 'Jede Regel muss ein JSON-Objekt sein.';

  @override
  String get backupSchemaVersionMustBeInt =>
      'Feld \"schemaVersion\" muss eine Ganzzahl sein.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'Sicherungsdaten überschreiten 2 MiB ($bytes Bytes).';
  }

  @override
  String get backupTagRulesMustBeList =>
      'Feld \"tagRules\" muss eine Liste sein.';

  @override
  String get backupTemplateMustBeObject =>
      'Jede Vorlage muss ein JSON-Objekt sein.';

  @override
  String get backupTemplatesMustBeList =>
      'Feld \"templates\" muss eine Liste sein.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'Nicht unterstützte Schema-Version: $version.';
  }

  @override
  String get batchWrite => 'Stapelschreiben';

  @override
  String get bluetoothDeviceName => 'Gerätename (Optional)';

  @override
  String get bluetoothMac => 'Bluetooth-MAC-Adresse';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'Geschriebene Bytes: $bytes | Prüfung: $status';
  }

  @override
  String cameraError(String error) {
    return 'Kamera konnte nicht geöffnet werden. Bitte Berechtigung in Einstellungen > Datenschutz > Kamera erteilen.\n($error)';
  }

  @override
  String get cancel => 'Abbrechen';

  @override
  String get catBusiness => 'Geschäft';

  @override
  String get catCar => 'Auto';

  @override
  String get catHome => 'Zuhause';

  @override
  String get catOther => 'Sonstiges';

  @override
  String get catPersonal => 'Persönlich';

  @override
  String get catWork => 'Arbeit';

  @override
  String get categoryLabel => 'Kategorie';

  @override
  String get chooseFromGallery => 'Aus Galerie wählen';

  @override
  String get clear => 'Leeren';

  @override
  String get clearAll => 'Alle löschen';

  @override
  String get clearAllRulesConfirm => 'Alle gespeicherten Notizen löschen?';

  @override
  String get clearConfirmButton => 'Ja, löschen';

  @override
  String get clearConfirmMessage =>
      'Alle NDEF-Daten auf dem Tag werden gelöscht. Fortfahren?';

  @override
  String get clearConfirmTitle => 'Tag-Inhalt zurücksetzen';

  @override
  String get clearHistory => 'Verlauf leeren';

  @override
  String get clearList => 'Liste leeren';

  @override
  String get clearTagSubtitle =>
      'Löscht alle Einträge und schreibt ein leeres NDEF';

  @override
  String get clearTagTitle => 'Tag löschen';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge in der Zwischenablage',
      one: '1 Eintrag in der Zwischenablage',
    );
    return '$_temp0 ($bytes B) · $source';
  }

  @override
  String get close => 'Schließen';

  @override
  String get commandsEmptyError => 'Mindestens einen Befehl eingeben.';

  @override
  String get commandsLabel => 'Befehle';

  @override
  String get composeRecordTitle => 'Neuen Eintrag hinzufügen';

  @override
  String get confirmClearHistoryContent =>
      'Der gesamte lokale Scan-Verlauf wird gelöscht. Fortfahren?';

  @override
  String get confirmClearHistoryTitle => 'Verlauf leeren';

  @override
  String get confirmClearTemplatesContent =>
      'Alle gespeicherten Schreibvorlagen werden gelöscht. Fortfahren?';

  @override
  String get confirmClearTemplatesTitle => 'Vorlagen löschen';

  @override
  String get contactCompany => 'Firma / Organisation';

  @override
  String get contactEmail => 'E-Mail';

  @override
  String get contactFullName => 'Vollständiger Name';

  @override
  String get contactNote => 'Notiz';

  @override
  String get contactPhone => 'Telefon';

  @override
  String get contactTitle => 'Position / Titel';

  @override
  String get contactWebsite => 'Website';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge',
      one: '1 Eintrag',
    );
    return 'Inhalt: $_temp0 · $content';
  }

  @override
  String get copy => 'Kopieren';

  @override
  String get copyAllRecords => 'Alle Einträge kopieren';

  @override
  String get copyTagUid => 'UID kopieren';

  @override
  String get copyToComposer => 'In Schreibliste kopieren';

  @override
  String get csvInvalidAddress => 'ungültige Adresse.';

  @override
  String get csvInvalidEmail => 'ungültige E-Mail-Adresse.';

  @override
  String get csvInvalidLocation =>
      'Breiten- und Längengrad für Standort angeben (z.B. Standort,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'Maximal $max Einträge erlaubt; Rest übersprungen.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'Zeile $row: Wert ist leer.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'Zeile $row: $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'unbekannter Typ \"$type\".';
  }

  @override
  String get csvWifiPasswordLength =>
      'Wi-Fi-Passwort muss 8-63 Zeichen lang sein.';

  @override
  String get delete => 'Löschen';

  @override
  String deleteTagConfirmContent(String name) {
    return '\"$name\" aus der Mediathek entfernen? Der physische Tag bleibt unverändert.';
  }

  @override
  String get deleteTagConfirmTitle => 'Tag löschen';

  @override
  String get deleteTemplateTooltip => 'Vorlage löschen';

  @override
  String get deviceNameTooLong => 'Gerätename ist zu lang.';

  @override
  String get dismiss => 'Verwerfen';

  @override
  String get editRecordTitle => 'Eintrag bearbeiten';

  @override
  String get editRule => 'Regel bearbeiten';

  @override
  String get editTag => 'Tag bearbeiten';

  @override
  String get emailBody => 'E-Mail-Text';

  @override
  String get emailRecipient => 'Empfänger-E-Mail';

  @override
  String get emailSubject => 'Betreff';

  @override
  String get emptyComposerSubtitle =>
      'Tippen Sie auf \"Eintrag hinzufügen\", um URLs, Texte, Wi-Fi oder Kontakte zu erstellen.';

  @override
  String get emptyComposerTitle => 'Noch keine Einträge';

  @override
  String get emptyHistorySubtitle =>
      'Gescannte Tags werden hier chronologisch aufgeführt.';

  @override
  String get emptyHistoryTitle => 'Noch kein Scan-Verlauf';

  @override
  String get emptyLibrary =>
      'Noch keine Tags gespeichert.\nScannen Sie einen Tag und speichern Sie ihn mit Foto hier.';

  @override
  String get eventDescription => 'Beschreibung';

  @override
  String get eventEnd => 'Endzeit';

  @override
  String get eventLocation => 'Ort';

  @override
  String get eventStart => 'Startzeit';

  @override
  String get eventTitle => 'Ereignistitel';

  @override
  String get exportBackup => 'Exportieren';

  @override
  String get facetimePrompt =>
      'Telefonnummer oder Apple-ID-Mailadresse eingeben.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" darf nicht leer sein.';
  }

  @override
  String get fieldTextPrompt => 'Text für den Tag';

  @override
  String get fieldUrlPrompt => 'Website-Adresse (https://...)';

  @override
  String get fileUrl => 'Datei-URL';

  @override
  String get filterAll => 'Alle';

  @override
  String get flashlight => 'Taschenlampe';

  @override
  String get formatConfirmButton => 'Formatieren';

  @override
  String get formatConfirmMessage =>
      'Daten auf dem Tag werden gelöscht und als leerer NDEF-Tag eingerichtet. Fortfahren?';

  @override
  String get formatMemorySubtitle =>
      'Bereitet Tag für NDEF vor (leere/defekte Tags)';

  @override
  String get formatMemoryTitle => 'Speicher formatieren';

  @override
  String get hardwareAvailable => 'NFC-Hardware bereit';

  @override
  String get hardwareDisabled => 'NFC deaktiviert';

  @override
  String get hardwareNotSupported => 'NFC nicht unterstützt';

  @override
  String get historyFilteredEmpty => 'Keine passenden Einträge gefunden.';

  @override
  String get idTooLarge => 'ID darf 255 Bytes nicht überschreiten';

  @override
  String get importBackup => 'Importieren (Zusammenführen)';

  @override
  String get importCsv => 'CSV importieren';

  @override
  String get inAppTagRules => 'In-App-Tag-Regeln';

  @override
  String get invalidHexId => 'Ungültige Hex-ID';

  @override
  String get invalidHexPayload => 'Ungültige Hex-Nutzlast';

  @override
  String get invalidHexType => 'Ungültiger Hex-Typ';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get latitude => 'Breitengrad (Lat)';

  @override
  String get linkCopied => 'Link kopiert';

  @override
  String get linkHistoryDesc => 'Öffnet den Verlauf';

  @override
  String get linkScanDesc => 'Öffnet die App und startet den Scan';

  @override
  String get linkToolsDesc => 'Öffnet die Tools-Ansicht';

  @override
  String get linkWriteDesc => 'Öffnet die Schreibansicht';

  @override
  String get loadToComposerTooltip => 'In Composer laden';

  @override
  String get locationHint => 'Z.B.: Kühlschranktür';

  @override
  String get locationLabel => 'Wo platziert?';

  @override
  String get lockAcknowledge =>
      'Ich verstehe, dass dies nicht rückgängig gemacht werden kann';

  @override
  String get lockButton => 'Sperren';

  @override
  String get lockTagSubtitle =>
      'Macht den Tag dauerhaft schreibgeschützt (unumkehrbar)';

  @override
  String get lockTagTitle => 'Tag sperren';

  @override
  String get lockWarning =>
      'Ein gesperrter Tag wird schreibgeschützt: Inhalt kann NICHT mehr geändert oder entsperrt werden. Prüfen Sie den Inhalt vorher.';

  @override
  String get longitude => 'Längengrad (Lng)';

  @override
  String get manage => 'Verwalten';

  @override
  String get matchedRule => 'Zugehörige Notiz';

  @override
  String get mimePayloadHex => 'Nutzlast (Hex / Text)';

  @override
  String get mimeTypeLabel => 'MIME-Typ';

  @override
  String get nameRequired => 'Bitte vergeben Sie einen Namen.';

  @override
  String get navHistory => 'Verlauf';

  @override
  String get navHistoryTitle => 'Verlauf';

  @override
  String get navRead => 'Lesen';

  @override
  String get navReadTitle => 'Tag lesen';

  @override
  String get navSettings => 'Setup';

  @override
  String get navSettingsTitle => 'Vorlagen & Setup';

  @override
  String get navTools => 'Tools';

  @override
  String get navToolsTitle => 'Tools';

  @override
  String get navWrite => 'Schreiben';

  @override
  String get navWriteTitle => 'Tag schreiben';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge',
      one: '1 Eintrag',
    );
    return '$_temp0';
  }

  @override
  String get ndefRecordsTitle => 'NDEF-Einträge';

  @override
  String get nfcPromptClear => 'Halten Sie den Tag zum Zurücksetzen an';

  @override
  String get nfcPromptLock => 'Halten Sie den Tag zum dauerhaften Sperren an';

  @override
  String get nfcPromptScan => 'Halten Sie das Gerät an den NFC-Tag zum Lesen';

  @override
  String get nfcPromptWrite => 'Halten Sie den Tag zum Speichern der Daten an';

  @override
  String get no => 'Nein';

  @override
  String get noContentInTag => 'Kein Tag-Inhalt verknüpft.';

  @override
  String get noLibraryMatches => 'Keine passenden Tags gefunden.';

  @override
  String get noRecordsOnTag => 'Keine NDEF-Einträge auf dem Tag gefunden.';

  @override
  String get noTemplates =>
      'Noch keine Schreibvorlagen vorhanden.\nErstellen Sie Einträge im Tab \"Schreiben\" und sichern Sie diese als Vorlage.';

  @override
  String get noteLabel => 'Notiz';

  @override
  String get onboardingContinue => 'Weiter';

  @override
  String get onboardingSkip => 'Überspringen';

  @override
  String get onboardingStart => 'Starten';

  @override
  String get onboardingStep1Body =>
      'Tippen Sie unten auf den blauen Button und halten Sie das Smartphone an den Tag. Inhalt, Kapazität und UID erscheinen sofort.';

  @override
  String get onboardingStep1Title => 'Tag scannen';

  @override
  String get onboardingStep2Body =>
      'Im Tab \"Schreiben\" auf \"Eintrag hinzufügen\" tippen: Web-Links, Wi-Fi, Kontakte, Social Media und Vorlagen in Sekunden nutzen.';

  @override
  String get onboardingStep2Title => 'Beliebiges schreiben';

  @override
  String get onboardingStep3Body =>
      'Speicher auslesen, Passwörter setzen, Tags sperren oder formatieren. Alles im Tab \"Tools\".';

  @override
  String get onboardingStep3Title => 'Experten-Tools';

  @override
  String get onboardingStep4Body =>
      'Gekennzeichnete Tags mit Namen, Notizen und Fotos in der Mediathek sichern. Sprache und Design in den Einstellungen anpassen.';

  @override
  String get onboardingStep4Title => 'Tags organisieren';

  @override
  String optionalField(String label) {
    return '$label (optional)';
  }

  @override
  String pageN(int page) {
    return 'Seite $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'Daten';

  @override
  String get pageRoleLock => 'Sperre';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / Sperre';

  @override
  String get passwordDialogAction => 'Passwort setzen';

  @override
  String get passwordDialogTitle => 'Passwort festlegen';

  @override
  String get passwordDialogWarning =>
      'Ohne dieses Passwort kann der Tag nicht mehr beschrieben werden. Das Lesen bleibt für alle möglich.';

  @override
  String get passwordError => 'Genau 4 Zeichen oder 8 Hex-Ziffern eingeben.';

  @override
  String get passwordHint => '4 Zeichen (z.B. 1234) oder 8 Hex-Ziffern';

  @override
  String get passwordLabel => 'Passwort';

  @override
  String get paste => 'Einfügen';

  @override
  String get phoneNumber => 'Telefonnummer';

  @override
  String get phoneWithCountryCode =>
      'Telefonnummer mit Ländervorwahl eingeben (z.B. 491511234567).';

  @override
  String get presetAppDownloadDesc =>
      'Öffnet oder installiert Ihre Android-App.';

  @override
  String get presetAppDownloadTitle => 'App-Download';

  @override
  String get presetBusinessCardDesc =>
      'Fügt Ihre Kontaktdaten beim Antippen zum Adressbuch hinzu.';

  @override
  String get presetBusinessCardTitle => 'Digitale Visitenkarte';

  @override
  String get presetDirectionsDesc => 'Zeigt Adresse oder Ort auf der Karte.';

  @override
  String get presetDirectionsTitle => 'Wegbeschreibung';

  @override
  String get presetEmergencyDesc =>
      'Blutgruppe, Notfallkontakte und wichtige Infos.';

  @override
  String get presetEmergencyTitle => 'Notfallkarte (ICE)';

  @override
  String get presetGoogleReviewDesc =>
      'Leitet Kunden direkt zur Bewertungsseite.';

  @override
  String get presetGoogleReviewTitle => 'Google-Bewertung';

  @override
  String get presetGuestWifiDesc =>
      'Gäste verbinden sich ohne Passworteingabe.';

  @override
  String get presetGuestWifiTitle => 'Gäste-WLAN-Karte';

  @override
  String get presetInstagramDesc => 'Öffnet direkt Ihr Instagram-Profil.';

  @override
  String get presetInstagramTitle => 'Instagram-Profil';

  @override
  String get presetMenuLinkDesc =>
      'Auf Tische kleben, damit Gäste die Karte direkt sehen.';

  @override
  String get presetMenuLinkTitle => 'Speisekarte';

  @override
  String get presetPetTagDesc =>
      'Ermöglicht Findern einen direkten Anruf bei Ihnen.';

  @override
  String get presetPetTagTitle => 'Haustier-Marke';

  @override
  String get presetShortcutDesc => 'Startet Kurzbefehle oder In-App-Aktionen.';

  @override
  String get presetShortcutTitle => 'Kurzbefehl-Auslöser';

  @override
  String get presetWebsiteDesc => 'Leitet zu einer beliebigen Website weiter.';

  @override
  String get presetWebsiteTitle => 'Website-Link';

  @override
  String get presetWhatsappDesc => 'Startet Chat ohne Speichern der Nummer.';

  @override
  String get presetWhatsappTitle => 'WhatsApp-Direktchat';

  @override
  String get qrCode => 'QR-Code';

  @override
  String qrContentChars(int chars) {
    return 'Inhalt ($chars Zeichen):';
  }

  @override
  String get qrContentEmpty => 'Der zu konvertierende Inhalt ist leer.';

  @override
  String qrContentTooLarge(int chars) {
    return 'Inhalt zu groß für QR-Code ($chars Zeichen, maximal 2048 unterstützt).';
  }

  @override
  String get qrFrameInstructions =>
      'QR-Code im Rahmen platzieren. Web-Links, Wi-Fi und Text-QR werden automatisch konvertiert.';

  @override
  String qrGenerationFailed(String error) {
    return 'QR-Code konnte nicht erzeugt werden: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'QR-Code-Vorschau: $title';
  }

  @override
  String get qrScanTitle => 'QR-Code scannen';

  @override
  String get qrSecurityNote =>
      'QR-Vorschau ist ausschließlich für lesbaren Text und Web-URLs verfügbar.\n\nPasswörter, vCards und Binärdaten werden aus Sicherheitsgründen nicht umgewandelt.';

  @override
  String get qrUserOnlyNote => 'Wird nur auf Benutzeranfrage geöffnet.';

  @override
  String get rawInspection => 'Rohdatenprüfung';

  @override
  String get rawRecordDetailsTitle => 'Eintragsdetails (Schreibgeschützt)';

  @override
  String get rawRecordEditorTitle => 'Rohdaten bearbeiten';

  @override
  String get readHeroButton => 'Scan starten';

  @override
  String get readHeroEyebrow => 'NFC-LESER';

  @override
  String get readHeroScanning => 'Wird gescannt...';

  @override
  String get readHeroSubtitle =>
      'Halten Sie das Smartphone an einen NFC-Tag, um NDEF-Daten und Chipdetails auszulesen.';

  @override
  String get readHeroTitle => 'Tag scannen';

  @override
  String get readMemorySubtitle =>
      'Rohspeicher seitenweise; kopieren oder als .bin sichern';

  @override
  String get readMemoryTitle => 'Speicher auslesen';

  @override
  String get readyTemplates => 'Fertige Vorlagen';

  @override
  String get recordCopied => 'Inhalt kopiert';

  @override
  String recordIndex(int index) {
    return 'Eintrag #$index';
  }

  @override
  String get recordTypeCalendar => 'Kalendereintrag (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'Eigener MIME ($mime)';
  }

  @override
  String get recordTypeEmail => 'E-Mail-Eintrag';

  @override
  String get recordTypeLocation => 'Standort / GPS';

  @override
  String get recordTypePhone => 'Telefonnummer';

  @override
  String get recordTypeSmartPoster => 'Smart Poster';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'Beschädigtes Smart Poster ($bytes Bytes)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'Smart Poster (Ungültig)';

  @override
  String get recordTypeSms => 'SMS-Eintrag';

  @override
  String get recordTypeText => 'Text-Eintrag';

  @override
  String get recordTypeUnknown => 'Unbekannter Eintrag';

  @override
  String get recordTypeUrl => 'Web-Link (URL)';

  @override
  String get recordTypeVCard => 'Kontaktkarte (vCard)';

  @override
  String get recordTypeWifi => 'Wi-Fi-Konfiguration (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'Beschädigte WSC-Nutzlast';

  @override
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge kopiert',
      one: '1 Eintrag kopiert',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'Wiederholen';

  @override
  String get removePasswordDialogTitle => 'Passwort entfernen';

  @override
  String get removePasswordDialogWarning =>
      'Geben Sie das aktuelle Passwort des Tags ein.';

  @override
  String get removePasswordSubtitle => 'Entfernt Schutz mit bekanntem Passwort';

  @override
  String get removePasswordTitle => 'Passwort entfernen';

  @override
  String get removePhoto => 'Entfernen';

  @override
  String get rewriteTag => 'Erneut schreiben';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Regel mit Notiz \"$note\" löschen?';
  }

  @override
  String get ruleDeleted => 'Regel gelöscht';

  @override
  String get ruleNoteDialogTitle => 'Tag-Notiz bearbeiten';

  @override
  String get ruleNoteHint => 'Z.B.: Lagerregal #4 oder Meetingraum';

  @override
  String get ruleNoteLabel => 'In-App-Notiz / Bezeichnung';

  @override
  String get ruleSaved => 'Regel gespeichert';

  @override
  String get save => 'Speichern';

  @override
  String get saveAsTemplate => 'Als Vorlage speichern';

  @override
  String get saveBin => '.bin sichern';

  @override
  String get saveLocalHistory => 'Lokalen Scan-Verlauf speichern';

  @override
  String get saveLocalHistorySubtitle =>
      'Deaktiviert werden Scans nicht gespeichert. Aktiviert werden erfolgreiche Scans lokal gesichert.';

  @override
  String get saveTemplateDialogTitle => 'Als Vorlage speichern';

  @override
  String get saveToLibrary => 'In Mediathek sichern';

  @override
  String get scanFabLabel => 'Tag scannen';

  @override
  String get scanQrToRecord => 'QR-Code scannen';

  @override
  String get scannedTag => 'Gescannter Tag';

  @override
  String get searchEngine => 'Suchmaschine';

  @override
  String get searchHistoryHint => 'Verlauf durchsuchen (UID, Inhalt, Typ)...';

  @override
  String get searchLibraryHint => 'Nach Name, Notiz, Ort oder Inhalt suchen';

  @override
  String get searchQuery => 'Suchbegriff';

  @override
  String get searchQueryCannotBeEmpty => 'Suchbegriff darf nicht leer sein.';

  @override
  String get securityRestriction => 'Sicherheitseinschränkung';

  @override
  String get send => 'Senden';

  @override
  String get setPasswordSubtitle =>
      'Schützt Tag-Inhalte vor unbefugtem Überschreiben';

  @override
  String get setPasswordTitle => 'Passwort festlegen';

  @override
  String get shareRecords => 'Einträge teilen';

  @override
  String get shortcutAutomationNote =>
      'Hinweis: Automationen binden sich an die UID und funktionieren auch bei geändertem Tag-Inhalt.';

  @override
  String get shortcutStep1 =>
      'Kurzbefehle-App öffnen und unten auf \"Automation\" tippen.';

  @override
  String get shortcutStep2 => '\"Neue Automation\" (+) → \"NFC\" auswählen.';

  @override
  String get shortcutStep3 =>
      '\"Scannen\" wählen, Tag an das iPhone halten und benennen.';

  @override
  String get shortcutStep4 =>
      '\"Sofort ausführen\" aktivieren und gewünschte Aktion wählen.';

  @override
  String get shortcutStep5 =>
      'Um die App zu öffnen, \"Tag scannen\" oder \"Tag schreiben\" wählen.';

  @override
  String get shortcutsGuideSubtitle =>
      'Führen Sie Aktionen bei Tag-Berührung automatisch aus oder scannen Sie per Siri.';

  @override
  String get shortcutsGuideTitle => 'Siri & Kurzbefehle';

  @override
  String get siriPhraseScan => '\"Hey Siri, Tag scannen mit NFC Tag Master\"';

  @override
  String get siriPhraseWrite =>
      '\"Hey Siri, Tag schreiben mit NFC Tag Master\"';

  @override
  String get siriShortcutsNote =>
      'Befehle erscheinen auch in Kurzbefehle und Spotlight-Suche.';

  @override
  String get smsMessage => 'Nachrichtentext';

  @override
  String get socialNetwork => 'Plattform';

  @override
  String get socialUsername => 'Benutzername / Profil';

  @override
  String get sourceComposer => 'Einträge der Schreibliste';

  @override
  String get sourceEmpty => 'Ohne Inhalt (nur Notiz)';

  @override
  String get sourceLastScan => 'Zuletzt gescannter Tag';

  @override
  String get sourceSelectPrompt => 'Woher soll der Inhalt stammen?';

  @override
  String get statusCancelled => 'Vorgang abgebrochen.';

  @override
  String statusClearError(String error) {
    return 'Löschfehler: $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'Löschen fehlgeschlagen: $error';
  }

  @override
  String get statusClearSuccess => 'Tag-Inhalt erfolgreich gelöscht.';

  @override
  String get statusClearing => 'Löschmodus aktiv. Tag anhalten...';

  @override
  String statusLockError(String error) {
    return 'Sperrfehler: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'Sperren fehlgeschlagen: $error';
  }

  @override
  String get statusLockSuccess => 'Tag dauerhaft schreibgeschützt gesperrt.';

  @override
  String get statusLocking => 'Sperrmodus aktiv. Tag anhalten...';

  @override
  String get statusNfcDisabled =>
      'NFC ist deaktiviert. Bitte in den Einstellungen aktivieren.';

  @override
  String get statusNfcNotSupported =>
      'NFC-Hardware ist auf diesem Gerät nicht verfügbar.';

  @override
  String get statusNfcUnavailable => 'NFC ist derzeit nicht verfügbar.';

  @override
  String get statusReady => 'Bereit';

  @override
  String statusScanError(String error) {
    return 'Scan-Fehler: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'Tag erfolgreich gelesen ($id).';
  }

  @override
  String get statusScanning =>
      'Tag wird gescannt... Halten Sie das Smartphone an den Tag.';

  @override
  String statusUnexpectedError(String error) {
    return 'Unerwarteter Fehler: $error';
  }

  @override
  String statusWriteError(String error) {
    return 'Schreibfehler: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'Schreibvorgang fehlgeschlagen: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return 'Schreiben und Überprüfung erfolgreich! ($bytes Bytes)';
  }

  @override
  String get statusWriting => 'Schreibmodus aktiv. Ziel-Tag anhalten...';

  @override
  String get systemLanguage => 'Systemsprache';

  @override
  String get tabApp => 'App';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'Kalender';

  @override
  String get tabContact => 'Kontakt (vCard)';

  @override
  String get tabCustomMime => 'Eigener MIME';

  @override
  String get tabEmail => 'E-Mail';

  @override
  String get tabFile => 'Datei';

  @override
  String get tabLocation => 'Standort';

  @override
  String get tabPhone => 'Telefon';

  @override
  String get tabSearch => 'Suche';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'Social Media';

  @override
  String get tabText => 'Text';

  @override
  String get tabUrl => 'Web-URL';

  @override
  String get tabVideo => 'Video';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'Kapazität';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max Bytes ($available Bytes frei)';
  }

  @override
  String get tagInfoTitle => 'Tag-Informationen';

  @override
  String get tagLibraryTitle => 'Meine Tag-Mediathek';

  @override
  String get tagNameHint => 'Z.B.: Küchentarif';

  @override
  String get tagNameLabel => 'Name';

  @override
  String get tagReadOnly => 'Schreibgeschützt (Gesperrt)';

  @override
  String tagRulesCount(int count) {
    return 'Gespeicherte Regeln: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Zeigt passende Notizen basierend auf dem SHA-256-Hash des NDEF-Inhalts an.';

  @override
  String get tagSerialNumber => 'Seriennummer (UID)';

  @override
  String get tagTechnology => 'Technologie';

  @override
  String get tagType => 'Typ';

  @override
  String get tagUidCopied => 'Tag-UID kopiert';

  @override
  String get tagWritable => 'Beschreibbar';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get templateGalleryTitle => 'Fertige Vorlagen';

  @override
  String get templateNameHint => 'Vorlagenname';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einträge',
      one: '1 Eintrag',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'Vorlage erfolgreich gespeichert';

  @override
  String get toolsExpertSection => 'Experte';

  @override
  String get toolsFooterNote =>
      'Speicher-, Passwort- und Befehlstools unterstützen NTAG213/215/216 und MIFARE Ultralight EV1. Tag nah am Gerät halten.';

  @override
  String get toolsMemorySection => 'Speicher';

  @override
  String get toolsSecuritySection => 'Sicherheit';

  @override
  String get toolsTagSection => 'Tag';

  @override
  String get totalBytes => 'Gesamtgröße';

  @override
  String get typeTooLarge => 'Typ darf 255 Bytes nicht überschreiten';

  @override
  String get undo => 'Rückgängig';

  @override
  String get unknownChip16Pages => 'Unbekannter Chip (erste 16 Seiten)';

  @override
  String get urlSafetyInvalidUrl => 'Ungültiges URL-Format.';

  @override
  String get urlSafetyIpv4 => 'Zieladresse enthält direkte IPv4-Adresse.';

  @override
  String get urlSafetyIpv6 => 'Zieladresse enthält direkte IPv6-Adresse.';

  @override
  String get urlSafetyMissingScheme => 'URL-Protokollschema fehlt.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'Nicht-standardisierter Port (Port: $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'Internationalisierte Domain / Punycode erkannt (\"xn--\").';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'Ungewöhnliches URL-Schema: \"$scheme\".';
  }

  @override
  String get urlSafetyUnencrypted => 'Unverschlüsselte Verbindung (http://).';

  @override
  String get urlSafetyUserInfo =>
      'URL enthält Zugangsdaten (Userinfo). Möglicher Phishing-Hinweis.';

  @override
  String get usernameCannotBeEmpty => 'Benutzername darf nicht leer sein.';

  @override
  String get usernameNoSpaces =>
      'Benutzername darf keine Leerzeichen enthalten.';

  @override
  String get validAndroidPackage =>
      'Gültigen Android-Paketnamen eingeben (z.B. com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'Gültige Bluetooth-MAC eingeben (z.B. 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'Bitte gültigen Video-Link eingeben.';

  @override
  String get validWebAddress =>
      'Bitte gültige Web-Adresse eingeben (z.B. https://example.com/datei.pdf).';

  @override
  String get verificationNotChecked => 'Nicht geprüft';

  @override
  String get verificationPassed => 'Bestanden';

  @override
  String get videoUrlCannotBeEmpty => 'Video-Link darf nicht leer sein.';

  @override
  String get videoUrlOrId => 'Video-URL oder YouTube-ID';

  @override
  String get videoUrlOrIdPrompt =>
      'Video-Link (https://...) oder YouTube-ID eingeben.';

  @override
  String get wifiAuthOpen => 'Offen (Ungesichert)';

  @override
  String get wifiAuthType => 'Sicherheit';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'Verstecktes Netzwerk';

  @override
  String get wifiPassword => 'Passwort';

  @override
  String get wifiSsid => 'Netzwerkname (SSID)';

  @override
  String get withSiri => 'Mit Siri';

  @override
  String get writeDumpConfirmButton => 'Schreiben';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes Bytes) wird in den Speicher geschrieben. UID und Konfigurationsseiten bleiben erhalten. Daten werden überschrieben.';
  }

  @override
  String get writeDumpSubtitle =>
      'Schreibt gesicherte Speicherdatei auf den Tag';

  @override
  String get writeDumpTitle => 'Dump schreiben (.bin)';

  @override
  String get writeHeroButton => 'Schreiben starten';

  @override
  String get writeHeroEyebrow => 'NDEF-SCHREIBER';

  @override
  String get writeHeroSubtitle =>
      'Erstellen Sie NDEF-Einträge und schreiben Sie sie gebündelt auf den Tag.';

  @override
  String get writeHeroTitle => 'Tag schreiben';

  @override
  String get writeHeroWriting => 'Wird geschrieben...';

  @override
  String get writeResultFailed => 'Vorgang fehlgeschlagen';

  @override
  String get writeResultSuccess => 'Vorgang erfolgreich';

  @override
  String get writeTemplates => 'Schreibvorlagen';

  @override
  String get writeTemplatesSubtitle =>
      'Speichern Sie häufig genutzte NDEF-Inhalte als Vorlage für schnelles Schreiben.';

  @override
  String get yes => 'Ja';
}
