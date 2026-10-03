// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get addRecord => 'Aggiungi record';

  @override
  String get addToComposerList => 'Aggiungi a lista scrittura';

  @override
  String get addToWriteList => 'Aggiungi a lista scrittura';

  @override
  String get addressCannotBeEmpty => 'L\'indirizzo non può essere vuoto.';

  @override
  String get advancedCommandsDesc =>
      'Un comando hex per riga. Es: 60 = GET_VERSION, 30 04 = leggi pagina 4. Comandi errati possono danneggiare il tag.';

  @override
  String get advancedCommandsSubtitle =>
      'Invia comandi esadecimali grezzi al tag';

  @override
  String get advancedCommandsTitle => 'Comandi NFC avanzati';

  @override
  String get appLinksDesc =>
      'Scrivendoli su un tag, toccarlo mostra una notifica e apre l\'app direttamente nella schermata scelta.';

  @override
  String get appLinksSection => 'Link dell\'applicazione';

  @override
  String get appPackageName => 'Nome pacchetto Android';

  @override
  String get appSettings => 'Impostazioni app';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'Esegui automaticamente al tocco';

  @override
  String get backupFileSizeExceeded => 'La dimensione del file supera 2 MiB.';

  @override
  String get backupHistoryMustBeList =>
      'Il campo \"history\" deve essere una lista.';

  @override
  String backupInvalidJson(String error) {
    return 'Formato JSON non valido: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Nota regola non valida.';

  @override
  String get backupInvalidRuleSha => 'Hash SHA-256 non valido.';

  @override
  String get backupInvalidTemplateId => 'ID modello non valido.';

  @override
  String get backupInvalidTemplateName => 'Nome modello non valido.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Numero cronologia superiore a $max ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'Numero di regole superiore a $max ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'Numero di modelli superiore a $max ($count).';
  }

  @override
  String get backupMissingSchemaVersion => 'Campo \"schemaVersion\" mancante.';

  @override
  String get backupRecordMustBeObject =>
      'Ogni record deve essere un oggetto JSON.';

  @override
  String get backupRestoreSubtitle =>
      'Salva modelli, note e cronologia in formato JSON o uniscili ai dati attuali.';

  @override
  String get backupRestoreTitle => 'Backup e Ripristino (JSON)';

  @override
  String get backupRootMustBeObject => 'La radice deve essere un oggetto JSON.';

  @override
  String get backupRuleMustBeObject =>
      'Ogni regola deve essere un oggetto JSON.';

  @override
  String get backupSchemaVersionMustBeInt =>
      'Il campo \"schemaVersion\" deve essere un intero.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'Il backup supera il limite di 2 MiB ($bytes byte).';
  }

  @override
  String get backupTagRulesMustBeList =>
      'Il campo \"tagRules\" deve essere una lista.';

  @override
  String get backupTemplateMustBeObject =>
      'Ogni modello deve essere un oggetto JSON.';

  @override
  String get backupTemplatesMustBeList =>
      'Il campo \"templates\" deve essere una lista.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'Versione dello schema non supportata: $version.';
  }

  @override
  String cameraError(String error) {
    return 'Fotocamera non disponibile. Concedi l\'autorizzazione in Impostazioni > Privacy > Fotocamera.\n($error)';
  }

  @override
  String get cancel => 'Annulla';

  @override
  String get catBusiness => 'Attività';

  @override
  String get catCar => 'Auto';

  @override
  String get catHome => 'Casa';

  @override
  String get catOther => 'Altro';

  @override
  String get catPersonal => 'Personale';

  @override
  String get catWork => 'Lavoro';

  @override
  String get categoryLabel => 'Categoria';

  @override
  String get chooseFromGallery => 'Scegli dalla galleria';

  @override
  String get clear => 'Cancella';

  @override
  String get clearAll => 'Cancella tutto';

  @override
  String get clearConfirmMessage =>
      'Questa operazione cancellerà tutti i record NDEF scrivendo un record vuoto. Continuare?';

  @override
  String get clearConfirmTitle => 'Ripristina contenuto tag';

  @override
  String get clearHistory => 'Cancella cronologia';

  @override
  String get clearTagSubtitle =>
      'Elimina tutti i record e scrive un NDEF vuoto';

  @override
  String get clearTagTitle => 'Cancella tag';

  @override
  String get close => 'Chiudi';

  @override
  String get commandsEmptyError => 'Inserisci almeno un comando.';

  @override
  String get commandsLabel => 'Comandi';

  @override
  String get confirmClearHistoryContent =>
      'Tutta la cronologia delle scansioni sarà eliminata. Confermi?';

  @override
  String get confirmClearHistoryTitle => 'Cancella cronologia';

  @override
  String get confirmClearTemplatesContent =>
      'Tutti i modelli di scrittura salvati saranno eliminati. Confermi?';

  @override
  String get confirmClearTemplatesTitle => 'Cancella modelli';

  @override
  String get contactCompany => 'Azienda / Ente';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactFullName => 'Nome e cognome';

  @override
  String get contactPhone => 'Telefono';

  @override
  String get contactTitle => 'Ruolo / Titolo';

  @override
  String get contactWebsite => 'Sito web';

  @override
  String get copy => 'Copia';

  @override
  String get copyTagUid => 'Copia UID';

  @override
  String get copyToComposer => 'Copia nella lista di scrittura';

  @override
  String get csvInvalidAddress => 'indirizzo non valido.';

  @override
  String get csvInvalidEmail => 'indirizzo email non valido.';

  @override
  String get csvInvalidLocation =>
      'inserisci latitudine e longitudine (es. posizione,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'Massimo $max record importati; righe restanti ignorate.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'Riga $row: valore vuoto.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'Riga $row: $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'tipo sconosciuto \"$type\".';
  }

  @override
  String get csvWifiPasswordLength =>
      'La password Wi-Fi deve avere tra 8 e 63 caratteri.';

  @override
  String get delete => 'Elimina';

  @override
  String get deleteTemplateTooltip => 'Elimina modello';

  @override
  String get deviceNameTooLong => 'Nome del dispositivo troppo lungo.';

  @override
  String get dismiss => 'Ignora';

  @override
  String get editRecordTitle => 'Modifica record';

  @override
  String get emailRecipient => 'Destinatario';

  @override
  String get exportBackup => 'Esporta';

  @override
  String get facetimePrompt =>
      'Inserisci numero di telefono o email dell\'Apple ID.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" non può essere vuoto.';
  }

  @override
  String get flashlight => 'Torcia';

  @override
  String get formatMemorySubtitle => 'Prepara per NDEF (tag vuoti o corrotti)';

  @override
  String get formatMemoryTitle => 'Formatta memoria';

  @override
  String get idTooLarge => 'La dimensione dell\'ID non può superare 255 byte';

  @override
  String get importBackup => 'Importa (Unisci)';

  @override
  String get inAppTagRules => 'Regole locali del tag';

  @override
  String get invalidHexId => 'ID esadecimale non valido';

  @override
  String get invalidHexPayload => 'Payload esadecimale non valido';

  @override
  String get invalidHexType => 'Tipo esadecimale non valido';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get linkCopied => 'Link copiato';

  @override
  String get linkHistoryDesc => 'Apre la cronologia';

  @override
  String get linkScanDesc => 'Apre l\'app e avvia la scansione';

  @override
  String get linkToolsDesc => 'Apre la schermata strumenti';

  @override
  String get linkWriteDesc => 'Apre la schermata di scrittura';

  @override
  String get locationLabel => 'Dove si trova?';

  @override
  String get lockAcknowledge => 'Comprendo che questa azione è irreversibile';

  @override
  String get lockTagSubtitle =>
      'Imposta in modo permanente in sola lettura (irreversibile)';

  @override
  String get lockTagTitle => 'Blocca tag';

  @override
  String get manage => 'Gestisci';

  @override
  String get navHistory => 'Cronol.';

  @override
  String get navHistoryTitle => 'Cronologia';

  @override
  String get navRead => 'Leggi';

  @override
  String get navReadTitle => 'Leggi tag';

  @override
  String get navSettings => 'Impost.';

  @override
  String get navSettingsTitle => 'Modelli e Impostazioni';

  @override
  String get navTools => 'Strumenti';

  @override
  String get navToolsTitle => 'Strumenti';

  @override
  String get navWrite => 'Scrivi';

  @override
  String get navWriteTitle => 'Scrivi tag';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Record',
      one: '1 Record',
    );
    return '$_temp0';
  }

  @override
  String get nfcPromptClear => 'Avvicina il tag per ripristinarlo';

  @override
  String get nfcPromptLock => 'Avvicina il tag per bloccarlo definitivamente';

  @override
  String get nfcPromptScan =>
      'Avvicina il tag alla parte superiore del telefono';

  @override
  String get nfcPromptWrite => 'Avvicina il tag NFC per scrivere i dati';

  @override
  String get no => 'No';

  @override
  String get noTemplates =>
      'Nessun modello salvato.\nCrea record nella scheda \"Scrivi\" per salvarli come modello.';

  @override
  String get noteLabel => 'Nota';

  @override
  String get onboardingContinue => 'Continua';

  @override
  String get onboardingSkip => 'Salta';

  @override
  String get onboardingStart => 'Inizia';

  @override
  String get onboardingStep1Body =>
      'Tocca il pulsante blu in basso e avvicina il telefono al tag. Contenuto, capacità e UID appariranno subito.';

  @override
  String get onboardingStep1Title => 'Scansiona un tag';

  @override
  String get onboardingStep2Body =>
      'Nella scheda \"Scrivi\", tocca \"Aggiungi record\": link web, Wi-Fi, contatti, social media e modelli pronti.';

  @override
  String get onboardingStep2Title => 'Scrivi qualsiasi dato';

  @override
  String get onboardingStep3Body =>
      'Esamina la memoria, imposta password, blocca tag o formattali nella scheda \"Strumenti\".';

  @override
  String get onboardingStep3Title => 'Strumenti avanzati';

  @override
  String get onboardingStep4Body =>
      'Salva i tag con nome, note e foto nella tua raccolta. Cambia lingua e tema nelle Impostazioni.';

  @override
  String get onboardingStep4Title => 'Organizza i tuoi tag';

  @override
  String optionalField(String label) {
    return '$label (opzionale)';
  }

  @override
  String get passwordError =>
      'Inserisci esattamente 4 caratteri o 8 cifre hex.';

  @override
  String get passwordHint => '4 caratteri (es. 1234) o 8 cifre esadecimali';

  @override
  String get passwordLabel => 'Password';

  @override
  String get paste => 'Incolla';

  @override
  String get phoneNumber => 'Numero di telefono';

  @override
  String get phoneWithCountryCode =>
      'Inserisci il prefisso internazionale (es. 393331112233).';

  @override
  String get presetAppDownloadDesc =>
      'Apre o invita a installare la tua app Android.';

  @override
  String get presetAppDownloadTitle => 'Download applicazione';

  @override
  String get presetBusinessCardDesc =>
      'Aggiunge il tuo contatto alla rubrica al tocco.';

  @override
  String get presetBusinessCardTitle => 'Biglietto da visita digitale';

  @override
  String get presetDirectionsDesc => 'Mostra un indirizzo o punto sulla mappa.';

  @override
  String get presetDirectionsTitle => 'Indicazioni stradali';

  @override
  String get presetEmergencyDesc => 'Gruppo sanguigno, contatti e dati vitali.';

  @override
  String get presetEmergencyTitle => 'Scheda d\'emergenza (ICE)';

  @override
  String get presetGoogleReviewDesc =>
      'Porta i clienti direttamente alle tue recensioni.';

  @override
  String get presetGoogleReviewTitle => 'Recensione Google';

  @override
  String get presetGuestWifiDesc =>
      'Permette agli ospiti di collegarsi senza password.';

  @override
  String get presetGuestWifiTitle => 'Scheda Wi-Fi ospiti';

  @override
  String get presetInstagramDesc => 'Apre subito il tuo profilo Instagram.';

  @override
  String get presetInstagramTitle => 'Profilo Instagram';

  @override
  String get presetMenuLinkDesc =>
      'Da incollare sui tavoli per mostrare il menu.';

  @override
  String get presetMenuLinkTitle => 'Menu del ristorante';

  @override
  String get presetPetTagDesc =>
      'Permette a chi lo ritrova di chiamarti all\'istante.';

  @override
  String get presetPetTagTitle => 'Medaglietta per animali';

  @override
  String get presetShortcutDesc => 'Avvia Comandi Rapidi o azioni dell\'app.';

  @override
  String get presetShortcutTitle => 'Attivatore di comandi';

  @override
  String get presetWebsiteDesc => 'Indirizza verso qualsiasi pagina web.';

  @override
  String get presetWebsiteTitle => 'Sito web';

  @override
  String get presetWhatsappDesc => 'Avvia una chat senza salvare il numero.';

  @override
  String get presetWhatsappTitle => 'Chat WhatsApp diretta';

  @override
  String get qrCode => 'Codice QR';

  @override
  String qrContentChars(int chars) {
    return 'Contenuto ($chars Caratteri):';
  }

  @override
  String get qrContentEmpty => 'Nessun contenuto da codificare.';

  @override
  String qrContentTooLarge(int chars) {
    return 'Contenuto troppo esteso per il codice QR ($chars caratteri, max 2048).';
  }

  @override
  String get qrFrameInstructions =>
      'Inquadra il codice QR. Link web, Wi-Fi e testi verranno convertiti in record.';

  @override
  String qrGenerationFailed(String error) {
    return 'Creazione codice QR non riuscita: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'Anteprima codice QR: $title';
  }

  @override
  String get qrScanTitle => 'Scansiona codice QR';

  @override
  String get qrSecurityNote =>
      'L\'anteprima QR è supportata solo per testo e URL web leggibili.\n\nPassword Wi-Fi e payload binari non vengono convertiti per motivi di sicurezza.';

  @override
  String get qrUserOnlyNote => 'Aperto solo su richiesta dell\'utente.';

  @override
  String get rawRecordDetailsTitle => 'Dettagli record (Sola lettura)';

  @override
  String get rawRecordEditorTitle => 'Modifica record NDEF grezzo';

  @override
  String get readHeroButton => 'Avvia scansione';

  @override
  String get readMemorySubtitle =>
      'Memoria grezza pagina per pagina; copia o salva come .bin';

  @override
  String get readMemoryTitle => 'Leggi memoria';

  @override
  String get readyTemplates => 'Modelli pronti';

  @override
  String get recordTypeCalendar => 'Evento calendario (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'MIME personalizzato ($mime)';
  }

  @override
  String get recordTypeEmail => 'Record email';

  @override
  String get recordTypeLocation => 'Posizione / GPS';

  @override
  String get recordTypePhone => 'Numero di telefono';

  @override
  String get recordTypeSmartPoster => 'Smart Poster';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'Payload Smart Poster corrotto ($bytes byte)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'Smart Poster (Non valido)';

  @override
  String get recordTypeSms => 'Record SMS';

  @override
  String get recordTypeText => 'Record di testo';

  @override
  String get recordTypeUnknown => 'Record sconosciuto';

  @override
  String get recordTypeUrl => 'Collegamento Web (URL)';

  @override
  String get recordTypeVCard => 'Scheda contatto (vCard)';

  @override
  String get recordTypeWifi => 'Configurazione Wi-Fi (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'Payload WSC corrotto';

  @override
  String get redo => 'Ripristina';

  @override
  String get removePasswordSubtitle =>
      'Rimuove la protezione usando la password nota';

  @override
  String get removePasswordTitle => 'Rimuovi password';

  @override
  String get rewriteTag => 'Riscrivi';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Eliminare la regola con nota \"$note\"?';
  }

  @override
  String get ruleNoteDialogTitle => 'Modifica nota tag';

  @override
  String get ruleNoteLabel => 'Nota / Descrizione locale';

  @override
  String get save => 'Salva';

  @override
  String get saveAsTemplate => 'Salva come modello';

  @override
  String get saveBin => 'Salva .bin';

  @override
  String get saveLocalHistory => 'Salva cronologia scansioni';

  @override
  String get saveLocalHistorySubtitle =>
      'Disattivato, le scansioni non sono salvate. Attivato, i dati corretti vengono memorizzati.';

  @override
  String get scanFabLabel => 'Scansiona tag';

  @override
  String get scannedTag => 'Tag scansionato';

  @override
  String get searchQueryCannotBeEmpty =>
      'Il testo di ricerca non può essere vuoto.';

  @override
  String get securityRestriction => 'Restrizione di sicurezza';

  @override
  String get send => 'Invia';

  @override
  String get setPasswordSubtitle =>
      'Protegge il contenuto da scritture non autorizzate';

  @override
  String get setPasswordTitle => 'Imposta password';

  @override
  String get shortcutAutomationNote =>
      'Nota: L\'automazione si collega all\'UID e funziona anche se il contenuto cambia.';

  @override
  String get shortcutStep1 =>
      'Apri l\'app Comandi e tocca \"Automazione\" in basso.';

  @override
  String get shortcutStep2 =>
      'Tocca \"Nuova automazione\" (+) → seleziona \"NFC\".';

  @override
  String get shortcutStep3 =>
      'Tocca \"Scansiona\", avvicina il tag e assegna un nome.';

  @override
  String get shortcutStep4 =>
      'Scegli \"Esegui immediatamente\", poi aggiungi l\'azione desiderata.';

  @override
  String get shortcutStep5 =>
      'Per aprire questa app, seleziona \"Scansiona tag\" o \"Scrivi tag\".';

  @override
  String get shortcutsGuideSubtitle =>
      'Avvia azioni automatiche al tocco di un tag o usa la voce con Siri.';

  @override
  String get shortcutsGuideTitle => 'Siri e Comandi Rapidi';

  @override
  String get siriPhraseScan => '\"Ehi Siri, scansiona tag con NFC Tag Master\"';

  @override
  String get siriPhraseWrite =>
      '\"Ehi Siri, scrivi su tag con NFC Tag Master\"';

  @override
  String get siriShortcutsNote =>
      'Questi comandi compaiono anche nell\'app Comandi e in Spotlight.';

  @override
  String get smsMessage => 'Testo SMS';

  @override
  String get socialUsername => 'Nome utente';

  @override
  String get sourceSelectPrompt => 'Da dove acquisire il contenuto del tag?';

  @override
  String get statusCancelled => 'Annullato';

  @override
  String statusClearError(String error) {
    return 'Errore durante la cancellazione: $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'Ripristino fallito: $error';
  }

  @override
  String get statusClearSuccess => 'Contenuto del tag cancellato.';

  @override
  String get statusClearing => 'Ripristino attivo. Avvicina il tag...';

  @override
  String statusLockError(String error) {
    return 'Errore durante il blocco: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'Blocco fallito: $error';
  }

  @override
  String get statusLockSuccess =>
      'Tag bloccato permanentemente (sola lettura).';

  @override
  String get statusLocking => 'Blocco attivo. Avvicina il tag...';

  @override
  String get statusNfcDisabled =>
      'NFC disattivato. Attivalo nelle impostazioni.';

  @override
  String get statusNfcNotSupported =>
      'Hardware NFC non supportato su questo dispositivo.';

  @override
  String get statusNfcUnavailable => 'NFC al momento non disponibile.';

  @override
  String get statusReady => 'Pronto';

  @override
  String statusScanError(String error) {
    return 'Errore di scansione: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'Tag letto con successo ($id).';
  }

  @override
  String get statusScanning => 'Scansione tag... Avvicina il telefono.';

  @override
  String statusUnexpectedError(String error) {
    return 'Errore imprevisto: $error';
  }

  @override
  String statusWriteError(String error) {
    return 'Errore di scrittura: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'Scrittura non completata: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return 'Scrittura e verifica completate! ($bytes byte)';
  }

  @override
  String get statusWriting => 'Scrittura attiva. Avvicina il tag NFC...';

  @override
  String get systemLanguage => 'Lingua di sistema';

  @override
  String get tabContact => 'Contatto (vCard)';

  @override
  String get tabCustomMime => 'MIME personalizzato';

  @override
  String get tabEmail => 'Email';

  @override
  String get tabPhone => 'Telefono';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabText => 'Testo';

  @override
  String get tabUrl => 'URL Web';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => 'Informazioni sul tag';

  @override
  String get tagLibraryTitle => 'La mia raccolta tag';

  @override
  String tagRulesCount(int count) {
    return 'Regole / note salvate: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Mostra solo la nota associata basandosi sull\'hash SHA-256 dei byte NDEF.';

  @override
  String get tagWritable => 'Scrivibile';

  @override
  String get takePhoto => 'Scatta foto';

  @override
  String get templateNameHint => 'Nome del modello';

  @override
  String get toolsExpertSection => 'Avanzate';

  @override
  String get toolsFooterNote =>
      'Strumenti compatibili con NTAG213/215/216 e MIFARE Ultralight EV1. Tieni il tag vicino al dispositivo.';

  @override
  String get toolsMemorySection => 'Memoria';

  @override
  String get toolsSecuritySection => 'Sicurezza';

  @override
  String get toolsTagSection => 'Tag';

  @override
  String get typeTooLarge => 'La dimensione del tipo non può superare 255 byte';

  @override
  String get undo => 'Annulla';

  @override
  String get unknownChip16Pages => 'Chip sconosciuto (prime 16 pagine)';

  @override
  String get urlSafetyInvalidUrl => 'Formato URL non valido.';

  @override
  String get urlSafetyIpv4 =>
      'La destinazione contiene un indirizzo IPv4 diretto.';

  @override
  String get urlSafetyIpv6 =>
      'La destinazione contiene un indirizzo IPv6 diretto.';

  @override
  String get urlSafetyMissingScheme => 'Schema di protocollo mancante.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'Porta di rete non standard (Porta: $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'Dominio internazionalizzato / Punycode rilevato (\"xn--\").';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'Schema URL non standard: \"$scheme\".';
  }

  @override
  String get urlSafetyUnencrypted => 'Connessione non crittografata (http://).';

  @override
  String get urlSafetyUserInfo =>
      'L\'URL contiene credenziali utente (userinfo). Possibile rischio di phishing.';

  @override
  String get usernameCannotBeEmpty => 'Il nome utente non può essere vuoto.';

  @override
  String get usernameNoSpaces => 'Il nome utente non può contenere spazi.';

  @override
  String get validAndroidPackage =>
      'Inserisci un package Android valido (es. com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'Inserisci un MAC Bluetooth valido (es. 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'Inserisci un URL video valido.';

  @override
  String get validWebAddress =>
      'Inserisci un indirizzo web valido (es. https://example.com/file.pdf).';

  @override
  String get verificationNotChecked => 'Non controllato';

  @override
  String get verificationPassed => 'Superata';

  @override
  String get videoUrlCannotBeEmpty => 'L\'URL del video non può essere vuoto.';

  @override
  String get videoUrlOrIdPrompt => 'Inserisci link video o ID YouTube.';

  @override
  String get wifiAuthOpen => 'Aperta (Nessuna password)';

  @override
  String get wifiPassword => 'Password';

  @override
  String get wifiSsid => 'Nome rete (SSID)';

  @override
  String get withSiri => 'Con Siri';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes byte) verrà scritto nella memoria. UID e pagine di blocco rimangono inalterati.';
  }

  @override
  String get writeDumpSubtitle => 'Scrive il file binario salvato sul tag';

  @override
  String get writeDumpTitle => 'Scrivi dump (.bin)';

  @override
  String get writeHeroTitle => 'Scrivi su tag';

  @override
  String get writeHeroWriting => 'Scrittura...';

  @override
  String get writeResultFailed => 'Operazione non riuscita';

  @override
  String get writeResultSuccess => 'Operazione completata';

  @override
  String get writeTemplates => 'Modelli di scrittura';

  @override
  String get writeTemplatesSubtitle =>
      'Salva contenuti NDEF frequenti come modelli per scriverli velocemente.';

  @override
  String get unknown => 'Sconosciuto';

  @override
  String get error => 'Errore';

  @override
  String get nfcPromptReady => 'Avvicina il tag';

  @override
  String get invalidResponseFormat => 'Formato di risposta non valido ricevuto';

  @override
  String get nfcReadError => 'Errore di lettura NFC';

  @override
  String get invalidPlatformResponse =>
      'Risposta non valida ricevuta dalla piattaforma';

  @override
  String get writeFailed => 'Scrittura non riuscita';

  @override
  String get lockFailed => 'Blocco non riuscito';

  @override
  String get failedToConnectTag => 'Impossibile connettersi al tag';

  @override
  String get invalidTagResponse => 'Risposta non valida dal tag';

  @override
  String get commandFailed => 'Comando non riuscito';

  @override
  String get ndefTypeOrIdTooLong => 'Il tipo o l\'ID NDEF supera i 255 byte';

  @override
  String get ndefUnsupportedOrInvalidRecord =>
      'Record NDEF non supportato o non valido';

  @override
  String get ndefMissingTypeLength => 'Lunghezza del tipo NDEF mancante';

  @override
  String get ndefMissingPayloadLength => 'Lunghezza del payload NDEF mancante';

  @override
  String get ndefMissingIdLength => 'Lunghezza dell\'ID NDEF mancante';

  @override
  String get ndefMissingType => 'Tipo NDEF mancante';

  @override
  String get ndefMissingId => 'ID NDEF mancante';

  @override
  String get ndefMissingPayload => 'Payload NDEF mancante';

  @override
  String get unprotected => '(Senza password)';

  @override
  String get binaryDataPreview => '(Dati binari)';

  @override
  String get emptyValue => '(Vuoto)';

  @override
  String get tnfEmpty => '0: Empty (Vuoto)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (Sconosciuto)';

  @override
  String get tnfUnchanged => '6: Unchanged (NDEF frammentato)';

  @override
  String get tnfReserved => '7: Reserved (Riservato)';

  @override
  String get ntagUnsupportedChip =>
      'Questa operazione è supportata solo sui tag NTAG213/215/216 e MIFARE Ultralight EV1.';

  @override
  String ntagPageReadFailed(String page) {
    return 'Impossibile leggere la pagina $page (il tag non ha risposto o area protetta).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'Impossibile scrivere la pagina $page: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'Impossibile scrivere la pagina $page (rifiutata; bloccata o protetta).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'Impossibile leggere oltre la pagina $page; area forse protetta da password.';
  }

  @override
  String get ntagPasswordPackSize =>
      'La password deve essere di 4 byte e PACK di 2 byte.';

  @override
  String get ntagPasswordSize => 'La password deve essere di 4 byte.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'Password errata o autenticazione rifiutata dal tag.';

  @override
  String get ntagPasswordWrong => 'Password errata.';

  @override
  String get ntagCcInvalid =>
      'L\'area CC ha un valore non NDEF; quest\'area OTP non può essere formattata.';

  @override
  String get ntagDumpTooShort => 'File dump troppo breve; nessun dato utente.';

  @override
  String get ntagInvalidHex =>
      'Inserisci un valore esadecimale valido (es.: 30 04).';

  @override
  String get googleReviewFieldLabel => 'Link recensione o Place ID';

  @override
  String get menuLinkFieldLabel => 'Link del menu';

  @override
  String get menuTitleHint => 'Il nostro menu';

  @override
  String get petName => 'Nome dell\'animale';

  @override
  String get ownerPhone => 'Telefono del proprietario';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'Ciao, sono $pet! Per favore chiama il mio proprietario: $phone$note';
  }

  @override
  String get bloodType => 'Gruppo sanguigno';

  @override
  String get allergies => 'Allergie / Farmaci';

  @override
  String get emergencyContact => 'Contatto di emergenza';

  @override
  String get emergencyInfo => 'INFORMAZIONI DI EMERGENZA';

  @override
  String emergencyBlood(String blood) {
    return 'Gruppo sanguigno: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'Allergie: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'In caso di emergenza chiamare: $contact';
  }

  @override
  String get storeLink => 'Link dello store';

  @override
  String get link => 'Link';

  @override
  String get title => 'Titolo';

  @override
  String get webAddress => 'Indirizzo web';

  @override
  String get address => 'Indirizzo';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'Modelli: $added aggiunti, $updated aggiornati';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'Note/Regole tag: $added aggiunte, $updated aggiornate';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'Cronologia ignorata perché disattivata sul dispositivo: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'Cronologia: $added aggiunti, $skipped esistenti/ignorati';
  }

  @override
  String get backupSummaryNoNewData =>
      'Nessun nuovo dato da importare (corrisponde ai record esistenti).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field deve essere una stringa.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field deve essere una data valida.';
  }

  @override
  String get rawTypeHexLabel => 'Tipo (Byte hex)';

  @override
  String get rawIdHexLabel => 'ID (Byte hex, opzionale)';

  @override
  String get rawPayloadHexLabel => 'Payload (Byte hex)';

  @override
  String get rawOptionalHexHint => 'Byte hex opzionali';

  @override
  String get saveChanges => 'Salva modifiche';

  @override
  String get edit => 'Modifica';

  @override
  String get clearAllButton => 'Cancella tutto';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: $count pagine lette';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip formattato';
  }

  @override
  String get ntagInvalidDumpFile =>
      'File dump non valido (deve essere un multiplo di 4 byte, 32–1024 byte).';

  @override
  String ntagPagesWritten(int count) {
    return '$count pagine scritte';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: protezione con password abilitata';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: password rimossa';
  }

  @override
  String get memoryDumpCopied => 'Dump di memoria copiato';

  @override
  String ntagCommandsSent(int count) {
    return '$count comandi inviati';
  }

  @override
  String get emptyResponse => '(risposta vuota)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages pagine · $bytes byte';
  }

  @override
  String get composeTextEmpty => 'Il contenuto del testo non può essere vuoto.';

  @override
  String get composeTextTooLong => 'Testo troppo lungo (max 5000 caratteri).';

  @override
  String get composeUrlInvalid =>
      'Inserisci un indirizzo valido (es: https://example.com o link app://).';

  @override
  String get composeUrlTooLong => 'URL troppo lungo (max 2000 caratteri).';

  @override
  String get composeEmailInvalid =>
      'Inserisci un\'email valida (es: nome@dominio.com).';

  @override
  String get composePhoneInvalid =>
      'Inserisci un numero di telefono valido (es: +905551234567).';

  @override
  String get composeSmsPhoneInvalid =>
      'Inserisci un numero di telefono destinatario valido.';

  @override
  String get composeLatInvalid =>
      'La latitudine deve essere compresa tra -90 e +90.';

  @override
  String get composeLngInvalid =>
      'La longitudine deve essere compresa tra -180 e +180.';

  @override
  String get composeVcardNameEmpty =>
      'Il nome del contatto non può essere vuoto.';

  @override
  String get composeVcardNameTooLong =>
      'Nome contatto troppo lungo (max 200 caratteri).';

  @override
  String get composeVcardEmailInvalid => 'Inserisci un indirizzo email valido.';

  @override
  String get composeVcardPhoneInvalid =>
      'Inserisci un numero di telefono valido.';

  @override
  String get composeVcardUrlInvalid =>
      'Inserisci un indirizzo web valido (es: https://...).';

  @override
  String get composeCalSummaryEmpty =>
      'Il titolo dell\'evento non può essere vuoto.';

  @override
  String get composeCalSummaryTooLong =>
      'Titolo evento troppo lungo (max 250 caratteri).';

  @override
  String get composeCalDateInvalid =>
      'L\'ora di fine deve essere successiva all\'ora di inizio.';

  @override
  String get composeSpUriInvalid =>
      'Inserisci un URL di destinazione valido (es: https://...).';

  @override
  String get composeSpLangInvalid =>
      'Inserisci un codice lingua ISO valido (es: it, en).';

  @override
  String get composeMimeTypeInvalid =>
      'Inserisci un tipo MIME valido (es: application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'Inserisci una stringa esadecimale valida (numero pari di caratteri esadecimali).';

  @override
  String get composeMimePayloadTooLarge =>
      'Dimensione del payload troppo grande (max 10 KB).';

  @override
  String get composeWifiSsidEmpty =>
      'Il nome della rete (SSID) non può essere vuoto.';

  @override
  String get composeWifiPasswordRequired =>
      'La password Wi-Fi è richiesta per le reti crittografate.';

  @override
  String get composeWifiPasswordLength =>
      'La password WPA/WPA2 deve contenere tra 8 e 63 caratteri.';

  @override
  String get composeEditNdefRecord => 'Modifica record NDEF';

  @override
  String get composeNewNdefRecord => 'Crea nuovo record NDEF';

  @override
  String get quickLinksHeader => 'Link rapidi';

  @override
  String get quickLinkCustomUri => 'URI personalizzato';

  @override
  String get quickLinkSocial => 'Social network';

  @override
  String get quickLinkVideo => 'Video';

  @override
  String get quickLinkSearch => 'Cerca';

  @override
  String get quickLinkFile => 'File';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime Audio';

  @override
  String get quickLinkAddress => 'Indirizzo';

  @override
  String get quickLinkPayment => 'Link di pagamento';

  @override
  String get quickLinkApp => 'Applicazione (Android)';

  @override
  String get updateRecord => 'Aggiorna record';

  @override
  String get addToList => 'Aggiungi all\'elenco';

  @override
  String get quickCustomUriError =>
      'Inserisci un indirizzo con schema (es: spotify:track:... o myapp://pagina).';

  @override
  String get quickFileEmptyMessage => 'Inserisci il link del file.';

  @override
  String get quickPaymentEmptyMessage => 'Inserisci il link di pagamento.';

  @override
  String get quickCustomUriDesc =>
      'Qualsiasi indirizzo con schema è valido; il telefono aprirà l\'app corrispondente.';

  @override
  String get quickSocialLabel => 'Social network';

  @override
  String get quickVideoLabel => 'Link video';

  @override
  String get quickVideoHint => 'https://youtu.be/... o ID video';

  @override
  String get quickVideoDesc =>
      'Link YouTube, Vimeo, ecc. o solo l\'ID video di YouTube.';

  @override
  String get quickSearchHint => 'es: Meteo Roma';

  @override
  String get quickFileLabel => 'Link file';

  @override
  String get quickFileDesc =>
      'A causa della ridotta capacità del tag, viene scritto il link web invece del file stesso.';

  @override
  String get quickPhoneOrAppleId => 'Telefono o ID Apple';

  @override
  String get quickFacetimeVideoDesc =>
      'Un iPhone che tocca il tag avvia una chiamata video FaceTime.';

  @override
  String get quickFacetimeAudioDesc =>
      'Un iPhone che tocca il tag avvia solo una chiamata audio FaceTime.';

  @override
  String get quickMapProvider => 'App mappe';

  @override
  String get quickAddressHint => 'es: Via del Corso 1, Roma';

  @override
  String get quickPaymentDesc =>
      'È possibile utilizzare link di pagamento come PayPal.me, Stripe. I dati della carta non vengono mai scritti.';

  @override
  String get quickAppDesc =>
      'I dispositivi Android aprono quest\'app al tocco (o Play Store). iPhone ignora questo tipo; aggiungi link App Store come URL.';

  @override
  String get quickDeviceNameOptional => 'Nome dispositivo (facoltativo)';

  @override
  String get quickSpeakerHint => 'es: Altoparlante';

  @override
  String get quickBluetoothDesc =>
      'I telefoni Android suggeriscono l\'accoppiamento con questo dispositivo. iPhone non supporta i tag di associazione Bluetooth.';

  @override
  String get composeTextContent => 'Contenuto del testo';

  @override
  String get composeTextHint => 'Inserisci il testo che desideri scrivere';

  @override
  String get composeEmailSubjectOptional => 'Oggetto (facoltativo)';

  @override
  String get composeEmailBodyOptional => 'Corpo del messaggio (facoltativo)';

  @override
  String get composeSmsRecipient => 'Numero di telefono del destinatario';

  @override
  String get composeSmsHint => 'Messaggio SMS da inviare...';

  @override
  String get composeVcardFullName => 'Nome completo (nome visualizzato) *';

  @override
  String get composeVcardNameHint => 'Mario Rossi';

  @override
  String get composeVcardNote => 'Nota / Descrizione';

  @override
  String get composeCalTitle => 'Titolo evento *';

  @override
  String get composeCalTitleHint => 'Riunione di progetto';

  @override
  String get composeCalLocationHint => 'Sala riunioni 2 o online';

  @override
  String get composeCalDesc => 'Descrizione dell\'evento';

  @override
  String get composeCalStartEndTime => 'Ora di inizio e fine:';

  @override
  String get composeSpTitleLabel => 'Titolo (testo visualizzato)';

  @override
  String get composeSpTitleHint => 'Brochure aziendale';

  @override
  String get composeMimeTypeLabel => 'Tipo MIME *';

  @override
  String get composeDataFormat => 'Formato dati: ';

  @override
  String get composeFormatHex => 'Esadecimale';

  @override
  String get composeMimeHexBytes => 'Byte esadecimali *';

  @override
  String get composeMimeTextPayload => 'Testo payload (UTF-8) *';

  @override
  String get composeWifiWarningTitle => 'Avviso di sicurezza e piattaforma:';

  @override
  String get composeWifiWarningBody =>
      '• La password Wi-Fi è salvata in testo normale e chiunque può leggerla.\n• La connessione automatica non è garantita; potrebbe essere richiesta la conferma dell\'utente.';

  @override
  String get composeWifiSsidLabel => 'Nome rete (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'Tipo di sicurezza (autenticazione)';

  @override
  String get composeWifiOpenNetwork => 'Rete aperta (nessuna)';

  @override
  String get composeWifiPasswordLabel => 'Password Wi-Fi *';

  @override
  String get composeWifiEncryptionLabel => 'Tipo di crittografia';

  @override
  String get composeWifiAesRecommended => 'AES (consigliato)';

  @override
  String get quickSearchTextLabel => 'Testo da cercare';

  @override
  String get readTagMemoryPrompt =>
      'Avvicina il tag al telefono per leggere la memoria';

  @override
  String get readingTagMemoryStatus => 'Lettura memoria in corso...';

  @override
  String get formatTagConfirmTitle => 'Formatta memoria';

  @override
  String get formatTagConfirmMessage =>
      'I dati sul tag saranno eliminati e preparati come NDEF vuoto. Continuare?';

  @override
  String get formatButton => 'Formatta';

  @override
  String get formatTagPrompt => 'Avvicina il tag da formattare';

  @override
  String get formattingStatus => 'Formattazione in corso...';

  @override
  String filePickerFailed(String error) {
    return 'Selezione file non riuscita: $error';
  }

  @override
  String get writeButton => 'Scrivi';

  @override
  String get writeDumpPrompt => 'Avvicina il tag per scrivere il dump';

  @override
  String get writingDumpStatus => 'Scrittura dump in corso...';

  @override
  String get setPasswordWarning =>
      'Se dimentichi la password, non potrai più cambiare il contenuto. La lettura rimane aperta a tutti.';

  @override
  String get setPasswordAction => 'Imposta password';

  @override
  String get setPasswordPrompt => 'Avvicina il tag per impostare la password';

  @override
  String get settingPasswordStatus => 'Impostazione password in corso...';

  @override
  String get removePasswordPromptMessage =>
      'Inserisci la password precedentemente impostata sul tag.';

  @override
  String get remove => 'Rimuovi';

  @override
  String get removePasswordPrompt =>
      'Avvicina il tag per rimuovere la password';

  @override
  String get removingPasswordStatus => 'Rimozione password in corso...';

  @override
  String get sendCommandsPrompt => 'Avvicina il tag per inviare comandi';

  @override
  String get sendingCommandsStatus => 'Invio comandi in corso...';

  @override
  String get sendButton => 'Invia';

  @override
  String get tagNoteEditTitle => 'Modifica nota tag';

  @override
  String get tagNoteInputLabel => 'Nota / Descrizione in-app';

  @override
  String get tagNoteInputHint =>
      'es: Info sala riunioni o Scaffale magazzino #12';

  @override
  String get tagNoteDeleteTitle => 'Elimina nota tag';

  @override
  String get clearAllTagRulesTitle => 'Elimina tutte le note';

  @override
  String get clearAllTagRulesConfirm =>
      'Tutte le note tag salvate saranno eliminate. Confermi?';

  @override
  String get deleteAll => 'Elimina tutto';

  @override
  String get tagRulesExplanation =>
      'Viene mostrata solo la nota salvata per i tag corrispondenti all\'hash SHA-256 di NDEF.';

  @override
  String get noTagRulesDefined => 'Nessuna nota tag ancora definita.';

  @override
  String lastUpdated(String time) {
    return 'Ultimo aggiornamento: $time';
  }

  @override
  String get tagLibraryNoMatch => 'Nessun tag corrispondente alla ricerca.';

  @override
  String get tagLibraryAddToLibrary => 'Aggiungi alla libreria';

  @override
  String get name => 'Nome';

  @override
  String get tagLibraryAddTag => 'Aggiungi tag';

  @override
  String get all => 'Tutti';

  @override
  String tagLibraryPhotoError(String error) {
    return 'Impossibile selezionare la foto: $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'Elimina tag';

  @override
  String get tagLibraryNameHint => 'es: Portachiavi ufficio';

  @override
  String get tagLibraryNoTagContent => 'Nessun contenuto tag in questo record.';

  @override
  String get tagLibrarySourceLastScanned => 'Ultima scansione';

  @override
  String get tagLibraryEmpty => 'Nessun tag ancora salvato.';

  @override
  String get tagLibrarySourceEmpty => 'Record vuoto';

  @override
  String get tagLibraryNamePrompt => 'Inserisci un nome per il tag';

  @override
  String get tagLibrarySearchHint => 'Cerca per nome, categoria o posizione...';

  @override
  String get tagLibrarySourceWriteList => 'Elenco di scrittura';

  @override
  String get tagLibraryLocationHint => 'es: Scrivania, Porta d\'ingresso';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return 'Vuoi davvero eliminare il tag \"$name\" dalla libreria?';
  }

  @override
  String get noContent => 'Nessun contenuto';

  @override
  String tagLibraryRecordSummary(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count record NDEF',
      one: '1 record NDEF',
    );
    return '$_temp0';
  }

  @override
  String get tagLibraryEditTag => 'Modifica tag';

  @override
  String get rawTypeHexHint => '41 (A) o 55 (U) ecc.';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: Il campo \"records\" deve essere una lista.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: Un elemento può contenere al massimo $max record NDEF.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - Il record #$index non è un oggetto valido.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - Record #$index: Valore TNF non valido ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - Record #$index: \"type\" deve essere una stringa Base64.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - Record #$index: \"type\" non sono dati Base64 validi ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - Record #$index: \"id\" deve essere una stringa Base64.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - Record #$index: \"id\" non sono dati Base64 validi ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - Record #$index: \"payload\" deve essere una stringa Base64.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - Record #$index: \"payload\" non sono dati Base64 validi ($error).';
  }

  @override
  String get composerUndoSnack => 'Ultima modifica annullata.';

  @override
  String get composerRedoSnack => 'Modifica ripristinata.';

  @override
  String get noRecordsToCopy => 'Nessun record NDEF da copiare.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count record NDEF ($bytes B) copiati negli appunti.\n(Solo il contenuto NDEF viene copiato; UID o settori crittografati non vengono mai clonati)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: $count record aggiunti.';
  }

  @override
  String get tagEmptyNoRecordsToImport =>
      'Il tag è vuoto; nessun record da importare.';

  @override
  String get sourceTag => 'Dal tag';

  @override
  String get sourceQr => 'Da codice QR';

  @override
  String filePickerError(String error) {
    return 'Impossibile aprire il selettore: $error';
  }

  @override
  String get csvFileTooLarge => 'File CSV troppo grande (max 512 KB).';

  @override
  String get noRecordsFound => 'Nessun record trovato';

  @override
  String get someRowsSkipped => 'Alcune righe saltate';

  @override
  String get expectedFormat => 'Formato previsto:';

  @override
  String get noClipboardContent =>
      'Nessun contenuto NDEF copiato negli appunti.';

  @override
  String get pasteFromClipboardTitle => 'Incolla dagli appunti NDEF';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'Dati appunti: $count record, $bytes byte ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      'Vuoi sostituire i record attuali o aggiungerli alla fine?';

  @override
  String get pasteOverwriteOption => 'Sovrascrivi (Sostituisci)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'Gli attuali $count record saranno sostituiti con il contenuto degli appunti (richiesta conferma).';
  }

  @override
  String get pasteEmptySubtitle =>
      'Il contenuto degli appunti viene inserito nel compositore.';

  @override
  String get pasteAppendOption => 'Aggiungi alla fine';

  @override
  String get pasteAppendSubtitle =>
      'I record correnti vengono mantenuti; i record degli appunti vengono aggiunti alla fine.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count record aggiunti.';
  }

  @override
  String get confirmOverwriteTitle => 'Sovrascrivere i record?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'Ci sono $currentCount record. Verranno sostituiti con i $newCount dagli appunti. Continuare?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'Record sostituiti con $count nuovi.';
  }

  @override
  String get yesReplace => 'Sì, sostituisci';

  @override
  String recordsImportedToComposer(num count) {
    return '$count record importati.';
  }

  @override
  String get noContentToCopy => 'Nessun contenuto NDEF trovato da copiare.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count record NDEF copiati e aggiunti (Contenuto copiato, UID non clonato).';
  }

  @override
  String get noContentToRewrite =>
      'Nessun contenuto NDEF trovato da riscrivere.';

  @override
  String get rewriteTagTitle => 'Riscrivi tag';

  @override
  String get importantNotice => 'AVVISO IMPORTANTE:';

  @override
  String get rewriteNotice1 =>
      '• Questa operazione SOVRASCRIVE COMPLETAMENTE il contenuto NDEF; non aggiunge alla fine.\n';

  @override
  String get rewriteNotice2 =>
      '• Il tag di destinazione deve essere scrivibile (sbloccato).\n';

  @override
  String get rewriteNotice3 =>
      '• Non scrive silenziosamente sul tag precedente; è necessario un nuovo tocco NFC.';

  @override
  String get rewriteInstruction =>
      'Prepara il tag, tocca \"Tocca e scrivi\" e avvicinalo al telefono.';

  @override
  String get tapAndWrite => 'Tocca e scrivi';

  @override
  String get rewritePromptMessage =>
      'Avvicina il tag al dispositivo (il contenuto verrà completamente rinnovato)';

  @override
  String get writeVerifiedTitle => 'Scrittura verificata';

  @override
  String get writeVerifiedDesc =>
      'Contenuto NDEF scritto e verificato con successo sul tag.';

  @override
  String get writeVerifiedHint =>
      'Puoi avviare la scansione successiva per verificare o confrontare i dati.';

  @override
  String get scanAndCompareNow => 'Scansiona e confronta ora';

  @override
  String get contentMatchesExactly => 'Il contenuto corrisponde esattamente';

  @override
  String get differenceDetected => 'Differenza rilevata';

  @override
  String get compareMatchDesc =>
      'Il messaggio NDEF del tag corrisponde byte per byte al messaggio di origine.';

  @override
  String get compareDiffDesc =>
      'C\'è differenza tra dati letti e previsti. Verifica se il tag è bloccato o diverso.';

  @override
  String get batchEmptyComposerError =>
      'Aggiungi almeno un record prima di avviare la scrittura in batch.';

  @override
  String get batchWriteTitle => 'Scrittura tag in batch';

  @override
  String get batchWriteSubtitle =>
      'Scrivi lo stesso contenuto NDEF su più tag in sequenza.';

  @override
  String get attention => 'ATTENZIONE:';

  @override
  String get batchNotice1 =>
      '• Per evitare doppie scritture accidentali, ogni scrittura si avvia con \"Scrivi successivo\".\n';

  @override
  String get batchNotice2 =>
      '• Nessuna scansione continua automatica; i tag devono essere scambiati fisicamente.';

  @override
  String get batchStartButton => 'Avvia scrittura in batch';

  @override
  String get batchControlPanelTitle => 'Pannello di controllo scrittura batch';

  @override
  String get batchCancelOrClose => 'Annulla / Chiudi';

  @override
  String get batchAllCompleted => 'Tutti i tentativi sui tag completati!';

  @override
  String batchStats(String ok, String failed, String left) {
    return 'Riusciti: $ok | Falliti: $failed | Rimanenti: $left';
  }

  @override
  String get waitingForTag => 'In attesa del tag...';

  @override
  String get batchFinishButton => 'Termina scrittura batch';

  @override
  String get writeError => 'Errore di scrittura';

  @override
  String get batchConfirmCancelTitle => 'Annulla scrittura in batch';

  @override
  String get batchConfirmCancelMessage =>
      'Terminare la sessione batch? I tag già scritti vengono conservati; i rimanenti non saranno scritti.';

  @override
  String get cancelled => 'Annullato';

  @override
  String get batchCancelledSnack =>
      'Scrittura batch annullata. Il contenuto è stato mantenuto.';

  @override
  String get cancelAndClose => 'Annulla e chiudi';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'Analisi URL offline';

  @override
  String get urlSafetyScheme => 'Schema (Protocollo):';

  @override
  String get urlSafetyPort => 'Porta:';

  @override
  String get urlSafetyUserInfoLabel => 'Info utente:';

  @override
  String get urlSafetyIpLiteral => 'Indirizzo IP diretto:';

  @override
  String get urlSafetyDomain => 'No (Nome di dominio)';

  @override
  String get urlSafetyPunycodeLabel => 'Internazionale / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => 'Sì (Sospetto omoglifo)';

  @override
  String get urlSafetyWarningsHeader => 'Avvisi di sicurezza / attenzione:';

  @override
  String get urlSafetyDisclaimer =>
      'NOTA: Analisi offline. Non esegue scansioni antivirus online. L\'URL non viene aperto automaticamente.';

  @override
  String get templateSaveEmptyError =>
      'Aggiungi record prima di salvare come modello.';

  @override
  String templateDefaultName(String n) {
    return 'Modello $n';
  }

  @override
  String get templateNameSample => 'es: Sito web aziendale e contatti';

  @override
  String get templateSavedSnack => 'Modello salvato.';

  @override
  String get ruleNoteRequiresNdef =>
      'Il tag deve contenere almeno un record NDEF per aggiungere una nota.';

  @override
  String get ruleNoteAddTitle => 'Aggiungi nota personalizzata';

  @override
  String get ruleNoteDigestExplanation =>
      'Collegata al digest SHA-256 di NDEF. Mostra solo questa descrizione alla scansione.';

  @override
  String get ruleNoteSavedSnack => 'Nota tag salvata.';

  @override
  String get ruleNoteDeleteConfirm =>
      'La nota per questo tag verrà eliminata. Continuare?';

  @override
  String get ruleNoteDeletedSnack => 'Nota tag eliminata.';

  @override
  String get backupExportTitle => 'Esporta backup';

  @override
  String get backupExportWarningTitle => 'AVVISO DI PRIVACY E SICUREZZA';

  @override
  String get backupExportWarningBody =>
      'Il file di backup (JSON) è in testo normale. Può contenere password Wi-Fi o vCard sensibili. Conservalo in un luogo sicuro.';

  @override
  String get backupIncludedItems => 'Elementi da includere:';

  @override
  String backupTemplatesCount(String count) {
    return '• Modelli: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• Note/regole dei tag: $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Includi cronologia scansioni (Opzionale)';

  @override
  String backupHistoryCount(String count) {
    return '$count voci di cronologia';
  }

  @override
  String get backupHistoryDisabled =>
      'La cronologia scansioni è disabilitata su questo dispositivo';

  @override
  String get backupExportAndShare => 'Esporta e condividi';

  @override
  String get backupFileNameLabel => 'File di backup NFC Tag Master';

  @override
  String get backupFileShareSubject =>
      'Backup modelli e dati NFC Tag Master (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'File di backup esportato e condiviso con successo.';

  @override
  String get backupExportCancelled => 'Condivisione esportazione annullata.';

  @override
  String get backupImportTitle => 'Importa backup';

  @override
  String get backupMergeRuleTitle => 'POLITICA DI SICUREZZA E UNIONE';

  @override
  String get backupMergeRule1 =>
      '• L\'importazione funziona tramite UNIONE; i tuoi record attuali non vengono MAI eliminati.\n';

  @override
  String get backupMergeRule2 =>
      '• Può contenere password Wi-Fi o dati personali; carica solo da fonti attendibili.\n';

  @override
  String get backupMergeRule3 =>
      '• Limite dimensione: 2 MiB. Dati sottoposti a rigida convalida schema e Base64.';

  @override
  String get backupSelectFilePrompt =>
      'Seleziona un file di backup .json valido da unire.';

  @override
  String get selectFileButton => 'Seleziona file';

  @override
  String get fileSelectionCancelled => 'Selezione file annullata.';

  @override
  String get backupFileExceedsLimit =>
      'Il file selezionato supera il limite di 2 MiB consentito.';

  @override
  String fileReadError(String error) {
    return 'Errore di lettura: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Errore di convalida backup: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Cronologia scansioni rilevata';

  @override
  String get backupHistoryDetectedPrompt =>
      'Vuoi importare e abilitare la cronologia? O importare solo modelli e note?';

  @override
  String get backupSkipHistoryOption =>
      'Salta cronologia (carica solo modelli e note)';

  @override
  String get backupEnableHistoryOption => 'Abilita cronologia e carica';

  @override
  String get nfcReadyStatus => 'NFC pronto';

  @override
  String get nfcReadyDesc => 'Hardware NFC attivo e pronto all\'uso';

  @override
  String get nfcDisabledStatus => 'NFC disattivato';

  @override
  String get nfcDisabledDesc =>
      'NFC disattivato. Attivalo nelle impostazioni del dispositivo.';

  @override
  String get template => 'Modello';

  @override
  String get nfcScannerTitle => 'Scanner NFC';

  @override
  String get composeRecord => 'Crea record';

  @override
  String get protectOrRemove => 'Proteggi / rimuovi';

  @override
  String get previousScans => 'Scansioni precedenti';

  @override
  String get noScannedTagYet => 'Nessun tag NFC ancora scansionato';

  @override
  String get tapScanPrompt =>
      'Tocca \"Avvia scansione\" e avvicina il tag al telefono.';

  @override
  String get ndefCopyAndRewriteTitle => 'Copia e riscrittura contenuto NDEF';

  @override
  String get savedTagNoteHeader => 'Nota tag salvata (regola in-app)';

  @override
  String get tagNoteOrRule => 'Nota / regola tag';

  @override
  String get editNote => 'Modifica nota';

  @override
  String get deleteNote => 'Elimina nota';

  @override
  String get tagNoteDigestNotice =>
      'Corrisponde al digest SHA-256 dei byte NDEF esatti. Non avvia azioni esterne.';

  @override
  String get addCustomTagNotePrompt =>
      'Puoi aggiungere una nota locale personalizzata per questo contenuto NDEF.';

  @override
  String get addNoteToThisTag => 'Aggiungi nota a questo tag';

  @override
  String get ndefSupport => 'Supporto NDEF:';

  @override
  String get usedSpace => 'Spazio utilizzato:';

  @override
  String get freeSpace => 'Spazio libero:';

  @override
  String get noNdefMessageOnTag => 'Nessun messaggio NDEF trovato sul tag.';

  @override
  String get hideDetails => 'Nascondi dettagli';

  @override
  String get advancedRecordInspector => 'Ispettore record (Avanzato)';

  @override
  String get ndefRecordInspectorTitle => 'Ispettore record NDEF (Avanzato)';

  @override
  String get inspectorType => 'Tipo:';

  @override
  String get inspectorPayloadLength => 'Lunghezza payload:';

  @override
  String get inspectorRawHexPreview =>
      'Anteprima hex non elaborata (limitata):';

  @override
  String get ndefRecordsToWriteTitle => 'Record NDEF da scrivere';

  @override
  String get pasteFromClipboardAction =>
      'Incolla dagli appunti (Sostituisci / Aggiungi)';

  @override
  String get importAction => 'Importa';

  @override
  String get importFromTagAction => 'Importa da tag NFC';

  @override
  String get importFromQrAction => 'Importa da codice QR';

  @override
  String get importFromCsvAction => 'Importa da file CSV';

  @override
  String get composerEmptyDescription =>
      'Puoi scrivere testo, link web, Wi-Fi, telefono, email, contatti e altro sui tag.';

  @override
  String get urlSafetyReview => 'Revisione URL';

  @override
  String get inspector => 'Ispettore';

  @override
  String get typeLabel => 'Tipo:';

  @override
  String get payloadLabel => 'Payload:';

  @override
  String get writeAndVerify => 'Scrivi sul tag e verifica';

  @override
  String get batchWriteButtonLabel => 'Scrittura in batch (2..100 tag)';

  @override
  String get clearTagButtonLabel => 'Reimposta tag (cancella contenuto)';

  @override
  String get confirmWriteTitle => 'Conferma scrittura sul tag';

  @override
  String get confirmWriteMessage1 =>
      'Questa operazione SOVRASCRIVE COMPLETAMENTE il contenuto NDEF attuale.';

  @override
  String get confirmWriteMessage2 =>
      'Assicurati che il tag sia scrivibile. Il contenuto sarà verificato automaticamente.';

  @override
  String get yesWrite => 'Sì, scrivi';

  @override
  String get scanHistoryDisabledTitle => 'Cronologia scansioni disattivata';

  @override
  String get scanHistoryDisabledDesc =>
      'Per privacy, la cronologia non viene salvata. Puoi abilitarla nelle impostazioni.';

  @override
  String get enableHistory => 'Abilita cronologia';

  @override
  String get historySearchHint =>
      'Cerca per UID, testo o tipo (es: URL, Wi-Fi, 04A1...)';

  @override
  String get noHistoryYet => 'Nessuna cronologia scansioni ancora salvata.';

  @override
  String get tryDifferentQuery =>
      'Prova con un UID, testo o tipo di record diverso.';

  @override
  String get clearSearch => 'Cancella ricerca';

  @override
  String get deleteThisRecord => 'Elimina questo record';

  @override
  String get qrPreview => 'Anteprima QR';

  @override
  String get lockTagConfirmTitle => 'Blocca permanentemente il tag';

  @override
  String get lockTagWarning2 =>
      'Assicurati di aver prima scritto il contenuto corretto.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'Anteprima codice QR';

  @override
  String get unknownParentheses => '(Sconosciuto)';

  @override
  String get ok => 'OK';

  @override
  String rewriteSourceUid(String uid) {
    return 'UID di origine: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return 'Record da scrivere: $count';
  }

  @override
  String rewriteFailed(String message) {
    return 'Riscrittura non riuscita: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return 'Record scritti: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'UID del tag scansionato: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return 'Dati scritti: $count record ($bytes byte)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'Dati scansionati: $count record ($bytes byte)';
  }

  @override
  String batchTargetCount(String count) {
    return 'Tag di destinazione: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return 'Elenco di scrittura: $count record ($bytes byte)';
  }

  @override
  String batchNext(String current, String total) {
    return 'Prossimo: tag #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return 'Riuscito ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return 'Non riuscito: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'Tag #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'Tocca e scrivi il tag #$n';
  }

  @override
  String batchPrompt(String current, String total) {
    return 'Scrittura multipla: avvicina il tag #$current / $total';
  }

  @override
  String batchWrittenVerified(String count) {
    return '$count record scritti e verificati';
  }

  @override
  String templateLoaded(String name) {
    return 'I record di \"$name\" sono stati aggiunti all\'elenco.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'Impronta del contenuto NDEF (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return 'Errore di esportazione: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'Il backup contiene $count voci di cronologia, ma la cronologia è disattivata qui.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'Importazione riuscita:\n$summary';
  }

  @override
  String mergeError(String error) {
    return 'Errore di unione: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'Appunti NDEF: $count record ($bytes B) - $source';
  }

  @override
  String get heroScanSubtitle =>
      'Avvicina il tag alla parte alta del telefono: contenuto, capacità e numero di serie appaiono subito.';

  @override
  String lastTagLabel(String uid) {
    return 'Ultimo tag: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'Errore di scansione: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count record ($bytes byte) - solo dati NDEF, l\'UID non viene copiato.';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'Tag $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'Errore: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return 'Record NDEF letti ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return 'Record NDEF da scrivere ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return 'Nota: il payload è di $bytes byte, quindi sono mostrati solo i primi 64.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return 'Dimensione totale: $bytes byte | Record: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return 'Scrivi e verifica ($bytes byte)';
  }

  @override
  String savedScansCount(String count) {
    return 'Scansioni salvate: $count';
  }

  @override
  String historyNoResults(String query) {
    return 'Nessun risultato per \"$query\".';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count record';
  }

  @override
  String historyCapacity(String max, String used) {
    return 'Capacità: $max B | Usati: $used B';
  }

  @override
  String historySourceLabel(String uid) {
    return 'Cronologia UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count record | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return 'Regole/note salvate: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return 'Byte scritti: $bytes | Verifica: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'Un tag bloccato diventa di sola lettura: il contenuto non potrà MAI essere modificato o cancellato e il blocco NON è reversibile. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'Dimensione messaggio: $bytes byte';
  }

  @override
  String bytesShort(String bytes) {
    return 'Byte: $bytes B';
  }

  @override
  String bytesValue(String bytes) {
    return '$bytes byte';
  }

  @override
  String bytesOfCapacity(String bytes, String max) {
    return '$bytes / $max byte';
  }

  @override
  String get valueNone => 'Nessuno';

  @override
  String get valueYesIp => 'Sì (indirizzo IP)';

  @override
  String get nfcMissingShort => 'No NFC';

  @override
  String get clearClipboard => 'Svuota appunti';

  @override
  String get statLibrary => 'Libreria';

  @override
  String get scanTagTitle => 'Scansiona tag';

  @override
  String get readingInProgress => 'Lettura...';

  @override
  String get rawMemorySubtitle => 'Memoria grezza';

  @override
  String get copyToClipboard => 'Copia negli appunti';

  @override
  String get serialUidLabel => 'N. di serie (UID):';

  @override
  String get totalCapacityLabel => 'Capacità totale:';

  @override
  String get technologiesLabel => 'Tecnologie:';

  @override
  String get idLabel => 'Identificativo (ID):';

  @override
  String get undoTooltip => 'Annulla';

  @override
  String get clearComposer => 'Svuota elenco';

  @override
  String composerTotalSize(String bytes) {
    return 'Dimensione totale: $bytes byte';
  }

  @override
  String get yesClear => 'Sì, cancella';

  @override
  String get ssidTooLong => 'Il SSID può avere al massimo 32 byte.';

  @override
  String get locationPlace => 'Luogo';

  @override
  String get targetWebUrl => 'URL di destinazione *';

  @override
  String get languageCodeLabel => 'Codice lingua (ISO 639-1) *';

  @override
  String get utf8Text => 'Testo UTF-8';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf, dimensione: $bytes byte';
  }

  @override
  String get quickGallerySubtitle => 'Pronto con un tocco';

  @override
  String get quickLibraryTitle => 'I miei tag';

  @override
  String get quickLibrarySubtitle => 'Tag salvati';

  @override
  String get saveToLibrary => 'Salva nella libreria';

  @override
  String libraryMatch(String name) {
    return 'Nella libreria: $name';
  }

  @override
  String tagChipLabel(String chip) {
    return 'Chip: $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return 'Produttore: $name';
  }

  @override
  String get settingsLibrarySubtitle => 'I tuoi tag con nomi, note e foto';

  @override
  String get showOnboardingAgain => 'Rivedi l\'introduzione';

  @override
  String get importFromGallery => 'Aggiungi dai modelli';

  @override
  String get appearanceTitle => 'Aspetto';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Chiaro';

  @override
  String get themeDark => 'Scuro';

  @override
  String get valuePresentRisky => 'Presente (può essere rischioso)';

  @override
  String get supportedValue => 'Supportato';

  @override
  String get notSupportedValue => 'Non supportato';

  @override
  String get nfcUnsupportedDesc => 'NFC non supportato su questo dispositivo';

  @override
  String get ndefTrailingData => 'Dati extra dopo il messaggio NDEF';

  @override
  String get ndefMissingEnd => 'Manca la fine del messaggio NDEF';

  @override
  String vcardPhoneShort(String value) {
    return 'Tel.: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'Email: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return 'Azienda: $value';
  }

  @override
  String get pageUidLock => 'UID / Blocco';

  @override
  String get pageData => 'Dati';

  @override
  String get pageLock => 'Blocco';

  @override
  String memoryPageLine(String page) {
    return 'Pag. $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (telefono)';

  @override
  String get mapApple => 'Mappe di Apple';

  @override
  String get mapGoogle => 'Google Maps';

  @override
  String get whatsappMessageHint => 'Ciao, vorrei delle informazioni';

  @override
  String get facetimeTargetHint => '+393123456789 o nome@icloud.com';

  @override
  String get bluetoothMacLabel => 'Indirizzo MAC Bluetooth';

  @override
  String get webAddressUrlLabel => 'Indirizzo web (URL)';

  @override
  String get latitudeLabel => 'Latitudine (Lat)';

  @override
  String get longitudeLabel => 'Longitudine (Lng)';

  @override
  String get emailAddressLabel => 'Indirizzo email';

  @override
  String get websiteLabel => 'Sito web';

  @override
  String get wifiAuthWpa2Home => 'WPA2 Personal (standard casa/ufficio)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 Personal (misto)';

  @override
  String get hostLabel => 'Host:';

  @override
  String get readOnlyLocked => 'Sola lettura (bloccato)';

  @override
  String get redoTooltip => 'Ripeti';

  @override
  String historyFoundCount(String found, String total) {
    return 'Trovati: $found / $total';
  }

  @override
  String get addToWriteListShort => 'Aggiungi all\'elenco';

  @override
  String get mimeTypeHint => 'application/json o text/plain';

  @override
  String get hapticsToggle => 'Vibrazione';

  @override
  String get hapticsToggleSubtitle =>
      'Breve vibrazione a fine lettura o scrittura';

  @override
  String get soundsToggle => 'Suoni';

  @override
  String get soundsToggleSubtitle => 'Riproduci un breve suono di sistema';

  @override
  String get backupLibraryMustBeList => 'La libreria deve essere un elenco.';

  @override
  String get backupInvalidLibraryEntry => 'Voce di libreria non valida.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'La libreria può contenere al massimo $max voci.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'Libreria: $added aggiunti';
  }

  @override
  String backupLibraryCount(String count) {
    return '• Libreria: $count (senza foto)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return 'Ultimo tag: $bytes / $max B';
  }

  @override
  String get contentTooLargeForChips =>
      'Troppo grande per i tag comuni; accorcia il testo o usa un link breve.';

  @override
  String get tagReportTitle => 'Report del tag';

  @override
  String get tagReportSubtitle => 'Chip, blocchi, password e uso';

  @override
  String get tagReportPrompt => 'Avvicina il tag da controllare';

  @override
  String get tagReportBusy => 'Controllo del tag...';

  @override
  String tagReportDone(String chip) {
    return 'Report pronto: $chip';
  }

  @override
  String get unknownChip => 'Chip sconosciuto';

  @override
  String get yes => 'Sì';

  @override
  String get reportChip => 'Chip';

  @override
  String get reportNdefFormatted => 'Formattato NDEF';

  @override
  String get reportWritable => 'Scrivibile';

  @override
  String get reportStaticLock => 'Blocco statico';

  @override
  String get reportDynamicLock => 'Blocco dinamico';

  @override
  String get reportPassword => 'Protezione con password';

  @override
  String get reportReadProtected => 'Lettura protetta';

  @override
  String get reportNdefUsage => 'Uso NDEF';

  @override
  String get reportVerdictWritable => 'Tag pronto per la scrittura';

  @override
  String get reportVerdictRestricted => 'Il tag ha restrizioni';

  @override
  String get reportCopied => 'Report copiato';

  @override
  String get compareTagsTitle => 'Confronta due tag';

  @override
  String get compareTagsSubtitle =>
      'Verifica se una copia corrisponde all\'originale';

  @override
  String get compareStepFirst => 'Prima scansiona il primo tag (originale).';

  @override
  String get compareStepSecond => 'Ora scansiona il secondo tag.';

  @override
  String get compareIdentical => 'I contenuti coincidono';

  @override
  String get compareDifferent => 'I contenuti sono diversi';

  @override
  String get compareSameTag => 'Lo stesso tag è stato scansionato due volte.';

  @override
  String get compareDifferentTags => 'Due tag diversi.';

  @override
  String get compareRecordSame => 'Uguale';

  @override
  String get compareRecordChanged => 'Diverso';

  @override
  String get compareRecordOnlyFirst => 'Solo su A';

  @override
  String get compareRecordOnlySecond => 'Solo su B';

  @override
  String get compareBothEmpty => 'Entrambi i tag sono vuoti.';

  @override
  String capacityExceededShort(String needed, String max) {
    return 'Contenuto troppo grande: $needed / $max byte';
  }

  @override
  String get verifyFailedAfterWrite =>
      'Dati scritti non verificati; tieni il tag più a lungo.';

  @override
  String get blankTagTitle => 'Il tag non è ancora pronto';

  @override
  String get blankTagBody =>
      'Questo tag è nuovo e non formattato NDEF. L\'app può prepararlo e scrivere il contenuto con un solo tocco (NTAG e MIFARE Ultralight).';

  @override
  String get blankTagAction => 'Prepara e scrivi';

  @override
  String get shareTag => 'Condividi';

  @override
  String get shareAsText => 'Condividi come testo';

  @override
  String get shareAsFile => 'Condividi come file (.json)';

  @override
  String get shareAsFileSubtitle =>
      'I record possono essere riscritti identici su un altro dispositivo';

  @override
  String get importFromJsonFile => 'Da un file tag (.json)';

  @override
  String get invalidTagFile => 'File tag non valido.';

  @override
  String get continuousScanTitle => 'Scansione continua';

  @override
  String get continuousScanSubtitle =>
      'Scansiona i tag uno dopo l\'altro e condividi l\'elenco in CSV';

  @override
  String continuousScanCount(String count) {
    return '$count tag scansionati';
  }

  @override
  String get exportCsv => 'Condividi in CSV';

  @override
  String get clearList => 'Svuota elenco';

  @override
  String get csvColumnTime => 'Ora';

  @override
  String get csvColumnRecords => 'Record';

  @override
  String get csvColumnContent => 'Contenuto';

  @override
  String get csvColumnCapacity => 'Capacità (B)';

  @override
  String get csvColumnUsed => 'Usato (B)';

  @override
  String get batchSerialToggle => 'Aggiungi numeri di serie';

  @override
  String batchSerialHint(String token) {
    return 'Inserisci $token in un record per mettere lì il numero; altrimenti a ogni tag viene aggiunto un record di testo con il numero.';
  }

  @override
  String get batchSerialPrefix => 'Prefisso';

  @override
  String get batchSerialStart => 'Inizio';

  @override
  String get batchSerialDigits => 'Cifre';

  @override
  String batchSerialPreview(String first, String last) {
    return 'Primo: $first · Ultimo: $last';
  }

  @override
  String get batchFromCsvButton => 'Da file CSV (una riga per tag)';

  @override
  String get batchCsvTitle => 'Scrittura in serie da CSV';

  @override
  String batchCsvSummary(String count) {
    return 'Verranno scritti $count tag. Ogni tag riceve una riga del CSV, in ordine.';
  }

  @override
  String batchCsvTruncated(String max) {
    return 'La scrittura in serie usa al massimo $max righe; le altre sono state saltate.';
  }

  @override
  String get cloneTagTitle => 'Clona tag';

  @override
  String get cloneTagSubtitle => 'Leggi un tag e scrivi il contenuto su altri';

  @override
  String get cloneSourceStep =>
      'Passo 1: scansiona il tag di origine. Viene copiato solo il contenuto NDEF; l\'UID non può essere clonato.';

  @override
  String get cloneSourceEmpty =>
      'Il tag di origine non ha record NDEF da copiare.';

  @override
  String get cloneReadyTitle => 'Origine letta';

  @override
  String cloneReadySummary(String count, String bytes) {
    return 'Verranno copiati $count record ($bytes byte). Scegli quanti tag scrivere.';
  }

  @override
  String get cloneEditFirst => 'Modifica prima';

  @override
  String get tapPreviewTitle => 'Cosa succede quando un telefono lo tocca?';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'Il tag è vuoto; non succede nulla.';

  @override
  String tapIosUrl(String target) {
    return 'Compare una notifica; toccandola $target si apre in Safari o nell\'app corrispondente.';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target si apre direttamente nel browser o nell\'app corrispondente.';
  }

  @override
  String tapIosApp(String target) {
    return 'Compare una notifica; l\'app si apre tramite \"$target\" se installata.';
  }

  @override
  String tapAndroidApp(String target) {
    return 'L\'app si apre tramite \"$target\" se installata.';
  }

  @override
  String tapIosCall(String target) {
    return 'Compare una notifica; toccandola si chiama $target.';
  }

  @override
  String tapAndroidCall(String target) {
    return 'L\'app Telefono si apre con $target.';
  }

  @override
  String tapIosSms(String target) {
    return 'Compare una notifica; Messaggi apre un nuovo messaggio a $target.';
  }

  @override
  String tapAndroidSms(String target) {
    return 'L\'app di messaggistica si apre per $target.';
  }

  @override
  String tapIosEmail(String target) {
    return 'Compare una notifica; Mail apre una nuova email a $target.';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'L\'app email si apre per $target.';
  }

  @override
  String get tapIosMap =>
      'L\'iPhone non apre da solo le posizioni \"geo:\". Usa un link di Apple o Google Maps (Link rapidi).';

  @override
  String get tapAndroidMap => 'L\'app mappe si apre in questa posizione.';

  @override
  String get tapIosNeedsApp =>
      'L\'iPhone non fa nulla da solo con questo contenuto; va letto con un\'app NFC.';

  @override
  String get tapAndroidText =>
      'Sulla maggior parte dei telefoni non succede nulla o il testo appare in una schermata di sistema.';

  @override
  String get tapAndroidContact => 'Propone di aggiungere il contatto.';

  @override
  String get tapAndroidWifi =>
      'Propone di connettersi alla rete (Android 10 e successivi).';

  @override
  String get tapAndroidCalendar =>
      'Se l\'app calendario lo supporta, propone di aggiungere l\'evento.';

  @override
  String get tapAndroidOther =>
      'Si apre solo se è installata un\'app compatibile.';

  @override
  String tapIgnoredRecords(String count) {
    return 'I telefoni eseguono solo il primo record; gli altri $count sono visibili nelle app NFC.';
  }

  @override
  String get tapIosRequirement =>
      'iPhone XS e successivi leggono in background se sbloccati e con Fotocamera/Wallet chiusi.';

  @override
  String get galleryCatBusiness => 'Lavoro';

  @override
  String get galleryCatSocial => 'Social';

  @override
  String get galleryCatHome => 'Casa';

  @override
  String get galleryCatPersonal => 'Personale';

  @override
  String get galleryCatAutomation => 'Automazione';

  @override
  String get galleryFavorites => 'Preferiti';

  @override
  String get gallerySearchHint => 'Cerca modelli...';

  @override
  String get galleryNoResults => 'Nessun modello corrispondente.';

  @override
  String get galleryAddFavorite => 'Aggiungi ai preferiti';

  @override
  String get galleryRemoveFavorite => 'Rimuovi dai preferiti';

  @override
  String get presetEventTitle => 'Invito a evento';

  @override
  String get presetEventDesc =>
      'Scrive l\'evento in formato iCalendar; Android può aggiungerlo al calendario.';

  @override
  String get eventNameLabel => 'Nome dell\'evento';

  @override
  String get eventDateLabel => 'Data (AAAA-MM-GG)';

  @override
  String get eventTimeLabel => 'Ora (HH:MM)';

  @override
  String get eventDateTimeInvalid =>
      'Data o ora non valida. Esempio: 2026-12-31 e 19:00';

  @override
  String get presetLuggageTitle => 'Etichetta bagaglio';

  @override
  String get presetLuggageDesc =>
      'Se si perde, chi lo trova può contattarti facilmente.';

  @override
  String luggageMessage(String name, String contact) {
    return 'Questo bagaglio appartiene a $name. Se lo trovi, contatta: $contact';
  }

  @override
  String get presetPlaylistTitle => 'Playlist';

  @override
  String get presetPlaylistDesc =>
      'Apre una playlist Spotify, Apple Music o YouTube.';

  @override
  String get playlistLinkLabel => 'Link della playlist';

  @override
  String get presetEmailMeTitle => 'Scrivimi';

  @override
  String get presetEmailMeDesc =>
      'Apre una nuova email a te con l\'oggetto pronto.';

  @override
  String get presetCallMeTitle => 'Chiamami';

  @override
  String get presetCallMeDesc => 'Il telefono chiama il tuo numero.';

  @override
  String get presetRunShortcutTitle => 'Esegui comando rapido';

  @override
  String get presetRunShortcutDesc =>
      'Esegue il comando rapido indicato: luci, musica, modalità Full immersion...';

  @override
  String get shortcutNameLabel => 'Nome del comando';

  @override
  String get recipesSection => 'Ricette di automazione';

  @override
  String get recipesIntro =>
      'Crea in Comandi un comando con il nome qui sotto e aggiungi le azioni. Poi collegalo a un\'automazione NFC o usa \"Aggiungi al tag\" per scrivere un link che lo avvia.';

  @override
  String get recipeAddToTag => 'Aggiungi al tag';

  @override
  String get recipeBedTitle => 'Buonanotte';

  @override
  String get recipeBedActions =>
      'Comodino: Full immersion Sonno · sveglia · luci spente';

  @override
  String get recipeCarTitle => 'Modalità auto';

  @override
  String get recipeCarActions =>
      'Supporto auto: Full immersion Guida · indicazioni casa · musica';

  @override
  String get recipeDoorTitle => 'Sono a casa';

  @override
  String get recipeDoorActions =>
      'Ingresso: luci accese · Wi-Fi attivo · messaggio \"Sono a casa\" alla famiglia';

  @override
  String get recipeDeskTitle => 'Modalità lavoro';

  @override
  String get recipeDeskActions =>
      'Scrivania: Full immersion Lavoro · timer 25 min · playlist';

  @override
  String get recipeGymTitle => 'Allenamento';

  @override
  String get recipeGymActions =>
      'Borsa palestra: avvia allenamento · playlist · Non disturbare';

  @override
  String get recipeKitchenTitle => 'Timer da cucina';

  @override
  String get recipeKitchenActions =>
      'Cucina: timer 10 min · apri la lista della spesa';

  @override
  String get libraryLabelsField => 'Etichette / cartelle (separate da virgole)';

  @override
  String get libraryLabelsHint => 'ufficio, piano 2';

  @override
  String librarySaveFailed(String error) {
    return 'Impossibile salvare: $error';
  }

  @override
  String get csvColumnLabels => 'Etichette';

  @override
  String get firstNameLabel => 'Nome';

  @override
  String get lastNameLabel => 'Cognome';

  @override
  String get wifiPasswordMinHint => 'Almeno 8 caratteri';

  @override
  String get emailExampleHint => 'nome@esempio.it';

  @override
  String get wifiSsidExampleHint => 'Casa_WiFi_5G';

  @override
  String get nfcErrUnavailable =>
      'L\'NFC non è disponibile o è disattivato su questo dispositivo.';

  @override
  String get nfcErrBusy => 'È in corso un\'altra operazione NFC; attendi.';

  @override
  String get nfcErrCancelled => 'L\'operazione è stata annullata.';

  @override
  String get nfcErrAppPaused =>
      'L\'operazione è stata annullata perché l\'app è passata in background.';

  @override
  String get nfcErrUnsupportedTag => 'Questo tipo di tag non è supportato.';

  @override
  String get nfcErrNtagOnly =>
      'Questo strumento funziona solo con tag NTAG / MIFARE Ultralight.';

  @override
  String get nfcErrNotNdefRead => 'Tag rilevato, ma non è in formato NDEF.';

  @override
  String get nfcErrNotNdefWrite =>
      'Il tag non è in formato NDEF; questo telefono non può scriverci direttamente.';

  @override
  String get nfcErrReadOnly => 'Il tag è di sola lettura (bloccato).';

  @override
  String get nfcErrNoData => 'Nessun dato da scrivere.';

  @override
  String nfcErrCapacity(String required, String max) {
    return 'Spazio insufficiente: servono $required byte, disponibili $max.';
  }

  @override
  String get nfcErrCapacityShort => 'Spazio insufficiente sul tag.';

  @override
  String get nfcErrVerify =>
      'Verifica non riuscita: i dati letti non corrispondono.';

  @override
  String get nfcErrConnectionLost =>
      'Connessione al tag persa; tienilo fermo e riprova.';

  @override
  String get nfcErrAlreadyLocked => 'Il tag è già bloccato (sola lettura).';

  @override
  String get nfcErrLockNotNdef =>
      'Il tag non è in formato NDEF; scrivi un record prima di bloccarlo.';

  @override
  String get nfcErrLockNotSupported =>
      'Questo tipo di tag non supporta il blocco.';

  @override
  String get nfcSheetConnected => 'Tag collegato, elaborazione...';

  @override
  String get nfcSheetReadOk => 'Tag letto!';

  @override
  String get nfcSheetEmptyRead => 'Tag vuoto letto!';

  @override
  String get nfcSheetMultipleTags => 'Rilevati più tag. Avvicina un solo tag.';

  @override
  String get nfcSheetWriteVerified => 'Scritto e verificato!';

  @override
  String get nfcSheetWritten => 'Scritto sul tag!';

  @override
  String get nfcSheetLocked => 'Il tag è ora bloccato in modo permanente!';

  @override
  String get nfcWriteDone => 'Scritto sul tag con successo.';

  @override
  String get errorWidgetMessage =>
      'Impossibile mostrare questa parte. Torna indietro e riprova.';
}
