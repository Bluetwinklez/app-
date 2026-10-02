// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get addRecord => 'Ajouter un enregistrement';

  @override
  String get addRule => 'Ajouter une règle';

  @override
  String get addTag => 'Ajouter un tag';

  @override
  String get addToComposerList => 'Ajouter à la liste d\'écriture';

  @override
  String get addToWriteList => 'Ajouter à la liste d\'écriture';

  @override
  String get addressCannotBeEmpty => 'L\'adresse ne peut pas être vide.';

  @override
  String get advancedCommandsDesc =>
      'Une commande hex par ligne. Ex. : 60 = GET_VERSION, 30 04 = lire page 4. Des commandes erronées peuvent détériorer le tag.';

  @override
  String get advancedCommandsSubtitle =>
      'Envoie des commandes brutes hexadécimales au tag';

  @override
  String get advancedCommandsTitle => 'Commandes NFC avancées';

  @override
  String get allRulesCleared => 'Toutes les règles ont été supprimées';

  @override
  String get appLinksDesc =>
      'Écrits sur un tag, ces liens permettent d\'ouvrir l\'app directement sur l\'écran concerné au toucher.';

  @override
  String get appLinksSection => 'Liens d\'application';

  @override
  String get appPackageName => 'Nom de package Android';

  @override
  String get appSettings => 'Paramètres de l\'application';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'Exécution automatique au toucher';

  @override
  String get backupExportSuccess =>
      'Fichier de sauvegarde enregistré avec succès';

  @override
  String get backupFileSizeExceeded =>
      'La taille de la sauvegarde dépasse 2 Mo.';

  @override
  String get backupHistoryMustBeList =>
      'Le champ \"history\" doit être une liste.';

  @override
  String backupImportFailed(String error) {
    return 'Échec de l\'importation de la sauvegarde : $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'Sauvegarde importée avec succès : $templates modèles, $rules règles, $history entrées d\'historique';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'ID non conforme en Base64 : $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Données non conformes en Base64 : $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Type non conforme en Base64 : $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'Format JSON invalide : $error';
  }

  @override
  String get backupInvalidRuleNote => 'Note de règle invalide.';

  @override
  String get backupInvalidRuleSha => 'Hash SHA-256 de règle invalide.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'Date de création de modèle invalide : $date';
  }

  @override
  String get backupInvalidTemplateId => 'ID de modèle invalide.';

  @override
  String get backupInvalidTemplateName => 'Nom de modèle invalide.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'Valeur TNF invalide ($tnf). Doit être comprise entre 0 et 7.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Nombre d\'historiques supérieur à la limite de $max ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'Nombre d\'enregistrements supérieur à la limite de $max ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'Nombre de règles supérieur à la limite de $max ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'Nombre de modèles supérieur à la limite de $max ($count).';
  }

  @override
  String get backupMissingSchemaVersion => 'Champ \"schemaVersion\" manquant.';

  @override
  String get backupRecordMustBeObject =>
      'Chaque enregistrement NDEF doit être un objet JSON.';

  @override
  String get backupRecordsMustBeList =>
      'Les enregistrements doivent être une liste.';

  @override
  String get backupRestoreSubtitle =>
      'Sauvegardez vos modèles, notes et historiques en JSON ou fusionnez-les avec vos données.';

  @override
  String get backupRestoreTitle => 'Sauvegarde & Restauration (JSON)';

  @override
  String get backupRootMustBeObject => 'La racine doit être un objet JSON.';

  @override
  String get backupRuleMustBeObject => 'Chaque règle doit être un objet JSON.';

  @override
  String get backupSchemaVersionMustBeInt =>
      'Le champ \"schemaVersion\" doit être un entier.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'La sauvegarde dépasse la limite de 2 Mo ($bytes octets).';
  }

  @override
  String get backupTagRulesMustBeList =>
      'Le champ \"tagRules\" doit être une liste.';

  @override
  String get backupTemplateMustBeObject =>
      'Chaque modèle doit être un objet JSON.';

  @override
  String get backupTemplatesMustBeList =>
      'Le champ \"templates\" doit être une liste.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'Version de schéma non prise en charge : $version.';
  }

  @override
  String get batchWrite => 'Écriture par lot';

  @override
  String get bluetoothDeviceName => 'Nom de l\'appareil (Optionnel)';

  @override
  String get bluetoothMac => 'Adresse MAC Bluetooth';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'Octets écrits : $bytes | Vérification : $status';
  }

  @override
  String cameraError(String error) {
    return 'Impossible d\'ouvrir l\'appareil photo. Autorisez l\'accès dans Réglages > Confidentialité > Appareil photo.\n($error)';
  }

  @override
  String get cancel => 'Annuler';

  @override
  String get catBusiness => 'Commerce';

  @override
  String get catCar => 'Voiture';

  @override
  String get catHome => 'Maison';

  @override
  String get catOther => 'Autre';

  @override
  String get catPersonal => 'Personnel';

  @override
  String get catWork => 'Travail';

  @override
  String get categoryLabel => 'Catégorie';

  @override
  String get chooseFromGallery => 'Choisir dans la galerie';

  @override
  String get clear => 'Effacer';

  @override
  String get clearAll => 'Tout effacer';

  @override
  String get clearAllRulesConfirm =>
      'Supprimer toutes les notes enregistrées ?';

  @override
  String get clearConfirmButton => 'Oui, effacer';

  @override
  String get clearConfirmMessage =>
      'Cette opération efface tous les enregistrements NDEF et écrit un enregistrement vide. Continuer ?';

  @override
  String get clearConfirmTitle => 'Réinitialiser le tag';

  @override
  String get clearHistory => 'Effacer l\'historique';

  @override
  String get clearList => 'Vider la liste';

  @override
  String get clearTagSubtitle =>
      'Supprime tous les enregistrements et écrit un NDEF vide';

  @override
  String get clearTagTitle => 'Effacer le tag';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count enregistrements dans le presse-papiers',
      one: '1 enregistrement dans le presse-papiers',
    );
    return '$_temp0 ($bytes o) · $source';
  }

  @override
  String get close => 'Fermer';

  @override
  String get commandsEmptyError => 'Veuillez saisir au moins une commande.';

  @override
  String get commandsLabel => 'Commandes';

  @override
  String get composeRecordTitle => 'Ajouter un enregistrement';

  @override
  String get confirmClearHistoryContent =>
      'Tout l\'historique des scans sera supprimé. Confirmez-vous ?';

  @override
  String get confirmClearHistoryTitle => 'Effacer l\'historique';

  @override
  String get confirmClearTemplatesContent =>
      'Tous les modèles enregistrés seront supprimés. Confirmez-vous ?';

  @override
  String get confirmClearTemplatesTitle => 'Supprimer les modèles';

  @override
  String get contactCompany => 'Société / Organisation';

  @override
  String get contactEmail => 'E-mail';

  @override
  String get contactFullName => 'Nom et prénom';

  @override
  String get contactNote => 'Note';

  @override
  String get contactPhone => 'Téléphone';

  @override
  String get contactTitle => 'Fonction / Titre';

  @override
  String get contactWebsite => 'Site web';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count enregistrements',
      one: '1 enregistrement',
    );
    return 'Contenu : $_temp0 · $content';
  }

  @override
  String get copy => 'Copier';

  @override
  String get copyAllRecords => 'Tout copier';

  @override
  String get copyTagUid => 'Copier l\'UID';

  @override
  String get copyToComposer => 'Copier vers la liste d\'écriture';

  @override
  String get csvInvalidAddress => 'adresse non valide.';

  @override
  String get csvInvalidEmail => 'adresse e-mail non valide.';

  @override
  String get csvInvalidLocation =>
      'entrez latitude et longitude (ex. position,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'Maximum $max enregistrements importés ; lignes restantes ignorées.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'Ligne $row : valeur vide.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'Ligne $row : $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'type inconnu \"$type\".';
  }

  @override
  String get csvWifiPasswordLength =>
      'Le mot de passe Wi-Fi doit comporter 8 à 63 caractères.';

  @override
  String get delete => 'Supprimer';

  @override
  String deleteTagConfirmContent(String name) {
    return 'Supprimer \"$name\" de la bibliothèque ? Le tag physique ne sera pas modifié.';
  }

  @override
  String get deleteTagConfirmTitle => 'Supprimer le tag';

  @override
  String get deleteTemplateTooltip => 'Supprimer le modèle';

  @override
  String get deviceNameTooLong => 'Nom d\'appareil trop long.';

  @override
  String get dismiss => 'Ignorer';

  @override
  String get editRecordTitle => 'Modifier l\'enregistrement';

  @override
  String get editRule => 'Modifier la règle';

  @override
  String get editTag => 'Modifier le tag';

  @override
  String get emailBody => 'Corps du message';

  @override
  String get emailRecipient => 'Destinataire';

  @override
  String get emailSubject => 'Objet';

  @override
  String get emptyComposerSubtitle =>
      'Touchez \"Ajouter un enregistrement\" pour créer des URL, textes, Wi-Fi, fiches contacts et plus.';

  @override
  String get emptyComposerTitle => 'Aucun enregistrement';

  @override
  String get emptyHistorySubtitle =>
      'Vos scans apparaîtront ici au fur et à mesure.';

  @override
  String get emptyHistoryTitle => 'Aucun historique';

  @override
  String get emptyLibrary =>
      'Aucun tag enregistré.\nScannez un tag pour l\'ajouter ici avec nom et photo.';

  @override
  String get eventDescription => 'Description';

  @override
  String get eventEnd => 'Fin';

  @override
  String get eventLocation => 'Lieu';

  @override
  String get eventStart => 'Début';

  @override
  String get eventTitle => 'Titre de l\'événement';

  @override
  String get exportBackup => 'Exporter';

  @override
  String get facetimePrompt =>
      'Entrez un numéro ou une adresse e-mail Apple ID.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" ne peut pas être vide.';
  }

  @override
  String get fieldTextPrompt => 'Texte à écrire sur le tag';

  @override
  String get fieldUrlPrompt => 'Adresse web (https://...)';

  @override
  String get fileUrl => 'Lien du fichier (URL)';

  @override
  String get filterAll => 'Tous';

  @override
  String get flashlight => 'Lampe';

  @override
  String get formatConfirmButton => 'Formater';

  @override
  String get formatConfirmMessage =>
      'Les données seront effacées et le tag sera préparé comme un tag NDEF vierge. Continuer ?';

  @override
  String get formatMemorySubtitle =>
      'Prépare le tag pour NDEF (tags vierges ou altérés)';

  @override
  String get formatMemoryTitle => 'Formater la mémoire';

  @override
  String get hardwareAvailable => 'Matériel NFC prêt';

  @override
  String get hardwareDisabled => 'NFC désactivé';

  @override
  String get hardwareNotSupported => 'NFC non pris en charge';

  @override
  String get historyFilteredEmpty =>
      'Aucun résultat trouvé dans l\'historique.';

  @override
  String get idTooLarge => 'L\'ID ne peut excéder 255 octets';

  @override
  String get importBackup => 'Importer (Fusionner)';

  @override
  String get importCsv => 'Importer CSV';

  @override
  String get inAppTagRules => 'Règles de tag intégrées';

  @override
  String get invalidHexId => 'ID hexadécimal invalide';

  @override
  String get invalidHexPayload => 'Données hexadécimales invalides';

  @override
  String get invalidHexType => 'Type hexadécimal invalide';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get latitude => 'Latitude (Lat)';

  @override
  String get linkCopied => 'Lien copié';

  @override
  String get linkHistoryDesc => 'Ouvre l\'historique';

  @override
  String get linkScanDesc => 'Ouvre l\'app et démarre le scanner';

  @override
  String get linkToolsDesc => 'Ouvre l\'écran des outils';

  @override
  String get linkWriteDesc => 'Ouvre l\'écran d\'écriture';

  @override
  String get loadToComposerTooltip => 'Charger dans l\'éditeur';

  @override
  String get locationHint => 'Ex. : Porte du réfrigérateur';

  @override
  String get locationLabel => 'Où se trouve-t-il ?';

  @override
  String get lockAcknowledge =>
      'Je comprends que cette action est irréversible';

  @override
  String get lockButton => 'Verrouiller';

  @override
  String get lockTagSubtitle =>
      'Rend le tag définitivement en lecture seule (irréversible)';

  @override
  String get lockTagTitle => 'Verrouiller le tag';

  @override
  String get lockWarning =>
      'Un tag verrouillé devient strictement en lecture seule : son contenu ne pourra PLUS être modifié ni déverrouillé. Vérifiez-le avant.';

  @override
  String get longitude => 'Longitude (Lng)';

  @override
  String get manage => 'Gérer';

  @override
  String get matchedRule => 'Règle / Note associée';

  @override
  String get mimePayloadHex => 'Données brutes (Hex / Texte)';

  @override
  String get mimeTypeLabel => 'Type MIME';

  @override
  String get nameRequired => 'Veuillez donner un nom au tag.';

  @override
  String get navHistory => 'Hist.';

  @override
  String get navHistoryTitle => 'Historique';

  @override
  String get navRead => 'Lire';

  @override
  String get navReadTitle => 'Lire un tag';

  @override
  String get navSettings => 'Régl.';

  @override
  String get navSettingsTitle => 'Modèles & Réglages';

  @override
  String get navTools => 'Outils';

  @override
  String get navToolsTitle => 'Outils';

  @override
  String get navWrite => 'Écrire';

  @override
  String get navWriteTitle => 'Écrire un tag';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Enregistrements',
      one: '1 Enregistrement',
    );
    return '$_temp0';
  }

  @override
  String get ndefRecordsTitle => 'Enregistrements NDEF';

  @override
  String get nfcPromptClear =>
      'Approchez le tag de l\'appareil pour le réinitialiser';

  @override
  String get nfcPromptLock =>
      'Approchez le tag pour le verrouiller définitivement';

  @override
  String get nfcPromptScan =>
      'Approchez le tag NFC de l\'appareil pour le lire';

  @override
  String get nfcPromptWrite =>
      'Approchez le tag NFC pour enregistrer les données';

  @override
  String get no => 'Non';

  @override
  String get noContentInTag => 'Aucun contenu associé.';

  @override
  String get noLibraryMatches => 'Aucun tag correspondant.';

  @override
  String get noRecordsOnTag => 'Aucun enregistrement NDEF trouvé sur le tag.';

  @override
  String get noTemplates =>
      'Aucun modèle enregistré.\nCréez un enregistrement dans l\'onglet \"Écrire\" pour l\'ajouter comme modèle.';

  @override
  String get noteLabel => 'Note';

  @override
  String get onboardingContinue => 'Continuer';

  @override
  String get onboardingSkip => 'Passer';

  @override
  String get onboardingStart => 'Commencer';

  @override
  String get onboardingStep1Body =>
      'Touchez le bouton bleu et approchez le haut du téléphone du tag. Contenu, capacité et UID s\'affichent instantanément.';

  @override
  String get onboardingStep1Title => 'Scanner un tag';

  @override
  String get onboardingStep2Body =>
      'Dans l\'onglet \"Écrire\", touchez \"Ajouter\" : liens web, Wi-Fi, contacts, réseaux sociaux et modèles prêts à l\'emploi.';

  @override
  String get onboardingStep2Title => 'Écrire librement';

  @override
  String get onboardingStep3Body =>
      'Inspectez la mémoire, appliquez des mots de passe, verrouillez ou formatez vos tags dans l\'onglet \"Outils\".';

  @override
  String get onboardingStep3Title => 'Outils experts';

  @override
  String get onboardingStep4Body =>
      'Conservez vos tags avec noms, notes et photos dans votre bibliothèque. Changez la langue dans les Réglages.';

  @override
  String get onboardingStep4Title => 'Organiser vos tags';

  @override
  String optionalField(String label) {
    return '$label (facultatif)';
  }

  @override
  String pageN(int page) {
    return 'Page $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'Données';

  @override
  String get pageRoleLock => 'Verrou';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / Verrou';

  @override
  String get passwordDialogAction => 'Appliquer';

  @override
  String get passwordDialogTitle => 'Définir un mot de passe';

  @override
  String get passwordDialogWarning =>
      'Si vous oubliez ce mot de passe, le tag ne pourra plus être modifié. La lecture reste publique.';

  @override
  String get passwordError =>
      'Entrez exactement 4 caractères ou 8 chiffres hex.';

  @override
  String get passwordHint => '4 caractères (ex. 1234) ou 8 chiffres hex';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String get paste => 'Coller';

  @override
  String get phoneNumber => 'Numéro de téléphone';

  @override
  String get phoneWithCountryCode =>
      'Entrez le numéro avec l\'indicatif (ex. 33612345678).';

  @override
  String get presetAppDownloadDesc =>
      'Ouvre ou propose d\'installer votre application.';

  @override
  String get presetAppDownloadTitle => 'Téléchargement d\'application';

  @override
  String get presetBusinessCardDesc =>
      'Ajoute votre contact au carnet d\'adresses au toucher.';

  @override
  String get presetBusinessCardTitle => 'Carte de visite numérique';

  @override
  String get presetDirectionsDesc =>
      'Indique une adresse ou un repère sur la carte.';

  @override
  String get presetDirectionsTitle => 'Itinéraire / Adresse';

  @override
  String get presetEmergencyDesc =>
      'Groupe sanguin, contacts d\'urgence et infos vitales.';

  @override
  String get presetEmergencyTitle => 'Fiche d\'urgence (ICE)';

  @override
  String get presetGoogleReviewDesc => 'Dirige vers votre page d\'avis Google.';

  @override
  String get presetGoogleReviewTitle => 'Avis Google';

  @override
  String get presetGuestWifiDesc =>
      'Permet aux invités de se connecter sans mot de passe.';

  @override
  String get presetGuestWifiTitle => 'Carte Wi-Fi invité';

  @override
  String get presetInstagramDesc => 'Ouvre directement votre profil Instagram.';

  @override
  String get presetInstagramTitle => 'Profil Instagram';

  @override
  String get presetMenuLinkDesc =>
      'À coller sur les tables pour afficher la carte.';

  @override
  String get presetMenuLinkTitle => 'Menu restaurant';

  @override
  String get presetPetTagDesc =>
      'Permet de vous joindre immédiatement en cas de perte.';

  @override
  String get presetPetTagTitle => 'Médaille pour animal';

  @override
  String get presetShortcutDesc =>
      'Lance des raccourcis iPhone ou des actions d\'app.';

  @override
  String get presetShortcutTitle => 'Déclencheur de raccourci';

  @override
  String get presetWebsiteDesc => 'Redirige vers une page web.';

  @override
  String get presetWebsiteTitle => 'Site internet';

  @override
  String get presetWhatsappDesc =>
      'Ouvre une discussion sans enregistrer le numéro.';

  @override
  String get presetWhatsappTitle => 'Contact WhatsApp';

  @override
  String get qrCode => 'Code QR';

  @override
  String qrContentChars(int chars) {
    return 'Contenu ($chars caractères) :';
  }

  @override
  String get qrContentEmpty => 'Le contenu à encoder est vide.';

  @override
  String qrContentTooLarge(int chars) {
    return 'Contenu trop volumineux pour un QR code ($chars caractères, max. 2048).';
  }

  @override
  String get qrFrameInstructions =>
      'Cadrez le QR code. Les QR de liens web, Wi-Fi et texte seront transformés en enregistrements.';

  @override
  String qrGenerationFailed(String error) {
    return 'Échec de génération du QR code : $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'Aperçu du code QR : $title';
  }

  @override
  String get qrScanTitle => 'Scanner un QR code';

  @override
  String get qrSecurityNote =>
      'L\'aperçu QR est réservé aux textes clairs et URL web.\n\nLes mots de passe Wi-Fi et données binaires ne sont pas convertis par souci de sécurité.';

  @override
  String get qrUserOnlyNote =>
      'Ouvert uniquement à la demande de l\'utilisateur.';

  @override
  String get rawInspection => 'Inspection détaillée';

  @override
  String get rawRecordDetailsTitle => 'Détails du record (Lecture seule)';

  @override
  String get rawRecordEditorTitle => 'Modifier le record NDEF brut';

  @override
  String get readHeroButton => 'Lancer le scan';

  @override
  String get readHeroEyebrow => 'LECTEUR NFC';

  @override
  String get readHeroScanning => 'Scan en cours...';

  @override
  String get readHeroSubtitle =>
      'Approchez le haut du téléphone d\'un tag NFC pour lire les données NDEF et les détails de la puce.';

  @override
  String get readHeroTitle => 'Scanner un tag';

  @override
  String get readMemorySubtitle =>
      'Mémoire brute page par page ; copier ou enregistrer en .bin';

  @override
  String get readMemoryTitle => 'Lire la mémoire';

  @override
  String get readyTemplates => 'Modèles prêts';

  @override
  String get recordCopied => 'Contenu copié';

  @override
  String recordIndex(int index) {
    return 'Enregistrement n°$index';
  }

  @override
  String get recordTypeCalendar => 'Événement calendrier (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'MIME personnalisé ($mime)';
  }

  @override
  String get recordTypeEmail => 'Enregistrement e-mail';

  @override
  String get recordTypeLocation => 'Position / GPS';

  @override
  String get recordTypePhone => 'Numéro de téléphone';

  @override
  String get recordTypeSmartPoster => 'Smart Poster';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'Contenu Smart Poster corrompu ($bytes octets)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'Smart Poster (Invalide)';

  @override
  String get recordTypeSms => 'Enregistrement SMS';

  @override
  String get recordTypeText => 'Enregistrement texte';

  @override
  String get recordTypeUnknown => 'Enregistrement inconnu';

  @override
  String get recordTypeUrl => 'Lien Web (URL)';

  @override
  String get recordTypeVCard => 'Fiche contact (vCard)';

  @override
  String get recordTypeWifi => 'Configuration Wi-Fi (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'Données WSC corrompues';

  @override
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count enregistrements copiés',
      one: '1 enregistrement copié',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'Rétablir';

  @override
  String get removePasswordDialogTitle => 'Supprimer le mot de passe';

  @override
  String get removePasswordDialogWarning =>
      'Saisissez le mot de passe actuel du tag.';

  @override
  String get removePasswordSubtitle =>
      'Supprime la protection à l\'aide du mot de passe';

  @override
  String get removePasswordTitle => 'Supprimer le mot de passe';

  @override
  String get removePhoto => 'Retirer';

  @override
  String get rewriteTag => 'Réécrire';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Supprimer la règle \"$note\" ?';
  }

  @override
  String get ruleDeleted => 'Règle supprimée';

  @override
  String get ruleNoteDialogTitle => 'Modifier la note du tag';

  @override
  String get ruleNoteHint => 'Ex. : Étagère #4 ou Salle de réunion';

  @override
  String get ruleNoteLabel => 'Note / Description locale';

  @override
  String get ruleSaved => 'Règle enregistrée';

  @override
  String get save => 'Enregistrer';

  @override
  String get saveAsTemplate => 'Enregistrer comme modèle';

  @override
  String get saveBin => 'Enregistrer .bin';

  @override
  String get saveLocalHistory => 'Enregistrer l\'historique local';

  @override
  String get saveLocalHistorySubtitle =>
      'Désactivé, aucun scan n\'est conservé. Activé, les scans réussis sont stockés localement.';

  @override
  String get saveTemplateDialogTitle => 'Enregistrer comme modèle';

  @override
  String get saveToLibrary => 'Sauvegarder dans la bibliothèque';

  @override
  String get scanFabLabel => 'Scanner le tag';

  @override
  String get scanQrToRecord => 'Scanner un QR';

  @override
  String get scannedTag => 'Tag scanné';

  @override
  String get searchEngine => 'Moteur de recherche';

  @override
  String get searchHistoryHint =>
      'Rechercher dans l\'historique (UID, texte, type)...';

  @override
  String get searchLibraryHint => 'Rechercher par nom, note, lieu ou contenu';

  @override
  String get searchQuery => 'Requête de recherche';

  @override
  String get searchQueryCannotBeEmpty => 'La recherche ne peut pas être vide.';

  @override
  String get securityRestriction => 'Restriction de sécurité';

  @override
  String get send => 'Envoyer';

  @override
  String get setPasswordSubtitle =>
      'Protège le contenu contre l\'écriture non autorisée';

  @override
  String get setPasswordTitle => 'Définir un mot de passe';

  @override
  String get shareRecords => 'Partager';

  @override
  String get shortcutAutomationNote =>
      'Note : L\'automatisation est liée à l\'UID et fonctionne même si le contenu du tag change.';

  @override
  String get shortcutStep1 =>
      'Ouvrez Raccourcis et touchez \"Automatisation\" en bas.';

  @override
  String get shortcutStep2 =>
      'Touchez \"Nouvelle automatisation\" (+) → choisissez \"NFC\".';

  @override
  String get shortcutStep3 =>
      'Touchez \"Scanner\", approchez le tag de l\'iPhone et nommez-le.';

  @override
  String get shortcutStep4 =>
      'Sélectionnez \"Exécuter immédiatement\", puis ajoutez vos actions.';

  @override
  String get shortcutStep5 =>
      'Pour ouvrir cette app, choisissez \"Scanner le tag\" ou \"Écrire un tag\".';

  @override
  String get shortcutsGuideSubtitle =>
      'Automatisez des actions au toucher d\'un tag ou demandez à Siri de scanner les mains libres.';

  @override
  String get shortcutsGuideTitle => 'Siri & Raccourcis';

  @override
  String get siriPhraseScan =>
      '\"Dis Siri, scanner un tag avec NFC Tag Master\"';

  @override
  String get siriPhraseWrite =>
      '\"Dis Siri, écrire sur un tag avec NFC Tag Master\"';

  @override
  String get siriShortcutsNote =>
      'Ces commandes apparaissent également dans l\'app Raccourcis et la recherche Spotlight.';

  @override
  String get smsMessage => 'Message SMS';

  @override
  String get socialNetwork => 'Plateforme';

  @override
  String get socialUsername => 'Nom d\'utilisateur';

  @override
  String get sourceComposer => 'Enregistrements de la liste d\'écriture';

  @override
  String get sourceEmpty => 'Sans contenu (note uniquement)';

  @override
  String get sourceLastScan => 'Dernier tag scanné';

  @override
  String get sourceSelectPrompt => 'D\'où provient le contenu du tag ?';

  @override
  String get statusCancelled => 'Opération annulée.';

  @override
  String statusClearError(String error) {
    return 'Erreur de réinitialisation : $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'Échec de la réinitialisation : $error';
  }

  @override
  String get statusClearSuccess => 'Contenu du tag effacé avec succès.';

  @override
  String get statusClearing => 'Réinitialisation en cours. Approchez le tag...';

  @override
  String statusLockError(String error) {
    return 'Erreur de verrouillage : $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'Échec du verrouillage : $error';
  }

  @override
  String get statusLockSuccess =>
      'Tag verrouillé définitivement (lecture seule).';

  @override
  String get statusLocking => 'Verrouillage en cours. Approchez le tag...';

  @override
  String get statusNfcDisabled =>
      'NFC désactivé. Veuillez l\'activer dans les réglages système.';

  @override
  String get statusNfcNotSupported =>
      'Le matériel NFC n\'est pas disponible sur cet appareil.';

  @override
  String get statusNfcUnavailable => 'NFC actuellement indisponible.';

  @override
  String get statusReady => 'Prêt';

  @override
  String statusScanError(String error) {
    return 'Erreur de scan : $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'Tag lu avec succès ($id).';
  }

  @override
  String get statusScanning =>
      'Scan en cours... Approchez le téléphone du tag.';

  @override
  String statusUnexpectedError(String error) {
    return 'Erreur inattendue : $error';
  }

  @override
  String statusWriteError(String error) {
    return 'Erreur d\'écriture : $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'Échec de l\'écriture : $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return 'Écriture et vérification réussies ! ($bytes octets)';
  }

  @override
  String get statusWriting => 'Mode écriture actif. Approchez le tag cible...';

  @override
  String get systemLanguage => 'Langue du système';

  @override
  String get tabApp => 'Application';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'Calendrier';

  @override
  String get tabContact => 'Contact (vCard)';

  @override
  String get tabCustomMime => 'MIME personnalisé';

  @override
  String get tabEmail => 'E-mail';

  @override
  String get tabFile => 'Fichier';

  @override
  String get tabLocation => 'Localisation';

  @override
  String get tabPhone => 'Téléphone';

  @override
  String get tabSearch => 'Recherche';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'Réseaux sociaux';

  @override
  String get tabText => 'Texte';

  @override
  String get tabUrl => 'URL Web';

  @override
  String get tabVideo => 'Vidéo';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'Capacité';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max octets ($available octets libres)';
  }

  @override
  String get tagInfoTitle => 'Informations sur le tag';

  @override
  String get tagLibraryTitle => 'Ma bibliothèque de tags';

  @override
  String get tagNameHint => 'Ex. : Tag de la cuisine';

  @override
  String get tagNameLabel => 'Nom';

  @override
  String get tagReadOnly => 'Lecture seule (Verrouillé)';

  @override
  String tagRulesCount(int count) {
    return 'Règles / notes enregistrées : $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Affiche uniquement la note associée selon le hachage SHA-256 du contenu NDEF.';

  @override
  String get tagSerialNumber => 'Numéro de série (UID)';

  @override
  String get tagTechnology => 'Technologie';

  @override
  String get tagType => 'Type';

  @override
  String get tagUidCopied => 'UID du tag copié';

  @override
  String get tagWritable => 'Inscriptible';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get templateGalleryTitle => 'Modèles prêts';

  @override
  String get templateNameHint => 'Nom du modèle';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Enregistrements',
      one: '1 Enregistrement',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'Modèle enregistré avec succès';

  @override
  String get toolsExpertSection => 'Expert';

  @override
  String get toolsFooterNote =>
      'Les outils mémoire, mot de passe et commandes fonctionnent avec NTAG213/215/216 et MIFARE Ultralight EV1. Maintenez le tag près de l\'appareil.';

  @override
  String get toolsMemorySection => 'Mémoire';

  @override
  String get toolsSecuritySection => 'Sécurité';

  @override
  String get toolsTagSection => 'Tag';

  @override
  String get totalBytes => 'Taille totale';

  @override
  String get typeTooLarge => 'Le type ne peut excéder 255 octets';

  @override
  String get undo => 'Annuler';

  @override
  String get unknownChip16Pages => 'Puce inconnue (16 premières pages)';

  @override
  String get urlSafetyInvalidUrl => 'Format d\'URL invalide.';

  @override
  String get urlSafetyIpv4 =>
      'L\'adresse de destination est une adresse IPv4 brute.';

  @override
  String get urlSafetyIpv6 =>
      'L\'adresse de destination est une adresse IPv6 brute.';

  @override
  String get urlSafetyMissingScheme => 'Schéma de protocole URL manquant.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'Port réseau non standard (Port : $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'Nom de domaine internationalisé / Punycode détecté (\"xn--\").';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'Schéma d\'URL non standard : \"$scheme\".';
  }

  @override
  String get urlSafetyUnencrypted => 'Connexion non chiffrée (http://).';

  @override
  String get urlSafetyUserInfo =>
      'L\'URL contient des identifiants (userinfo). Risque potentiel d\'hameçonnage.';

  @override
  String get usernameCannotBeEmpty =>
      'Le nom d\'utilisateur ne peut pas être vide.';

  @override
  String get usernameNoSpaces =>
      'Le nom d\'utilisateur ne peut pas contenir d\'espaces.';

  @override
  String get validAndroidPackage =>
      'Entrez un nom de package Android valide (ex. com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'Entrez une adresse MAC valide (ex. 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'Veuillez saisir un lien vidéo valide.';

  @override
  String get validWebAddress =>
      'Entrez une adresse web valide (ex. https://example.com/doc.pdf).';

  @override
  String get verificationNotChecked => 'Non vérifié';

  @override
  String get verificationPassed => 'Réussie';

  @override
  String get videoUrlCannotBeEmpty => 'Le lien vidéo ne peut pas être vide.';

  @override
  String get videoUrlOrId => 'Lien vidéo ou identifiant YouTube';

  @override
  String get videoUrlOrIdPrompt =>
      'Entrez une URL (https://...) ou l\'ID de la vidéo.';

  @override
  String get wifiAuthOpen => 'Ouvert (Non sécurisé)';

  @override
  String get wifiAuthType => 'Sécurité';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'Réseau masqué';

  @override
  String get wifiPassword => 'Mot de passe';

  @override
  String get wifiSsid => 'Nom du réseau (SSID)';

  @override
  String get withSiri => 'Avec Siri';

  @override
  String get writeDumpConfirmButton => 'Écrire';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes octets) sera écrit dans la mémoire. L\'UID et les pages de configuration restent inchangés.';
  }

  @override
  String get writeDumpSubtitle =>
      'Écrit le fichier mémoire sauvegardé sur le tag';

  @override
  String get writeDumpTitle => 'Écrire un dump (.bin)';

  @override
  String get writeHeroButton => 'Lancer l\'écriture';

  @override
  String get writeHeroEyebrow => 'ÉCRIVAIN NDEF';

  @override
  String get writeHeroSubtitle =>
      'Préparez plusieurs enregistrements NDEF et écrivez-les en une seule fois.';

  @override
  String get writeHeroTitle => 'Écrire sur le tag';

  @override
  String get writeHeroWriting => 'Écriture en cours...';

  @override
  String get writeResultFailed => 'Échec de l\'opération';

  @override
  String get writeResultSuccess => 'Opération réussie';

  @override
  String get writeTemplates => 'Modèles d\'écriture';

  @override
  String get writeTemplatesSubtitle =>
      'Enregistrez vos contenus NDEF fréquents sous forme de modèles réutilisables.';

  @override
  String get yes => 'Oui';
}
