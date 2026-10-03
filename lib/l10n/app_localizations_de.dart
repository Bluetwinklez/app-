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
  String get appLinksDesc =>
      'Auf einen Tag geschrieben, öffnet eine Berührung die jeweilige Ansicht der App.';

  @override
  String get appLinksSection => 'App-Links';

  @override
  String get appPackageName => 'Android-Paketname';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'Automatisch bei Berührung ausführen';

  @override
  String get backupFileSizeExceeded => 'Sicherungsdatei überschreitet 2 MiB.';

  @override
  String get backupHistoryMustBeList =>
      'Feld \"history\" muss eine Liste sein.';

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
  String get backupInvalidTemplateId =>
      'Vorlagen-ID muss eine gültige Zeichenkette sein.';

  @override
  String get backupInvalidTemplateName =>
      'Vorlagenname muss eine gültige Zeichenkette sein.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Verlaufsanzahl überschreitet Limit $max ($count).';
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
  String get clearConfirmMessage =>
      'Alle NDEF-Daten auf dem Tag werden gelöscht. Fortfahren?';

  @override
  String get clearConfirmTitle => 'Tag-Inhalt zurücksetzen';

  @override
  String get clearHistory => 'Verlauf leeren';

  @override
  String get clearTagSubtitle =>
      'Löscht alle Einträge und schreibt ein leeres NDEF';

  @override
  String get clearTagTitle => 'Tag löschen';

  @override
  String get close => 'Schließen';

  @override
  String get commandsEmptyError => 'Mindestens einen Befehl eingeben.';

  @override
  String get commandsLabel => 'Befehle';

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
  String get contactPhone => 'Telefon';

  @override
  String get contactTitle => 'Position / Titel';

  @override
  String get contactWebsite => 'Website';

  @override
  String get copy => 'Kopieren';

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
  String get deleteTemplateTooltip => 'Vorlage löschen';

  @override
  String get deviceNameTooLong => 'Gerätename ist zu lang.';

  @override
  String get dismiss => 'Verwerfen';

  @override
  String get editRecordTitle => 'Eintrag bearbeiten';

  @override
  String get emailRecipient => 'Empfänger-E-Mail';

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
  String get flashlight => 'Taschenlampe';

  @override
  String get formatMemorySubtitle =>
      'Bereitet Tag für NDEF vor (leere/defekte Tags)';

  @override
  String get formatMemoryTitle => 'Speicher formatieren';

  @override
  String get idTooLarge => 'ID darf 255 Bytes nicht überschreiten';

  @override
  String get importBackup => 'Importieren (Zusammenführen)';

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
  String get locationLabel => 'Wo platziert?';

  @override
  String get lockAcknowledge =>
      'Ich verstehe, dass dies nicht rückgängig gemacht werden kann';

  @override
  String get lockTagSubtitle =>
      'Macht den Tag dauerhaft schreibgeschützt (unumkehrbar)';

  @override
  String get lockTagTitle => 'Tag sperren';

  @override
  String get manage => 'Verwalten';

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
  String get nfcPromptClear => 'Halten Sie den Tag zum Zurücksetzen an';

  @override
  String get nfcPromptLock => 'Halten Sie den Tag zum dauerhaften Sperren an';

  @override
  String get nfcPromptScan =>
      'Halten Sie das Tag an die Oberseite Ihres Telefons';

  @override
  String get nfcPromptWrite => 'Halten Sie den Tag zum Speichern der Daten an';

  @override
  String get no => 'Nein';

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
      'Teilt Ihre Kontaktkarte; Android bietet das Speichern an, auf dem iPhone öffnet sie eine NFC-App.';

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
      'Android-Geräte verbinden sich per Antippen; auf dem iPhone zeigt eine NFC-App die Daten.';

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
  String get rawRecordDetailsTitle => 'Eintragsdetails (Schreibgeschützt)';

  @override
  String get rawRecordEditorTitle => 'Rohdaten bearbeiten';

  @override
  String get readHeroButton => 'Scan starten';

  @override
  String get readMemorySubtitle =>
      'Rohspeicher seitenweise; kopieren oder als .bin sichern';

  @override
  String get readMemoryTitle => 'Speicher auslesen';

  @override
  String get readyTemplates => 'Fertige Vorlagen';

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
  String get redo => 'Wiederholen';

  @override
  String get removePasswordSubtitle => 'Entfernt Schutz mit bekanntem Passwort';

  @override
  String get removePasswordTitle => 'Passwort entfernen';

  @override
  String get rewriteTag => 'Erneut schreiben';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Regel mit Notiz \"$note\" löschen?';
  }

  @override
  String get ruleNoteDialogTitle => 'Tag-Notiz bearbeiten';

  @override
  String get ruleNoteLabel => 'In-App-Notiz / Bezeichnung';

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
  String get scanFabLabel => 'Tag scannen';

  @override
  String get scannedTag => 'Gescannter Tag';

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
  String get socialUsername => 'Benutzername / Profil';

  @override
  String get sourceSelectPrompt => 'Woher soll der Inhalt stammen?';

  @override
  String get statusCancelled => 'Abgebrochen';

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
  String get tabContact => 'Kontakt (vCard)';

  @override
  String get tabCustomMime => 'Eigener MIME';

  @override
  String get tabEmail => 'E-Mail';

  @override
  String get tabPhone => 'Telefon';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabText => 'Text';

  @override
  String get tabUrl => 'Web-URL';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => 'Tag-Informationen';

  @override
  String get tagLibraryTitle => 'Meine Tag-Mediathek';

  @override
  String tagRulesCount(int count) {
    return 'Gespeicherte Regeln: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Zeigt passende Notizen basierend auf dem SHA-256-Hash des NDEF-Inhalts an.';

  @override
  String get tagWritable => 'Beschreibbar';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get templateNameHint => 'Vorlagenname';

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
  String get videoUrlOrIdPrompt =>
      'Video-Link (https://...) oder YouTube-ID eingeben.';

  @override
  String get wifiAuthOpen => 'Offen (Ungesichert)';

  @override
  String get wifiPassword => 'Passwort';

  @override
  String get wifiSsid => 'Netzwerkname (SSID)';

  @override
  String get withSiri => 'Mit Siri';

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
  String get unknown => 'Unbekannt';

  @override
  String get error => 'Fehler';

  @override
  String get nfcPromptReady => 'Tag an Telefon halten';

  @override
  String get invalidResponseFormat => 'Ungültiges Antwortformat empfangen';

  @override
  String get nfcReadError => 'NFC-Lesefehler';

  @override
  String get invalidPlatformResponse =>
      'Ungültige Antwort von Plattform empfangen';

  @override
  String get writeFailed => 'Schreiben fehlgeschlagen';

  @override
  String get lockFailed => 'Sperren fehlgeschlagen';

  @override
  String get failedToConnectTag => 'Verbindung zum Tag fehlgeschlagen';

  @override
  String get invalidTagResponse => 'Ungültige Antwort vom Tag';

  @override
  String get commandFailed => 'Befehl fehlgeschlagen';

  @override
  String get ndefTypeOrIdTooLong => 'NDEF-Typ oder -ID überschreitet 255 Bytes';

  @override
  String get ndefUnsupportedOrInvalidRecord =>
      'Nicht unterstützter oder ungültiger NDEF-Datensatz';

  @override
  String get ndefMissingTypeLength => 'Fehlende NDEF-Typlänge';

  @override
  String get ndefMissingPayloadLength => 'Fehlende NDEF-Nutzlastlänge';

  @override
  String get ndefMissingIdLength => 'Fehlende NDEF-ID-Länge';

  @override
  String get ndefMissingType => 'Fehlender NDEF-Typ';

  @override
  String get ndefMissingId => 'Fehlende NDEF-ID';

  @override
  String get ndefMissingPayload => 'Fehlende NDEF-Nutzlast';

  @override
  String get unprotected => '(Ohne Passwort)';

  @override
  String get binaryDataPreview => '(Binärdaten)';

  @override
  String get emptyValue => '(Leer)';

  @override
  String get tnfEmpty => '0: Empty (Leer)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (Unbekannt)';

  @override
  String get tnfUnchanged => '6: Unchanged (Fragmentiertes NDEF)';

  @override
  String get tnfReserved => '7: Reserved (Reserviert)';

  @override
  String get ntagUnsupportedChip =>
      'Dieser Vorgang wird nur auf NTAG213/215/216 und MIFARE Ultralight EV1 Tags unterstützt.';

  @override
  String ntagPageReadFailed(String page) {
    return 'Seite $page konnte nicht gelesen werden (Tag hat nicht geantwortet oder Bereich geschützt).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'Seite $page konnte nicht geschrieben werden: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'Seite $page konnte nicht geschrieben werden (abgelehnt; gesperrt oder passwortgeschützt).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'Konnte nicht über Seite $page hinaus lesen; dieser Bereich ist möglicherweise passwortgeschützt.';
  }

  @override
  String get ntagPasswordPackSize =>
      'Passwort muss 4 Bytes und PACK 2 Bytes groß sein.';

  @override
  String get ntagPasswordSize => 'Passwort muss 4 Bytes groß sein.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'Falsches Passwort oder Tag hat Authentifizierung abgelehnt.';

  @override
  String get ntagPasswordWrong => 'Falsches Passwort.';

  @override
  String get ntagCcInvalid =>
      'Der CC-Bereich hat einen Nicht-NDEF-Wert; dieser OTP-Bereich kann nicht formatiert werden.';

  @override
  String get ntagDumpTooShort =>
      'Dump-Datei ist zu kurz; enthält keine Benutzerdaten.';

  @override
  String get ntagInvalidHex =>
      'Geben Sie einen gültigen Hex-Wert ein (z. B.: 30 04).';

  @override
  String get googleReviewFieldLabel => 'Bewertungslink oder Place ID';

  @override
  String get menuLinkFieldLabel => 'Menü-Link';

  @override
  String get menuTitleHint => 'Unser Menü';

  @override
  String get petName => 'Name des Haustiers';

  @override
  String get ownerPhone => 'Telefon des Besitzers';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'Hallo, ich bin $pet! Bitte rufen Sie meinen Besitzer an: $phone$note';
  }

  @override
  String get bloodType => 'Blutgruppe';

  @override
  String get allergies => 'Allergien / Medikamente';

  @override
  String get emergencyContact => 'Notfallkontakt';

  @override
  String get emergencyInfo => 'NOTFALLINFORMATION';

  @override
  String emergencyBlood(String blood) {
    return 'Blutgruppe: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'Allergien: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'Im Notfall anrufen: $contact';
  }

  @override
  String get storeLink => 'Store-Link';

  @override
  String get link => 'Link';

  @override
  String get title => 'Titel';

  @override
  String get webAddress => 'Webadresse';

  @override
  String get address => 'Adresse';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'Vorlagen: $added hinzugefügt, $updated aktualisiert';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'Tag-Notizen/Regeln: $added hinzugefügt, $updated aktualisiert';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'Scanverlauf übersprungen, da auf dem Gerät deaktiviert: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'Verlauf: $added hinzugefügt, $skipped vorhanden/übersprungen';
  }

  @override
  String get backupSummaryNoNewData =>
      'Keine neuen Daten zum Importieren gefunden (stimmte mit vorhandenen überein).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field muss eine Zeichenkette sein.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field muss ein gültiges Datum sein.';
  }

  @override
  String get rawTypeHexLabel => 'Typ (Hex-Bytes)';

  @override
  String get rawIdHexLabel => 'ID (Hex-Bytes, optional)';

  @override
  String get rawPayloadHexLabel => 'Payload (Hex-Bytes)';

  @override
  String get rawOptionalHexHint => 'Optionale Hex-Bytes';

  @override
  String get saveChanges => 'Änderungen speichern';

  @override
  String get edit => 'Bearbeiten';

  @override
  String get clearAllButton => 'Alle löschen';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: $count Seiten gelesen';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip formatiert';
  }

  @override
  String get ntagInvalidDumpFile =>
      'Ungültige Dump-Datei (muss Vielfaches von 4 Byte sein, 32–1024 Byte).';

  @override
  String ntagPagesWritten(int count) {
    return '$count Seiten geschrieben';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: Passwortschutz aktiviert';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: Passwort entfernt';
  }

  @override
  String get memoryDumpCopied => 'Speicherauszug kopiert';

  @override
  String ntagCommandsSent(int count) {
    return '$count Befehle gesendet';
  }

  @override
  String get emptyResponse => '(leere Antwort)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages Seiten · $bytes Bytes';
  }

  @override
  String get composeTextEmpty => 'Textinhalt darf nicht leer sein.';

  @override
  String get composeTextTooLong => 'Text ist zu lang (max. 5000 Zeichen).';

  @override
  String get composeUrlInvalid =>
      'Gültige Adresse eingeben (z.B. https://example.com oder app:// Link).';

  @override
  String get composeUrlTooLong => 'URL ist zu lang (max. 2000 Zeichen).';

  @override
  String get composeEmailInvalid =>
      'Gültige E-Mail-Adresse eingeben (z.B. name@domain.com).';

  @override
  String get composePhoneInvalid =>
      'Gültige Telefonnummer eingeben (z.B. +905551234567).';

  @override
  String get composeSmsPhoneInvalid =>
      'Gültige Empfänger-Telefonnummer eingeben.';

  @override
  String get composeLatInvalid =>
      'Breitengrad muss zwischen -90 und +90 liegen.';

  @override
  String get composeLngInvalid =>
      'Längengrad muss zwischen -180 und +180 liegen.';

  @override
  String get composeVcardNameEmpty =>
      'Kontaktname oder vollständiger Name darf nicht leer sein.';

  @override
  String get composeVcardNameTooLong =>
      'Kontaktname ist zu lang (max. 200 Zeichen).';

  @override
  String get composeVcardEmailInvalid => 'Gültige E-Mail-Adresse eingeben.';

  @override
  String get composeVcardPhoneInvalid => 'Gültige Telefonnummer eingeben.';

  @override
  String get composeVcardUrlInvalid =>
      'Gültige Webadresse eingeben (z.B. https://...).';

  @override
  String get composeCalSummaryEmpty => 'Ereignistitel darf nicht leer sein.';

  @override
  String get composeCalSummaryTooLong =>
      'Ereignistitel ist zu lang (max. 250 Zeichen).';

  @override
  String get composeCalDateInvalid => 'Endzeit muss nach der Startzeit liegen.';

  @override
  String get composeSpUriInvalid =>
      'Gültige Ziel-URL eingeben (z.B. https://...).';

  @override
  String get composeSpLangInvalid =>
      'Gültigen ISO-Sprachcode eingeben (z.B. de, en).';

  @override
  String get composeMimeTypeInvalid =>
      'Gültigen MIME-Typ eingeben (z.B. application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'Gültige Hex-Zeichenfolge eingeben (gerade Anzahl an Hex-Zeichen).';

  @override
  String get composeMimePayloadTooLarge => 'Nutzlast ist zu groß (max. 10 KB).';

  @override
  String get composeWifiSsidEmpty =>
      'Netzwerkname (SSID) darf nicht leer sein.';

  @override
  String get composeWifiPasswordRequired =>
      'WLAN-Passwort ist für verschlüsselte Netzwerke erforderlich.';

  @override
  String get composeWifiPasswordLength =>
      'WPA/WPA2-Passwort muss zwischen 8 und 63 Zeichen lang sein.';

  @override
  String get composeEditNdefRecord => 'NDEF-Datensatz bearbeiten';

  @override
  String get composeNewNdefRecord => 'Neuen NDEF-Datensatz erstellen';

  @override
  String get quickLinksHeader => 'Schnelllinks';

  @override
  String get quickLinkCustomUri => 'Benutzerdefinierter URI';

  @override
  String get quickLinkSocial => 'Soziale Netzwerke';

  @override
  String get quickLinkVideo => 'Video';

  @override
  String get quickLinkSearch => 'Suche';

  @override
  String get quickLinkFile => 'Datei';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime Audio';

  @override
  String get quickLinkAddress => 'Adresse';

  @override
  String get quickLinkPayment => 'Zahlungslink';

  @override
  String get quickLinkApp => 'App (Android)';

  @override
  String get updateRecord => 'Datensatz aktualisieren';

  @override
  String get addToList => 'Zur Liste hinzufügen';

  @override
  String get quickCustomUriError =>
      'Adresse mit Schema eingeben (z.B. spotify:track:... oder myapp://seite).';

  @override
  String get quickFileEmptyMessage => 'Dateilink eingeben.';

  @override
  String get quickPaymentEmptyMessage => 'Zahlungslink eingeben.';

  @override
  String get quickCustomUriDesc =>
      'Jede Adresse mit Schema möglich; das Telefon öffnet die passende App.';

  @override
  String get quickSocialLabel => 'Soziales Netzwerk';

  @override
  String get quickVideoLabel => 'Videolink';

  @override
  String get quickVideoHint => 'https://youtu.be/... oder Video-ID';

  @override
  String get quickVideoDesc =>
      'YouTube, Vimeo etc. Link oder nur YouTube-Video-ID eingeben.';

  @override
  String get quickSearchHint => 'z.B. Wetter Berlin';

  @override
  String get quickFileLabel => 'Dateilink';

  @override
  String get quickFileDesc =>
      'Aufgrund geringer Tag-Kapazität wird der Weblink statt der Datei selbst gespeichert (Google Drive, Dropbox etc.).';

  @override
  String get quickPhoneOrAppleId => 'Telefon oder Apple-ID';

  @override
  String get quickFacetimeVideoDesc =>
      'Ein iPhone, das den Tag berührt, startet einen FaceTime-Videoanruf.';

  @override
  String get quickFacetimeAudioDesc =>
      'Ein iPhone, das den Tag berührt, startet nur einen FaceTime-Audioanruf.';

  @override
  String get quickMapProvider => 'Karten-App';

  @override
  String get quickAddressHint => 'z.B. Brandenburger Tor, Berlin';

  @override
  String get quickPaymentDesc =>
      'Zahlungslinks wie PayPal.me, Stripe usw. können verwendet werden. Kartendaten werden niemals geschrieben.';

  @override
  String get quickAppDesc =>
      'Android-Telefone öffnen diese App beim Scannen (oder den Play Store). Das iPhone ignoriert diesen Typ; App Store-Link als URL hinzufügen.';

  @override
  String get quickDeviceNameOptional => 'Gerätename (optional)';

  @override
  String get quickSpeakerHint => 'z.B. Lautsprecher';

  @override
  String get quickBluetoothDesc =>
      'Android-Telefone schlagen beim Scannen die Kopplung vor. Das iPhone unterstützt keine Bluetooth-Kopplungs-Tags.';

  @override
  String get composeTextContent => 'Textinhalt';

  @override
  String get composeTextHint => 'Geben Sie den gewünschten Text ein';

  @override
  String get composeEmailSubjectOptional => 'Betreff (optional)';

  @override
  String get composeEmailBodyOptional => 'Nachrichtentext (optional)';

  @override
  String get composeSmsRecipient => 'Empfänger-Telefonnummer';

  @override
  String get composeSmsHint => 'Zu sendende SMS-Nachricht...';

  @override
  String get composeVcardFullName => 'Vollständiger Name (Anzeigename) *';

  @override
  String get composeVcardNameHint => 'Max Mustermann';

  @override
  String get composeVcardNote => 'Notiz / Beschreibung';

  @override
  String get composeCalTitle => 'Ereignistitel *';

  @override
  String get composeCalTitleHint => 'Projektbesprechung';

  @override
  String get composeCalLocationHint => 'Besprechungsraum 2 oder Online';

  @override
  String get composeCalDesc => 'Ereignisbeschreibung';

  @override
  String get composeCalStartEndTime => 'Start- und Endzeit:';

  @override
  String get composeSpTitleLabel => 'Titel (Angezeigter Text)';

  @override
  String get composeSpTitleHint => 'Unternehmensbroschüre';

  @override
  String get composeMimeTypeLabel => 'MIME-Typ *';

  @override
  String get composeDataFormat => 'Datenformat: ';

  @override
  String get composeFormatHex => 'Hex';

  @override
  String get composeMimeHexBytes => 'Hex-Bytes *';

  @override
  String get composeMimeTextPayload => 'Nutzlasttext (UTF-8) *';

  @override
  String get composeWifiWarningTitle => 'Sicherheits- und Plattformhinweis:';

  @override
  String get composeWifiWarningBody =>
      '• Das auf den Tag geschriebene WLAN-Passwort wird im Klartext gespeichert und kann von jedem gelesen werden.\n• Die automatische Verbindung beim Scannen ist nicht garantiert; eine Bestätigung kann erforderlich sein.';

  @override
  String get composeWifiSsidLabel => 'Netzwerkname (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'Sicherheitstyp (Authentifizierung)';

  @override
  String get composeWifiOpenNetwork => 'Offenes Netzwerk (Kein Passwort)';

  @override
  String get composeWifiPasswordLabel => 'WLAN-Passwort *';

  @override
  String get composeWifiEncryptionLabel => 'Verschlüsselungstyp';

  @override
  String get composeWifiAesRecommended => 'AES (Empfohlen)';

  @override
  String get quickSearchTextLabel => 'Suchbegriff';

  @override
  String get readTagMemoryPrompt =>
      'Tag an das Telefon halten, um den Speicher zu lesen';

  @override
  String get readingTagMemoryStatus => 'Speicher wird gelesen...';

  @override
  String get formatTagConfirmTitle => 'Speicher formatieren';

  @override
  String get formatTagConfirmMessage =>
      'Daten auf dem Tag werden gelöscht und als leeres NDEF vorbereitet. Fortfahren?';

  @override
  String get formatButton => 'Formatieren';

  @override
  String get formatTagPrompt => 'Tag zum Formatieren heranhalten';

  @override
  String get formattingStatus => 'Wird formatiert...';

  @override
  String filePickerFailed(String error) {
    return 'Dateiauswahl fehlgeschlagen: $error';
  }

  @override
  String get writeButton => 'Schreiben';

  @override
  String get writeDumpPrompt => 'Tag zum Schreiben des Dumps heranhalten';

  @override
  String get writingDumpStatus => 'Dump wird geschrieben...';

  @override
  String get setPasswordWarning =>
      'Wenn Sie das Passwort vergessen, kann der Inhalt nie wieder geändert werden. Lesen bleibt öffentlich.';

  @override
  String get setPasswordAction => 'Passwort festlegen';

  @override
  String get setPasswordPrompt => 'Tag zum Setzen des Passworts heranhalten';

  @override
  String get settingPasswordStatus => 'Passwort wird festgelegt...';

  @override
  String get removePasswordPromptMessage =>
      'Geben Sie das zuvor auf dem Tag festgelegte Passwort ein.';

  @override
  String get remove => 'Entfernen';

  @override
  String get removePasswordPrompt =>
      'Tag zum Entfernen des Passworts heranhalten';

  @override
  String get removingPasswordStatus => 'Passwort wird entfernt...';

  @override
  String get sendCommandsPrompt => 'Tag zum Senden von Befehlen heranhalten';

  @override
  String get sendingCommandsStatus => 'Befehle werden gesendet...';

  @override
  String get sendButton => 'Senden';

  @override
  String get tagNoteEditTitle => 'Tag-Notiz bearbeiten';

  @override
  String get tagNoteInputLabel => 'In-App-Notiz / Beschreibung';

  @override
  String get tagNoteInputHint =>
      'z.B. Besprechungsraum-Info oder Lagerregal #12';

  @override
  String get tagNoteDeleteTitle => 'Tag-Notiz löschen';

  @override
  String get clearAllTagRulesTitle => 'Alle Notizen löschen';

  @override
  String get clearAllTagRulesConfirm =>
      'Alle gespeicherten In-App-Tag-Notizen werden gelöscht. Bestätigen?';

  @override
  String get deleteAll => 'Alle löschen';

  @override
  String get tagRulesExplanation =>
      'Für Tags mit passendem NDEF SHA-256-Digest wird nur die Notiz angezeigt. Keine externe Aktion.';

  @override
  String get noTagRulesDefined => 'Noch keine Tag-Notizen definiert.';

  @override
  String lastUpdated(String time) {
    return 'Zuletzt aktualisiert: $time';
  }

  @override
  String get tagLibraryNoMatch => 'Keine Tags für Ihre Suche gefunden.';

  @override
  String get tagLibraryAddToLibrary => 'Zur Bibliothek hinzufügen';

  @override
  String get name => 'Name';

  @override
  String get tagLibraryAddTag => 'Tag hinzufügen';

  @override
  String get all => 'Alle';

  @override
  String tagLibraryPhotoError(String error) {
    return 'Foto konnte nicht ausgewählt werden: $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'Tag löschen';

  @override
  String get tagLibraryNameHint => 'z.B. Büroschlüsselanhänger';

  @override
  String get tagLibraryNoTagContent => 'Kein Tag-Inhalt in diesem Eintrag.';

  @override
  String get tagLibrarySourceLastScanned => 'Zuletzt gescannt';

  @override
  String get tagLibraryEmpty => 'Noch keine Tags gespeichert.';

  @override
  String get tagLibrarySourceEmpty => 'Leerer Eintrag';

  @override
  String get tagLibraryNamePrompt => 'Bitte geben Sie einen Tag-Namen ein';

  @override
  String get tagLibrarySearchHint => 'Nach Name, Kategorie oder Ort suchen...';

  @override
  String get tagLibrarySourceWriteList => 'Schreibliste';

  @override
  String get tagLibraryLocationHint => 'z.B. Schreibtisch, Eingangstür';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return 'Möchten Sie den Tag \"$name\" wirklich aus der Bibliothek löschen?';
  }

  @override
  String get noContent => 'Kein Inhalt';

  @override
  String tagLibraryRecordSummary(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count NDEF-Datensätze',
      one: '1 NDEF-Datensatz',
    );
    return '$_temp0';
  }

  @override
  String get tagLibraryEditTag => 'Tag bearbeiten';

  @override
  String get rawTypeHexHint => '41 (A) oder 55 (U) usw.';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: Feld \"records\" muss eine Liste sein.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: Ein Element darf maximal $max NDEF-Datensätze enthalten.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - Datensatz #$index ist kein gültiges Objekt.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - Datensatz #$index: Ungültiger TNF-Wert ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - Datensatz #$index: \"type\" muss ein Base64-String sein.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - Datensatz #$index: \"type\" sind keine gültigen Base64-Daten ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - Datensatz #$index: \"id\" muss ein Base64-String sein.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - Datensatz #$index: \"id\" sind keine gültigen Base64-Daten ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - Datensatz #$index: \"payload\" muss ein Base64-String sein.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - Datensatz #$index: \"payload\" sind keine gültigen Base64-Daten ($error).';
  }

  @override
  String get composerUndoSnack => 'Letzte Änderung rückgängig gemacht.';

  @override
  String get composerRedoSnack => 'Änderung wiederholt.';

  @override
  String get noRecordsToCopy => 'Keine NDEF-Datensätze zum Kopieren vorhanden.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count NDEF-Datensätze ($bytes B) in Zwischenablage kopiert.\n(Nur NDEF-Inhalt wird kopiert; UID/geschützte Sektoren werden nie geklont)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: $count Datensätze hinzugefügt.';
  }

  @override
  String get tagEmptyNoRecordsToImport =>
      'Tag ist leer; keine Datensätze zum Importieren.';

  @override
  String get sourceTag => 'Vom Tag';

  @override
  String get sourceQr => 'Vom QR-Code';

  @override
  String filePickerError(String error) {
    return 'Dateiauswahl konnte nicht geöffnet werden: $error';
  }

  @override
  String get csvFileTooLarge => 'CSV-Datei ist zu groß (max. 512 KB).';

  @override
  String get noRecordsFound => 'Keine Datensätze gefunden';

  @override
  String get someRowsSkipped => 'Einige Zeilen übersprungen';

  @override
  String get expectedFormat => 'Erwartetes Format:';

  @override
  String get noClipboardContent =>
      'Kein kopierter NDEF-Inhalt in der Zwischenablage.';

  @override
  String get pasteFromClipboardTitle => 'Aus NDEF-Zwischenablage einfügen';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'Zwischenablagedaten: $count Datensätze, $bytes Bytes ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      'Möchten Sie bestehende Einträge ersetzen oder anfügen?';

  @override
  String get pasteOverwriteOption => 'Überschreiben (Ersetzen)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'Aktuelle $count Einträge werden durch Zwischenablage ersetzt (Bestätigung nötig).';
  }

  @override
  String get pasteEmptySubtitle => 'Zwischenablage-Inhalt wird eingefügt.';

  @override
  String get pasteAppendOption => 'Am Ende anfügen';

  @override
  String get pasteAppendSubtitle =>
      'Bestehende Einträge bleiben erhalten; Datensätze werden angefügt.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count Datensätze hinzugefügt.';
  }

  @override
  String get confirmOverwriteTitle => 'Datensätze überschreiben?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'Es gibt $currentCount Einträge. Diese werden durch $newCount Datensätze ersetzt. Fortfahren?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'Datensätze durch $count Einträge ersetzt.';
  }

  @override
  String get yesReplace => 'Ja, Ersetzen';

  @override
  String recordsImportedToComposer(num count) {
    return '$count Datensätze importiert.';
  }

  @override
  String get noContentToCopy => 'Kein NDEF-Inhalt zum Kopieren gefunden.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count NDEF-Datensätze kopiert und angefügt (Inhalt kopiert, UID nicht geklont).';
  }

  @override
  String get noContentToRewrite =>
      'Kein NDEF-Inhalt zum Überschreiben gefunden.';

  @override
  String get rewriteTagTitle => 'Tag überschreiben';

  @override
  String get importantNotice => 'WICHTIGER HINWEIS:';

  @override
  String get rewriteNotice1 =>
      '• Dieser Vorgang ÜBERSCHREIBT den vorhandenen NDEF-Inhalt vollständig; hängt nicht an.\n';

  @override
  String get rewriteNotice2 =>
      '• Das Ziel muss ein beschreibbarer (entsperrter) NDEF-Tag sein.\n';

  @override
  String get rewriteNotice3 =>
      '• Schreibt nicht still auf vorherigen Tag; neuer NFC-Scan erforderlich.';

  @override
  String get rewriteInstruction =>
      'Ziel-Tag vorbereiten, auf \"Tippen und Schreiben\" tippen und an das Telefon halten.';

  @override
  String get tapAndWrite => 'Tippen und Schreiben';

  @override
  String get rewritePromptMessage =>
      'Ziel-Tag an das Gerät halten (Inhalt wird komplett erneuert)';

  @override
  String get writeVerifiedTitle => 'Schreiben verifiziert';

  @override
  String get writeVerifiedDesc =>
      'NDEF-Inhalt wurde erfolgreich geschrieben und verifiziert.';

  @override
  String get writeVerifiedHint =>
      'Sie können den nächsten Scan starten, um Daten zu vergleichen.';

  @override
  String get scanAndCompareNow => 'Jetzt scannen und vergleichen';

  @override
  String get contentMatchesExactly => 'Inhalt stimmt exakt überein';

  @override
  String get differenceDetected => 'Unterschied festgestellt';

  @override
  String get compareMatchDesc =>
      'NDEF-Nachricht auf dem Tag stimmt Byte für Byte mit der Quelle überein.';

  @override
  String get compareDiffDesc =>
      'Unterschied zwischen gelesenen und beabsichtigten Daten. Prüfen Sie, ob der Tag gesperrt ist.';

  @override
  String get batchEmptyComposerError =>
      'Fügen Sie vor dem Starten mindestens einen Datensatz hinzu.';

  @override
  String get batchWriteTitle => 'Batch-Tag-Schreiben';

  @override
  String get batchWriteSubtitle =>
      'Schreiben Sie denselben NDEF-Inhalt nacheinander auf mehrere Tags.';

  @override
  String get attention => 'ACHTUNG:';

  @override
  String get batchNotice1 =>
      '• Um versehentliches Doppelschreiben zu verhindern, startet jeder Schreibvorgang über \"Nächsten schreiben\".\n';

  @override
  String get batchNotice2 =>
      '• Kein automatisches Dauerscannen; Tags müssen physisch getauscht werden.';

  @override
  String get batchStartButton => 'Batch-Schreiben starten';

  @override
  String get batchControlPanelTitle => 'Batch-Schreib-Bedienfeld';

  @override
  String get batchCancelOrClose => 'Abbrechen / Schließen';

  @override
  String get batchAllCompleted => 'Alle Tag-Versuche abgeschlossen!';

  @override
  String batchStats(String ok, String failed, String left) {
    return 'Erfolgreich: $ok | Fehler: $failed | Übrig: $left';
  }

  @override
  String get waitingForTag => 'Warte auf Tag...';

  @override
  String get batchFinishButton => 'Batch-Schreiben beenden';

  @override
  String get writeError => 'Schreibfehler';

  @override
  String get batchConfirmCancelTitle => 'Batch-Schreiben abbrechen';

  @override
  String get batchConfirmCancelMessage =>
      'Batch-Schreiben beenden? Bisher beschriebene Tags bleiben erhalten; restliche werden nicht geschrieben.';

  @override
  String get cancelled => 'Abgebrochen';

  @override
  String get batchCancelledSnack =>
      'Batch-Schreiben abgebrochen. Inhalt wurde beibehalten.';

  @override
  String get cancelAndClose => 'Abbrechen und Schließen';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'Offline-URL-Prüfung';

  @override
  String get urlSafetyScheme => 'Schema (Protokoll):';

  @override
  String get urlSafetyPort => 'Port:';

  @override
  String get urlSafetyUserInfoLabel => 'Benutzerinfo:';

  @override
  String get urlSafetyIpLiteral => 'Direkte IP-Adresse (IP-Literal):';

  @override
  String get urlSafetyDomain => 'Nein (Domainname)';

  @override
  String get urlSafetyPunycodeLabel => 'International / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => 'Ja (Homoglyphen-Verdacht)';

  @override
  String get urlSafetyWarningsHeader => 'Sicherheits- / Warnhinweise:';

  @override
  String get urlSafetyDisclaimer =>
      'HINWEIS: Lokale Offline-Prüfung. Keine Online-Virenprüfung. URL wird nicht automatisch geöffnet.';

  @override
  String get templateSaveEmptyError =>
      'Fügen Sie Datensätze hinzu, bevor Sie als Vorlage speichern.';

  @override
  String templateDefaultName(String n) {
    return 'Vorlage $n';
  }

  @override
  String get templateNameSample => 'z.B. Firmenwebseite & Kontakt';

  @override
  String get templateSavedSnack => 'Vorlage gespeichert.';

  @override
  String get ruleNoteRequiresNdef =>
      'Tag muss mindestens einen NDEF-Datensatz enthalten, um eine Notiz hinzuzufügen.';

  @override
  String get ruleNoteAddTitle => 'Benutzerdefinierte Notiz hinzufügen';

  @override
  String get ruleNoteDigestExplanation =>
      'Bindet an NDEF SHA-256-Digest. Zeigt beim Scannen nur diese Beschreibung an; keine externen Aktionen.';

  @override
  String get ruleNoteSavedSnack => 'Tag-Notiz gespeichert.';

  @override
  String get ruleNoteDeleteConfirm =>
      'Die In-App-Notiz für diesen Tag wird gelöscht. Fortfahren?';

  @override
  String get ruleNoteDeletedSnack => 'Tag-Notiz gelöscht.';

  @override
  String get backupExportTitle => 'Backup exportieren';

  @override
  String get backupExportWarningTitle => 'DATENSCHUTZ- UND SICHERHEITSHINWEIS';

  @override
  String get backupExportWarningBody =>
      'Die exportierte Sicherungsdatei (JSON) ist Klartext. Sie kann sensible Daten wie WLAN-Passwörter oder vCards enthalten. Sicher aufbewahren.';

  @override
  String get backupIncludedItems => 'Enthaltene Elemente:';

  @override
  String backupTemplatesCount(String count) {
    return '• Vorlagen: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• Tag-Notizen/Regeln in der App: $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Scan-Verlauf einschließen (Optional)';

  @override
  String backupHistoryCount(String count) {
    return '$count Verlaufseinträge';
  }

  @override
  String get backupHistoryDisabled =>
      'Scan-Verlauf ist auf diesem Gerät deaktiviert';

  @override
  String get backupExportAndShare => 'Exportieren und Teilen';

  @override
  String get backupFileNameLabel => 'NFC Tag Master Sicherungsdatei';

  @override
  String get backupFileShareSubject =>
      'NFC Tag Master Vorlagen- und Datensicherung (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'Sicherungsdatei erfolgreich exportiert und geteilt.';

  @override
  String get backupExportCancelled => 'Export-Freigabe abgebrochen.';

  @override
  String get backupImportTitle => 'Backup importieren';

  @override
  String get backupMergeRuleTitle =>
      'SICHERHEITS- UND ZUSAMMENFÜHRUNGSRICHTLINIE';

  @override
  String get backupMergeRule1 =>
      '• Der Import erfolgt über ein MERGE; vorhandene Daten werden NIE gelöscht.\n';

  @override
  String get backupMergeRule2 =>
      '• Dateien können WLAN-Passwörter enthalten; nur aus vertrauenswürdigen Quellen laden.\n';

  @override
  String get backupMergeRule3 =>
      '• Dateigrößenlimit: 2 MiB. Strenge Schema- und Base64-Validierung vor dem Laden.';

  @override
  String get backupSelectFilePrompt =>
      'Wählen Sie eine gültige .json-Sicherungsdatei zum Zusammenführen.';

  @override
  String get selectFileButton => 'Datei auswählen';

  @override
  String get fileSelectionCancelled => 'Dateiauswahl abgebrochen.';

  @override
  String get backupFileExceedsLimit =>
      'Die ausgewählte Datei überschreitet das Limit von 2 MiB.';

  @override
  String fileReadError(String error) {
    return 'Fehler beim Lesen der Datei: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Fehler bei der Sicherungsprüfung: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Scan-Verlauf erkannt';

  @override
  String get backupHistoryDetectedPrompt =>
      'Möchten Sie den Verlauf importieren und aktivieren? Oder überspringen und nur Vorlagen laden?';

  @override
  String get backupSkipHistoryOption =>
      'Verlauf überspringen (Nur Vorlagen und Notizen laden)';

  @override
  String get backupEnableHistoryOption => 'Verlauf aktivieren und laden';

  @override
  String get nfcReadyStatus => 'NFC bereit';

  @override
  String get nfcReadyDesc => 'NFC-Hardware ist aktiv und einsatzbereit';

  @override
  String get nfcDisabledStatus => 'NFC deaktiviert';

  @override
  String get nfcDisabledDesc =>
      'NFC ist ausgeschaltet. Bitte in den Geräteeinstellungen aktivieren.';

  @override
  String get template => 'Vorlage';

  @override
  String get nfcScannerTitle => 'NFC-Scanner';

  @override
  String get composeRecord => 'Eintrag erstellen';

  @override
  String get protectOrRemove => 'Schützen / entfernen';

  @override
  String get previousScans => 'Vorherige Scans';

  @override
  String get noScannedTagYet => 'Noch kein NFC-Tag gescannt';

  @override
  String get tapScanPrompt =>
      'Tippen Sie auf \"Scan starten\" und halten Sie den Tag an das Telefon.';

  @override
  String get ndefCopyAndRewriteTitle =>
      'NDEF-Inhalt kopieren und überschreiben';

  @override
  String get savedTagNoteHeader => 'Gespeicherte Tag-Notiz (In-App-Regel)';

  @override
  String get tagNoteOrRule => 'Tag-Notiz / Regel';

  @override
  String get editNote => 'Notiz bearbeiten';

  @override
  String get deleteNote => 'Notiz löschen';

  @override
  String get tagNoteDigestNotice =>
      'Entspricht dem SHA-256-Digest der genauen NDEF-Bytes. Keine externen Aktionen.';

  @override
  String get addCustomTagNotePrompt =>
      'Sie können eine benutzerdefinierte Notiz für diesen NDEF-Inhalt hinzufügen.';

  @override
  String get addNoteToThisTag => 'Notiz zu diesem Tag hinzufügen';

  @override
  String get ndefSupport => 'NDEF-Unterstützung:';

  @override
  String get usedSpace => 'Belegter Speicher:';

  @override
  String get freeSpace => 'Freier Speicher:';

  @override
  String get noNdefMessageOnTag => 'Keine NDEF-Nachricht auf dem Tag gefunden.';

  @override
  String get hideDetails => 'Details ausblenden';

  @override
  String get advancedRecordInspector => 'Datensatz-Inspektor (Erweitert)';

  @override
  String get ndefRecordInspectorTitle => 'NDEF-Datensatz-Inspektor (Erweitert)';

  @override
  String get inspectorType => 'Typ:';

  @override
  String get inspectorPayloadLength => 'Nutzlastlänge:';

  @override
  String get inspectorRawHexPreview => 'Hex-Vorschau (Begrenzt):';

  @override
  String get ndefRecordsToWriteTitle => 'Zu schreibende NDEF-Datensätze';

  @override
  String get pasteFromClipboardAction =>
      'Aus Zwischenablage einfügen (Ersetzen / Anfügen)';

  @override
  String get importAction => 'Importieren';

  @override
  String get importFromTagAction => 'Von NFC-Tag importieren';

  @override
  String get importFromQrAction => 'Von QR-Code importieren';

  @override
  String get importFromCsvAction => 'Aus CSV-Datei importieren';

  @override
  String get composerEmptyDescription =>
      'Sie können Text, Weblinks, WLAN, Telefon, E-Mail, vCards und mehr auf Tags schreiben.';

  @override
  String get urlSafetyReview => 'URL-Prüfung';

  @override
  String get inspector => 'Inspektor';

  @override
  String get typeLabel => 'Typ:';

  @override
  String get payloadLabel => 'Nutzlast:';

  @override
  String get writeAndVerify => 'Auf Tag schreiben und verifizieren';

  @override
  String get batchWriteButtonLabel => 'Batch-Tag-Schreiben (2..100 Tags)';

  @override
  String get clearTagButtonLabel => 'Tag zurücksetzen (Inhalt löschen)';

  @override
  String get confirmWriteTitle => 'Schreiben auf Tag bestätigen';

  @override
  String get confirmWriteMessage1 =>
      'Dieser Vorgang ÜBERSCHREIBT vorhandene NDEF-Daten vollständig.';

  @override
  String get confirmWriteMessage2 =>
      'Stellen Sie sicher, dass der Tag beschreibbar ist. Inhalt wird danach verifiziert.';

  @override
  String get yesWrite => 'Ja, Schreiben';

  @override
  String get scanHistoryDisabledTitle => 'Scan-Verlauf deaktiviert';

  @override
  String get scanHistoryDisabledDesc =>
      'Aus Datenschutzgründen wird der Verlauf nicht gespeichert. In Einstellungen aktivierbar.';

  @override
  String get enableHistory => 'Verlauf aktivieren';

  @override
  String get historySearchHint =>
      'Nach UID, Text oder Typ suchen (z.B. URL, Wi-Fi, 04A1...)';

  @override
  String get noHistoryYet => 'Noch kein Scan-Verlauf vorhanden.';

  @override
  String get tryDifferentQuery =>
      'Versuchen Sie eine andere UID, Textinhalt oder Datensatztyp.';

  @override
  String get clearSearch => 'Suche löschen';

  @override
  String get deleteThisRecord => 'Diesen Eintrag löschen';

  @override
  String get qrPreview => 'QR-Vorschau';

  @override
  String get lockTagConfirmTitle => 'Tag dauerhaft sperren';

  @override
  String get lockTagWarning2 =>
      'Stellen Sie sicher, dass zuerst der richtige Inhalt geschrieben wurde.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'QR-Code-Vorschau';

  @override
  String get unknownParentheses => '(Unbekannt)';

  @override
  String get ok => 'OK';

  @override
  String rewriteSourceUid(String uid) {
    return 'Quell-UID: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return 'Zu schreibende Einträge: $count';
  }

  @override
  String rewriteFailed(String message) {
    return 'Neu schreiben fehlgeschlagen: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return 'Geschriebene Einträge: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'UID des gescannten Tags: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return 'Geschriebene Daten: $count Einträge ($bytes Byte)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'Gescannte Daten: $count Einträge ($bytes Byte)';
  }

  @override
  String batchTargetCount(String count) {
    return 'Ziel-Tags: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return 'Schreibliste: $count Einträge ($bytes Byte)';
  }

  @override
  String batchNext(String current, String total) {
    return 'Als Nächstes: Tag #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return 'Erfolgreich ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return 'Fehlgeschlagen: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'Tag #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'Tag #$n antippen und schreiben';
  }

  @override
  String batchPrompt(String current, String total) {
    return 'Stapelschreiben: Tag #$current / $total ans Telefon halten';
  }

  @override
  String batchWrittenVerified(String count) {
    return '$count Einträge geschrieben und geprüft';
  }

  @override
  String templateLoaded(String name) {
    return 'Einträge aus „$name“ wurden zur Schreibliste hinzugefügt.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'NDEF-Inhaltsprüfsumme (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return 'Exportfehler: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'Die Sicherung enthält $count Verlaufseinträge, aber der Verlauf ist auf diesem Gerät aus.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'Import erfolgreich:\n$summary';
  }

  @override
  String mergeError(String error) {
    return 'Fehler beim Zusammenführen: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'NDEF-Ablage: $count Einträge ($bytes B) - $source';
  }

  @override
  String get heroScanSubtitle =>
      'Halten Sie den Tag an die Oberseite des Telefons; Inhalt, Kapazität und Seriennummer erscheinen sofort.';

  @override
  String lastTagLabel(String uid) {
    return 'Letzter Tag: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'Scanfehler: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count Einträge ($bytes Byte) - nur NDEF-Daten, die UID wird nicht kopiert.';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'Tag $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'Fehler: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return 'Gelesene NDEF-Einträge ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return 'Zu schreibende NDEF-Einträge ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return 'Hinweis: Die Nutzlast hat $bytes Byte, daher werden nur die ersten 64 gezeigt.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return 'Gesamtgröße: $bytes Byte | Einträge: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return 'Schreiben und prüfen ($bytes Byte)';
  }

  @override
  String savedScansCount(String count) {
    return 'Gespeicherte Scans: $count';
  }

  @override
  String historyNoResults(String query) {
    return 'Keine Ergebnisse für „$query“.';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count Einträge';
  }

  @override
  String historyCapacity(String max, String used) {
    return 'Kapazität: $max B | Belegt: $used B';
  }

  @override
  String historySourceLabel(String uid) {
    return 'Verlauf UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count Einträge | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return 'Gespeicherte Regeln/Notizen: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return 'Geschriebene Byte: $bytes | Prüfung: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'Ein gesperrter Tag ist schreibgeschützt: Der Inhalt kann NIE geändert oder gelöscht und die Sperre NICHT aufgehoben werden. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'Nachrichtengröße: $bytes Byte';
  }

  @override
  String bytesShort(String bytes) {
    return 'Byte: $bytes B';
  }

  @override
  String bytesValue(String bytes) {
    return '$bytes Byte';
  }

  @override
  String bytesOfCapacity(String bytes, String max) {
    return '$bytes / $max Byte';
  }

  @override
  String get valueNone => 'Keine';

  @override
  String get valueYesIp => 'Ja (IP-Adresse)';

  @override
  String get nfcMissingShort => 'Kein NFC';

  @override
  String get clearClipboard => 'Ablage leeren';

  @override
  String get statLibrary => 'Bibliothek';

  @override
  String get scanTagTitle => 'Tag scannen';

  @override
  String get readingInProgress => 'Wird gelesen...';

  @override
  String get rawMemorySubtitle => 'Rohspeicher';

  @override
  String get copyToClipboard => 'In Ablage kopieren';

  @override
  String get serialUidLabel => 'Seriennr. (UID):';

  @override
  String get totalCapacityLabel => 'Gesamtkapazität:';

  @override
  String get technologiesLabel => 'Technologien:';

  @override
  String get idLabel => 'Kennung (ID):';

  @override
  String get undoTooltip => 'Rückgängig';

  @override
  String get clearComposer => 'Liste leeren';

  @override
  String composerTotalSize(String bytes) {
    return 'Gesamtgröße: $bytes Byte';
  }

  @override
  String get yesClear => 'Ja, leeren';

  @override
  String get ssidTooLong => 'Die SSID darf höchstens 32 Byte lang sein.';

  @override
  String get locationPlace => 'Ort';

  @override
  String get targetWebUrl => 'Ziel-URL *';

  @override
  String get languageCodeLabel => 'Sprachcode (ISO 639-1) *';

  @override
  String get utf8Text => 'UTF-8-Text';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf, Größe: $bytes Byte';
  }

  @override
  String get quickGallerySubtitle => 'Mit einem Tipp fertig';

  @override
  String get quickLibraryTitle => 'Meine Tags';

  @override
  String get quickLibrarySubtitle => 'Gespeicherte Tags';

  @override
  String get saveToLibrary => 'In Bibliothek speichern';

  @override
  String libraryMatch(String name) {
    return 'In der Bibliothek: $name';
  }

  @override
  String tagChipLabel(String chip) {
    return 'Chip: $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return 'Hersteller: $name';
  }

  @override
  String get settingsLibrarySubtitle =>
      'Ihre Tags mit Namen, Notizen und Fotos';

  @override
  String get showOnboardingAgain => 'Einführung erneut anzeigen';

  @override
  String get importFromGallery => 'Aus fertigen Vorlagen hinzufügen';

  @override
  String get appearanceTitle => 'Darstellung';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Hell';

  @override
  String get themeDark => 'Dunkel';

  @override
  String get valuePresentRisky => 'Vorhanden (evtl. riskant)';

  @override
  String get supportedValue => 'Unterstützt';

  @override
  String get notSupportedValue => 'Nicht unterstützt';

  @override
  String get nfcUnsupportedDesc =>
      'NFC wird auf diesem Gerät nicht unterstützt';

  @override
  String get ndefTrailingData => 'Zusätzliche Daten nach der NDEF-Nachricht';

  @override
  String get ndefMissingEnd => 'Ende der NDEF-Nachricht fehlt';

  @override
  String vcardPhoneShort(String value) {
    return 'Tel.: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'E-Mail: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return 'Firma: $value';
  }

  @override
  String get pageUidLock => 'UID / Sperre';

  @override
  String get pageData => 'Daten';

  @override
  String get pageLock => 'Sperre';

  @override
  String memoryPageLine(String page) {
    return 'Seite $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (Telefon)';

  @override
  String get mapApple => 'Apple Karten';

  @override
  String get mapGoogle => 'Google Maps';

  @override
  String get whatsappMessageHint => 'Hallo, ich hätte gern Informationen';

  @override
  String get facetimeTargetHint => '+4915112345678 oder name@icloud.com';

  @override
  String get bluetoothMacLabel => 'Bluetooth-MAC-Adresse';

  @override
  String get webAddressUrlLabel => 'Webadresse (URL)';

  @override
  String get latitudeLabel => 'Breitengrad (Lat)';

  @override
  String get longitudeLabel => 'Längengrad (Lng)';

  @override
  String get emailAddressLabel => 'E-Mail-Adresse';

  @override
  String get websiteLabel => 'Website';

  @override
  String get wifiAuthWpa2Home => 'WPA2 Personal (Standard für Zuhause/Büro)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 Personal (gemischt)';

  @override
  String get hostLabel => 'Host:';

  @override
  String get readOnlyLocked => 'Schreibgeschützt (gesperrt)';

  @override
  String get redoTooltip => 'Wiederholen';

  @override
  String historyFoundCount(String found, String total) {
    return 'Gefunden: $found / $total';
  }

  @override
  String get addToWriteListShort => 'Zur Schreibliste';

  @override
  String get mimeTypeHint => 'application/json oder text/plain';

  @override
  String get hapticsToggle => 'Haptisches Feedback';

  @override
  String get hapticsToggleSubtitle =>
      'Kurze Vibration nach dem Lesen oder Schreiben';

  @override
  String get soundsToggle => 'Töne';

  @override
  String get soundsToggleSubtitle => 'Kurzen Systemton beim Ergebnis abspielen';

  @override
  String get backupLibraryMustBeList =>
      'Die Tag-Bibliothek muss eine Liste sein.';

  @override
  String get backupInvalidLibraryEntry => 'Ungültiger Bibliothekseintrag.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'Die Bibliothek darf höchstens $max Einträge enthalten.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'Bibliothek: $added hinzugefügt';
  }

  @override
  String backupLibraryCount(String count) {
    return '• Tag-Bibliothek: $count (ohne Fotos)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return 'Letzter Tag: $bytes / $max B';
  }

  @override
  String get contentTooLargeForChips =>
      'Zu groß für gängige Tags; Text kürzen oder Kurzlink nutzen.';

  @override
  String get tagReportTitle => 'Tag-Bericht';

  @override
  String get tagReportSubtitle => 'Chip, Sperren, Passwort und Belegung';

  @override
  String get tagReportPrompt => 'Zu prüfenden Tag anhalten';

  @override
  String get tagReportBusy => 'Tag wird geprüft...';

  @override
  String tagReportDone(String chip) {
    return 'Bericht fertig: $chip';
  }

  @override
  String get unknownChip => 'Unbekannter Chip';

  @override
  String get yes => 'Ja';

  @override
  String get reportChip => 'Chip';

  @override
  String get reportNdefFormatted => 'NDEF-formatiert';

  @override
  String get reportWritable => 'Beschreibbar';

  @override
  String get reportStaticLock => 'Statische Sperre';

  @override
  String get reportDynamicLock => 'Dynamische Sperre';

  @override
  String get reportPassword => 'Passwortschutz';

  @override
  String get reportReadProtected => 'Lesegeschützt';

  @override
  String get reportNdefUsage => 'NDEF-Belegung';

  @override
  String get reportVerdictWritable => 'Tag ist bereit zum Schreiben';

  @override
  String get reportVerdictRestricted => 'Tag ist eingeschränkt';

  @override
  String get reportCopied => 'Bericht kopiert';

  @override
  String get compareTagsTitle => 'Zwei Tags vergleichen';

  @override
  String get compareTagsSubtitle =>
      'Prüfen, ob eine Kopie dem Original entspricht';

  @override
  String get compareStepFirst =>
      'Scannen Sie zuerst den ersten (originalen) Tag.';

  @override
  String get compareStepSecond => 'Scannen Sie jetzt den zweiten Tag.';

  @override
  String get compareIdentical => 'Inhalte stimmen überein';

  @override
  String get compareDifferent => 'Inhalte unterscheiden sich';

  @override
  String get compareSameTag => 'Derselbe Tag wurde zweimal gescannt.';

  @override
  String get compareDifferentTags => 'Zwei verschiedene Tags.';

  @override
  String get compareRecordSame => 'Gleich';

  @override
  String get compareRecordChanged => 'Abweichend';

  @override
  String get compareRecordOnlyFirst => 'Nur auf A';

  @override
  String get compareRecordOnlySecond => 'Nur auf B';

  @override
  String get compareBothEmpty => 'Beide Tags sind leer.';

  @override
  String capacityExceededShort(String needed, String max) {
    return 'Inhalt zu groß: $needed / $max Byte';
  }

  @override
  String get verifyFailedAfterWrite =>
      'Geschriebene Daten nicht bestätigt; Tag länger halten.';

  @override
  String get blankTagTitle => 'Tag ist noch nicht bereit';

  @override
  String get blankTagBody =>
      'Dieser Tag ist neu und nicht für NDEF formatiert. Die App kann ihn vorbereiten und den Inhalt mit einem Antippen schreiben (NTAG und MIFARE Ultralight).';

  @override
  String get blankTagAction => 'Vorbereiten und schreiben';

  @override
  String get shareTag => 'Teilen';

  @override
  String get shareAsText => 'Als Text teilen';

  @override
  String get shareAsFile => 'Als Datei teilen (.json)';

  @override
  String get shareAsFileSubtitle =>
      'Einträge lassen sich auf einem anderen Gerät exakt schreiben';

  @override
  String get importFromJsonFile => 'Aus Tag-Datei (.json)';

  @override
  String get invalidTagFile => 'Ungültige Tag-Datei.';

  @override
  String get continuousScanTitle => 'Dauerscan';

  @override
  String get continuousScanSubtitle =>
      'Tags nacheinander scannen und Liste als CSV teilen';

  @override
  String continuousScanCount(String count) {
    return '$count Tags gescannt';
  }

  @override
  String get exportCsv => 'Als CSV teilen';

  @override
  String get clearList => 'Liste leeren';

  @override
  String get csvColumnTime => 'Zeit';

  @override
  String get csvColumnRecords => 'Einträge';

  @override
  String get csvColumnContent => 'Inhalt';

  @override
  String get csvColumnCapacity => 'Kapazität (B)';

  @override
  String get csvColumnUsed => 'Belegt (B)';

  @override
  String get batchSerialToggle => 'Seriennummern hinzufügen';

  @override
  String batchSerialHint(String token) {
    return 'Steht $token in einem Eintrag, kommt die Nummer dorthin; sonst wird jedem Tag ein eigener Texteintrag mit der Nummer hinzugefügt.';
  }

  @override
  String get batchSerialPrefix => 'Präfix';

  @override
  String get batchSerialStart => 'Start';

  @override
  String get batchSerialDigits => 'Stellen';

  @override
  String batchSerialPreview(String first, String last) {
    return 'Erste: $first · Letzte: $last';
  }

  @override
  String get batchFromCsvButton => 'Aus CSV-Datei (eine Zeile pro Tag)';

  @override
  String get batchCsvTitle => 'Stapelschreiben aus CSV';

  @override
  String batchCsvSummary(String count) {
    return '$count Tags werden beschrieben. Jeder Tag erhält der Reihe nach eine Zeile der CSV-Datei.';
  }

  @override
  String batchCsvTruncated(String max) {
    return 'Beim Stapelschreiben werden höchstens $max Zeilen verwendet; der Rest wurde übersprungen.';
  }

  @override
  String get cloneTagTitle => 'Tag klonen';

  @override
  String get cloneTagSubtitle =>
      'Tag lesen und Inhalt auf andere Tags schreiben';

  @override
  String get cloneSourceStep =>
      'Schritt 1: Quell-Tag scannen. Nur der NDEF-Inhalt wird kopiert; die UID lässt sich nicht klonen.';

  @override
  String get cloneSourceEmpty =>
      'Der Quell-Tag enthält keine NDEF-Einträge zum Kopieren.';

  @override
  String get cloneReadyTitle => 'Quelle gelesen';

  @override
  String cloneReadySummary(String count, String bytes) {
    return '$count Einträge ($bytes Byte) werden kopiert. Wählen Sie nun die Anzahl der Tags.';
  }

  @override
  String get cloneEditFirst => 'Erst bearbeiten';

  @override
  String get tapPreviewTitle => 'Was passiert beim Antippen?';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'Der Tag ist leer; es passiert nichts.';

  @override
  String tapIosUrl(String target) {
    return 'Eine Mitteilung erscheint; Antippen öffnet $target in Safari oder der passenden App.';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target öffnet sich direkt im Browser oder der passenden App.';
  }

  @override
  String tapIosApp(String target) {
    return 'Eine Mitteilung erscheint; die App öffnet sich über „$target“, falls installiert.';
  }

  @override
  String tapAndroidApp(String target) {
    return 'Die App öffnet sich über „$target“, falls installiert.';
  }

  @override
  String tapIosCall(String target) {
    return 'Eine Mitteilung erscheint; Antippen ruft $target an.';
  }

  @override
  String tapAndroidCall(String target) {
    return 'Die Telefon-App öffnet sich mit $target.';
  }

  @override
  String tapIosSms(String target) {
    return 'Eine Mitteilung erscheint; Nachrichten öffnet eine neue Nachricht an $target.';
  }

  @override
  String tapAndroidSms(String target) {
    return 'Die Nachrichten-App öffnet sich für $target.';
  }

  @override
  String tapIosEmail(String target) {
    return 'Eine Mitteilung erscheint; Mail öffnet eine neue E-Mail an $target.';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'Die E-Mail-App öffnet sich für $target.';
  }

  @override
  String get tapIosMap =>
      'Das iPhone öffnet „geo:“-Orte nicht von selbst. Nutzen Sie einen Apple- oder Google-Maps-Link (Schnelllinks).';

  @override
  String get tapAndroidMap => 'Die Karten-App öffnet sich an diesem Ort.';

  @override
  String get tapIosNeedsApp =>
      'Das iPhone macht damit von selbst nichts; es muss mit einer NFC-App gelesen werden.';

  @override
  String get tapAndroidText =>
      'Auf den meisten Geräten passiert nichts oder der Text erscheint in einer Systemansicht.';

  @override
  String get tapAndroidContact =>
      'Es wird angeboten, den Kontakt hinzuzufügen.';

  @override
  String get tapAndroidWifi =>
      'Es wird angeboten, dem Netzwerk beizutreten (ab Android 10).';

  @override
  String get tapAndroidCalendar =>
      'Unterstützt die Kalender-App es, wird das Hinzufügen des Termins angeboten.';

  @override
  String get tapAndroidOther =>
      'Öffnet sich nur, wenn eine passende App installiert ist.';

  @override
  String tapIgnoredRecords(String count) {
    return 'Telefone reagieren nur auf den ersten Eintrag; die übrigen $count sieht man in NFC-Apps.';
  }

  @override
  String get tapIosRequirement =>
      'iPhone XS und neuer lesen im Hintergrund, wenn entsperrt und Kamera/Wallet nicht geöffnet sind.';

  @override
  String get galleryCatBusiness => 'Business';

  @override
  String get galleryCatSocial => 'Social';

  @override
  String get galleryCatHome => 'Zuhause';

  @override
  String get galleryCatPersonal => 'Persönlich';

  @override
  String get galleryCatAutomation => 'Automation';

  @override
  String get galleryFavorites => 'Favoriten';

  @override
  String get gallerySearchHint => 'Vorlagen suchen...';

  @override
  String get galleryNoResults => 'Keine passenden Vorlagen.';

  @override
  String get galleryAddFavorite => 'Zu Favoriten';

  @override
  String get galleryRemoveFavorite => 'Aus Favoriten entfernen';

  @override
  String get presetEventTitle => 'Event-Einladung';

  @override
  String get presetEventDesc =>
      'Schreibt den Termin als iCalendar; Android kann ihn in den Kalender übernehmen.';

  @override
  String get eventNameLabel => 'Name des Termins';

  @override
  String get eventDateLabel => 'Datum (JJJJ-MM-TT)';

  @override
  String get eventTimeLabel => 'Uhrzeit (HH:MM)';

  @override
  String get eventDateTimeInvalid =>
      'Ungültiges Datum oder Uhrzeit. Beispiel: 2026-12-31 und 19:00';

  @override
  String get presetLuggageTitle => 'Kofferanhänger';

  @override
  String get presetLuggageDesc =>
      'Wird er verloren, kann der Finder Sie leicht erreichen.';

  @override
  String luggageMessage(String name, String contact) {
    return 'Dieses Gepäck gehört $name. Bitte melden Sie sich unter: $contact';
  }

  @override
  String get presetPlaylistTitle => 'Playlist';

  @override
  String get presetPlaylistDesc =>
      'Öffnet eine Spotify-, Apple-Music- oder YouTube-Playlist.';

  @override
  String get playlistLinkLabel => 'Playlist-Link';

  @override
  String get presetEmailMeTitle => 'Schreib mir';

  @override
  String get presetEmailMeDesc =>
      'Öffnet eine neue E-Mail an Sie mit vorbereitetem Betreff.';

  @override
  String get presetCallMeTitle => 'Ruf mich an';

  @override
  String get presetCallMeDesc => 'Das Telefon ruft Ihre Nummer an.';

  @override
  String get presetRunShortcutTitle => 'Kurzbefehl ausführen';

  @override
  String get presetRunShortcutDesc =>
      'Führt den genannten iPhone-Kurzbefehl aus: Licht an, Musik starten, Fokus ändern...';

  @override
  String get shortcutNameLabel => 'Name des Kurzbefehls';

  @override
  String get recipesSection => 'Fertige Automations-Rezepte';

  @override
  String get recipesIntro =>
      'Erstellen Sie in Kurzbefehle einen Kurzbefehl mit dem Namen unten und fügen Sie die Aktionen hinzu. Verknüpfen Sie ihn dann mit einer NFC-Automation oder schreiben Sie mit „Zum Tag hinzufügen“ einen Startlink.';

  @override
  String get recipeAddToTag => 'Zum Tag hinzufügen';

  @override
  String get recipeBedTitle => 'Gute Nacht';

  @override
  String get recipeBedActions =>
      'Nachttisch: Schlaf-Fokus an · Wecker stellen · Licht aus';

  @override
  String get recipeCarTitle => 'Automodus';

  @override
  String get recipeCarActions =>
      'Autohalterung: Fokus Fahren · Route nach Hause · Musik starten';

  @override
  String get recipeDoorTitle => 'Bin zu Hause';

  @override
  String get recipeDoorActions =>
      'Haustür: Licht an · WLAN an · Familie „Bin da“ schreiben';

  @override
  String get recipeDeskTitle => 'Fokuszeit';

  @override
  String get recipeDeskActions =>
      'Schreibtisch: Fokus Arbeit · 25-Minuten-Timer · Fokus-Playlist';

  @override
  String get recipeGymTitle => 'Training';

  @override
  String get recipeGymActions =>
      'Sporttasche: Training starten · Trainings-Playlist · Nicht stören';

  @override
  String get recipeKitchenTitle => 'Küchentimer';

  @override
  String get recipeKitchenActions =>
      'Küche: 10-Minuten-Timer · Einkaufsliste öffnen';

  @override
  String get libraryLabelsField => 'Labels / Ordner (durch Komma getrennt)';

  @override
  String get libraryLabelsHint => 'Büro, 2. Stock';

  @override
  String librarySaveFailed(String error) {
    return 'Speichern fehlgeschlagen: $error';
  }

  @override
  String get csvColumnLabels => 'Labels';

  @override
  String get firstNameLabel => 'Vorname';

  @override
  String get lastNameLabel => 'Nachname';

  @override
  String get wifiPasswordMinHint => 'Mindestens 8 Zeichen';

  @override
  String get emailExampleHint => 'name@beispiel.de';

  @override
  String get wifiSsidExampleHint => 'Heim_WLAN_5G';

  @override
  String get nfcErrUnavailable =>
      'NFC ist auf diesem Gerät nicht verfügbar oder ausgeschaltet.';

  @override
  String get nfcErrBusy => 'Ein anderer NFC-Vorgang läuft; bitte warten.';

  @override
  String get nfcErrCancelled => 'Der Vorgang wurde abgebrochen.';

  @override
  String get nfcErrAppPaused =>
      'Der Vorgang wurde abgebrochen, weil die App in den Hintergrund ging.';

  @override
  String get nfcErrUnsupportedTag => 'Dieser Tag-Typ wird nicht unterstützt.';

  @override
  String get nfcErrNtagOnly =>
      'Dieses Werkzeug funktioniert nur mit NTAG-/MIFARE-Ultralight-Tags.';

  @override
  String get nfcErrNotNdefRead => 'Tag erkannt, aber nicht NDEF-formatiert.';

  @override
  String get nfcErrNotNdefWrite =>
      'Der Tag ist nicht NDEF-formatiert; dieses Telefon kann nicht direkt NDEF schreiben.';

  @override
  String get nfcErrReadOnly => 'Der Tag ist schreibgeschützt (gesperrt).';

  @override
  String get nfcErrNoData => 'Keine Daten zum Schreiben.';

  @override
  String nfcErrCapacity(String required, String max) {
    return 'Zu wenig Platz auf dem Tag: $required Byte nötig, $max Byte verfügbar.';
  }

  @override
  String get nfcErrCapacityShort => 'Zu wenig Platz auf dem Tag.';

  @override
  String get nfcErrVerify =>
      'Prüfung fehlgeschlagen: Gelesene Daten stimmen nicht überein.';

  @override
  String get nfcErrConnectionLost =>
      'Verbindung zum Tag verloren; ruhig halten und erneut versuchen.';

  @override
  String get nfcErrAlreadyLocked =>
      'Der Tag ist bereits gesperrt (schreibgeschützt).';

  @override
  String get nfcErrLockNotNdef =>
      'Der Tag ist nicht NDEF-formatiert; vor dem Sperren einen Eintrag schreiben.';

  @override
  String get nfcErrLockNotSupported =>
      'Dieser Tag-Typ unterstützt kein Sperren.';

  @override
  String get nfcSheetConnected => 'Tag verbunden, wird bearbeitet...';

  @override
  String get nfcSheetReadOk => 'Tag gelesen!';

  @override
  String get nfcSheetEmptyRead => 'Leerer Tag gelesen!';

  @override
  String get nfcSheetMultipleTags =>
      'Mehrere Tags erkannt. Nur einen Tag an das Telefon halten.';

  @override
  String get nfcSheetWriteVerified => 'Geschrieben und geprüft!';

  @override
  String get nfcSheetWritten => 'Auf den Tag geschrieben!';

  @override
  String get nfcSheetLocked => 'Der Tag ist jetzt dauerhaft gesperrt!';

  @override
  String get nfcWriteDone => 'Erfolgreich auf den Tag geschrieben.';

  @override
  String get errorWidgetMessage =>
      'Dieser Bereich konnte nicht angezeigt werden. Gehen Sie zurück und versuchen Sie es erneut.';

  @override
  String get nfcErrTimeout =>
      'Zeit abgelaufen, kein Tag erkannt. Halten Sie den Tag an die Oberseite des Telefons und versuchen Sie es erneut.';

  @override
  String get aboutTitle => 'Über';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get privacySummary =>
      'Ihre Daten bleiben auf diesem Gerät: kein Konto, kein Server, keine Werbung, kein Tracking.';

  @override
  String get whatsNewTitle => 'Neuigkeiten';

  @override
  String get whatsNew110 =>
      '• 14 Sprachen, Dunkelmodus und neues Design\n• Vorlagen mit Kategorien, Suche und Favoriten\n• Stapelschreiben mit Seriennummern, CSV und Klonen\n• Vorschau „Was passiert beim Antippen?“ und Kapazitätswarnungen\n• Tag-Bibliothek mit Fotos, Notizen und Labels\n• Tag-Bericht, Vergleich, Dauerscan und CSV-Export\n• Siri, Kurzbefehle und fertige Automationen';

  @override
  String lastBackupAt(String date) {
    return 'Letzte Sicherung: $date';
  }

  @override
  String get noBackupYet => 'Noch keine Sicherung.';

  @override
  String get backupStale =>
      'Die letzte Sicherung ist über 30 Tage alt; erstellen Sie eine neue.';

  @override
  String get backupICloudTip =>
      'Tipp: Wählen Sie im Teilen-Menü „In Dateien sichern“ → iCloud Drive, um die Sicherung in iCloud abzulegen.';

  @override
  String get dragToReorder => 'Zum Sortieren ziehen';

  @override
  String get modeTitle => 'Modus';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeCompat => 'Kompatibilität';

  @override
  String get modeNormalDesc =>
      'Normal: alle Funktionen aktiv; jeder Tag wird nach dem Schreiben geprüft.';

  @override
  String get modeCompatDesc =>
      'Kompatibilität: kein Zurücklesen nach dem Schreiben. Bei manchen alten oder schwierigen Tags zuverlässiger.';

  @override
  String get rateApp => 'App bewerten';

  @override
  String get rateAppUnavailable =>
      'Die Bewertung konnte gerade nicht angezeigt werden (in TestFlight nie).';

  @override
  String get chipsTitle => 'NFC-Chips';

  @override
  String get chipsSubtitle =>
      'Welchen Tag kaufen? Kapazität und Telefon-Unterstützung';

  @override
  String get chipsIntro =>
      'Nutzbare Bytes = maximaler NDEF-Inhalt. Für Einsteiger ist NTAG215 eine gute Wahl.';

  @override
  String chipsUsable(String bytes) {
    return 'Nutzbar: $bytes Byte';
  }

  @override
  String get chipsReadWrite => 'Lesen und Schreiben';

  @override
  String get chipsReadOnlyNdef => 'Nur NDEF-formatiert';

  @override
  String get chipsNotSupported => 'Nicht unterstützt';

  @override
  String get chipsNxpOnly => 'Nur Telefone mit NXP-Chipsatz';

  @override
  String get chipUseSmall => 'Ein Link, kurzer Text, WLAN; am günstigsten';

  @override
  String get chipUseMedium => 'Visitenkarten, mehrere Einträge; amiibo-Figuren';

  @override
  String get chipUseLarge => 'Lange Inhalte, ausführliche Visitenkarten';

  @override
  String get chipUseSecure =>
      'Fälschungssichere Authentifizierung (Produkte, Tickets)';

  @override
  String get chipUseTicket => 'Fahr- und Eintrittskarten';

  @override
  String get chipUseAccess => 'Tür-/Drehkreuz- und Hotelkarten';

  @override
  String get chipUseIndustrial =>
      'Bibliotheks-, Lager- und Industrie-Tags; größere Reichweite';

  @override
  String get chipUseJapan => 'Verbreitet in Japan (ÖPNV, Bezahlen)';

  @override
  String get chipUseLegacy =>
      'Veralteter Typ; für neue Projekte nicht empfohlen';

  @override
  String templateVarsHint(String date, String time, String counter) {
    return 'Tipp: $date, $time oder $counter in Text oder Link werden beim Schreiben ausgefüllt.';
  }

  @override
  String templateVarsPreview(String date, String time, String counter) {
    return 'Beim Schreiben: $date · $time · Zähler $counter';
  }

  @override
  String get libraryWriteToTag => 'Auf Tag schreiben';

  @override
  String libraryWritePrompt(String name) {
    return 'Tag annähern, um „$name“ zu schreiben';
  }

  @override
  String get presetSmartCardTitle => 'Smart Card';

  @override
  String get presetSmartCardDesc =>
      'Website, Kontaktkarte und optional WLAN auf einem Tag. Telefone öffnen zuerst die Website.';

  @override
  String get presetLostItemTitle => 'Fundsache';

  @override
  String get presetLostItemDesc =>
      'Der Finder bekommt beim Antippen eine fertige SMS an Sie.';

  @override
  String get lostItemNameLabel => 'Gegenstand (z. B. Schlüssel)';

  @override
  String lostItemSms(String item) {
    return 'Hallo, ich habe Ihr(e) $item gefunden.';
  }

  @override
  String lostItemText(String item, String name) {
    return 'Dieses $item gehört $name. Bitte melden Sie sich, wenn Sie es gefunden haben.';
  }

  @override
  String get presetVoiceTitle => 'Sprachnachricht';

  @override
  String get presetVoiceDesc =>
      'Auf Geschenk oder Box: Antippen spielt Ihre Sprachnotiz oder Ihr Lied.';

  @override
  String get voiceLinkLabel => 'Audio-Link (iCloud, Drive, SoundCloud…)';

  @override
  String get logbookTitle => 'Logbuch';

  @override
  String get logbookSubtitle =>
      'Anwesenheit, Medikamente, Inventur: jeder Scan mit Uhrzeit';

  @override
  String get logbookNew => 'Neues Logbuch';

  @override
  String get logbookName => 'Name des Logbuchs';

  @override
  String get logbookKindAttendance => 'Anwesenheit';

  @override
  String get logbookKindMedication => 'Medikamente';

  @override
  String get logbookKindInventory => 'Inventur';

  @override
  String get logbookKindCustom => 'Sonstiges';

  @override
  String get logbookEmpty =>
      'Noch keine Logbücher. Legen Sie z. B. „Klasse 3A“ oder „Abendtablette“ an.';

  @override
  String get logbookScanButton => 'Scannen und erfassen';

  @override
  String logbookEntryAdded(String label) {
    return 'Erfasst: $label';
  }

  @override
  String get logbookNoEntries => 'Noch keine Einträge.';

  @override
  String logbookToday(String count, String tags) {
    return 'Heute: $count Einträge · $tags verschiedene Tags';
  }

  @override
  String logbookMedTaken(String time) {
    return 'Heute genommen ✓ (zuletzt: $time)';
  }

  @override
  String get logbookMedNotTaken => 'Heute noch nicht genommen';

  @override
  String logbookInventorySummary(String count) {
    return '$count verschiedene Tags gezählt';
  }

  @override
  String logbookDeleteConfirm(String name) {
    return 'Logbuch „$name“ mit allen Einträgen löschen?';
  }

  @override
  String logbookEntries(String count) {
    return '$count Einträge';
  }

  @override
  String lastSeenAt(String date) {
    return 'Zuletzt gesehen: $date';
  }

  @override
  String get neverSeen => 'Noch nicht gescannt';

  @override
  String get sortLongestUnseen => 'Am längsten nicht gesehen';

  @override
  String get unseen30Days => 'Seit 30+ Tagen nicht gesehen';

  @override
  String get inventoryCardTitle => 'Dieser Tag ist in Ihrer Bibliothek';

  @override
  String scanReportLine(String unique, String dup, String empty) {
    return '$unique verschiedene Tags · $dup doppelt · $empty leer';
  }

  @override
  String get printSheet => 'Druckbarer Etikettenbogen (PDF)';

  @override
  String get phishDangerTitle => 'Achtung: möglicherweise gefälschte Seite';

  @override
  String get phishCautionTitle => 'Link vor dem Öffnen prüfen';

  @override
  String phishLookalike(String brand) {
    return 'Die Adresse ähnelt $brand, ist aber nicht die offizielle Domain.';
  }

  @override
  String phishBrandInSubdomain(String brand) {
    return '„$brand“ steht vor einer anderen Domain; die echte Seite ist eine andere.';
  }

  @override
  String phishBrandInName(String brand) {
    return 'Die Domain enthält „$brand“, ist aber nicht die offizielle Seite.';
  }

  @override
  String phishShortener(String host) {
    return 'Gekürzter Link ($host): die echte Adresse ist verborgen.';
  }

  @override
  String phishRiskyTld(String tld) {
    return 'Die Endung „.$tld“ wird oft für Phishing genutzt.';
  }

  @override
  String get phishDisclaimer =>
      'Diese Prüfung nutzt Offline-Hinweise und garantiert keine Sicherheit.';

  @override
  String get backupEncrypt => 'Mit Passwort schützen';

  @override
  String get backupEncryptHint =>
      'Die Sicherung wird mit AES-256 verschlüsselt. Ohne Passwort lässt sie sich nicht öffnen.';

  @override
  String get backupPassword => 'Passwort';

  @override
  String get backupPasswordRepeat => 'Passwort (wiederholen)';

  @override
  String backupPasswordTooShort(String min) {
    return 'Das Passwort braucht mindestens $min Zeichen.';
  }

  @override
  String get backupPasswordMismatch => 'Die Passwörter stimmen nicht überein.';

  @override
  String get backupEncryptedPrompt =>
      'Diese Sicherung ist geschützt. Passwort eingeben.';

  @override
  String get backupWrongPassword => 'Falsches Passwort.';

  @override
  String get backupDecryptFailed =>
      'Entschlüsselung fehlgeschlagen; die Datei ist evtl. beschädigt.';

  @override
  String get appLockTitle => 'App-Sperre';

  @override
  String get appLockSubtitle =>
      'Face ID, Touch ID oder Gerätecode beim Öffnen verlangen';

  @override
  String get appLockUnavailable =>
      'Auf diesem Gerät ist keine Bildschirmsperre eingerichtet.';

  @override
  String get appLockLocked => 'App gesperrt';

  @override
  String get appLockUnlock => 'Entsperren';

  @override
  String get appLockReason =>
      'Um Ihre Tag-Bibliothek und den Verlauf zu öffnen';

  @override
  String get sigTitle => 'Signierte Tags';

  @override
  String get sigSubtitle => 'Erkennen, wenn jemand den Inhalt ändert';

  @override
  String get sigExplain =>
      'Ihre Tags erhalten einen Signatur-Eintrag mit Ihrem geheimen Schlüssel. Beim Lesen mit dieser App wird jede Änderung erkannt. Teilen Sie den Schlüssel mit Ihrem Team; ohne ihn lässt sich die Signatur nicht fälschen. Lesen bleibt für alle möglich.';

  @override
  String get sigCreateKey => 'Schlüssel erstellen';

  @override
  String get sigCopyKey => 'Schlüssel kopieren (mit Team teilen)';

  @override
  String get sigImportKey => 'Schlüssel einfügen';

  @override
  String get sigImportInvalid =>
      'Die Zwischenablage enthält keinen gültigen Schlüssel.';

  @override
  String sigKeyReady(String id) {
    return 'Schlüssel bereit ($id)';
  }

  @override
  String get sigSignOnWrite => 'Geschriebene Tags signieren';

  @override
  String get sigValid => 'Signatur gültig';

  @override
  String get sigInvalid => 'Signatur ungültig: Inhalt geändert';

  @override
  String get sigOtherKey => 'Mit einem anderen Schlüssel signiert';

  @override
  String get sigReplaceKeyConfirm =>
      'Aktuellen Schlüssel ersetzen? Mit dem alten signierte Tags gelten dann als „anderer Schlüssel“.';

  @override
  String get amiiboTitle => 'Amiibo-Info';

  @override
  String get amiiboSubtitle => 'Figur-/Karten-ID und Serie (nur lesen)';

  @override
  String get amiiboPrompt => 'Amiibo-Figur oder -Karte annähern';

  @override
  String amiiboNotNtag215(String chip) {
    return 'Kein amiibo ($chip); amiibo nutzen NTAG215.';
  }

  @override
  String get amiiboNotFound => 'NTAG215 gelesen, aber keine amiibo-Daten.';

  @override
  String amiiboSeries(String series) {
    return 'Serie: $series';
  }

  @override
  String amiiboType(String type) {
    return 'Typ: $type';
  }

  @override
  String get amiiboFigure => 'Figur';

  @override
  String get amiiboCard => 'Karte';

  @override
  String get amiiboYarn => 'Wolle';

  @override
  String get amiiboLookup => 'Namen online suchen (amiiboapi.com)';

  @override
  String memoryEditPage(String page) {
    return 'Seite $page bearbeiten (4 Hex-Bytes)';
  }

  @override
  String get memoryEditHint =>
      'Tippen Sie auf eine Benutzerseite, um sie zu bearbeiten.';

  @override
  String memoryEditPrompt(String page) {
    return 'Denselben Tag annähern, um Seite $page zu schreiben';
  }

  @override
  String memoryPageWritten(String page) {
    return 'Seite $page geschrieben.';
  }

  @override
  String get memoryUidMismatch => 'Anderer Tag erkannt; nichts geschrieben.';

  @override
  String memoryReadSpeed(String ms, String rate) {
    return 'Lesezeit: $ms ms ($rate Byte/s)';
  }

  @override
  String get simpleModeTitle => 'Einfacher Modus';

  @override
  String get simpleModeSubtitle =>
      'Große Tasten; Lesen mit einem Tipp für Kinder und Ältere';

  @override
  String get simpleScan => 'Tag lesen';

  @override
  String get simpleHint => 'Halten Sie den Tag an die Oberseite des Telefons.';

  @override
  String get simpleCall => 'Anrufen';

  @override
  String get simpleMessage => 'Nachricht senden';

  @override
  String get simpleOpen => 'Öffnen';

  @override
  String get simpleEmail => 'E-Mail schreiben';

  @override
  String get simpleMap => 'In Karten öffnen';

  @override
  String get simpleExit => 'Gedrückt halten für die normale Ansicht';

  @override
  String get simpleNothing => 'Auf diesem Tag gibt es nichts anzuzeigen.';

  @override
  String whatsNew120(String date, String time, String counter) {
    return '• Logbuch: Anwesenheit, Medikamente und Inventur\n• Sicherheit: Face-ID-Sperre, verschlüsselte Backups, signierte Tags, Warnung vor Fake-Seiten\n• Vorlagenvariablen ($date, $time, $counter) und Schreiben aus der Bibliothek\n• Neue Vorlagen: Smart Card, Fundsache, Sprachnachricht\n• Druckbarer Etikettenbogen mit QR-Codes (PDF)\n• Einfacher Modus, amiibo-Info, Byte-Editor, NFC-Chip-Ratgeber\n• Sortieren per Drag & Drop und Kompatibilitätsmodus';
  }

  @override
  String get logbookKindTimeClock => 'Kommen / Gehen (Zeiterfassung)';

  @override
  String get logbookCheckIn => 'Kommen';

  @override
  String get logbookCheckOut => 'Gehen';

  @override
  String logbookCheckedIn(String label) {
    return 'Gekommen: $label';
  }

  @override
  String logbookCheckedOut(String label) {
    return 'Gegangen: $label';
  }

  @override
  String logbookPresentNow(String count) {
    return 'Jetzt anwesend: $count';
  }

  @override
  String logbookWorkedToday(String duration) {
    return 'Heute gesamt: $duration';
  }

  @override
  String get logbookWorkedPerPerson => 'Zeit heute';

  @override
  String durationHm(String h, String m) {
    return '$h Std. $m Min.';
  }

  @override
  String get csvColumnDirection => 'Richtung';

  @override
  String get libraryCheckEvery => 'Prüfintervall';

  @override
  String get libraryCheckNone => 'Keins';

  @override
  String libraryCheckDays(String days) {
    return 'Alle $days Tage';
  }

  @override
  String get libraryCheckHint =>
      'Wird der Tag in dieser Zeit nicht gescannt, wird er als fällig markiert (Feuerlöscher, Filter, Pflanzen gießen…).';

  @override
  String get libraryCheckDue => 'Prüfung fällig';

  @override
  String libraryCheckNext(String date) {
    return 'Nächste Prüfung: $date';
  }

  @override
  String libraryDueFilter(String count) {
    return 'Prüfung fällig ($count)';
  }

  @override
  String libraryCheckRecorded(String date) {
    return 'Prüfung erfasst · nächste: $date';
  }

  @override
  String cloneWarning(String name) {
    return 'Dieser Inhalt ist in Ihrer Bibliothek unter „$name\" mit anderer UID gespeichert. Dieser Tag könnte eine Kopie sein.';
  }

  @override
  String get doctorTitle => 'NDEF-Doktor';

  @override
  String get doctorButton => 'Prüfen';

  @override
  String get doctorTooShort =>
      'Speicher nicht vollständig gelesen; Tag länger halten und erneut versuchen.';

  @override
  String get doctorNoCc =>
      'Der Tag ist nicht für NDEF vorbereitet (leer). Werkzeuge → „NDEF formatieren\" oder einfach beschreiben.';

  @override
  String get doctorVersion =>
      'Ungewöhnliches NDEF-Versionsbyte; manche Telefone lesen den Tag evtl. nicht.';

  @override
  String get doctorReadRestricted =>
      'Lesezugriff ist eingeschränkt markiert; Telefone zeigen den Inhalt evtl. nicht.';

  @override
  String get doctorReadOnly =>
      'Der Tag ist schreibgeschützt (gesperrt); Inhalt nicht änderbar.';

  @override
  String get doctorNoNdef =>
      'Kein NDEF-Block im Speicher. Erneutes Beschreiben behebt das.';

  @override
  String get doctorEmpty => 'Der Tag ist vorbereitet, aber leer.';

  @override
  String get doctorOverflow =>
      'Ein Längenfeld reicht über den Speicher hinaus; Inhalt beschädigt. Tag neu beschreiben.';

  @override
  String doctorExceeds(String bytes) {
    return 'Die Nachricht ($bytes Bytes) ist größer als die angegebene Kapazität; Telefone lesen sie evtl. abgeschnitten.';
  }

  @override
  String get doctorNoTerminator =>
      'Endmarke (FE) fehlt. Die meisten Telefone lesen trotzdem; neu beschreiben behebt es.';

  @override
  String get doctorUnknownTlv =>
      'Unbekannter Datenblock im Speicher; Telefone brechen dort evtl. ab.';

  @override
  String doctorBadRecord(String n) {
    return 'Datensatz $n ist fehlerhaft (Kopf oder Länge). Tag neu beschreiben.';
  }

  @override
  String doctorHealthy(String count) {
    return 'Alles in Ordnung: $count Datensätze korrekt geschrieben.';
  }

  @override
  String get libraryImportTitle => 'Aus Tabelle importieren';

  @override
  String get libraryImportHint =>
      'Zeilen aus Excel, Numbers oder Google Tabellen kopieren und hier einfügen. Spalten: Name, Inhalt (Link oder Text), Ort, Labels, Notiz, UID. Mit Kopfzeile werden Spalten nach Namen zugeordnet.';

  @override
  String libraryImportPreview(String count) {
    return '$count Tags werden hinzugefügt';
  }

  @override
  String libraryImportSkipped(String dupes, String invalid) {
    return '$dupes Zeilen übersprungen (UID schon gespeichert), $invalid ohne Namen';
  }

  @override
  String get libraryImportPaste => 'Aus Zwischenablage einfügen';

  @override
  String get libraryImportAdd => 'Hinzufügen';

  @override
  String libraryImportDone(String count) {
    return '$count Tags zur Bibliothek hinzugefügt';
  }

  @override
  String get presetGiftTitle => 'Geschenknachricht';

  @override
  String get presetGiftDesc =>
      'Aufs Geschenk kleben: Antippen zeigt Ihre Nachricht und optional einen Videolink.';

  @override
  String get giftTo => 'Für';

  @override
  String get giftFrom => 'Von';

  @override
  String get giftVideo => 'Videolink (optional)';

  @override
  String giftText(String to, String message, String from) {
    return '🎁 $to,\n$message\n— $from';
  }

  @override
  String get presetPlantTitle => 'Pflanzenpflege-Karte';

  @override
  String get presetPlantDesc =>
      'Am Topf anbringen: Gießen und Licht. Mit Prüfintervall in der Bibliothek auch als Gießerinnerung.';

  @override
  String get plantName => 'Pflanzenname';

  @override
  String get plantWater => 'Gießen';

  @override
  String get plantLight => 'Licht';

  @override
  String plantText(String plant, String water, String light) {
    return '🌱 $plant\n💧 $water\n☀️ $light';
  }

  @override
  String get presetChildTitle => 'Kinder-Sicherheitsarmband';

  @override
  String get presetChildDesc =>
      'Für volle Orte: Wer antippt, sieht den Namen des Kindes und ruft die Eltern mit einem Tipp an.';

  @override
  String get childName => 'Name des Kindes';

  @override
  String childText(String name, String phone) {
    return 'Hallo, ich bin $name. Wenn ich verloren bin, ruf bitte meine Familie an: $phone';
  }

  @override
  String get presetManualTitle => 'Anleitungskarte';

  @override
  String get presetManualDesc =>
      'Fitnessgerät, Kaffeemaschine, Ferienwohnung: Kurzanleitung plus Video- oder Handbuchlink.';

  @override
  String get manualItem => 'Gerät / Gegenstand';

  @override
  String get manualSteps => 'Kurzanleitung';

  @override
  String get manualLink => 'Video-/Handbuchlink (optional)';

  @override
  String get libraryAutoLog => 'Beim Scannen ins Logbuch';

  @override
  String get libraryAutoLogHint =>
      'Wird dieser Tag im Hauptbildschirm gescannt, entsteht automatisch ein Eintrag im gewählten Logbuch (z. B. Türtag → Kommen/Gehen).';

  @override
  String autoLogged(String book) {
    return 'Ins Logbuch „$book\" eingetragen';
  }

  @override
  String get whatsNew130 =>
      '• Kommen/Gehen-Logbuch: wer ist da, Stunden heute\n• Bibliotheks-Tags schreiben beim Scannen automatisch ins Logbuch\n• Prüferinnerungen und Filter „fällig\"\n• Warnung vor kopierten Tags\n• NDEF-Doktor: erkennt defekte Tags\n• Massenimport in die Bibliothek aus Excel/Numbers\n• Neue Vorlagen: Geschenknachricht, Pflanzenpflege, Kinderarmband, Anleitungskarte';

  @override
  String get securityTitle => 'Sicherheit & Datenschutz';

  @override
  String get lockAfterTitle => 'Erneut sperren nach';

  @override
  String get lockImmediately => 'Sofort';

  @override
  String lockAfterSecondsLabel(String n) {
    return '$n s';
  }

  @override
  String lockAfterMinutesLabel(String n) {
    return '$n Min.';
  }

  @override
  String get hideInSwitcherTitle => 'Im App-Umschalter ausblenden';

  @override
  String get hideInSwitcherSubtitle =>
      'Im Hintergrund wird der Bildschirm unscharf. Unter Android sind auch Screenshots gesperrt.';

  @override
  String get clearClipboardTitle => 'Zwischenablage automatisch leeren';

  @override
  String get clearClipboardSubtitle =>
      'Sensible Werte wie kopierte Schlüssel werden nach 60 Sekunden entfernt.';

  @override
  String get securityConfirmReason =>
      'Zum Fortfahren bestätigen Sie Ihre Identität';

  @override
  String get securityCopiedClears => 'Kopiert · wird in 60 s gelöscht';

  @override
  String get wipeTitle => 'Alle Daten löschen';

  @override
  String get wipeSubtitle =>
      'Verlauf, Bibliothek, Fotos, Logbücher, Vorlagen, Signaturschlüssel und Einstellungen';

  @override
  String get wipeConfirm =>
      'Alle Daten dauerhaft von diesem Gerät löschen? Das lässt sich nicht rückgängig machen; erstellen Sie vorher ein Backup.';

  @override
  String get wipeDone => 'Alle Daten gelöscht';

  @override
  String dataSummary(
      String history, String library, String books, String templates) {
    return '$history Verlauf · $library Bibliothek · $books Logbücher · $templates Vorlagen';
  }

  @override
  String get secCheckTitle => 'Sicherheitscheck';

  @override
  String secCheckScore(String ok, String total) {
    return '$ok/$total empfohlene Einstellungen aktiv';
  }

  @override
  String get secCheckBackup => 'In den letzten 30 Tagen gesichert';

  @override
  String get secCheckEncryptedNote =>
      'Backups können WLAN-Passwörter enthalten; beim Export wird ein Passwortschutz empfohlen.';

  @override
  String get packShare => 'Als Team-Paket teilen';

  @override
  String get packImport => 'Team-Paket importieren';

  @override
  String get packHint =>
      'Die sichtbaren Tags (gefiltert) werden in einer Datei geteilt; Kollegen fügen sie über Bibliothek → Importieren hinzu. Fotos werden nicht geteilt.';

  @override
  String get packName => 'Paketname';

  @override
  String packIncludeTemplates(String count) {
    return 'Gespeicherte Vorlagen einschließen ($count)';
  }

  @override
  String packCount(String count) {
    return '$count Tags werden geteilt';
  }

  @override
  String get packPassword => 'Passwort (optional, mind. 6 Zeichen)';

  @override
  String get packPasswordShort => 'Passwort muss mind. 6 Zeichen haben';

  @override
  String packPreview(String name, String tags, String templates) {
    return '„$name\": $tags Tags, $templates Vorlagen. Importieren?';
  }

  @override
  String packImported(String tags, String templates, String skipped) {
    return '$tags Tags und $templates Vorlagen hinzugefügt · $skipped schon vorhanden';
  }

  @override
  String packInvalid(String reason) {
    return 'Diese Datei ist kein gültiges Team-Paket ($reason)';
  }

  @override
  String get libraryMoreActions => 'Weitere Aktionen';

  @override
  String get appIconTitle => 'App-Symbol';

  @override
  String get appIconFailed => 'Symbol konnte nicht geändert werden';

  @override
  String get iconBlue => 'Blau';

  @override
  String get iconGreen => 'Grün';

  @override
  String get iconPurple => 'Lila';

  @override
  String get iconOrange => 'Orange';

  @override
  String get iconDark => 'Nacht';

  @override
  String get mapTitle => 'Tag-Karte';

  @override
  String get mapEmpty =>
      'Noch keine Tags auf der Karte. Tag bearbeiten und „Aktuellen Ort hinzufügen\" tippen oder einen Ort auf den Tag schreiben.';

  @override
  String get mapTilesNote => 'Kartenbilder werden von OpenStreetMap geladen.';

  @override
  String get mapOpenInMaps => 'In Karten öffnen';

  @override
  String get mapAddCurrent => 'Aktuellen Ort hinzufügen';

  @override
  String mapPositionSaved(String lat, String lng) {
    return 'Ort: $lat, $lng';
  }

  @override
  String get mapLocationDenied =>
      'Standortzugriff nicht erlaubt. Unter Einstellungen → Datenschutz → Ortungsdienste freigeben.';

  @override
  String mapLocationFailed(String error) {
    return 'Standort nicht verfügbar: $error';
  }
}
