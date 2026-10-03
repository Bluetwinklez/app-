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
  String get backupFileSizeExceeded =>
      'La taille de la sauvegarde dépasse 2 Mo.';

  @override
  String get backupHistoryMustBeList =>
      'Le champ \"history\" doit être une liste.';

  @override
  String backupInvalidJson(String error) {
    return 'Format JSON invalide : $error';
  }

  @override
  String get backupInvalidRuleNote => 'Note de règle invalide.';

  @override
  String get backupInvalidRuleSha => 'Hash SHA-256 de règle invalide.';

  @override
  String get backupInvalidTemplateId => 'ID de modèle invalide.';

  @override
  String get backupInvalidTemplateName => 'Nom de modèle invalide.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Nombre d\'historiques supérieur à la limite de $max ($count).';
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
  String get clearConfirmMessage =>
      'Cette opération efface tous les enregistrements NDEF et écrit un enregistrement vide. Continuer ?';

  @override
  String get clearConfirmTitle => 'Réinitialiser le tag';

  @override
  String get clearHistory => 'Effacer l\'historique';

  @override
  String get clearTagSubtitle =>
      'Supprime tous les enregistrements et écrit un NDEF vide';

  @override
  String get clearTagTitle => 'Effacer le tag';

  @override
  String get close => 'Fermer';

  @override
  String get commandsEmptyError => 'Veuillez saisir au moins une commande.';

  @override
  String get commandsLabel => 'Commandes';

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
  String get contactPhone => 'Téléphone';

  @override
  String get contactTitle => 'Fonction / Titre';

  @override
  String get contactWebsite => 'Site web';

  @override
  String get copy => 'Copier';

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
  String get deleteTemplateTooltip => 'Supprimer le modèle';

  @override
  String get deviceNameTooLong => 'Nom d\'appareil trop long.';

  @override
  String get dismiss => 'Ignorer';

  @override
  String get editRecordTitle => 'Modifier l\'enregistrement';

  @override
  String get emailRecipient => 'Destinataire';

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
  String get flashlight => 'Lampe';

  @override
  String get formatMemorySubtitle =>
      'Prépare le tag pour NDEF (tags vierges ou altérés)';

  @override
  String get formatMemoryTitle => 'Formater la mémoire';

  @override
  String get idTooLarge => 'L\'ID ne peut excéder 255 octets';

  @override
  String get importBackup => 'Importer (Fusionner)';

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
  String get locationLabel => 'Où se trouve-t-il ?';

  @override
  String get lockAcknowledge =>
      'Je comprends que cette action est irréversible';

  @override
  String get lockTagSubtitle =>
      'Rend le tag définitivement en lecture seule (irréversible)';

  @override
  String get lockTagTitle => 'Verrouiller le tag';

  @override
  String get manage => 'Gérer';

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
  String get nfcPromptClear =>
      'Approchez le tag de l\'appareil pour le réinitialiser';

  @override
  String get nfcPromptLock =>
      'Approchez le tag pour le verrouiller définitivement';

  @override
  String get nfcPromptScan => 'Approchez le tag du haut de votre téléphone';

  @override
  String get nfcPromptWrite =>
      'Approchez le tag NFC pour enregistrer les données';

  @override
  String get no => 'Non';

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
      'Partage votre fiche contact ; Android propose de l\'enregistrer, sur iPhone elle s\'ouvre dans une app NFC.';

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
      'Les téléphones Android se connectent d\'un geste ; sur iPhone, une app NFC affiche les infos.';

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
  String get rawRecordDetailsTitle => 'Détails du record (Lecture seule)';

  @override
  String get rawRecordEditorTitle => 'Modifier le record NDEF brut';

  @override
  String get readHeroButton => 'Lancer le scan';

  @override
  String get readMemorySubtitle =>
      'Mémoire brute page par page ; copier ou enregistrer en .bin';

  @override
  String get readMemoryTitle => 'Lire la mémoire';

  @override
  String get readyTemplates => 'Modèles prêts';

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
  String get redo => 'Rétablir';

  @override
  String get removePasswordSubtitle =>
      'Supprime la protection à l\'aide du mot de passe';

  @override
  String get removePasswordTitle => 'Supprimer le mot de passe';

  @override
  String get rewriteTag => 'Réécrire';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Supprimer la règle \"$note\" ?';
  }

  @override
  String get ruleNoteDialogTitle => 'Modifier la note du tag';

  @override
  String get ruleNoteLabel => 'Note / Description locale';

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
  String get scanFabLabel => 'Scanner le tag';

  @override
  String get scannedTag => 'Tag scanné';

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
  String get socialUsername => 'Nom d\'utilisateur';

  @override
  String get sourceSelectPrompt => 'D\'où provient le contenu du tag ?';

  @override
  String get statusCancelled => 'Annulé';

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
  String get tabContact => 'Contact (vCard)';

  @override
  String get tabCustomMime => 'MIME personnalisé';

  @override
  String get tabEmail => 'E-mail';

  @override
  String get tabPhone => 'Téléphone';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabText => 'Texte';

  @override
  String get tabUrl => 'URL Web';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => 'Informations sur le tag';

  @override
  String get tagLibraryTitle => 'Ma bibliothèque de tags';

  @override
  String tagRulesCount(int count) {
    return 'Règles / notes enregistrées : $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Affiche uniquement la note associée selon le hachage SHA-256 du contenu NDEF.';

  @override
  String get tagWritable => 'Inscriptible';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get templateNameHint => 'Nom du modèle';

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
  String get verificationPassed => 'Réussi';

  @override
  String get videoUrlCannotBeEmpty => 'Le lien vidéo ne peut pas être vide.';

  @override
  String get videoUrlOrIdPrompt =>
      'Entrez une URL (https://...) ou l\'ID de la vidéo.';

  @override
  String get wifiAuthOpen => 'Ouvert (Non sécurisé)';

  @override
  String get wifiPassword => 'Mot de passe';

  @override
  String get wifiSsid => 'Nom du réseau (SSID)';

  @override
  String get withSiri => 'Avec Siri';

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
  String get unknown => 'Inconnu';

  @override
  String get error => 'Erreur';

  @override
  String get nfcPromptReady => 'Approchez le tag';

  @override
  String get invalidResponseFormat => 'Format de réponse invalide reçu';

  @override
  String get nfcReadError => 'Erreur de lecture NFC';

  @override
  String get invalidPlatformResponse =>
      'Réponse invalide reçue de la plateforme';

  @override
  String get writeFailed => 'Échec de l\'écriture';

  @override
  String get lockFailed => 'Échec du verrouillage';

  @override
  String get failedToConnectTag => 'Impossible de se connecter au tag';

  @override
  String get invalidTagResponse => 'Réponse invalide du tag';

  @override
  String get commandFailed => 'Échec de la commande';

  @override
  String get ndefTypeOrIdTooLong => 'Le type ou l\'ID NDEF dépasse 255 octets';

  @override
  String get ndefUnsupportedOrInvalidRecord =>
      'Enregistrement NDEF non pris en charge ou invalide';

  @override
  String get ndefMissingTypeLength => 'Longueur de type NDEF manquante';

  @override
  String get ndefMissingPayloadLength =>
      'Longueur de charge utile NDEF manquante';

  @override
  String get ndefMissingIdLength => 'Longueur d\'ID NDEF manquante';

  @override
  String get ndefMissingType => 'Type NDEF manquant';

  @override
  String get ndefMissingId => 'ID NDEF manquant';

  @override
  String get ndefMissingPayload => 'Charge utile NDEF manquante';

  @override
  String get unprotected => '(Sans mot de passe)';

  @override
  String get binaryDataPreview => '(Données binaires)';

  @override
  String get emptyValue => '(Vide)';

  @override
  String get tnfEmpty => '0: Empty (Vide)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (Inconnu)';

  @override
  String get tnfUnchanged => '6: Unchanged (NDEF morcelé)';

  @override
  String get tnfReserved => '7: Reserved (Réservé)';

  @override
  String get ntagUnsupportedChip =>
      'Cette opération n\'est prise en charge que sur les tags NTAG213/215/216 et MIFARE Ultralight EV1.';

  @override
  String ntagPageReadFailed(String page) {
    return 'Impossible de lire la page $page (le tag n\'a pas répondu ou zone protégée).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'Impossible d\'écrire la page $page : $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'Impossible d\'écrire la page $page (rejetée ; verrouillée ou protégée).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'Impossible de lire au-delà de la page $page ; zone peut-être protégée par mot de passe.';
  }

  @override
  String get ntagPasswordPackSize =>
      'Le mot de passe doit comporter 4 octets et PACK 2 octets.';

  @override
  String get ntagPasswordSize => 'Le mot de passe doit comporter 4 octets.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'Mot de passe incorrect ou authentification rejetée par le tag.';

  @override
  String get ntagPasswordWrong => 'Mot de passe incorrect.';

  @override
  String get ntagCcInvalid =>
      'La zone CC a une valeur non-NDEF ; cette zone OTP ne peut pas être formatée.';

  @override
  String get ntagDumpTooShort =>
      'Fichier dump trop court ; aucune donnée utilisateur.';

  @override
  String get ntagInvalidHex =>
      'Entrez une valeur hexadécimale valide (ex. : 30 04).';

  @override
  String get googleReviewFieldLabel => 'Lien d\'avis ou Place ID';

  @override
  String get menuLinkFieldLabel => 'Lien du menu';

  @override
  String get menuTitleHint => 'Notre menu';

  @override
  String get petName => 'Nom de l\'animal';

  @override
  String get ownerPhone => 'Téléphone du propriétaire';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'Bonjour, je suis $pet ! Merci d\'appeler mon propriétaire : $phone$note';
  }

  @override
  String get bloodType => 'Groupe sanguin';

  @override
  String get allergies => 'Allergies / Médicaments';

  @override
  String get emergencyContact => 'Contact d\'urgence';

  @override
  String get emergencyInfo => 'INFOS D\'URGENCE';

  @override
  String emergencyBlood(String blood) {
    return 'Groupe sanguin : $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'Allergies : $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'En cas d\'urgence appeler : $contact';
  }

  @override
  String get storeLink => 'Lien du magasin';

  @override
  String get link => 'Lien';

  @override
  String get title => 'Titre';

  @override
  String get webAddress => 'Adresse web';

  @override
  String get address => 'Adresse';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'Modèles : $added ajoutés, $updated mis à jour';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'Notes/Règles de tag : $added ajoutées, $updated mises à jour';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'Historique ignoré car désactivé sur l\'appareil : $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'Historique : $added ajoutés, $skipped existants/ignorés';
  }

  @override
  String get backupSummaryNoNewData =>
      'Aucune nouvelle donnée à importer (correspond aux enregistrements existants).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field doit être une chaîne de caractères.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field doit être une date valide.';
  }

  @override
  String get rawTypeHexLabel => 'Type (Octets hex)';

  @override
  String get rawIdHexLabel => 'ID (Octets hex, facultatif)';

  @override
  String get rawPayloadHexLabel => 'Charge utile (Octets hex)';

  @override
  String get rawOptionalHexHint => 'Octets hex facultatifs';

  @override
  String get saveChanges => 'Enregistrer les modifications';

  @override
  String get edit => 'Modifier';

  @override
  String get clearAllButton => 'Tout effacer';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip : $count pages lues';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip formaté';
  }

  @override
  String get ntagInvalidDumpFile =>
      'Fichier dump non valide (doit être un multiple de 4 octets, 32-1024 octets).';

  @override
  String ntagPagesWritten(int count) {
    return '$count pages écrites';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip : protection par mot de passe activée';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip : mot de passe supprimé';
  }

  @override
  String get memoryDumpCopied => 'Vidage mémoire copié';

  @override
  String ntagCommandsSent(int count) {
    return '$count commandes envoyées';
  }

  @override
  String get emptyResponse => '(réponse vide)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages pages · $bytes octets';
  }

  @override
  String get composeTextEmpty => 'Le contenu textuel ne peut pas être vide.';

  @override
  String get composeTextTooLong => 'Texte trop long (5000 caractères max).';

  @override
  String get composeUrlInvalid =>
      'Entrez une adresse valide (ex: https://example.com ou lien app://).';

  @override
  String get composeUrlTooLong => 'URL trop longue (2000 caractères max).';

  @override
  String get composeEmailInvalid =>
      'Entrez une adresse e-mail valide (ex: nom@domaine.com).';

  @override
  String get composePhoneInvalid =>
      'Entrez un numéro de téléphone valide (ex: +905551234567).';

  @override
  String get composeSmsPhoneInvalid =>
      'Entrez un numéro de téléphone de destinataire valide.';

  @override
  String get composeLatInvalid =>
      'La latitude doit être comprise entre -90 et +90.';

  @override
  String get composeLngInvalid =>
      'La longitude doit être comprise entre -180 et +180.';

  @override
  String get composeVcardNameEmpty =>
      'Le nom du contact ne peut pas être vide.';

  @override
  String get composeVcardNameTooLong =>
      'Nom du contact trop long (200 caractères max).';

  @override
  String get composeVcardEmailInvalid => 'Entrez une adresse e-mail valide.';

  @override
  String get composeVcardPhoneInvalid =>
      'Entrez un numéro de téléphone valide.';

  @override
  String get composeVcardUrlInvalid =>
      'Entrez une adresse web valide (ex: https://...).';

  @override
  String get composeCalSummaryEmpty =>
      'Le titre de l\'événement ne peut pas être vide.';

  @override
  String get composeCalSummaryTooLong =>
      'Titre de l\'événement trop long (250 caractères max).';

  @override
  String get composeCalDateInvalid =>
      'L\'heure de fin doit être postérieure à l\'heure de début.';

  @override
  String get composeSpUriInvalid =>
      'Entrez une URL cible valide (ex: https://...).';

  @override
  String get composeSpLangInvalid =>
      'Entrez un code de langue ISO valide (ex: fr, en).';

  @override
  String get composeMimeTypeInvalid =>
      'Entrez un type MIME valide (ex: application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'Entrez une chaîne hexadécimale valide (nombre pair de caractères hex).';

  @override
  String get composeMimePayloadTooLarge =>
      'Taille de charge utile trop grande (10 Ko max).';

  @override
  String get composeWifiSsidEmpty =>
      'Le nom du réseau (SSID) ne peut pas être vide.';

  @override
  String get composeWifiPasswordRequired =>
      'Le mot de passe Wi-Fi est requis pour les réseaux chiffrés.';

  @override
  String get composeWifiPasswordLength =>
      'Le mot de passe WPA/WPA2 doit comporter entre 8 et 63 caractères.';

  @override
  String get composeEditNdefRecord => 'Modifier l\'enregistrement NDEF';

  @override
  String get composeNewNdefRecord => 'Créer un enregistrement NDEF';

  @override
  String get quickLinksHeader => 'Raccourcis rapides';

  @override
  String get quickLinkCustomUri => 'URI personnalisé';

  @override
  String get quickLinkSocial => 'Réseaux sociaux';

  @override
  String get quickLinkVideo => 'Vidéo';

  @override
  String get quickLinkSearch => 'Recherche';

  @override
  String get quickLinkFile => 'Fichier';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime Audio';

  @override
  String get quickLinkAddress => 'Adresse';

  @override
  String get quickLinkPayment => 'Lien de paiement';

  @override
  String get quickLinkApp => 'Application (Android)';

  @override
  String get updateRecord => 'Mettre à jour l\'enregistrement';

  @override
  String get addToList => 'Ajouter à la liste';

  @override
  String get quickCustomUriError =>
      'Entrez une adresse avec schéma (ex: spotify:track:... ou myapp://page).';

  @override
  String get quickFileEmptyMessage => 'Entrez le lien du fichier.';

  @override
  String get quickPaymentEmptyMessage => 'Entrez le lien de paiement.';

  @override
  String get quickCustomUriDesc =>
      'Toute adresse avec un schéma est acceptée; le téléphone ouvre l\'application compatible.';

  @override
  String get quickSocialLabel => 'Réseau social';

  @override
  String get quickVideoLabel => 'Lien vidéo';

  @override
  String get quickVideoHint => 'https://youtu.be/... ou ID de la vidéo';

  @override
  String get quickVideoDesc =>
      'Lien YouTube, Vimeo, etc. ou simplement l\'identifiant de la vidéo.';

  @override
  String get quickSearchHint => 'ex: Météo Paris';

  @override
  String get quickFileLabel => 'Lien du fichier';

  @override
  String get quickFileDesc =>
      'En raison de la faible capacité du tag, le lien web est enregistré au lieu du fichier lui-même.';

  @override
  String get quickPhoneOrAppleId => 'Téléphone ou identifiant Apple';

  @override
  String get quickFacetimeVideoDesc =>
      'Un iPhone scannant le tag lance un appel vidéo FaceTime.';

  @override
  String get quickFacetimeAudioDesc =>
      'Un iPhone scannant le tag lance un appel audio FaceTime uniquement.';

  @override
  String get quickMapProvider => 'Application de carte';

  @override
  String get quickAddressHint => 'ex: Champs-Élysées, Paris';

  @override
  String get quickPaymentDesc =>
      'Des liens de paiement (PayPal.me, Stripe, etc.) peuvent être utilisés. Les données de carte ne sont jamais écrites.';

  @override
  String get quickAppDesc =>
      'Les téléphones Android ouvrent cette application (ou le Play Store). L\'iPhone ignore ce type; ajoutez le lien App Store en URL pour iPhone.';

  @override
  String get quickDeviceNameOptional => 'Nom de l\'appareil (facultatif)';

  @override
  String get quickSpeakerHint => 'ex: Haut-parleur';

  @override
  String get quickBluetoothDesc =>
      'Les téléphones Android proposent le jumelage avec cet appareil. L\'iPhone ne prend pas en charge les tags de jumelage Bluetooth.';

  @override
  String get composeTextContent => 'Contenu textuel';

  @override
  String get composeTextHint => 'Entrez le texte que vous souhaitez écrire';

  @override
  String get composeEmailSubjectOptional => 'Objet (facultatif)';

  @override
  String get composeEmailBodyOptional => 'Corps du message (facultatif)';

  @override
  String get composeSmsRecipient => 'Numéro de téléphone du destinataire';

  @override
  String get composeSmsHint => 'Message SMS à envoyer...';

  @override
  String get composeVcardFullName => 'Nom complet (nom d\'affichage) *';

  @override
  String get composeVcardNameHint => 'Jean Dupont';

  @override
  String get composeVcardNote => 'Note / Description';

  @override
  String get composeCalTitle => 'Titre de l\'événement *';

  @override
  String get composeCalTitleHint => 'Réunion de projet';

  @override
  String get composeCalLocationHint => 'Salle de réunion 2 ou en ligne';

  @override
  String get composeCalDesc => 'Description de l\'événement';

  @override
  String get composeCalStartEndTime => 'Heure de début et de fin :';

  @override
  String get composeSpTitleLabel => 'Titre (texte affiché)';

  @override
  String get composeSpTitleHint => 'Brochure d\'entreprise';

  @override
  String get composeMimeTypeLabel => 'Type MIME *';

  @override
  String get composeDataFormat => 'Format des données : ';

  @override
  String get composeFormatHex => 'Hexadécimal';

  @override
  String get composeMimeHexBytes => 'Octets hexadécimaux *';

  @override
  String get composeMimeTextPayload => 'Texte de charge utile (UTF-8) *';

  @override
  String get composeWifiWarningTitle =>
      'Avertissement sécurité et plateforme :';

  @override
  String get composeWifiWarningBody =>
      '• Le mot de passe Wi-Fi est stocké en texte clair sur le tag et peut être lu par quiconque.\n• La connexion automatique n\'est pas garantie; une confirmation peut être requise selon l\'appareil.';

  @override
  String get composeWifiSsidLabel => 'Nom du réseau (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'Type de sécurité (authentification)';

  @override
  String get composeWifiOpenNetwork => 'Réseau ouvert (aucun)';

  @override
  String get composeWifiPasswordLabel => 'Mot de passe Wi-Fi *';

  @override
  String get composeWifiEncryptionLabel => 'Type de chiffrement';

  @override
  String get composeWifiAesRecommended => 'AES (recommandé)';

  @override
  String get quickSearchTextLabel => 'Texte à rechercher';

  @override
  String get readTagMemoryPrompt => 'Approchez le tag pour lire la mémoire';

  @override
  String get readingTagMemoryStatus => 'Lecture de la mémoire...';

  @override
  String get formatTagConfirmTitle => 'Formater la mémoire';

  @override
  String get formatTagConfirmMessage =>
      'Les données du tag seront effacées et préparées en NDEF vierge. Continuer ?';

  @override
  String get formatButton => 'Formater';

  @override
  String get formatTagPrompt => 'Approchez le tag à formater';

  @override
  String get formattingStatus => 'Formatage en cours...';

  @override
  String filePickerFailed(String error) {
    return 'Échec du sélecteur de fichier : $error';
  }

  @override
  String get writeButton => 'Écrire';

  @override
  String get writeDumpPrompt => 'Approchez le tag pour écrire le dump';

  @override
  String get writingDumpStatus => 'Écriture du dump...';

  @override
  String get setPasswordWarning =>
      'Si vous oubliez le mot de passe, vous ne pourrez plus modifier le contenu. La lecture reste publique.';

  @override
  String get setPasswordAction => 'Définir le mot de passe';

  @override
  String get setPasswordPrompt =>
      'Approchez le tag pour définir le mot de passe';

  @override
  String get settingPasswordStatus => 'Configuration du mot de passe...';

  @override
  String get removePasswordPromptMessage =>
      'Entrez le mot de passe précédemment défini sur le tag.';

  @override
  String get remove => 'Supprimer';

  @override
  String get removePasswordPrompt =>
      'Approchez le tag pour supprimer le mot de passe';

  @override
  String get removingPasswordStatus => 'Suppression du mot de passe...';

  @override
  String get sendCommandsPrompt =>
      'Approchez le tag pour envoyer les commandes';

  @override
  String get sendingCommandsStatus => 'Envoi des commandes...';

  @override
  String get sendButton => 'Envoyer';

  @override
  String get tagNoteEditTitle => 'Modifier la note du tag';

  @override
  String get tagNoteInputLabel => 'Note / Description dans l\'application';

  @override
  String get tagNoteInputHint => 'ex: Info salle de réunion ou Étagère #12';

  @override
  String get tagNoteDeleteTitle => 'Supprimer la note du tag';

  @override
  String get clearAllTagRulesTitle => 'Supprimer toutes les notes';

  @override
  String get clearAllTagRulesConfirm =>
      'Toutes les notes de tag enregistrées seront supprimées. Confirmez-vous ?';

  @override
  String get deleteAll => 'Tout supprimer';

  @override
  String get tagRulesExplanation =>
      'Seule la note enregistrée s\'affiche pour les tags correspondant au digest SHA-256 du NDEF.';

  @override
  String get noTagRulesDefined => 'Aucune note de tag définie pour le moment.';

  @override
  String lastUpdated(String time) {
    return 'Dernière mise à jour : $time';
  }

  @override
  String get tagLibraryNoMatch => 'Aucun tag ne correspond à votre recherche.';

  @override
  String get tagLibraryAddToLibrary => 'Ajouter à la bibliothèque';

  @override
  String get name => 'Nom';

  @override
  String get tagLibraryAddTag => 'Ajouter un tag';

  @override
  String get all => 'Tous';

  @override
  String tagLibraryPhotoError(String error) {
    return 'Échec de la sélection de la photo : $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'Supprimer le tag';

  @override
  String get tagLibraryNameHint => 'ex: Porte-clés du bureau';

  @override
  String get tagLibraryNoTagContent =>
      'Aucun contenu de tag dans cet enregistrement.';

  @override
  String get tagLibrarySourceLastScanned => 'Dernier scan';

  @override
  String get tagLibraryEmpty => 'Aucun tag enregistré pour le moment.';

  @override
  String get tagLibrarySourceEmpty => 'Enregistrement vide';

  @override
  String get tagLibraryNamePrompt => 'Veuillez entrer un nom de tag';

  @override
  String get tagLibrarySearchHint => 'Rechercher par nom, catégorie ou lieu...';

  @override
  String get tagLibrarySourceWriteList => 'Liste d\'écriture';

  @override
  String get tagLibraryLocationHint => 'ex: Bureau, Porte d\'entrée';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return 'Voulez-vous vraiment supprimer le tag \"$name\" de la bibliothèque ?';
  }

  @override
  String get noContent => 'Aucun contenu';

  @override
  String tagLibraryRecordSummary(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count enregistrements NDEF',
      one: '1 enregistrement NDEF',
    );
    return '$_temp0';
  }

  @override
  String get tagLibraryEditTag => 'Modifier le tag';

  @override
  String get rawTypeHexHint => '41 (A) ou 55 (U) etc.';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context : Le champ \"records\" doit être une liste.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context : Un élément peut contenir au maximum $max enregistrements NDEF.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - L\'enregistrement #$index n\'est pas un objet valide.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - Enregistrement #$index : Valeur TNF non valide ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - Enregistrement #$index : \"type\" doit être une chaîne Base64.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - Enregistrement #$index : \"type\" n\'est pas une donnée Base64 valide ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - Enregistrement #$index : \"id\" doit être une chaîne Base64.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - Enregistrement #$index : \"id\" n\'est pas une donnée Base64 valide ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - Enregistrement #$index : \"payload\" doit être une chaîne Base64.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - Enregistrement #$index : \"payload\" n\'est pas une donnée Base64 valide ($error).';
  }

  @override
  String get composerUndoSnack => 'Dernière modification annulée.';

  @override
  String get composerRedoSnack => 'Modification rétablie.';

  @override
  String get noRecordsToCopy => 'Aucun enregistrement NDEF à copier.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count enregistrements NDEF ($bytes o) copiés dans le presse-papiers.\n(Seul le contenu NDEF est copié ; l\'UID ou secteurs chiffrés ne sont jamais clonés)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source : $count enregistrements ajoutés.';
  }

  @override
  String get tagEmptyNoRecordsToImport =>
      'Le tag est vide ; aucun enregistrement à importer.';

  @override
  String get sourceTag => 'Du tag';

  @override
  String get sourceQr => 'Du code QR';

  @override
  String filePickerError(String error) {
    return 'Impossible d\'ouvrir le sélecteur : $error';
  }

  @override
  String get csvFileTooLarge => 'Fichier CSV trop volumineux (512 Ko max).';

  @override
  String get noRecordsFound => 'Aucun enregistrement trouvé';

  @override
  String get someRowsSkipped => 'Certaines lignes ignorées';

  @override
  String get expectedFormat => 'Format attendu :';

  @override
  String get noClipboardContent =>
      'Aucun contenu NDEF copié dans le presse-papiers.';

  @override
  String get pasteFromClipboardTitle => 'Coller depuis le presse-papiers NDEF';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'Données du presse-papiers : $count enregistrements, $bytes octets ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      'Voulez-vous remplacer les enregistrements actuels ou les ajouter à la fin ?';

  @override
  String get pasteOverwriteOption => 'Écraser (Remplacer)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'Les $count enregistrements actuels seront remplacés par le presse-papiers (confirmation requise).';
  }

  @override
  String get pasteEmptySubtitle => 'Le contenu du presse-papiers est inséré.';

  @override
  String get pasteAppendOption => 'Ajouter à la fin';

  @override
  String get pasteAppendSubtitle =>
      'Les enregistrements actuels sont conservés ; les nouveaux sont ajoutés à la fin.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count enregistrements ajoutés.';
  }

  @override
  String get confirmOverwriteTitle => 'Écraser les enregistrements ?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'Il y a $currentCount enregistrements. Ils seront remplacés par les $newCount du presse-papiers. Continuer ?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'Enregistrements remplacés par $count nouveaux.';
  }

  @override
  String get yesReplace => 'Oui, remplacer';

  @override
  String recordsImportedToComposer(num count) {
    return '$count enregistrements importés.';
  }

  @override
  String get noContentToCopy => 'Aucun contenu NDEF trouvé à copier.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count enregistrements NDEF copiés et ajoutés (Contenu copié, UID non cloné).';
  }

  @override
  String get noContentToRewrite => 'Aucun contenu NDEF trouvé à réécrire.';

  @override
  String get rewriteTagTitle => 'Réécrire le tag';

  @override
  String get importantNotice => 'AVIS IMPORTANT :';

  @override
  String get rewriteNotice1 =>
      '• Cette opération ÉCRASE COMPLÈTEMENT le contenu NDEF existant ; elle ne l\'ajoute pas.\n';

  @override
  String get rewriteNotice2 =>
      '• Le tag cible doit être un tag NDEF inscriptible (déverrouillé).\n';

  @override
  String get rewriteNotice3 =>
      '• N\'écrit pas silencieusement sur le tag précédent ; un nouveau scan NFC est requis.';

  @override
  String get rewriteInstruction =>
      'Préparez le tag cible, appuyez sur \"Toucher et écrire\", puis approchez le tag.';

  @override
  String get tapAndWrite => 'Toucher et écrire';

  @override
  String get rewritePromptMessage =>
      'Approchez le tag cible (le contenu sera totalement renouvelé)';

  @override
  String get writeVerifiedTitle => 'Écriture vérifiée';

  @override
  String get writeVerifiedDesc =>
      'Contenu NDEF écrit et vérifié avec succès sur le tag cible.';

  @override
  String get writeVerifiedHint =>
      'Vous pouvez lancer le prochain scan pour vérifier ou comparer les données.';

  @override
  String get scanAndCompareNow => 'Scanner et comparer maintenant';

  @override
  String get contentMatchesExactly => 'Le contenu correspond exactement';

  @override
  String get differenceDetected => 'Différence détectée';

  @override
  String get compareMatchDesc =>
      'Le message NDEF du tag cible correspond octet par octet au message source.';

  @override
  String get compareDiffDesc =>
      'Différence entre données lues et prévues. Vérifiez si le tag est verrouillé ou différent.';

  @override
  String get batchEmptyComposerError =>
      'Ajoutez au moins un enregistrement avant de lancer l\'écriture par lot.';

  @override
  String get batchWriteTitle => 'Écriture de tags par lot';

  @override
  String get batchWriteSubtitle =>
      'Écrivez le même contenu NDEF sur plusieurs tags à la suite.';

  @override
  String get attention => 'ATTENTION :';

  @override
  String get batchNotice1 =>
      '• Pour éviter les doublons accidentels, chaque écriture doit être déclenchée via \"Écrire le suivant\".\n';

  @override
  String get batchNotice2 =>
      '• Aucun scan automatique en continu ; chaque tag doit être changé physiquement.';

  @override
  String get batchStartButton => 'Démarrer l\'écriture par lot';

  @override
  String get batchControlPanelTitle =>
      'Panneau de contrôle de l\'écriture par lot';

  @override
  String get batchCancelOrClose => 'Annuler / Fermer';

  @override
  String get batchAllCompleted =>
      'Toutes les tentatives de tag sont terminées !';

  @override
  String batchStats(String ok, String failed, String left) {
    return 'Réussis : $ok | Échecs : $failed | Restants : $left';
  }

  @override
  String get waitingForTag => 'En attente du tag...';

  @override
  String get batchFinishButton => 'Terminer l\'écriture par lot';

  @override
  String get writeError => 'Erreur d\'écriture';

  @override
  String get batchConfirmCancelTitle => 'Annuler l\'écriture par lot';

  @override
  String get batchConfirmCancelMessage =>
      'Mettre fin à la session par lot ? Les tags déjà écrits sont conservés ; les restants ne seront pas écrits.';

  @override
  String get cancelled => 'Annulé';

  @override
  String get batchCancelledSnack =>
      'Écriture par lot annulée. Votre contenu a été conservé.';

  @override
  String get cancelAndClose => 'Annuler et fermer';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'Analyse d\'URL hors ligne';

  @override
  String get urlSafetyScheme => 'Schéma (Protocole) :';

  @override
  String get urlSafetyPort => 'Port :';

  @override
  String get urlSafetyUserInfoLabel => 'Info utilisateur :';

  @override
  String get urlSafetyIpLiteral => 'Adresse IP directe :';

  @override
  String get urlSafetyDomain => 'Non (Nom de domaine)';

  @override
  String get urlSafetyPunycodeLabel => 'International / Punycode (xn--) :';

  @override
  String get urlSafetyHomoglyphRisk => 'Oui (Homoglyphe suspecté)';

  @override
  String get urlSafetyWarningsHeader => 'Avertissements de sécurité :';

  @override
  String get urlSafetyDisclaimer =>
      'NOTE : Analyse hors ligne. Ne remplace pas un antivirus en ligne. L\'URL ne s\'ouvre pas automatiquement.';

  @override
  String get templateSaveEmptyError =>
      'Ajoutez des enregistrements avant d\'enregistrer comme modèle.';

  @override
  String templateDefaultName(String n) {
    return 'Modèle $n';
  }

  @override
  String get templateNameSample => 'ex: Site web d\'entreprise & Contact';

  @override
  String get templateSavedSnack => 'Modèle enregistré.';

  @override
  String get ruleNoteRequiresNdef =>
      'Le tag doit contenir au moins un enregistrement NDEF pour ajouter une note.';

  @override
  String get ruleNoteAddTitle => 'Ajouter une note personnalisée';

  @override
  String get ruleNoteDigestExplanation =>
      'Liée au digest SHA-256 du NDEF. N\'affiche que cette description ; aucune action externe.';

  @override
  String get ruleNoteSavedSnack => 'Note de tag enregistrée.';

  @override
  String get ruleNoteDeleteConfirm =>
      'La note pour ce tag sera supprimée. Continuer ?';

  @override
  String get ruleNoteDeletedSnack => 'Note de tag supprimée.';

  @override
  String get backupExportTitle => 'Exporter la sauvegarde';

  @override
  String get backupExportWarningTitle =>
      'AVERTISSEMENT DE CONFIDENTIALITÉ ET SÉCURITÉ';

  @override
  String get backupExportWarningBody =>
      'Le fichier de sauvegarde (JSON) est en texte brut. Il peut contenir des mots de passe Wi-Fi ou vCards. Conservez-le en lieu sûr.';

  @override
  String get backupIncludedItems => 'Éléments à inclure :';

  @override
  String backupTemplatesCount(String count) {
    return '• Modèles : $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• Notes/règles de tags : $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Inclure l\'historique des scans (facultatif)';

  @override
  String backupHistoryCount(String count) {
    return '$count entrées d\'historique';
  }

  @override
  String get backupHistoryDisabled =>
      'L\'historique des scans est désactivé sur cet appareil';

  @override
  String get backupExportAndShare => 'Exporter et partager';

  @override
  String get backupFileNameLabel => 'Fichier de sauvegarde NFC Tag Master';

  @override
  String get backupFileShareSubject =>
      'Sauvegarde des modèles et données NFC Tag Master (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'Fichier de sauvegarde exporté et partagé avec succès.';

  @override
  String get backupExportCancelled => 'Partage de l\'exportation annulé.';

  @override
  String get backupImportTitle => 'Importer la sauvegarde';

  @override
  String get backupMergeRuleTitle => 'RÈGLE DE SÉCURITÉ ET DE FUSION';

  @override
  String get backupMergeRule1 =>
      '• L\'importation FUSIONNE les données ; vos enregistrements ne sont JAMAIS supprimés.\n';

  @override
  String get backupMergeRule2 =>
      '• Peut contenir des mots de passe Wi-Fi ou données privées ; n\'importez que des fichiers sûrs.\n';

  @override
  String get backupMergeRule3 =>
      '• Taille limite : 2 Mo. Données soumises à une stricte validation de schéma et Base64.';

  @override
  String get backupSelectFilePrompt =>
      'Sélectionnez un fichier .json valide à fusionner.';

  @override
  String get selectFileButton => 'Choisir le fichier';

  @override
  String get fileSelectionCancelled => 'Sélection du fichier annulée.';

  @override
  String get backupFileExceedsLimit =>
      'Le fichier sélectionné dépasse la limite autorisée de 2 Mo.';

  @override
  String fileReadError(String error) {
    return 'Erreur de lecture : $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Erreur de validation : $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Historique des scans détecté';

  @override
  String get backupHistoryDetectedPrompt =>
      'Voulez-vous importer et activer l\'historique ? Ou n\'importer que les modèles et notes ?';

  @override
  String get backupSkipHistoryOption =>
      'Ignorer l\'historique (charger modèles et notes uniquement)';

  @override
  String get backupEnableHistoryOption => 'Activer l\'historique et charger';

  @override
  String get nfcReadyStatus => 'NFC prêt';

  @override
  String get nfcReadyDesc => 'Matériel NFC actif et prêt à l\'emploi';

  @override
  String get nfcDisabledStatus => 'NFC désactivé';

  @override
  String get nfcDisabledDesc =>
      'Le NFC est désactivé. Veuillez l\'activer dans les paramètres.';

  @override
  String get template => 'Modèle';

  @override
  String get nfcScannerTitle => 'Scanner NFC';

  @override
  String get composeRecord => 'Créer un enregistrement';

  @override
  String get protectOrRemove => 'Protéger / supprimer';

  @override
  String get previousScans => 'Scans précédents';

  @override
  String get noScannedTagYet => 'Aucun tag NFC scanné pour le moment';

  @override
  String get tapScanPrompt =>
      'Appuyez sur \"Démarrer le scan\" et approchez le tag du téléphone.';

  @override
  String get ndefCopyAndRewriteTitle => 'Copie et réécriture de contenu NDEF';

  @override
  String get savedTagNoteHeader => 'Note de tag enregistrée (règle intégrée)';

  @override
  String get tagNoteOrRule => 'Note / règle de tag';

  @override
  String get editNote => 'Modifier la note';

  @override
  String get deleteNote => 'Supprimer la note';

  @override
  String get tagNoteDigestNotice =>
      'Correspond au digest SHA-256 des octets NDEF exacts. Ne déclenche aucune action externe.';

  @override
  String get addCustomTagNotePrompt =>
      'Vous pouvez ajouter une note locale pour ce contenu NDEF.';

  @override
  String get addNoteToThisTag => 'Ajouter une note à ce tag';

  @override
  String get ndefSupport => 'Prise en charge NDEF :';

  @override
  String get usedSpace => 'Espace utilisé :';

  @override
  String get freeSpace => 'Espace libre :';

  @override
  String get noNdefMessageOnTag => 'Aucun message NDEF trouvé sur le tag.';

  @override
  String get hideDetails => 'Masquer les détails';

  @override
  String get advancedRecordInspector =>
      'Inspecteur d\'enregistrements (Avancé)';

  @override
  String get ndefRecordInspectorTitle => 'Inspecteur de record NDEF (Avancé)';

  @override
  String get inspectorType => 'Type :';

  @override
  String get inspectorPayloadLength => 'Longueur de la charge utile :';

  @override
  String get inspectorRawHexPreview => 'Aperçu hexadécimal brut (limité) :';

  @override
  String get ndefRecordsToWriteTitle => 'Enregistrements NDEF à écrire';

  @override
  String get pasteFromClipboardAction =>
      'Coller depuis le presse-papiers (Remplacer / Ajouter)';

  @override
  String get importAction => 'Importer';

  @override
  String get importFromTagAction => 'Importer depuis un tag NFC';

  @override
  String get importFromQrAction => 'Importer depuis un code QR';

  @override
  String get importFromCsvAction => 'Importer depuis un fichier CSV';

  @override
  String get composerEmptyDescription =>
      'Vous pouvez écrire du texte, des liens web, Wi-Fi, téléphone, e-mail, cartes de contact, etc.';

  @override
  String get urlSafetyReview => 'Examen d\'URL';

  @override
  String get inspector => 'Inspecteur';

  @override
  String get typeLabel => 'Type :';

  @override
  String get payloadLabel => 'Charge utile :';

  @override
  String get writeAndVerify => 'Écrire sur le tag et vérifier';

  @override
  String get batchWriteButtonLabel => 'Écriture par lot (2..100 tags)';

  @override
  String get clearTagButtonLabel => 'Réinitialiser le tag (effacer le contenu)';

  @override
  String get confirmWriteTitle => 'Confirmer l\'écriture sur le tag';

  @override
  String get confirmWriteMessage1 =>
      'Cette opération ÉCRASE COMPLÈTEMENT le contenu NDEF existant sur le tag.';

  @override
  String get confirmWriteMessage2 =>
      'Vérifiez que le tag est inscriptible. Le contenu sera vérifié automatiquement.';

  @override
  String get yesWrite => 'Oui, écrire';

  @override
  String get scanHistoryDisabledTitle => 'Historique des scans désactivé';

  @override
  String get scanHistoryDisabledDesc =>
      'Par confidentialité, l\'historique n\'est pas enregistré. Activez-le dans les paramètres.';

  @override
  String get enableHistory => 'Activer l\'historique';

  @override
  String get historySearchHint =>
      'Rechercher par UID, texte ou type (ex: URL, Wi-Fi, 04A1...)';

  @override
  String get noHistoryYet =>
      'Aucun historique de scan enregistré pour le moment.';

  @override
  String get tryDifferentQuery =>
      'Essayez un UID, un contenu de texte ou un type différent.';

  @override
  String get clearSearch => 'Effacer la recherche';

  @override
  String get deleteThisRecord => 'Supprimer cet enregistrement';

  @override
  String get qrPreview => 'Aperçu QR';

  @override
  String get lockTagConfirmTitle => 'Verrouiller définitivement le tag';

  @override
  String get lockTagWarning2 =>
      'Assurez-vous d\'avoir d\'abord écrit le bon contenu.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'Aperçu du code QR';

  @override
  String get unknownParentheses => '(Inconnu)';

  @override
  String get ok => 'OK';

  @override
  String rewriteSourceUid(String uid) {
    return 'UID source : $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return 'Enregistrements à écrire : $count';
  }

  @override
  String rewriteFailed(String message) {
    return 'Réécriture échouée : $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return 'Enregistrements écrits : $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'UID du tag scanné : $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return 'Données écrites : $count enregistrements ($bytes octets)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'Données scannées : $count enregistrements ($bytes octets)';
  }

  @override
  String batchTargetCount(String count) {
    return 'Tags cibles : $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return 'Liste d\'écriture : $count enregistrements ($bytes octets)';
  }

  @override
  String batchNext(String current, String total) {
    return 'Suivant : tag n°$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return 'Réussi ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return 'Échec : $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'Tag n°$n : ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'Toucher et écrire le tag n°$n';
  }

  @override
  String batchPrompt(String current, String total) {
    return 'Écriture en lot : approchez le tag n°$current / $total';
  }

  @override
  String batchWrittenVerified(String count) {
    return '$count enregistrements écrits et vérifiés';
  }

  @override
  String templateLoaded(String name) {
    return 'Les enregistrements de « $name » ont été ajoutés à la liste.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'Empreinte du contenu NDEF (SHA-256) :\n$sha';
  }

  @override
  String exportError(String error) {
    return 'Erreur d\'export : $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'La sauvegarde contient $count entrées d\'historique, mais l\'historique est désactivé ici.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'Import réussi :\n$summary';
  }

  @override
  String mergeError(String error) {
    return 'Erreur de fusion : $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'Presse-papiers NDEF : $count enr. ($bytes o) - $source';
  }

  @override
  String get heroScanSubtitle =>
      'Approchez le tag du haut du téléphone ; contenu, capacité et numéro de série s\'affichent aussitôt.';

  @override
  String lastTagLabel(String uid) {
    return 'Dernier tag : $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'Erreur de lecture : $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count enr. ($bytes octets) - seules les données NDEF sont copiées, pas l\'UID.';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'Tag $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'Erreur : $message';
  }

  @override
  String readRecordsHeader(String count) {
    return 'Enregistrements NDEF lus ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return 'Enregistrements NDEF à écrire ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return 'Remarque : la charge fait $bytes octets, seuls les 64 premiers sont affichés.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return 'Taille totale : $bytes octets | Enregistrements : $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return 'Écrire et vérifier ($bytes octets)';
  }

  @override
  String savedScansCount(String count) {
    return 'Lectures enregistrées : $count';
  }

  @override
  String historyNoResults(String query) {
    return 'Aucun résultat pour « $query ».';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count enr.';
  }

  @override
  String historyCapacity(String max, String used) {
    return 'Capacité : $max o | Utilisé : $used o';
  }

  @override
  String historySourceLabel(String uid) {
    return 'Historique UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count enr. | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return 'Règles/notes enregistrées : $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return 'Octets écrits : $bytes | Vérification : $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'Un tag verrouillé passe en lecture seule : son contenu ne pourra JAMAIS être modifié ni effacé, et le verrou est DÉFINITIF. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'Taille du message : $bytes octets';
  }

  @override
  String bytesShort(String bytes) {
    return 'Octets : $bytes o';
  }

  @override
  String bytesValue(String bytes) {
    return '$bytes octets';
  }

  @override
  String bytesOfCapacity(String bytes, String max) {
    return '$bytes / $max octets';
  }

  @override
  String get valueNone => 'Aucun';

  @override
  String get valueYesIp => 'Oui (adresse IP)';

  @override
  String get nfcMissingShort => 'Pas de NFC';

  @override
  String get clearClipboard => 'Vider le presse-papiers';

  @override
  String get statLibrary => 'Bibliothèque';

  @override
  String get scanTagTitle => 'Scanner un tag';

  @override
  String get readingInProgress => 'Lecture...';

  @override
  String get rawMemorySubtitle => 'Mémoire brute';

  @override
  String get copyToClipboard => 'Copier';

  @override
  String get serialUidLabel => 'N° de série (UID) :';

  @override
  String get totalCapacityLabel => 'Capacité totale :';

  @override
  String get technologiesLabel => 'Technologies :';

  @override
  String get idLabel => 'Identifiant (ID) :';

  @override
  String get undoTooltip => 'Annuler';

  @override
  String get clearComposer => 'Vider la liste';

  @override
  String composerTotalSize(String bytes) {
    return 'Taille totale : $bytes octets';
  }

  @override
  String get yesClear => 'Oui, effacer';

  @override
  String get ssidTooLong => 'Le SSID ne peut dépasser 32 octets.';

  @override
  String get locationPlace => 'Lieu';

  @override
  String get targetWebUrl => 'URL cible *';

  @override
  String get languageCodeLabel => 'Code langue (ISO 639-1) *';

  @override
  String get utf8Text => 'Texte UTF-8';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF : $tnf, taille : $bytes octets';
  }

  @override
  String get quickGallerySubtitle => 'Prêt en un geste';

  @override
  String get quickLibraryTitle => 'Mes tags';

  @override
  String get quickLibrarySubtitle => 'Tags enregistrés';

  @override
  String get saveToLibrary => 'Enregistrer dans la bibliothèque';

  @override
  String libraryMatch(String name) {
    return 'Dans la bibliothèque : $name';
  }

  @override
  String tagChipLabel(String chip) {
    return 'Puce : $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return 'Fabricant : $name';
  }

  @override
  String get settingsLibrarySubtitle => 'Vos tags avec noms, notes et photos';

  @override
  String get showOnboardingAgain => 'Revoir la présentation';

  @override
  String get importFromGallery => 'Ajouter depuis les modèles';

  @override
  String get appearanceTitle => 'Apparence';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get valuePresentRisky => 'Présent (peut être risqué)';

  @override
  String get supportedValue => 'Pris en charge';

  @override
  String get notSupportedValue => 'Non pris en charge';

  @override
  String get nfcUnsupportedDesc =>
      'Le NFC n\'est pas pris en charge sur cet appareil';

  @override
  String get ndefTrailingData => 'Données en trop après le message NDEF';

  @override
  String get ndefMissingEnd => 'Fin du message NDEF manquante';

  @override
  String vcardPhoneShort(String value) {
    return 'Tél. : $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'E-mail : $value';
  }

  @override
  String vcardOrgShort(String value) {
    return 'Société : $value';
  }

  @override
  String get pageUidLock => 'UID / Verrou';

  @override
  String get pageData => 'Données';

  @override
  String get pageLock => 'Verrou';

  @override
  String memoryPageLine(String page) {
    return 'Page $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (téléphone)';

  @override
  String get mapApple => 'Plans d\'Apple';

  @override
  String get mapGoogle => 'Google Maps';

  @override
  String get whatsappMessageHint => 'Bonjour, je voudrais des informations';

  @override
  String get facetimeTargetHint => '+33612345678 ou nom@icloud.com';

  @override
  String get bluetoothMacLabel => 'Adresse MAC Bluetooth';

  @override
  String get webAddressUrlLabel => 'Adresse web (URL)';

  @override
  String get latitudeLabel => 'Latitude (Lat)';

  @override
  String get longitudeLabel => 'Longitude (Lng)';

  @override
  String get emailAddressLabel => 'Adresse e-mail';

  @override
  String get websiteLabel => 'Site web';

  @override
  String get wifiAuthWpa2Home => 'WPA2 Personnel (standard maison/bureau)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 Personnel (mixte)';

  @override
  String get hostLabel => 'Hôte :';

  @override
  String get readOnlyLocked => 'Lecture seule (verrouillé)';

  @override
  String get redoTooltip => 'Rétablir';

  @override
  String historyFoundCount(String found, String total) {
    return 'Trouvés : $found / $total';
  }

  @override
  String get addToWriteListShort => 'Ajouter à la liste';

  @override
  String get mimeTypeHint => 'application/json ou text/plain';

  @override
  String get hapticsToggle => 'Vibrations';

  @override
  String get hapticsToggleSubtitle =>
      'Courte vibration à la fin d\'une lecture ou écriture';

  @override
  String get soundsToggle => 'Sons';

  @override
  String get soundsToggleSubtitle => 'Jouer un court son système';

  @override
  String get backupLibraryMustBeList => 'La bibliothèque doit être une liste.';

  @override
  String get backupInvalidLibraryEntry => 'Entrée de bibliothèque invalide.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'La bibliothèque peut contenir au plus $max entrées.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'Bibliothèque : $added ajoutés';
  }

  @override
  String backupLibraryCount(String count) {
    return '• Bibliothèque : $count (sans photos)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return 'Dernier tag : $bytes / $max o';
  }

  @override
  String get contentTooLargeForChips =>
      'Trop volumineux pour les tags courants ; raccourcissez le texte ou utilisez un lien court.';

  @override
  String get tagReportTitle => 'Rapport du tag';

  @override
  String get tagReportSubtitle => 'Puce, verrous, mot de passe et usage';

  @override
  String get tagReportPrompt => 'Approchez le tag à analyser';

  @override
  String get tagReportBusy => 'Analyse du tag...';

  @override
  String tagReportDone(String chip) {
    return 'Rapport prêt : $chip';
  }

  @override
  String get unknownChip => 'Puce inconnue';

  @override
  String get yes => 'Oui';

  @override
  String get reportChip => 'Puce';

  @override
  String get reportNdefFormatted => 'Formaté NDEF';

  @override
  String get reportWritable => 'Inscriptible';

  @override
  String get reportStaticLock => 'Verrou statique';

  @override
  String get reportDynamicLock => 'Verrou dynamique';

  @override
  String get reportPassword => 'Protection par mot de passe';

  @override
  String get reportReadProtected => 'Lecture protégée';

  @override
  String get reportNdefUsage => 'Utilisation NDEF';

  @override
  String get reportVerdictWritable => 'Tag prêt pour l\'écriture';

  @override
  String get reportVerdictRestricted => 'Le tag a des restrictions';

  @override
  String get reportCopied => 'Rapport copié';

  @override
  String get compareTagsTitle => 'Comparer deux tags';

  @override
  String get compareTagsSubtitle =>
      'Vérifier qu\'une copie correspond à l\'original';

  @override
  String get compareStepFirst => 'Scannez d\'abord le premier tag (original).';

  @override
  String get compareStepSecond => 'Scannez maintenant le second tag.';

  @override
  String get compareIdentical => 'Contenus identiques';

  @override
  String get compareDifferent => 'Contenus différents';

  @override
  String get compareSameTag => 'Le même tag a été scanné deux fois.';

  @override
  String get compareDifferentTags => 'Deux tags différents.';

  @override
  String get compareRecordSame => 'Identique';

  @override
  String get compareRecordChanged => 'Différent';

  @override
  String get compareRecordOnlyFirst => 'Seulement sur A';

  @override
  String get compareRecordOnlySecond => 'Seulement sur B';

  @override
  String get compareBothEmpty => 'Les deux tags sont vides.';

  @override
  String capacityExceededShort(String needed, String max) {
    return 'Contenu trop volumineux : $needed / $max octets';
  }

  @override
  String get verifyFailedAfterWrite =>
      'Données écrites non vérifiées ; maintenez le tag plus longtemps.';

  @override
  String get blankTagTitle => 'Le tag n\'est pas encore prêt';

  @override
  String get blankTagBody =>
      'Ce tag est neuf et non formaté NDEF. L\'app peut le préparer et écrire le contenu en un seul geste (NTAG et MIFARE Ultralight).';

  @override
  String get blankTagAction => 'Préparer et écrire';

  @override
  String get shareTag => 'Partager';

  @override
  String get shareAsText => 'Partager en texte';

  @override
  String get shareAsFile => 'Partager en fichier (.json)';

  @override
  String get shareAsFileSubtitle =>
      'Les enregistrements peuvent être réécrits à l\'identique';

  @override
  String get importFromJsonFile => 'Depuis un fichier de tag (.json)';

  @override
  String get invalidTagFile => 'Fichier de tag invalide.';

  @override
  String get continuousScanTitle => 'Lecture continue';

  @override
  String get continuousScanSubtitle =>
      'Scannez les tags à la suite et partagez la liste en CSV';

  @override
  String continuousScanCount(String count) {
    return '$count tags lus';
  }

  @override
  String get exportCsv => 'Partager en CSV';

  @override
  String get clearList => 'Vider la liste';

  @override
  String get csvColumnTime => 'Heure';

  @override
  String get csvColumnRecords => 'Enregistrements';

  @override
  String get csvColumnContent => 'Contenu';

  @override
  String get csvColumnCapacity => 'Capacité (o)';

  @override
  String get csvColumnUsed => 'Utilisé (o)';

  @override
  String get batchSerialToggle => 'Ajouter des numéros de série';

  @override
  String batchSerialHint(String token) {
    return 'Mettez $token dans un enregistrement pour y placer le numéro ; sinon un enregistrement texte avec le numéro est ajouté à chaque tag.';
  }

  @override
  String get batchSerialPrefix => 'Préfixe';

  @override
  String get batchSerialStart => 'Début';

  @override
  String get batchSerialDigits => 'Chiffres';

  @override
  String batchSerialPreview(String first, String last) {
    return 'Premier : $first · Dernier : $last';
  }

  @override
  String get batchFromCsvButton => 'Depuis un fichier CSV (une ligne par tag)';

  @override
  String get batchCsvTitle => 'Écriture par lot depuis CSV';

  @override
  String batchCsvSummary(String count) {
    return '$count tags seront écrits. Chaque tag reçoit une ligne du fichier CSV, dans l\'ordre.';
  }

  @override
  String batchCsvTruncated(String max) {
    return 'L\'écriture par lot utilise au plus $max lignes ; le reste a été ignoré.';
  }

  @override
  String get cloneTagTitle => 'Cloner un tag';

  @override
  String get cloneTagSubtitle =>
      'Lire un tag et écrire son contenu sur d\'autres';

  @override
  String get cloneSourceStep =>
      'Étape 1 : scannez le tag source. Seul le contenu NDEF est copié ; l\'UID ne peut pas être cloné.';

  @override
  String get cloneSourceEmpty =>
      'Le tag source ne contient aucun enregistrement NDEF.';

  @override
  String get cloneReadyTitle => 'Source lue';

  @override
  String cloneReadySummary(String count, String bytes) {
    return '$count enregistrements ($bytes octets) seront copiés. Choisissez le nombre de tags.';
  }

  @override
  String get cloneEditFirst => 'Modifier d\'abord';

  @override
  String get tapPreviewTitle => 'Que se passe-t-il au contact ?';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'Le tag est vide ; rien ne se passe.';

  @override
  String tapIosUrl(String target) {
    return 'Une notification apparaît ; en la touchant, $target s\'ouvre dans Safari ou l\'app associée.';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target s\'ouvre directement dans le navigateur ou l\'app associée.';
  }

  @override
  String tapIosApp(String target) {
    return 'Une notification apparaît ; l\'app s\'ouvre via « $target » si elle est installée.';
  }

  @override
  String tapAndroidApp(String target) {
    return 'L\'app s\'ouvre via « $target » si elle est installée.';
  }

  @override
  String tapIosCall(String target) {
    return 'Une notification apparaît ; la toucher appelle $target.';
  }

  @override
  String tapAndroidCall(String target) {
    return 'L\'app Téléphone s\'ouvre avec $target.';
  }

  @override
  String tapIosSms(String target) {
    return 'Une notification apparaît ; Messages ouvre un nouveau message pour $target.';
  }

  @override
  String tapAndroidSms(String target) {
    return 'L\'app de messagerie s\'ouvre pour $target.';
  }

  @override
  String tapIosEmail(String target) {
    return 'Une notification apparaît ; Mail ouvre un nouvel e-mail pour $target.';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'L\'app e-mail s\'ouvre pour $target.';
  }

  @override
  String get tapIosMap =>
      'L\'iPhone n\'ouvre pas seul les positions « geo: ». Utilisez un lien Plans ou Google Maps (Liens rapides).';

  @override
  String get tapAndroidMap => 'L\'app de cartes s\'ouvre à cet endroit.';

  @override
  String get tapIosNeedsApp =>
      'L\'iPhone n\'en fait rien seul ; il faut le lire avec une app NFC.';

  @override
  String get tapAndroidText =>
      'Sur la plupart des téléphones rien ne se passe, ou le texte s\'affiche sur un écran système.';

  @override
  String get tapAndroidContact => 'Il propose d\'ajouter le contact.';

  @override
  String get tapAndroidWifi =>
      'Il propose de rejoindre le réseau (Android 10 et ultérieur).';

  @override
  String get tapAndroidCalendar =>
      'Si l\'app Calendrier le permet, elle propose d\'ajouter l\'événement.';

  @override
  String get tapAndroidOther =>
      'S\'ouvre seulement si une app compatible est installée.';

  @override
  String tapIgnoredRecords(String count) {
    return 'Les téléphones n\'exécutent que le premier enregistrement ; les $count autres sont visibles dans les apps NFC.';
  }

  @override
  String get tapIosRequirement =>
      'L\'iPhone XS et ultérieur lit en arrière-plan s\'il est déverrouillé et que Appareil photo/Cartes ne sont pas ouverts.';

  @override
  String get galleryCatBusiness => 'Pro';

  @override
  String get galleryCatSocial => 'Social';

  @override
  String get galleryCatHome => 'Maison';

  @override
  String get galleryCatPersonal => 'Personnel';

  @override
  String get galleryCatAutomation => 'Automatisation';

  @override
  String get galleryFavorites => 'Favoris';

  @override
  String get gallerySearchHint => 'Rechercher un modèle...';

  @override
  String get galleryNoResults => 'Aucun modèle correspondant.';

  @override
  String get galleryAddFavorite => 'Ajouter aux favoris';

  @override
  String get galleryRemoveFavorite => 'Retirer des favoris';

  @override
  String get presetEventTitle => 'Invitation à un événement';

  @override
  String get presetEventDesc =>
      'Écrit l\'événement au format iCalendar ; Android peut l\'ajouter au calendrier.';

  @override
  String get eventNameLabel => 'Nom de l\'événement';

  @override
  String get eventDateLabel => 'Date (AAAA-MM-JJ)';

  @override
  String get eventTimeLabel => 'Heure (HH:MM)';

  @override
  String get eventDateTimeInvalid =>
      'Date ou heure invalide. Exemple : 2026-12-31 et 19:00';

  @override
  String get presetLuggageTitle => 'Étiquette de bagage';

  @override
  String get presetLuggageDesc =>
      'En cas de perte, la personne qui le trouve peut vous joindre.';

  @override
  String luggageMessage(String name, String contact) {
    return 'Ce bagage appartient à $name. Si vous le trouvez, contactez : $contact';
  }

  @override
  String get presetPlaylistTitle => 'Playlist';

  @override
  String get presetPlaylistDesc =>
      'Ouvre une playlist Spotify, Apple Music ou YouTube.';

  @override
  String get playlistLinkLabel => 'Lien de la playlist';

  @override
  String get presetEmailMeTitle => 'Écrivez-moi';

  @override
  String get presetEmailMeDesc =>
      'Ouvre un nouvel e-mail vers vous avec un objet prêt.';

  @override
  String get presetCallMeTitle => 'Appelez-moi';

  @override
  String get presetCallMeDesc => 'Le téléphone appelle votre numéro.';

  @override
  String get presetRunShortcutTitle => 'Exécuter un raccourci';

  @override
  String get presetRunShortcutDesc =>
      'Exécute le raccourci iPhone indiqué : allumer, lancer la musique, changer de Concentration...';

  @override
  String get shortcutNameLabel => 'Nom du raccourci';

  @override
  String get recipesSection => 'Recettes d\'automatisation';

  @override
  String get recipesIntro =>
      'Créez dans Raccourcis un raccourci portant le nom ci-dessous et ajoutez les actions. Liez-le ensuite à une automatisation NFC ou utilisez « Ajouter au tag » pour écrire un lien qui le lance.';

  @override
  String get recipeAddToTag => 'Ajouter au tag';

  @override
  String get recipeBedTitle => 'Bonne nuit';

  @override
  String get recipeBedActions =>
      'Chevet : Concentration Sommeil · régler une alarme · éteindre';

  @override
  String get recipeCarTitle => 'Mode voiture';

  @override
  String get recipeCarActions =>
      'Support voiture : Concentration Conduite · itinéraire maison · musique';

  @override
  String get recipeDoorTitle => 'Je suis rentré';

  @override
  String get recipeDoorActions =>
      'Porte d\'entrée : allumer · Wi-Fi activé · SMS « Je suis rentré » à la famille';

  @override
  String get recipeDeskTitle => 'Mode travail';

  @override
  String get recipeDeskActions =>
      'Bureau : Concentration Travail · minuteur 25 min · playlist';

  @override
  String get recipeGymTitle => 'Entraînement';

  @override
  String get recipeGymActions =>
      'Sac de sport : démarrer une séance · playlist sport · Ne pas déranger';

  @override
  String get recipeKitchenTitle => 'Minuteur cuisine';

  @override
  String get recipeKitchenActions =>
      'Cuisine : minuteur 10 min · ouvrir la liste de courses';

  @override
  String get libraryLabelsField =>
      'Libellés / dossiers (séparés par des virgules)';

  @override
  String get libraryLabelsHint => 'bureau, 2e étage';

  @override
  String librarySaveFailed(String error) {
    return 'Enregistrement impossible : $error';
  }

  @override
  String get csvColumnLabels => 'Libellés';

  @override
  String get firstNameLabel => 'Prénom';

  @override
  String get lastNameLabel => 'Nom';

  @override
  String get wifiPasswordMinHint => 'Au moins 8 caractères';

  @override
  String get emailExampleHint => 'nom@exemple.fr';

  @override
  String get wifiSsidExampleHint => 'Maison_WiFi_5G';

  @override
  String get nfcErrUnavailable =>
      'Le NFC est indisponible ou désactivé sur cet appareil.';

  @override
  String get nfcErrBusy => 'Une autre opération NFC est en cours ; patientez.';

  @override
  String get nfcErrCancelled => 'L\'opération a été annulée.';

  @override
  String get nfcErrAppPaused =>
      'L\'opération a été annulée car l\'app est passée en arrière-plan.';

  @override
  String get nfcErrUnsupportedTag =>
      'Ce type de tag n\'est pas pris en charge.';

  @override
  String get nfcErrNtagOnly =>
      'Cet outil ne fonctionne qu\'avec les tags NTAG / MIFARE Ultralight.';

  @override
  String get nfcErrNotNdefRead =>
      'Tag détecté, mais il n\'est pas au format NDEF.';

  @override
  String get nfcErrNotNdefWrite =>
      'Le tag n\'est pas au format NDEF ; ce téléphone ne peut pas y écrire directement.';

  @override
  String get nfcErrReadOnly => 'Le tag est en lecture seule (verrouillé).';

  @override
  String get nfcErrNoData => 'Aucune donnée à écrire.';

  @override
  String nfcErrCapacity(String required, String max) {
    return 'Espace insuffisant : $required octets requis, $max disponibles.';
  }

  @override
  String get nfcErrCapacityShort => 'Espace insuffisant sur le tag.';

  @override
  String get nfcErrVerify =>
      'Échec de la vérification : les données relues ne correspondent pas.';

  @override
  String get nfcErrConnectionLost =>
      'Connexion au tag perdue ; maintenez-le immobile et réessayez.';

  @override
  String get nfcErrAlreadyLocked =>
      'Le tag est déjà verrouillé (lecture seule).';

  @override
  String get nfcErrLockNotNdef =>
      'Le tag n\'est pas au format NDEF ; écrivez un enregistrement avant de le verrouiller.';

  @override
  String get nfcErrLockNotSupported =>
      'Ce type de tag ne peut pas être verrouillé.';

  @override
  String get nfcSheetConnected => 'Tag connecté, traitement...';

  @override
  String get nfcSheetReadOk => 'Tag lu !';

  @override
  String get nfcSheetEmptyRead => 'Tag vide lu !';

  @override
  String get nfcSheetMultipleTags =>
      'Plusieurs tags détectés. N\'approchez qu\'un seul tag.';

  @override
  String get nfcSheetWriteVerified => 'Écrit et vérifié !';

  @override
  String get nfcSheetWritten => 'Écrit sur le tag !';

  @override
  String get nfcSheetLocked => 'Le tag est verrouillé définitivement !';

  @override
  String get nfcWriteDone => 'Écrit sur le tag avec succès.';

  @override
  String get errorWidgetMessage =>
      'Cette partie n\'a pas pu s\'afficher. Revenez en arrière et réessayez.';

  @override
  String get nfcErrTimeout =>
      'Délai dépassé, aucun tag détecté. Approchez le tag du haut du téléphone et réessayez.';

  @override
  String get aboutTitle => 'À propos';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get privacySummary =>
      'Vos données restent sur cet appareil : pas de compte, pas de serveur, ni pub ni pistage.';

  @override
  String get whatsNewTitle => 'Nouveautés';

  @override
  String get whatsNew110 =>
      '• 14 langues, mode sombre et nouveau design\n• Modèles prêts avec catégories, recherche et favoris\n• Écriture par lot : numéros de série, CSV et clonage\n• Aperçu « Que se passe-t-il au contact ? » et alertes de capacité\n• Bibliothèque de tags avec photos, notes et libellés\n• Rapport de tag, comparaison, scan continu et export CSV\n• Siri, Raccourcis et recettes d\'automatisation';

  @override
  String lastBackupAt(String date) {
    return 'Dernière sauvegarde : $date';
  }

  @override
  String get noBackupYet => 'Aucune sauvegarde pour l\'instant.';

  @override
  String get backupStale =>
      'La dernière sauvegarde date de plus de 30 jours ; pensez à en refaire une.';

  @override
  String get backupICloudTip =>
      'Astuce : dans le menu de partage, choisissez « Enregistrer dans Fichiers » → iCloud Drive.';

  @override
  String get dragToReorder => 'Glisser pour réordonner';

  @override
  String get modeTitle => 'Mode';

  @override
  String get modeNormal => 'Normal';

  @override
  String get modeCompat => 'Compatibilité';

  @override
  String get modeNormalDesc =>
      'Normal : tout est activé ; chaque tag écrit est relu et vérifié.';

  @override
  String get modeCompatDesc =>
      'Compatibilité : pas de relecture après écriture. Plus fiable sur certains tags anciens ou capricieux.';

  @override
  String get rateApp => 'Noter l\'app';

  @override
  String get rateAppUnavailable =>
      'La fenêtre de notation n\'a pas pu s\'afficher (jamais dans TestFlight).';

  @override
  String get chipsTitle => 'Puces NFC';

  @override
  String get chipsSubtitle => 'Quel tag acheter ? Capacité et compatibilité';

  @override
  String get chipsIntro =>
      'Les octets utiles sont le maximum de contenu NDEF. NTAG215 est un bon choix pour débuter.';

  @override
  String chipsUsable(String bytes) {
    return 'Utile : $bytes octets';
  }

  @override
  String get chipsReadWrite => 'Lecture et écriture';

  @override
  String get chipsReadOnlyNdef => 'Seulement si NDEF';

  @override
  String get chipsNotSupported => 'Non pris en charge';

  @override
  String get chipsNxpOnly => 'Seulement téléphones à puce NXP';

  @override
  String get chipUseSmall => 'Un lien, texte court, Wi-Fi ; le moins cher';

  @override
  String get chipUseMedium =>
      'Cartes de visite, plusieurs enregistrements ; figurines amiibo';

  @override
  String get chipUseLarge => 'Contenu long, cartes de visite détaillées';

  @override
  String get chipUseSecure =>
      'Authentification anti-contrefaçon (produits, billets)';

  @override
  String get chipUseTicket => 'Billets de transport et d\'événement';

  @override
  String get chipUseAccess => 'Badges de porte et cartes d\'hôtel';

  @override
  String get chipUseIndustrial =>
      'Bibliothèque, entrepôt, industrie ; portée plus longue';

  @override
  String get chipUseJapan => 'Courant au Japon (transport, paiement)';

  @override
  String get chipUseLegacy =>
      'Type ancien ; déconseillé pour les nouveaux projets';

  @override
  String templateVarsHint(String date, String time, String counter) {
    return 'Astuce : $date, $time ou $counter dans un texte ou un lien sont remplis à l\'écriture.';
  }

  @override
  String templateVarsPreview(String date, String time, String counter) {
    return 'À l\'écriture : $date · $time · compteur $counter';
  }

  @override
  String get libraryWriteToTag => 'Écrire sur un tag';

  @override
  String libraryWritePrompt(String name) {
    return 'Approchez un tag pour écrire « $name »';
  }

  @override
  String get presetSmartCardTitle => 'Carte intelligente';

  @override
  String get presetSmartCardDesc =>
      'Site web, fiche contact et Wi-Fi facultatif sur un tag. Le téléphone ouvre d\'abord le site.';

  @override
  String get presetLostItemTitle => 'Objet perdu';

  @override
  String get presetLostItemDesc =>
      'La personne qui le trouve ouvre un SMS prêt à vous envoyer.';

  @override
  String get lostItemNameLabel => 'Objet (ex. clés, portefeuille)';

  @override
  String lostItemSms(String item) {
    return 'Bonjour, j\'ai trouvé votre $item.';
  }

  @override
  String lostItemText(String item, String name) {
    return 'Cet objet ($item) appartient à $name. Merci de me contacter.';
  }

  @override
  String get presetVoiceTitle => 'Message vocal';

  @override
  String get presetVoiceDesc =>
      'Sur un cadeau ou une boîte : votre note vocale ou chanson se lance.';

  @override
  String get voiceLinkLabel => 'Lien audio (iCloud, Drive, SoundCloud…)';

  @override
  String get logbookTitle => 'Registre';

  @override
  String get logbookSubtitle =>
      'Présence, médicaments, inventaire : chaque scan horodaté';

  @override
  String get logbookNew => 'Nouveau registre';

  @override
  String get logbookName => 'Nom du registre';

  @override
  String get logbookKindAttendance => 'Présence';

  @override
  String get logbookKindMedication => 'Médicaments';

  @override
  String get logbookKindInventory => 'Inventaire';

  @override
  String get logbookKindCustom => 'Autre';

  @override
  String get logbookEmpty =>
      'Aucun registre. Créez-en un, par ex. « Présence 3A » ou « Médicament du soir ».';

  @override
  String get logbookScanButton => 'Scanner et enregistrer';

  @override
  String logbookEntryAdded(String label) {
    return 'Enregistré : $label';
  }

  @override
  String get logbookNoEntries => 'Aucune entrée pour l\'instant.';

  @override
  String logbookToday(String count, String tags) {
    return 'Aujourd\'hui : $count entrées · $tags tags différents';
  }

  @override
  String logbookMedTaken(String time) {
    return 'Pris aujourd\'hui ✓ (dernier : $time)';
  }

  @override
  String get logbookMedNotTaken => 'Pas encore pris aujourd\'hui';

  @override
  String logbookInventorySummary(String count) {
    return '$count tags différents comptés';
  }

  @override
  String logbookDeleteConfirm(String name) {
    return 'Supprimer le registre « $name » et toutes ses entrées ?';
  }

  @override
  String logbookEntries(String count) {
    return '$count entrées';
  }

  @override
  String lastSeenAt(String date) {
    return 'Vu pour la dernière fois : $date';
  }

  @override
  String get neverSeen => 'Pas encore scanné';

  @override
  String get sortLongestUnseen => 'Non vus depuis le plus longtemps';

  @override
  String get unseen30Days => 'Non vu depuis 30+ jours';

  @override
  String get inventoryCardTitle => 'Ce tag est dans votre bibliothèque';

  @override
  String scanReportLine(String unique, String dup, String empty) {
    return '$unique tags différents · $dup relus · $empty vides';
  }

  @override
  String get printSheet => 'Planche d\'étiquettes (PDF)';

  @override
  String get phishDangerTitle => 'Attention : site peut-être frauduleux';

  @override
  String get phishCautionTitle => 'Vérifiez ce lien avant de l\'ouvrir';

  @override
  String phishLookalike(String brand) {
    return 'L\'adresse ressemble à $brand mais n\'est pas son domaine officiel.';
  }

  @override
  String phishBrandInSubdomain(String brand) {
    return '« $brand » est placé devant un autre domaine ; le vrai site est différent.';
  }

  @override
  String phishBrandInName(String brand) {
    return 'Le domaine contient « $brand » mais n\'est pas le site officiel.';
  }

  @override
  String phishShortener(String host) {
    return 'Lien raccourci ($host) : la vraie adresse est cachée.';
  }

  @override
  String phishRiskyTld(String tld) {
    return 'L\'extension « .$tld » est souvent utilisée pour l\'hameçonnage.';
  }

  @override
  String get phishDisclaimer =>
      'Cette vérification repose sur des indices hors ligne ; elle ne garantit rien.';

  @override
  String get backupEncrypt => 'Protéger par mot de passe';

  @override
  String get backupEncryptHint =>
      'La sauvegarde est chiffrée en AES-256. Sans le mot de passe, impossible de l\'ouvrir.';

  @override
  String get backupPassword => 'Mot de passe';

  @override
  String get backupPasswordRepeat => 'Mot de passe (confirmation)';

  @override
  String backupPasswordTooShort(String min) {
    return 'Le mot de passe doit contenir au moins $min caractères.';
  }

  @override
  String get backupPasswordMismatch =>
      'Les mots de passe ne correspondent pas.';

  @override
  String get backupEncryptedPrompt =>
      'Cette sauvegarde est protégée. Saisissez le mot de passe.';

  @override
  String get backupWrongPassword => 'Mot de passe incorrect.';

  @override
  String get backupDecryptFailed =>
      'Déchiffrement impossible ; le fichier est peut-être abîmé.';

  @override
  String get appLockTitle => 'Verrouillage de l\'app';

  @override
  String get appLockSubtitle =>
      'Exiger Face ID, Touch ID ou le code à l\'ouverture';

  @override
  String get appLockUnavailable =>
      'Aucun verrouillage d\'écran n\'est configuré sur cet appareil.';

  @override
  String get appLockLocked => 'App verrouillée';

  @override
  String get appLockUnlock => 'Déverrouiller';

  @override
  String get appLockReason =>
      'Pour ouvrir votre bibliothèque et votre historique';

  @override
  String get sigTitle => 'Tags signés';

  @override
  String get sigSubtitle => 'Détecter si quelqu\'un modifie le contenu';

  @override
  String get sigExplain =>
      'Un enregistrement de signature créé avec votre clé secrète est ajouté aux tags écrits. Lu avec cette app, toute modification est signalée. Partagez la clé avec votre équipe ; sans elle, impossible de falsifier la signature. La lecture reste possible pour tous.';

  @override
  String get sigCreateKey => 'Créer une clé';

  @override
  String get sigCopyKey => 'Copier la clé (partager)';

  @override
  String get sigImportKey => 'Coller une clé';

  @override
  String get sigImportInvalid =>
      'Le presse-papiers ne contient pas de clé valide.';

  @override
  String sigKeyReady(String id) {
    return 'Clé prête ($id)';
  }

  @override
  String get sigSignOnWrite => 'Signer les tags que j\'écris';

  @override
  String get sigValid => 'Signature valide';

  @override
  String get sigInvalid => 'Signature invalide : contenu modifié';

  @override
  String get sigOtherKey => 'Signé avec une autre clé';

  @override
  String get sigReplaceKeyConfirm =>
      'Remplacer la clé actuelle ? Les tags signés avec l\'ancienne apparaîtront « autre clé ».';

  @override
  String get amiiboTitle => 'Infos amiibo';

  @override
  String get amiiboSubtitle =>
      'ID et série de la figurine/carte (lecture seule)';

  @override
  String get amiiboPrompt => 'Approchez la figurine ou carte amiibo';

  @override
  String amiiboNotNtag215(String chip) {
    return 'Ce n\'est pas un amiibo ($chip) ; les amiibo utilisent NTAG215.';
  }

  @override
  String get amiiboNotFound => 'NTAG215 lu, mais aucune donnée amiibo.';

  @override
  String amiiboSeries(String series) {
    return 'Série : $series';
  }

  @override
  String amiiboType(String type) {
    return 'Type : $type';
  }

  @override
  String get amiiboFigure => 'Figurine';

  @override
  String get amiiboCard => 'Carte';

  @override
  String get amiiboYarn => 'Laine';

  @override
  String get amiiboLookup => 'Chercher son nom en ligne (amiiboapi.com)';

  @override
  String memoryEditPage(String page) {
    return 'Modifier la page $page (4 octets hex)';
  }

  @override
  String get memoryEditHint => 'Touchez une page utilisateur pour la modifier.';

  @override
  String memoryEditPrompt(String page) {
    return 'Approchez le même tag pour écrire la page $page';
  }

  @override
  String memoryPageWritten(String page) {
    return 'Page $page écrite.';
  }

  @override
  String get memoryUidMismatch =>
      'Un autre tag a été détecté ; rien n\'a été écrit.';

  @override
  String memoryReadSpeed(String ms, String rate) {
    return 'Durée de lecture : $ms ms ($rate o/s)';
  }

  @override
  String get simpleModeTitle => 'Mode simple';

  @override
  String get simpleModeSubtitle =>
      'Gros boutons ; lecture en un geste pour enfants et aînés';

  @override
  String get simpleScan => 'Lire le tag';

  @override
  String get simpleHint => 'Approchez le tag du haut du téléphone.';

  @override
  String get simpleCall => 'Appeler';

  @override
  String get simpleMessage => 'Envoyer un message';

  @override
  String get simpleOpen => 'Ouvrir';

  @override
  String get simpleEmail => 'Écrire un e-mail';

  @override
  String get simpleMap => 'Ouvrir dans Plans';

  @override
  String get simpleExit => 'Appui long pour revenir à la vue normale';

  @override
  String get simpleNothing => 'Rien à afficher sur ce tag.';

  @override
  String whatsNew120(String date, String time, String counter) {
    return '• Registre : présence, médicaments et inventaire\n• Sécurité : verrou Face ID, sauvegardes chiffrées, tags signés, alerte faux sites\n• Variables de modèle ($date, $time, $counter) et écriture depuis la bibliothèque\n• Nouveaux modèles : Carte intelligente, Objet perdu, Message vocal\n• Planche d\'étiquettes avec QR codes (PDF)\n• Mode simple, infos amiibo, éditeur d\'octets, guide des puces NFC\n• Tri par glisser-déposer et mode Compatibilité';
  }

  @override
  String get logbookKindTimeClock => 'Entrée / sortie (pointage)';

  @override
  String get logbookCheckIn => 'Entrée';

  @override
  String get logbookCheckOut => 'Sortie';

  @override
  String logbookCheckedIn(String label) {
    return 'Entrée : $label';
  }

  @override
  String logbookCheckedOut(String label) {
    return 'Sortie : $label';
  }

  @override
  String logbookPresentNow(String count) {
    return 'Présents : $count';
  }

  @override
  String logbookWorkedToday(String duration) {
    return 'Total aujourd\'hui : $duration';
  }

  @override
  String get logbookWorkedPerPerson => 'Temps aujourd\'hui';

  @override
  String durationHm(String h, String m) {
    return '$h h $m min';
  }

  @override
  String get csvColumnDirection => 'Sens';

  @override
  String get libraryCheckEvery => 'Intervalle de contrôle';

  @override
  String get libraryCheckNone => 'Aucun';

  @override
  String libraryCheckDays(String days) {
    return 'Tous les $days jours';
  }

  @override
  String get libraryCheckHint =>
      'Si le tag n\'est pas scanné dans ce délai, il est signalé à contrôler (extincteur, filtre, arrosage…).';

  @override
  String get libraryCheckDue => 'Contrôle à faire';

  @override
  String libraryCheckNext(String date) {
    return 'Prochain contrôle : $date';
  }

  @override
  String libraryDueFilter(String count) {
    return 'À contrôler ($count)';
  }

  @override
  String libraryCheckRecorded(String date) {
    return 'Contrôle enregistré · prochain : $date';
  }

  @override
  String cloneWarning(String name) {
    return 'Ce contenu est enregistré dans votre bibliothèque sur « $name » avec un autre UID. Ce tag est peut-être une copie.';
  }

  @override
  String get doctorTitle => 'Docteur NDEF';

  @override
  String get doctorButton => 'Diagnostic';

  @override
  String get doctorTooShort =>
      'Mémoire lue partiellement ; tenez le tag plus longtemps et réessayez.';

  @override
  String get doctorNoCc =>
      'Le tag n\'est pas préparé pour NDEF (vierge). Utilisez Outils → « Formater NDEF » ou écrivez dessus.';

  @override
  String get doctorVersion =>
      'Octet de version NDEF inhabituel ; certains téléphones peuvent ne pas lire le tag.';

  @override
  String get doctorReadRestricted =>
      'L\'accès en lecture est restreint ; les téléphones peuvent ne pas afficher le contenu.';

  @override
  String get doctorReadOnly =>
      'Le tag est en lecture seule (verrouillé) ; contenu non modifiable.';

  @override
  String get doctorNoNdef =>
      'Aucun bloc NDEF en mémoire. Réécrire le tag corrige le problème.';

  @override
  String get doctorEmpty => 'Le tag est préparé mais vide.';

  @override
  String get doctorOverflow =>
      'Un champ de longueur dépasse la mémoire ; contenu corrompu. Réécrivez le tag.';

  @override
  String doctorExceeds(String bytes) {
    return 'Le message ($bytes octets) dépasse la capacité déclarée ; lecture possiblement tronquée.';
  }

  @override
  String get doctorNoTerminator =>
      'Le marqueur de fin (FE) manque. La plupart des téléphones lisent quand même ; réécrire corrige.';

  @override
  String get doctorUnknownTlv =>
      'Bloc de données inconnu en mémoire ; la lecture peut s\'arrêter là.';

  @override
  String doctorBadRecord(String n) {
    return 'L\'enregistrement $n est malformé (en-tête ou longueur). Réécrivez le tag.';
  }

  @override
  String doctorHealthy(String count) {
    return 'Tout va bien : $count enregistrement(s) correctement écrit(s).';
  }

  @override
  String get libraryImportTitle => 'Importer depuis un tableur';

  @override
  String get libraryImportHint =>
      'Copiez des lignes depuis Excel, Numbers ou Google Sheets et collez-les ici. Colonnes : nom, contenu (lien ou texte), lieu, étiquettes, note, UID. Avec une ligne d\'en-tête, les colonnes sont associées par nom.';

  @override
  String libraryImportPreview(String count) {
    return '$count tags seront ajoutés';
  }

  @override
  String libraryImportSkipped(String dupes, String invalid) {
    return '$dupes lignes ignorées (UID déjà enregistré), $invalid sans nom';
  }

  @override
  String get libraryImportPaste => 'Coller depuis le presse-papiers';

  @override
  String get libraryImportAdd => 'Ajouter';

  @override
  String libraryImportDone(String count) {
    return '$count tags ajoutés à la bibliothèque';
  }
}
