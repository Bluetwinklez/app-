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
  String get addRule => 'Aggiungi regola';

  @override
  String get addTag => 'Aggiungi tag';

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
  String get allRulesCleared => 'Tutte le regole eliminate';

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
  String get backupExportSuccess => 'File di backup salvato con successo';

  @override
  String get backupFileSizeExceeded => 'La dimensione del file supera 2 MiB.';

  @override
  String get backupHistoryMustBeList =>
      'Il campo \"history\" deve essere una lista.';

  @override
  String backupImportFailed(String error) {
    return 'Impossibile importare il backup: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'Backup importato con successo: $templates modelli, $rules regole, $history elementi di cronologia';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'ID Base64 non valido: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Payload Base64 non valido: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Tipo Base64 non valido: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'Formato JSON non valido: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Nota regola non valida.';

  @override
  String get backupInvalidRuleSha => 'Hash SHA-256 non valido.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'Data modello non valida: $date';
  }

  @override
  String get backupInvalidTemplateId => 'ID modello non valido.';

  @override
  String get backupInvalidTemplateName => 'Nome modello non valido.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'Valore TNF non valido ($tnf). Deve essere compreso tra 0 e 7.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Numero cronologia superiore a $max ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'Numero di record superiore a $max ($count).';
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
  String get backupRecordsMustBeList => 'I record devono essere una lista.';

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
  String get batchWrite => 'Scrittura multipla';

  @override
  String get bluetoothDeviceName => 'Nome dispositivo (Opzionale)';

  @override
  String get bluetoothMac => 'Indirizzo MAC Bluetooth';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'Byte scritti: $bytes | Verifica: $status';
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
  String get clearAllRulesConfirm => 'Eliminare tutte le note salvate?';

  @override
  String get clearConfirmButton => 'Sì, cancella';

  @override
  String get clearConfirmMessage =>
      'Questa operazione cancellerà tutti i record NDEF scrivendo un record vuoto. Continuare?';

  @override
  String get clearConfirmTitle => 'Ripristina contenuto tag';

  @override
  String get clearHistory => 'Cancella cronologia';

  @override
  String get clearList => 'Svuota elenco';

  @override
  String get clearTagSubtitle =>
      'Elimina tutti i record e scrive un NDEF vuoto';

  @override
  String get clearTagTitle => 'Cancella tag';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count record pronti negli appunti',
      one: '1 record pronto negli appunti',
    );
    return '$_temp0 ($bytes B) · $source';
  }

  @override
  String get close => 'Chiudi';

  @override
  String get commandsEmptyError => 'Inserisci almeno un comando.';

  @override
  String get commandsLabel => 'Comandi';

  @override
  String get composeRecordTitle => 'Aggiungi record';

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
  String get contactNote => 'Nota';

  @override
  String get contactPhone => 'Telefono';

  @override
  String get contactTitle => 'Ruolo / Titolo';

  @override
  String get contactWebsite => 'Sito web';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count record',
      one: '1 record',
    );
    return 'Contenuto: $_temp0 · $content';
  }

  @override
  String get copy => 'Copia';

  @override
  String get copyAllRecords => 'Copia tutti i record';

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
  String deleteTagConfirmContent(String name) {
    return 'Eliminare \"$name\" dalla raccolta? Il tag fisico non verrà modificato.';
  }

  @override
  String get deleteTagConfirmTitle => 'Elimina tag';

  @override
  String get deleteTemplateTooltip => 'Elimina modello';

  @override
  String get deviceNameTooLong => 'Nome del dispositivo troppo lungo.';

  @override
  String get dismiss => 'Ignora';

  @override
  String get editRecordTitle => 'Modifica record';

  @override
  String get editRule => 'Modifica regola';

  @override
  String get editTag => 'Modifica tag';

  @override
  String get emailBody => 'Corpo email';

  @override
  String get emailRecipient => 'Destinatario';

  @override
  String get emailSubject => 'Oggetto';

  @override
  String get emptyComposerSubtitle =>
      'Tocca \"Aggiungi record\" per creare URL, testi, Wi-Fi, contatti e altro.';

  @override
  String get emptyComposerTitle => 'Nessun record inserito';

  @override
  String get emptyHistorySubtitle => 'I tag scansionati compariranno qui.';

  @override
  String get emptyHistoryTitle => 'Nessuna scansione recente';

  @override
  String get emptyLibrary =>
      'Nessun tag memorizzato.\nScansiona un tag e salvalo qui con nome e foto.';

  @override
  String get eventDescription => 'Descrizione';

  @override
  String get eventEnd => 'Fine';

  @override
  String get eventLocation => 'Luogo';

  @override
  String get eventStart => 'Inizio';

  @override
  String get eventTitle => 'Titolo evento';

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
  String get fieldTextPrompt => 'Testo da scrivere sul tag';

  @override
  String get fieldUrlPrompt => 'Indirizzo sito web (https://...)';

  @override
  String get fileUrl => 'URL del file';

  @override
  String get filterAll => 'Tutti';

  @override
  String get flashlight => 'Torcia';

  @override
  String get formatConfirmButton => 'Formatta';

  @override
  String get formatConfirmMessage =>
      'I dati saranno cancellati e il tag sarà preparato come NDEF vuoto. Continuare?';

  @override
  String get formatMemorySubtitle => 'Prepara per NDEF (tag vuoti o corrotti)';

  @override
  String get formatMemoryTitle => 'Formatta memoria';

  @override
  String get hardwareAvailable => 'Hardware NFC pronto';

  @override
  String get hardwareDisabled => 'NFC disattivato';

  @override
  String get hardwareNotSupported => 'NFC non supportato';

  @override
  String get historyFilteredEmpty => 'Nessun elemento corrispondente trovato.';

  @override
  String get idTooLarge => 'La dimensione dell\'ID non può superare 255 byte';

  @override
  String get importBackup => 'Importa (Unisci)';

  @override
  String get importCsv => 'Importa CSV';

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
  String get latitude => 'Latitudine (Lat)';

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
  String get loadToComposerTooltip => 'Carica nell\'editor';

  @override
  String get locationHint => 'Es.: Porta del frigorifero';

  @override
  String get locationLabel => 'Dove si trova?';

  @override
  String get lockAcknowledge => 'Comprendo che questa azione è irreversibile';

  @override
  String get lockButton => 'Blocca';

  @override
  String get lockTagSubtitle =>
      'Imposta in modo permanente in sola lettura (irreversibile)';

  @override
  String get lockTagTitle => 'Blocca tag';

  @override
  String get lockWarning =>
      'Un tag bloccato diventa in sola lettura permanente: NON potrà più essere modificato né sbloccato.';

  @override
  String get longitude => 'Longitudine (Lng)';

  @override
  String get manage => 'Gestisci';

  @override
  String get matchedRule => 'Regola / Nota associata';

  @override
  String get mimePayloadHex => 'Dati grezzi (Hex / Testo)';

  @override
  String get mimeTypeLabel => 'Tipo MIME';

  @override
  String get nameRequired => 'Assegna un nome al tag.';

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
  String get ndefRecordsTitle => 'Record NDEF';

  @override
  String get nfcPromptClear => 'Avvicina il tag per ripristinarlo';

  @override
  String get nfcPromptLock => 'Avvicina il tag per bloccarlo definitivamente';

  @override
  String get nfcPromptScan => 'Avvicina il tag NFC al dispositivo per leggerlo';

  @override
  String get nfcPromptWrite => 'Avvicina il tag NFC per scrivere i dati';

  @override
  String get no => 'No';

  @override
  String get noContentInTag => 'Nessun contenuto associato.';

  @override
  String get noLibraryMatches => 'Nessun tag corrispondente.';

  @override
  String get noRecordsOnTag => 'Nessun record NDEF trovato sul tag.';

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
  String pageN(int page) {
    return 'Pagina $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'Dati';

  @override
  String get pageRoleLock => 'Blocco';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / Blocco';

  @override
  String get passwordDialogAction => 'Imposta';

  @override
  String get passwordDialogTitle => 'Imposta password';

  @override
  String get passwordDialogWarning =>
      'Se dimentichi la password non potrai più modificare il tag. La lettura rimarrà accessibile a tutti.';

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
  String get rawInspection => 'Ispezione dettagliata';

  @override
  String get rawRecordDetailsTitle => 'Dettagli record (Sola lettura)';

  @override
  String get rawRecordEditorTitle => 'Modifica record NDEF grezzo';

  @override
  String get readHeroButton => 'Avvia scansione';

  @override
  String get readHeroEyebrow => 'LETTORE NFC';

  @override
  String get readHeroScanning => 'Scansione...';

  @override
  String get readHeroSubtitle =>
      'Avvicina la parte superiore del telefono al tag NFC per leggere dati NDEF e dettagli chip.';

  @override
  String get readHeroTitle => 'Scansiona tag';

  @override
  String get readMemorySubtitle =>
      'Memoria grezza pagina per pagina; copia o salva come .bin';

  @override
  String get readMemoryTitle => 'Leggi memoria';

  @override
  String get readyTemplates => 'Modelli pronti';

  @override
  String get recordCopied => 'Contenuto copiato';

  @override
  String recordIndex(int index) {
    return 'Record #$index';
  }

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
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count record copiati',
      one: '1 record copiato',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'Ripristina';

  @override
  String get removePasswordDialogTitle => 'Rimuovi password';

  @override
  String get removePasswordDialogWarning =>
      'Inserisci la password impostata sul tag.';

  @override
  String get removePasswordSubtitle =>
      'Rimuove la protezione usando la password nota';

  @override
  String get removePasswordTitle => 'Rimuovi password';

  @override
  String get removePhoto => 'Rimuovi';

  @override
  String get rewriteTag => 'Riscrivi';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Eliminare la regola con nota \"$note\"?';
  }

  @override
  String get ruleDeleted => 'Regola eliminata';

  @override
  String get ruleNoteDialogTitle => 'Modifica nota tag';

  @override
  String get ruleNoteHint => 'Es.: Ripiano magazzino #4 o Sala riunioni';

  @override
  String get ruleNoteLabel => 'Nota / Descrizione locale';

  @override
  String get ruleSaved => 'Regola salvata';

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
  String get saveTemplateDialogTitle => 'Salva come modello';

  @override
  String get saveToLibrary => 'Salva nella raccolta';

  @override
  String get scanFabLabel => 'Scansiona tag';

  @override
  String get scanQrToRecord => 'Scansiona QR';

  @override
  String get scannedTag => 'Tag scansionato';

  @override
  String get searchEngine => 'Motore di ricerca';

  @override
  String get searchHistoryHint =>
      'Cerca nella cronologia (UID, testo, tipo)...';

  @override
  String get searchLibraryHint => 'Cerca per nome, nota, posizione o contenuto';

  @override
  String get searchQuery => 'Testo da cercare';

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
  String get shareRecords => 'Condividi record';

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
  String get socialNetwork => 'Piattaforma';

  @override
  String get socialUsername => 'Nome utente';

  @override
  String get sourceComposer => 'Record nella lista di scrittura';

  @override
  String get sourceEmpty => 'Senza contenuto (solo nota)';

  @override
  String get sourceLastScan => 'Ultimo tag scansionato';

  @override
  String get sourceSelectPrompt => 'Da dove acquisire il contenuto del tag?';

  @override
  String get statusCancelled => 'Operazione annullata.';

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
  String get tabApp => 'Applicazione';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'Calendario';

  @override
  String get tabContact => 'Contatto (vCard)';

  @override
  String get tabCustomMime => 'MIME personalizzato';

  @override
  String get tabEmail => 'Email';

  @override
  String get tabFile => 'File';

  @override
  String get tabLocation => 'Posizione';

  @override
  String get tabPhone => 'Telefono';

  @override
  String get tabSearch => 'Ricerca';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'Social Network';

  @override
  String get tabText => 'Testo';

  @override
  String get tabUrl => 'URL Web';

  @override
  String get tabVideo => 'Video';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'Capacità';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max byte ($available byte liberi)';
  }

  @override
  String get tagInfoTitle => 'Informazioni sul tag';

  @override
  String get tagLibraryTitle => 'La mia raccolta tag';

  @override
  String get tagNameHint => 'Es.: Tag cucina';

  @override
  String get tagNameLabel => 'Nome';

  @override
  String get tagReadOnly => 'Sola lettura (Bloccato)';

  @override
  String tagRulesCount(int count) {
    return 'Regole / note salvate: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Mostra solo la nota associata basandosi sull\'hash SHA-256 dei byte NDEF.';

  @override
  String get tagSerialNumber => 'Numero di serie (UID)';

  @override
  String get tagTechnology => 'Tecnologia';

  @override
  String get tagType => 'Tipo';

  @override
  String get tagUidCopied => 'UID del tag copiato';

  @override
  String get tagWritable => 'Scrivibile';

  @override
  String get takePhoto => 'Scatta foto';

  @override
  String get templateGalleryTitle => 'Modelli pronti';

  @override
  String get templateNameHint => 'Nome del modello';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Record',
      one: '1 Record',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'Modello salvato con successo';

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
  String get totalBytes => 'Dimensione totale';

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
  String get verificationNotChecked => 'Non controllata';

  @override
  String get verificationPassed => 'Superata';

  @override
  String get videoUrlCannotBeEmpty => 'L\'URL del video non può essere vuoto.';

  @override
  String get videoUrlOrId => 'URL video o ID YouTube';

  @override
  String get videoUrlOrIdPrompt => 'Inserisci link video o ID YouTube.';

  @override
  String get wifiAuthOpen => 'Aperta (Nessuna password)';

  @override
  String get wifiAuthType => 'Tipo di sicurezza';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'Rete nascosta';

  @override
  String get wifiPassword => 'Password';

  @override
  String get wifiSsid => 'Nome rete (SSID)';

  @override
  String get withSiri => 'Con Siri';

  @override
  String get writeDumpConfirmButton => 'Scrivi';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes byte) verrà scritto nella memoria. UID e pagine di blocco rimangono inalterati.';
  }

  @override
  String get writeDumpSubtitle => 'Scrive il file binario salvato sul tag';

  @override
  String get writeDumpTitle => 'Scrivi dump (.bin)';

  @override
  String get writeHeroButton => 'Avvia scrittura';

  @override
  String get writeHeroEyebrow => 'SCRITTORE NDEF';

  @override
  String get writeHeroSubtitle =>
      'Prepara più record NDEF e scrivili sul tag NFC in un unico passaggio.';

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
  String get yes => 'Sì';
}
