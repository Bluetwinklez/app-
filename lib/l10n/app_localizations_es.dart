// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get addRecord => 'Añadir registro';

  @override
  String get addToComposerList => 'Añadir a lista de escritura';

  @override
  String get addToWriteList => 'Añadir a lista de escritura';

  @override
  String get addressCannotBeEmpty => 'La dirección no puede estar vacía.';

  @override
  String get advancedCommandsDesc =>
      'Un comando hex por línea. Ej: 60 = GET_VERSION, 30 04 = leer página 4. Comandos erróneos pueden dañar la etiqueta.';

  @override
  String get advancedCommandsSubtitle =>
      'Envía comandos hexadecimales directos a la etiqueta';

  @override
  String get advancedCommandsTitle => 'Comandos NFC avanzados';

  @override
  String get appLinksDesc =>
      'Al escribirlos en una etiqueta, tocarla muestra una notificación y abre la app en esa pantalla.';

  @override
  String get appLinksSection => 'Enlaces de la aplicación';

  @override
  String get appPackageName => 'Nombre de paquete Android';

  @override
  String get appSettings => 'Ajustes de la aplicación';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'Ejecutar automáticamente al tocar';

  @override
  String get backupFileSizeExceeded => 'El archivo de copia supera 2 MiB.';

  @override
  String get backupHistoryMustBeList =>
      'El campo \"history\" debe ser una lista.';

  @override
  String backupInvalidJson(String error) {
    return 'Formato JSON no válido: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Nota de regla no válida.';

  @override
  String get backupInvalidRuleSha => 'Hash SHA-256 no válido.';

  @override
  String get backupInvalidTemplateId => 'ID de plantilla no válido.';

  @override
  String get backupInvalidTemplateName => 'Nombre de plantilla no válido.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Superado el límite de $max elementos de historial ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'Superado el límite de $max reglas ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'Superado el límite de $max plantillas ($count).';
  }

  @override
  String get backupMissingSchemaVersion => 'Falta el campo \"schemaVersion\".';

  @override
  String get backupRecordMustBeObject =>
      'Cada registro NDEF debe ser un objeto JSON.';

  @override
  String get backupRestoreSubtitle =>
      'Guarde sus plantillas, notas e historial opcional en formato JSON o combínelos con sus datos.';

  @override
  String get backupRestoreTitle => 'Copia de seguridad y Restauración (JSON)';

  @override
  String get backupRootMustBeObject => 'La raíz debe ser un objeto JSON.';

  @override
  String get backupRuleMustBeObject => 'Cada regla debe ser un objeto JSON.';

  @override
  String get backupSchemaVersionMustBeInt =>
      'El campo \"schemaVersion\" debe ser un número entero.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'La copia supera el límite de 2 MiB ($bytes bytes).';
  }

  @override
  String get backupTagRulesMustBeList =>
      'El campo \"tagRules\" debe ser una lista.';

  @override
  String get backupTemplateMustBeObject =>
      'Cada plantilla debe ser un objeto JSON.';

  @override
  String get backupTemplatesMustBeList =>
      'El campo \"templates\" debe ser una lista.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'Versión de esquema no admitida: $version.';
  }

  @override
  String cameraError(String error) {
    return 'No se pudo abrir la cámara. Conceda permiso en Ajustes > Privacidad > Cámara.\n($error)';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get catBusiness => 'Negocio';

  @override
  String get catCar => 'Coche';

  @override
  String get catHome => 'Casa';

  @override
  String get catOther => 'Otro';

  @override
  String get catPersonal => 'Personal';

  @override
  String get catWork => 'Trabajo';

  @override
  String get categoryLabel => 'Categoría';

  @override
  String get chooseFromGallery => 'Elegir de la galería';

  @override
  String get clear => 'Borrar';

  @override
  String get clearAll => 'Borrar todo';

  @override
  String get clearConfirmMessage =>
      'Se borrarán todos los registros NDEF y se escribirá un registro vacío. ¿Desea continuar?';

  @override
  String get clearConfirmTitle => 'Restablecer contenido';

  @override
  String get clearHistory => 'Borrar historial';

  @override
  String get clearTagSubtitle =>
      'Elimina todos los registros y escribe un NDEF vacío';

  @override
  String get clearTagTitle => 'Borrar etiqueta';

  @override
  String get close => 'Cerrar';

  @override
  String get commandsEmptyError => 'Introduzca al menos un comando.';

  @override
  String get commandsLabel => 'Comandos';

  @override
  String get confirmClearHistoryContent =>
      'Se eliminará todo el historial guardado en el dispositivo. ¿Desea continuar?';

  @override
  String get confirmClearHistoryTitle => 'Borrar historial de escaneos';

  @override
  String get confirmClearTemplatesContent =>
      'Se eliminarán todas las plantillas guardadas. ¿Desea continuar?';

  @override
  String get confirmClearTemplatesTitle => 'Borrar plantillas';

  @override
  String get contactCompany => 'Empresa / Entidad';

  @override
  String get contactEmail => 'Correo electrónico';

  @override
  String get contactFullName => 'Nombre completo';

  @override
  String get contactPhone => 'Teléfono';

  @override
  String get contactTitle => 'Cargo / Puesto';

  @override
  String get contactWebsite => 'Sitio web';

  @override
  String get copy => 'Copiar';

  @override
  String get copyTagUid => 'Copiar UID';

  @override
  String get copyToComposer => 'Copiar a lista de escritura';

  @override
  String get csvInvalidAddress => 'dirección no válida.';

  @override
  String get csvInvalidEmail => 'correo electrónico no válido.';

  @override
  String get csvInvalidLocation =>
      'indique latitud y longitud (ej. ubicacion,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'Máximo $max registros importados; filas restantes omitidas.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'Fila $row: valor vacío.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'Fila $row: $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'tipo desconocido \"$type\".';
  }

  @override
  String get csvWifiPasswordLength =>
      'La contraseña de Wi-Fi debe tener entre 8 y 63 caracteres.';

  @override
  String get delete => 'Eliminar';

  @override
  String get deleteTemplateTooltip => 'Eliminar plantilla';

  @override
  String get deviceNameTooLong => 'Nombre de dispositivo demasiado largo.';

  @override
  String get dismiss => 'Descartar';

  @override
  String get editRecordTitle => 'Editar registro';

  @override
  String get emailRecipient => 'Destinatario';

  @override
  String get exportBackup => 'Exportar';

  @override
  String get facetimePrompt =>
      'Introduzca número de teléfono o correo de Apple ID.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" no puede estar vacío.';
  }

  @override
  String get flashlight => 'Linterna';

  @override
  String get formatMemorySubtitle =>
      'Prepara para NDEF (etiquetas vacías o corruptas)';

  @override
  String get formatMemoryTitle => 'Formatear memoria';

  @override
  String get idTooLarge => 'El ID no puede superar 255 bytes';

  @override
  String get importBackup => 'Importar (Combinar)';

  @override
  String get inAppTagRules => 'Reglas locales de etiqueta';

  @override
  String get invalidHexId => 'ID hexadecimal no válido';

  @override
  String get invalidHexPayload => 'Carga útil hexadecimal no válida';

  @override
  String get invalidHexType => 'Tipo hexadecimal no válido';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get linkCopied => 'Enlace copiado';

  @override
  String get linkHistoryDesc => 'Abre el historial';

  @override
  String get linkScanDesc => 'Abre la app e inicia el escáner';

  @override
  String get linkToolsDesc => 'Abre la pantalla de herramientas';

  @override
  String get linkWriteDesc => 'Abre la pantalla de escritura';

  @override
  String get locationLabel => '¿Dónde está?';

  @override
  String get lockAcknowledge => 'Entiendo que esta acción no se puede deshacer';

  @override
  String get lockTagSubtitle =>
      'Convierte en solo lectura permanentemente (irreversible)';

  @override
  String get lockTagTitle => 'Bloquear etiqueta';

  @override
  String get manage => 'Gestionar';

  @override
  String get navHistory => 'Hist.';

  @override
  String get navHistoryTitle => 'Historial';

  @override
  String get navRead => 'Leer';

  @override
  String get navReadTitle => 'Leer etiqueta';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get navSettingsTitle => 'Plantillas y Ajustes';

  @override
  String get navTools => 'Herr.';

  @override
  String get navToolsTitle => 'Herramientas';

  @override
  String get navWrite => 'Escribir';

  @override
  String get navWriteTitle => 'Escribir etiqueta';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Registros',
      one: '1 Registro',
    );
    return '$_temp0';
  }

  @override
  String get nfcPromptClear =>
      'Acerque la etiqueta al dispositivo para restablecerla';

  @override
  String get nfcPromptLock =>
      'Acerque la etiqueta para bloquearla permanentemente';

  @override
  String get nfcPromptScan =>
      'Acerque la etiqueta a la parte superior del teléfono';

  @override
  String get nfcPromptWrite => 'Acerque la etiqueta NFC para guardar los datos';

  @override
  String get no => 'No';

  @override
  String get noTemplates =>
      'No hay plantillas guardadas.\nCree registros en la pestaña \"Escribir\" para guardarlos como plantilla.';

  @override
  String get noteLabel => 'Nota';

  @override
  String get onboardingContinue => 'Continuar';

  @override
  String get onboardingSkip => 'Saltar';

  @override
  String get onboardingStart => 'Empezar';

  @override
  String get onboardingStep1Body =>
      'Toque el botón azul inferior y acerque el teléfono a la etiqueta. El contenido, capacidad y número de serie se muestran al instante.';

  @override
  String get onboardingStep1Title => 'Escanear etiqueta';

  @override
  String get onboardingStep2Body =>
      'En la pestaña \"Escribir\", toque \"Añadir registro\": enlaces web, Wi-Fi, contactos, redes sociales y plantillas preparadas.';

  @override
  String get onboardingStep2Title => 'Escribir datos';

  @override
  String get onboardingStep3Body =>
      'Lea la memoria, configure contraseñas, bloquee etiquetas o formatéelas en la pestaña \"Herramientas\".';

  @override
  String get onboardingStep3Title => 'Herramientas expertas';

  @override
  String get onboardingStep4Body =>
      'Guarde etiquetas con nombre, notas y fotos en su biblioteca. Cambie el idioma y aspecto en Ajustes.';

  @override
  String get onboardingStep4Title => 'Organizar etiquetas';

  @override
  String optionalField(String label) {
    return '$label (opcional)';
  }

  @override
  String get passwordError =>
      'Introduzca exactamente 4 caracteres u 8 dígitos hex.';

  @override
  String get passwordHint => '4 caracteres (ej. 1234) u 8 dígitos hex';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get paste => 'Pegar';

  @override
  String get phoneNumber => 'Número de teléfono';

  @override
  String get phoneWithCountryCode =>
      'Introduzca el teléfono con código de país (ej. 34611223344).';

  @override
  String get presetAppDownloadDesc =>
      'Abre o invita a instalar su app en Android.';

  @override
  String get presetAppDownloadTitle => 'Descarga de aplicación';

  @override
  String get presetBusinessCardDesc =>
      'Añade sus datos a la agenda al tocar la etiqueta.';

  @override
  String get presetBusinessCardTitle => 'Tarjeta de visita digital';

  @override
  String get presetDirectionsDesc => 'Fija una dirección o punto en el mapa.';

  @override
  String get presetDirectionsTitle => 'Ubicación / Cómo llegar';

  @override
  String get presetEmergencyDesc =>
      'Grupo sanguíneo, contactos de auxilio y datos vitales.';

  @override
  String get presetEmergencyTitle => 'Tarjeta de emergencia (ICE)';

  @override
  String get presetGoogleReviewDesc =>
      'Dirige directamente a su página de reseñas.';

  @override
  String get presetGoogleReviewTitle => 'Reseña de Google';

  @override
  String get presetGuestWifiDesc =>
      'Permite conectarse a la red sin escribir la clave.';

  @override
  String get presetGuestWifiTitle => 'Tarjeta Wi-Fi de invitados';

  @override
  String get presetInstagramDesc => 'Abre directamente su perfil de Instagram.';

  @override
  String get presetInstagramTitle => 'Perfil de Instagram';

  @override
  String get presetMenuLinkDesc =>
      'Para colocar en mesas y mostrar el menú al instante.';

  @override
  String get presetMenuLinkTitle => 'Carta de restaurante';

  @override
  String get presetPetTagDesc =>
      'Permite que quien la encuentre le llame enseguida.';

  @override
  String get presetPetTagTitle => 'Chapa para mascotas';

  @override
  String get presetShortcutDesc =>
      'Inicia atajos de iPhone o acciones en la app.';

  @override
  String get presetShortcutTitle => 'Activador de atajos';

  @override
  String get presetWebsiteDesc => 'Dirige a cualquier sitio de Internet.';

  @override
  String get presetWebsiteTitle => 'Página web';

  @override
  String get presetWhatsappDesc =>
      'Inicia una conversación sin guardar el número.';

  @override
  String get presetWhatsappTitle => 'Chat de WhatsApp';

  @override
  String get qrCode => 'Código QR';

  @override
  String qrContentChars(int chars) {
    return 'Contenido ($chars caracteres):';
  }

  @override
  String get qrContentEmpty => 'El contenido a codificar está vacío.';

  @override
  String qrContentTooLarge(int chars) {
    return 'El contenido es demasiado grande para código QR ($chars caracteres, máx. 2048).';
  }

  @override
  String get qrFrameInstructions =>
      'Encuadre el código QR. Enlaces web, Wi-Fi y texto se convertirán en registros.';

  @override
  String qrGenerationFailed(String error) {
    return 'Error al crear código QR: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'Vista previa de código QR: $title';
  }

  @override
  String get qrScanTitle => 'Escanear código QR';

  @override
  String get qrSecurityNote =>
      'La vista previa solo admite texto legible y direcciones URL.\n\nContraseñas Wi-Fi y cargas binarias no se convierten por seguridad.';

  @override
  String get qrUserOnlyNote => 'Se abre solo a petición del usuario.';

  @override
  String get rawRecordDetailsTitle => 'Detalles del registro (Solo lectura)';

  @override
  String get rawRecordEditorTitle => 'Editar registro NDEF sin formato';

  @override
  String get readHeroButton => 'Iniciar escaneo';

  @override
  String get readMemorySubtitle =>
      'Memoria sin procesar página a página; copiar o guardar como .bin';

  @override
  String get readMemoryTitle => 'Leer memoria';

  @override
  String get readyTemplates => 'Plantillas listas';

  @override
  String get recordTypeCalendar => 'Evento de calendario (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'MIME personalizado ($mime)';
  }

  @override
  String get recordTypeEmail => 'Registro de correo';

  @override
  String get recordTypeLocation => 'Ubicación / GPS';

  @override
  String get recordTypePhone => 'Número de teléfono';

  @override
  String get recordTypeSmartPoster => 'Smart Poster';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'Contenido de Smart Poster dañado ($bytes bytes)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'Smart Poster (No válido)';

  @override
  String get recordTypeSms => 'Registro de SMS';

  @override
  String get recordTypeText => 'Registro de texto';

  @override
  String get recordTypeUnknown => 'Registro desconocido';

  @override
  String get recordTypeUrl => 'Enlace web (URL)';

  @override
  String get recordTypeVCard => 'Tarjeta de contacto (vCard)';

  @override
  String get recordTypeWifi => 'Configuración Wi-Fi (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'Carga útil WSC dañada';

  @override
  String get redo => 'Rehacer';

  @override
  String get removePasswordSubtitle =>
      'Elimina la protección con la contraseña conocida';

  @override
  String get removePasswordTitle => 'Quitar contraseña';

  @override
  String get rewriteTag => 'Reescribir';

  @override
  String ruleDeleteConfirm(String note) {
    return '¿Eliminar la regla con nota \"$note\"?';
  }

  @override
  String get ruleNoteDialogTitle => 'Editar nota de etiqueta';

  @override
  String get ruleNoteLabel => 'Nota / Descripción local';

  @override
  String get save => 'Guardar';

  @override
  String get saveAsTemplate => 'Guardar como plantilla';

  @override
  String get saveBin => 'Guardar .bin';

  @override
  String get saveLocalHistory => 'Guardar historial de escaneos';

  @override
  String get saveLocalHistorySubtitle =>
      'Desactivado, no se guardan escaneos. Activado, los escaneos correctos se almacenan localmente.';

  @override
  String get scanFabLabel => 'Escanear etiqueta';

  @override
  String get scannedTag => 'Etiqueta escaneada';

  @override
  String get searchQueryCannotBeEmpty => 'La búsqueda no puede estar vacía.';

  @override
  String get securityRestriction => 'Restricción de seguridad';

  @override
  String get send => 'Enviar';

  @override
  String get setPasswordSubtitle =>
      'Protege el contenido contra escrituras no autorizadas';

  @override
  String get setPasswordTitle => 'Establecer contraseña';

  @override
  String get shortcutAutomationNote =>
      'Nota: La automatización se vincula al UID y funciona aunque cambie el contenido.';

  @override
  String get shortcutStep1 =>
      'Abra Atajos y toque \"Automatización\" en la parte inferior.';

  @override
  String get shortcutStep2 =>
      'Toque \"Nueva automatización\" (+) → seleccione \"NFC\".';

  @override
  String get shortcutStep3 =>
      'Toque \"Escanear\", acerque la etiqueta al iPhone y asígnele un nombre.';

  @override
  String get shortcutStep4 =>
      'Seleccione \"Ejecutar inmediatamente\" y añada la acción deseada.';

  @override
  String get shortcutStep5 =>
      'Para abrir esta app, elija \"Escanear etiqueta\" o \"Escribir etiqueta\".';

  @override
  String get shortcutsGuideSubtitle =>
      'Ejecute acciones automáticas al tocar una etiqueta o use Siri por voz.';

  @override
  String get shortcutsGuideTitle => 'Siri y Atajos';

  @override
  String get siriPhraseScan =>
      '\"Oye Siri, escanear etiqueta con NFC Tag Master\"';

  @override
  String get siriPhraseWrite =>
      '\"Oye Siri, escribir etiqueta con NFC Tag Master\"';

  @override
  String get siriShortcutsNote =>
      'Estos comandos también aparecen en la app Atajos y en Spotlight.';

  @override
  String get smsMessage => 'Mensaje SMS';

  @override
  String get socialUsername => 'Usuario / Perfil';

  @override
  String get sourceSelectPrompt => '¿De dónde se debe tomar el contenido?';

  @override
  String get statusCancelled => 'Cancelado';

  @override
  String statusClearError(String error) {
    return 'Error al formatear: $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'Error al borrar: $error';
  }

  @override
  String get statusClearSuccess => 'Contenido de la etiqueta borrado.';

  @override
  String get statusClearing => 'Modo de borrado activo. Acerque la etiqueta...';

  @override
  String statusLockError(String error) {
    return 'Error de bloqueo: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'Error al bloquear: $error';
  }

  @override
  String get statusLockSuccess =>
      'Etiqueta bloqueada permanentemente (solo lectura).';

  @override
  String get statusLocking => 'Modo de bloqueo activo. Acerque la etiqueta...';

  @override
  String get statusNfcDisabled =>
      'NFC desactivado. Actívelo en los ajustes del sistema.';

  @override
  String get statusNfcNotSupported =>
      'El hardware NFC no está disponible en este dispositivo.';

  @override
  String get statusNfcUnavailable => 'NFC no disponible en este momento.';

  @override
  String get statusReady => 'Listo';

  @override
  String statusScanError(String error) {
    return 'Error al escanear: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'Etiqueta leída con éxito ($id).';
  }

  @override
  String get statusScanning => 'Escaneando etiqueta... Acerque el teléfono.';

  @override
  String statusUnexpectedError(String error) {
    return 'Error inesperado: $error';
  }

  @override
  String statusWriteError(String error) {
    return 'Error de escritura: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'No se pudo completar la escritura: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return '¡Escritura y verificación correctas! ($bytes bytes)';
  }

  @override
  String get statusWriting =>
      'Modo de escritura activo. Acerque la etiqueta...';

  @override
  String get systemLanguage => 'Idioma del sistema';

  @override
  String get tabContact => 'Contacto (vCard)';

  @override
  String get tabCustomMime => 'MIME personalizado';

  @override
  String get tabEmail => 'Correo';

  @override
  String get tabPhone => 'Teléfono';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabText => 'Texto';

  @override
  String get tabUrl => 'URL Web';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => 'Información de la etiqueta';

  @override
  String get tagLibraryTitle => 'Mi biblioteca de etiquetas';

  @override
  String tagRulesCount(int count) {
    return 'Reglas / notas guardadas: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Muestra solo la nota guardada según el hash SHA-256 exacto del contenido NDEF.';

  @override
  String get tagWritable => 'Modificable';

  @override
  String get takePhoto => 'Hacer foto';

  @override
  String get templateNameHint => 'Nombre de la plantilla';

  @override
  String get toolsExpertSection => 'Avanzado';

  @override
  String get toolsFooterNote =>
      'Herramientas de memoria, contraseña y comandos compatibles con NTAG213/215/216 y MIFARE Ultralight EV1.';

  @override
  String get toolsMemorySection => 'Memoria';

  @override
  String get toolsSecuritySection => 'Seguridad';

  @override
  String get toolsTagSection => 'Etiqueta';

  @override
  String get typeTooLarge => 'El tipo no puede superar 255 bytes';

  @override
  String get undo => 'Deshacer';

  @override
  String get unknownChip16Pages => 'Chip desconocido (primeras 16 páginas)';

  @override
  String get urlSafetyInvalidUrl => 'Formato de URL no válido.';

  @override
  String get urlSafetyIpv4 =>
      'La dirección de destino contiene una IP literal IPv4.';

  @override
  String get urlSafetyIpv6 =>
      'La dirección de destino contiene una IP literal IPv6.';

  @override
  String get urlSafetyMissingScheme =>
      'Falta el esquema de protocolo en la URL.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'Puerto de red no estándar (Puerto: $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'Dominio internacionalizado / Punycode detectado (\"xn--\").';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'Esquema de URL no estándar: \"$scheme\".';
  }

  @override
  String get urlSafetyUnencrypted => 'Conexión no cifrada (http://).';

  @override
  String get urlSafetyUserInfo =>
      'La URL incluye credenciales (userinfo). Posible riesgo de phishing.';

  @override
  String get usernameCannotBeEmpty =>
      'El nombre de usuario no puede estar vacío.';

  @override
  String get usernameNoSpaces => 'El usuario no puede tener espacios.';

  @override
  String get validAndroidPackage =>
      'Introduzca un paquete Android válido (ej. com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'Introduzca una MAC Bluetooth válida (ej. 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'Introduzca un enlace de vídeo válido.';

  @override
  String get validWebAddress =>
      'Introduzca una dirección web válida (ej. https://example.com/doc.pdf).';

  @override
  String get verificationNotChecked => 'No comprobado';

  @override
  String get verificationPassed => 'Aprobado';

  @override
  String get videoUrlCannotBeEmpty =>
      'El enlace de vídeo no puede estar vacío.';

  @override
  String get videoUrlOrIdPrompt =>
      'Introduzca URL (https://...) o ID del vídeo.';

  @override
  String get wifiAuthOpen => 'Abierta (Sin clave)';

  @override
  String get wifiPassword => 'Contraseña';

  @override
  String get wifiSsid => 'Nombre de la red (SSID)';

  @override
  String get withSiri => 'Con Siri';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes bytes) se escribirá en la memoria de usuario. UID y páginas de bloqueo se mantienen intactas.';
  }

  @override
  String get writeDumpSubtitle =>
      'Escribe archivo binario de memoria en la etiqueta';

  @override
  String get writeDumpTitle => 'Escribir volcado (.bin)';

  @override
  String get writeHeroTitle => 'Escribir etiqueta';

  @override
  String get writeHeroWriting => 'Escribiendo...';

  @override
  String get writeResultFailed => 'Operación fallida';

  @override
  String get writeResultSuccess => 'Operación correcta';

  @override
  String get writeTemplates => 'Plantillas de escritura';

  @override
  String get writeTemplatesSubtitle =>
      'Guarde contenidos NDEF habituales como plantillas para escribirlos al instante.';

  @override
  String get unknown => 'Desconocido';

  @override
  String get error => 'Error';

  @override
  String get nfcPromptReady => 'Acerque la etiqueta';

  @override
  String get invalidResponseFormat => 'Formato de respuesta recibido no válido';

  @override
  String get nfcReadError => 'Error de lectura NFC';

  @override
  String get invalidPlatformResponse => 'Respuesta no válida de la plataforma';

  @override
  String get writeFailed => 'Error al escribir';

  @override
  String get lockFailed => 'Error al bloquear';

  @override
  String get failedToConnectTag => 'No se pudo conectar a la etiqueta';

  @override
  String get invalidTagResponse => 'Respuesta no válida de la etiqueta';

  @override
  String get commandFailed => 'Comando fallido';

  @override
  String get ndefTypeOrIdTooLong => 'El tipo o ID de NDEF supera los 255 bytes';

  @override
  String get ndefUnsupportedOrInvalidRecord =>
      'Registro NDEF no admitido o no válido';

  @override
  String get ndefMissingTypeLength => 'Falta la longitud del tipo NDEF';

  @override
  String get ndefMissingPayloadLength => 'Falta la longitud de carga útil NDEF';

  @override
  String get ndefMissingIdLength => 'Falta la longitud del ID NDEF';

  @override
  String get ndefMissingType => 'Falta el tipo NDEF';

  @override
  String get ndefMissingId => 'Falta el ID NDEF';

  @override
  String get ndefMissingPayload => 'Falta la carga útil NDEF';

  @override
  String get unprotected => '(Sin contraseña)';

  @override
  String get binaryDataPreview => '(Datos binarios)';

  @override
  String get emptyValue => '(Vacío)';

  @override
  String get tnfEmpty => '0: Empty (Vacío)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (Desconocido)';

  @override
  String get tnfUnchanged => '6: Unchanged (NDEF fragmentado)';

  @override
  String get tnfReserved => '7: Reserved (Reservado)';

  @override
  String get ntagUnsupportedChip =>
      'Esta operación solo se admite en etiquetas NTAG213/215/216 y MIFARE Ultralight EV1.';

  @override
  String ntagPageReadFailed(String page) {
    return 'No se pudo leer la página $page (la etiqueta no respondió o área protegida).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'No se pudo escribir en la página $page: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'No se pudo escribir en la página $page (rechazada; bloqueada o protegida).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'No se pudo leer más allá de la página $page; esta área puede estar protegida por contraseña.';
  }

  @override
  String get ntagPasswordPackSize =>
      'La contraseña debe tener 4 bytes y PACK 2 bytes.';

  @override
  String get ntagPasswordSize => 'La contraseña debe tener 4 bytes.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'Contraseña incorrecta o la etiqueta rechazó la autenticación.';

  @override
  String get ntagPasswordWrong => 'Contraseña incorrecta.';

  @override
  String get ntagCcInvalid =>
      'El área CC tiene un valor no NDEF; esta área OTP no se puede formatear.';

  @override
  String get ntagDumpTooShort =>
      'Archivo dump demasiado corto; no contiene datos de usuario.';

  @override
  String get ntagInvalidHex =>
      'Introduzca un valor hexadecimal válido (ej.: 30 04).';

  @override
  String get googleReviewFieldLabel => 'Enlace de reseña o Place ID';

  @override
  String get menuLinkFieldLabel => 'Enlace del menú';

  @override
  String get menuTitleHint => 'Nuestro menú';

  @override
  String get petName => 'Nombre de la mascota';

  @override
  String get ownerPhone => 'Teléfono del dueño';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return '¡Hola, soy $pet! Por favor llama a mi dueño: $phone$note';
  }

  @override
  String get bloodType => 'Grupo sanguíneo';

  @override
  String get allergies => 'Alergias / Medicamentos';

  @override
  String get emergencyContact => 'Contacto de emergencia';

  @override
  String get emergencyInfo => 'INFORMACIÓN DE EMERGENCIA';

  @override
  String emergencyBlood(String blood) {
    return 'Grupo sanguíneo: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'Alergias: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'En caso de emergencia llamar: $contact';
  }

  @override
  String get storeLink => 'Enlace de la tienda';

  @override
  String get link => 'Enlace';

  @override
  String get title => 'Título';

  @override
  String get webAddress => 'Dirección web';

  @override
  String get address => 'Dirección';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'Plantillas: $added añadidas, $updated actualizadas';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'Notas/Reglas de etiquetas: $added añadidas, $updated actualizadas';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'Historial omitido porque está desactivado en el dispositivo: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'Historial: $added añadido, $skipped existente/omitido';
  }

  @override
  String get backupSummaryNoNewData =>
      'No se encontraron nuevos datos para importar (coincidió con los existentes).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field debe ser una cadena de texto.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field debe ser una fecha válida.';
  }

  @override
  String get rawTypeHexLabel => 'Tipo (Bytes hex)';

  @override
  String get rawIdHexLabel => 'ID (Bytes hex, opcional)';

  @override
  String get rawPayloadHexLabel => 'Carga útil (Bytes hex)';

  @override
  String get rawOptionalHexHint => 'Bytes hex opcionales';

  @override
  String get saveChanges => 'Guardar cambios';

  @override
  String get edit => 'Editar';

  @override
  String get clearAllButton => 'Borrar todo';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: $count páginas leídas';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip formateado';
  }

  @override
  String get ntagInvalidDumpFile =>
      'Archivo dump no válido (debe ser múltiplo de 4 bytes, 32-1024 bytes).';

  @override
  String ntagPagesWritten(int count) {
    return '$count páginas escritas';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: protección por contraseña activada';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: contraseña eliminada';
  }

  @override
  String get memoryDumpCopied => 'Volcado de memoria copiado';

  @override
  String ntagCommandsSent(int count) {
    return '$count comandos enviados';
  }

  @override
  String get emptyResponse => '(respuesta vacía)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages páginas · $bytes bytes';
  }

  @override
  String get composeTextEmpty => 'El contenido del texto no puede estar vacío.';

  @override
  String get composeTextTooLong =>
      'El texto es demasiado largo (máximo 5000 caracteres).';

  @override
  String get composeUrlInvalid =>
      'Introduce una dirección válida (ej: https://example.com o enlace app://).';

  @override
  String get composeUrlTooLong =>
      'La URL es demasiado larga (máximo 2000 caracteres).';

  @override
  String get composeEmailInvalid =>
      'Introduce un correo válido (ej: nombre@dominio.com).';

  @override
  String get composePhoneInvalid =>
      'Introduce un número de teléfono válido (ej: +905551234567).';

  @override
  String get composeSmsPhoneInvalid =>
      'Introduce un número de destinatario válido.';

  @override
  String get composeLatInvalid => 'La latitud debe estar entre -90 y +90.';

  @override
  String get composeLngInvalid => 'La longitud debe estar entre -180 y +180.';

  @override
  String get composeVcardNameEmpty =>
      'El nombre del contacto no puede estar vacío.';

  @override
  String get composeVcardNameTooLong =>
      'Nombre de contacto demasiado largo (máx. 200 caracteres).';

  @override
  String get composeVcardEmailInvalid =>
      'Introduce una dirección de correo válida.';

  @override
  String get composeVcardPhoneInvalid =>
      'Introduce un número de teléfono válido.';

  @override
  String get composeVcardUrlInvalid =>
      'Introduce una dirección web válida (ej: https://...).';

  @override
  String get composeCalSummaryEmpty =>
      'El título del evento no puede estar vacío.';

  @override
  String get composeCalSummaryTooLong =>
      'Título de evento demasiado largo (máx. 250 caracteres).';

  @override
  String get composeCalDateInvalid =>
      'La hora de finalización debe ser posterior a la de inicio.';

  @override
  String get composeSpUriInvalid =>
      'Introduce una URL de destino válida (ej: https://...).';

  @override
  String get composeSpLangInvalid =>
      'Introduce un código de idioma ISO válido (ej: es, en).';

  @override
  String get composeMimeTypeInvalid =>
      'Introduce un tipo MIME válido (ej: application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'Introduce una cadena hexadecimal válida (número par de caracteres hex).';

  @override
  String get composeMimePayloadTooLarge =>
      'Tamaño de carga útil demasiado grande (máximo 10 KB).';

  @override
  String get composeWifiSsidEmpty =>
      'El nombre de red (SSID) no puede estar vacío.';

  @override
  String get composeWifiPasswordRequired =>
      'Se requiere contraseña de Wi-Fi para redes cifradas.';

  @override
  String get composeWifiPasswordLength =>
      'La contraseña WPA/WPA2 debe tener entre 8 y 63 caracteres.';

  @override
  String get composeEditNdefRecord => 'Editar registro NDEF';

  @override
  String get composeNewNdefRecord => 'Crear nuevo registro NDEF';

  @override
  String get quickLinksHeader => 'Enlaces rápidos';

  @override
  String get quickLinkCustomUri => 'URI personalizado';

  @override
  String get quickLinkSocial => 'Redes sociales';

  @override
  String get quickLinkVideo => 'Vídeo';

  @override
  String get quickLinkSearch => 'Búsqueda';

  @override
  String get quickLinkFile => 'Archivo';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime Audio';

  @override
  String get quickLinkAddress => 'Dirección';

  @override
  String get quickLinkPayment => 'Enlace de pago';

  @override
  String get quickLinkApp => 'Aplicación (Android)';

  @override
  String get updateRecord => 'Actualizar registro';

  @override
  String get addToList => 'Añadir a la lista';

  @override
  String get quickCustomUriError =>
      'Introduce una dirección con esquema (ej: spotify:track:... o myapp://pagina).';

  @override
  String get quickFileEmptyMessage => 'Introduce el enlace del archivo.';

  @override
  String get quickPaymentEmptyMessage => 'Introduce el enlace de pago.';

  @override
  String get quickCustomUriDesc =>
      'Se puede usar cualquier dirección con esquema; el teléfono abrirá la app correspondiente.';

  @override
  String get quickSocialLabel => 'Red social';

  @override
  String get quickVideoLabel => 'Enlace de vídeo';

  @override
  String get quickVideoHint => 'https://youtu.be/... o ID de vídeo';

  @override
  String get quickVideoDesc =>
      'Enlace de YouTube, Vimeo, etc. o solo el ID del vídeo de YouTube.';

  @override
  String get quickSearchHint => 'ej: Tiempo Madrid';

  @override
  String get quickFileLabel => 'Enlace de archivo';

  @override
  String get quickFileDesc =>
      'Debido a la poca capacidad de la etiqueta, se guarda el enlace web en lugar del archivo.';

  @override
  String get quickPhoneOrAppleId => 'Teléfono o ID de Apple';

  @override
  String get quickFacetimeVideoDesc =>
      'Un iPhone que toque la etiqueta iniciará una videollamada FaceTime.';

  @override
  String get quickFacetimeAudioDesc =>
      'Un iPhone que toque la etiqueta iniciará solo una llamada de voz FaceTime.';

  @override
  String get quickMapProvider => 'App de mapas';

  @override
  String get quickAddressHint => 'ej: Gran Vía 1, Madrid';

  @override
  String get quickPaymentDesc =>
      'Se pueden usar enlaces de pago como PayPal.me, Stripe. La información de tarjeta nunca se escribe.';

  @override
  String get quickAppDesc =>
      'Android abre esta app al escanear (o Play Store si no está instalada). iPhone ignora este tipo; añade enlace a App Store como URL.';

  @override
  String get quickDeviceNameOptional => 'Nombre del dispositivo (opcional)';

  @override
  String get quickSpeakerHint => 'ej: Altavoz';

  @override
  String get quickBluetoothDesc =>
      'Los teléfonos Android sugieren el emparejamiento con este dispositivo. iPhone no admite etiquetas de emparejamiento Bluetooth.';

  @override
  String get composeTextContent => 'Contenido del texto';

  @override
  String get composeTextHint => 'Introduce el texto que deseas escribir';

  @override
  String get composeEmailSubjectOptional => 'Asunto (opcional)';

  @override
  String get composeEmailBodyOptional => 'Cuerpo del mensaje (opcional)';

  @override
  String get composeSmsRecipient => 'Número de teléfono del destinatário';

  @override
  String get composeSmsHint => 'Mensaje SMS para enviar...';

  @override
  String get composeVcardFullName => 'Nombre completo (nombre visible) *';

  @override
  String get composeVcardNameHint => 'Juan Pérez';

  @override
  String get composeVcardNote => 'Nota / Descripción';

  @override
  String get composeCalTitle => 'Título del evento *';

  @override
  String get composeCalTitleHint => 'Reunión de proyecto';

  @override
  String get composeCalLocationHint => 'Sala de reuniones 2 u online';

  @override
  String get composeCalDesc => 'Descripción del evento';

  @override
  String get composeCalStartEndTime => 'Hora de inicio y fin:';

  @override
  String get composeSpTitleLabel => 'Título (texto visible)';

  @override
  String get composeSpTitleHint => 'Folleto de la empresa';

  @override
  String get composeMimeTypeLabel => 'Tipo MIME *';

  @override
  String get composeDataFormat => 'Formato de datos: ';

  @override
  String get composeFormatHex => 'Hexadecimal';

  @override
  String get composeMimeHexBytes => 'Bytes hexadecimales *';

  @override
  String get composeMimeTextPayload => 'Texto de carga útil (UTF-8) *';

  @override
  String get composeWifiWarningTitle => 'Aviso de seguridad y plataforma:';

  @override
  String get composeWifiWarningBody =>
      '• La contraseña de Wi-Fi se guarda en texto plano y cualquiera puede leerla.\n• La conexión automática no está garantizada; puede requerirse confirmación del usuario.';

  @override
  String get composeWifiSsidLabel => 'Nombre de red (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'Tipo de seguridad (autenticación)';

  @override
  String get composeWifiOpenNetwork => 'Red abierta (sin contraseña)';

  @override
  String get composeWifiPasswordLabel => 'Contraseña de Wi-Fi *';

  @override
  String get composeWifiEncryptionLabel => 'Tipo de cifrado';

  @override
  String get composeWifiAesRecommended => 'AES (recomendado)';

  @override
  String get quickSearchTextLabel => 'Texto a buscar';

  @override
  String get readTagMemoryPrompt =>
      'Acerque la etiqueta al teléfono para leer la memoria';

  @override
  String get readingTagMemoryStatus => 'Leyendo memoria...';

  @override
  String get formatTagConfirmTitle => 'Formatear memoria';

  @override
  String get formatTagConfirmMessage =>
      'Se borrarán los datos y se preparará como NDEF vacío. ¿Continuar?';

  @override
  String get formatButton => 'Formatear';

  @override
  String get formatTagPrompt => 'Acerque la etiqueta para formatear';

  @override
  String get formattingStatus => 'Formateando...';

  @override
  String filePickerFailed(String error) {
    return 'Error en el selector de archivos: $error';
  }

  @override
  String get writeButton => 'Escribir';

  @override
  String get writeDumpPrompt => 'Acerque la etiqueta para escribir el dump';

  @override
  String get writingDumpStatus => 'Escribiendo dump...';

  @override
  String get setPasswordWarning =>
      'Si olvida la contraseña, no podrá volver a modificar el contenido. La lectura sigue abierta a todos.';

  @override
  String get setPasswordAction => 'Establecer contraseña';

  @override
  String get setPasswordPrompt => 'Acerque la etiqueta para poner contraseña';

  @override
  String get settingPasswordStatus => 'Configurando contraseña...';

  @override
  String get removePasswordPromptMessage =>
      'Introduzca la contraseña establecida anteriormente en la etiqueta.';

  @override
  String get remove => 'Eliminar';

  @override
  String get removePasswordPrompt =>
      'Acerque la etiqueta para quitar la contraseña';

  @override
  String get removingPasswordStatus => 'Quitando contraseña...';

  @override
  String get sendCommandsPrompt => 'Acerque la etiqueta para enviar comandos';

  @override
  String get sendingCommandsStatus => 'Enviando comandos...';

  @override
  String get sendButton => 'Enviar';

  @override
  String get tagNoteEditTitle => 'Editar nota de etiqueta';

  @override
  String get tagNoteInputLabel => 'Nota / Descripción en la app';

  @override
  String get tagNoteInputHint => 'ej: Información de sala o Estantería #12';

  @override
  String get tagNoteDeleteTitle => 'Eliminar nota de etiqueta';

  @override
  String get clearAllTagRulesTitle => 'Eliminar todas las notas';

  @override
  String get clearAllTagRulesConfirm =>
      'Se eliminarán todas las notas guardadas. ¿Confirmar?';

  @override
  String get deleteAll => 'Eliminar todo';

  @override
  String get tagRulesExplanation =>
      'Solo se muestra la nota guardada para etiquetas que coincidan con el hash SHA-256 de NDEF.';

  @override
  String get noTagRulesDefined => 'No hay notas de etiquetas definidas aún.';

  @override
  String lastUpdated(String time) {
    return 'Última actualización: $time';
  }

  @override
  String get tagLibraryNoMatch => 'No se encontraron etiquetas que coincidan.';

  @override
  String get tagLibraryAddToLibrary => 'Añadir a la biblioteca';

  @override
  String get name => 'Nombre';

  @override
  String get tagLibraryAddTag => 'Añadir etiqueta';

  @override
  String get all => 'Todos';

  @override
  String tagLibraryPhotoError(String error) {
    return 'No se pudo seleccionar la foto: $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'Eliminar etiqueta';

  @override
  String get tagLibraryNameHint => 'ej: Llavero de la oficina';

  @override
  String get tagLibraryNoTagContent =>
      'No hay contenido de etiqueta en este registro.';

  @override
  String get tagLibrarySourceLastScanned => 'Último escaneo';

  @override
  String get tagLibraryEmpty => 'No hay etiquetas guardadas aún.';

  @override
  String get tagLibrarySourceEmpty => 'Registro vacío';

  @override
  String get tagLibraryNamePrompt =>
      'Por favor, introduzca un nombre de etiqueta';

  @override
  String get tagLibrarySearchHint =>
      'Buscar por nombre, categoría o ubicación...';

  @override
  String get tagLibrarySourceWriteList => 'Lista de escritura';

  @override
  String get tagLibraryLocationHint => 'ej: Escritorio, Puerta principal';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return '¿Seguro que desea eliminar la etiqueta \"$name\" de la biblioteca?';
  }

  @override
  String get noContent => 'Sin contenido';

  @override
  String tagLibraryRecordSummary(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros NDEF',
      one: '1 registro NDEF',
    );
    return '$_temp0';
  }

  @override
  String get tagLibraryEditTag => 'Editar etiqueta';

  @override
  String get rawTypeHexHint => '41 (A) o 55 (U) etc.';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: El campo \"records\" debe ser una lista.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: Un elemento puede tener como máximo $max registros NDEF.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - El registro #$index no es un objeto válido.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - Registro #$index: Valor TNF no válido ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - Registro #$index: \"type\" debe ser una cadena Base64.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - Registro #$index: \"type\" no son datos Base64 válidos ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - Registro #$index: \"id\" debe ser una cadena Base64.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - Registro #$index: \"id\" no son datos Base64 válidos ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - Registro #$index: \"payload\" debe ser una cadena Base64.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - Registro #$index: \"payload\" no son datos Base64 válidos ($error).';
  }

  @override
  String get composerUndoSnack => 'Último cambio deshecho.';

  @override
  String get composerRedoSnack => 'Cambio rehecho.';

  @override
  String get noRecordsToCopy => 'No hay registros NDEF para copiar.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count registros NDEF ($bytes B) copiados al portapapeles.\n(Solo se copia el contenido NDEF; UID o sectores cifrados nunca se clonan)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: $count registros añadidos.';
  }

  @override
  String get tagEmptyNoRecordsToImport =>
      'La etiqueta está vacía; no hay registros para importar.';

  @override
  String get sourceTag => 'De etiqueta';

  @override
  String get sourceQr => 'Desde código QR';

  @override
  String filePickerError(String error) {
    return 'No se pudo abrir el selector: $error';
  }

  @override
  String get csvFileTooLarge =>
      'El archivo CSV es demasiado grande (máximo 512 KB).';

  @override
  String get noRecordsFound => 'No se encontraron registros';

  @override
  String get someRowsSkipped => 'Se omitieron algunas filas';

  @override
  String get expectedFormat => 'Formato esperado:';

  @override
  String get noClipboardContent =>
      'No hay contenido NDEF copiado en el portapapeles.';

  @override
  String get pasteFromClipboardTitle => 'Pegar desde portapapeles NDEF';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'Datos del portapapeles: $count registros, $bytes bytes ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      '¿Desea reemplazar los registros actuales o añadirlos al final?';

  @override
  String get pasteOverwriteOption => 'Sobrescribir (Reemplazar)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'Los $count registros actuales se sustituyen por el portapapeles (se pide confirmación).';
  }

  @override
  String get pasteEmptySubtitle =>
      'El contenido del portapapeles se coloca en el compositor.';

  @override
  String get pasteAppendOption => 'Añadir al final';

  @override
  String get pasteAppendSubtitle =>
      'Se conservan los registros actuales; los del portapapeles se añaden al final.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count registros añadidos.';
  }

  @override
  String get confirmOverwriteTitle => '¿Sobrescribir registros?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'Hay $currentCount registros. Serán reemplazados por los $newCount del portapapeles. ¿Continuar?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'Registros reemplazados con $count registros.';
  }

  @override
  String get yesReplace => 'Sí, reemplazar';

  @override
  String recordsImportedToComposer(num count) {
    return '$count registros importados.';
  }

  @override
  String get noContentToCopy => 'No se encontró contenido NDEF para copiar.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count registros NDEF copiados y añadidos (Contenido copiado, UID no clonado).';
  }

  @override
  String get noContentToRewrite =>
      'No se encontró contenido NDEF para reescribir.';

  @override
  String get rewriteTagTitle => 'Reescribir etiqueta';

  @override
  String get importantNotice => 'AVISO IMPORTANTE:';

  @override
  String get rewriteNotice1 =>
      '• Esta operación SOBRESCRIBE COMPLETAMENTE el contenido NDEF; no añade al final.\n';

  @override
  String get rewriteNotice2 =>
      '• La etiqueta de destino debe ser escribible (desbloqueada).\n';

  @override
  String get rewriteNotice3 =>
      '• No escribe silenciosamente en la etiqueta anterior; requiere nuevo toque NFC.';

  @override
  String get rewriteInstruction =>
      'Prepare la etiqueta, pulse \"Tocar y escribir\" y acérquela al teléfono.';

  @override
  String get tapAndWrite => 'Tocar y escribir';

  @override
  String get rewritePromptMessage =>
      'Acerque la etiqueta al dispositivo (se renovará todo el contenido)';

  @override
  String get writeVerifiedTitle => 'Escritura verificada';

  @override
  String get writeVerifiedDesc =>
      'Contenido NDEF escrito y verificado con éxito en la etiqueta.';

  @override
  String get writeVerifiedHint =>
      'Puede iniciar el siguiente escaneo para verificar o comparar datos.';

  @override
  String get scanAndCompareNow => 'Escanear y comparar ahora';

  @override
  String get contentMatchesExactly => 'El contenido coincide exactamente';

  @override
  String get differenceDetected => 'Diferencia detectada';

  @override
  String get compareMatchDesc =>
      'El mensaje NDEF de la etiqueta coincide byte a byte con el origen.';

  @override
  String get compareDiffDesc =>
      'Hay diferencias entre los datos leídos y los previstos. Compruebe si la etiqueta está bloqueada.';

  @override
  String get batchEmptyComposerError =>
      'Añada al menos un registro antes de iniciar la escritura por lotes.';

  @override
  String get batchWriteTitle => 'Escritura por lotes';

  @override
  String get batchWriteSubtitle =>
      'Escriba el mismo contenido NDEF en varias etiquetas sucesivamente.';

  @override
  String get attention => 'ATENCIÓN:';

  @override
  String get batchNotice1 =>
      '• Para evitar escrituras dobles accidentales, cada escritura se inicia con \"Escribir siguiente\".\n';

  @override
  String get batchNotice2 =>
      '• No se realiza escaneo automático sucesivo; cada etiqueta debe cambiarse físicamente.';

  @override
  String get batchStartButton => 'Iniciar escritura por lotes';

  @override
  String get batchControlPanelTitle =>
      'Panel de control de escritura por lotes';

  @override
  String get batchCancelOrClose => 'Cancelar / Cerrar';

  @override
  String get batchAllCompleted => '¡Todos los intentos completados!';

  @override
  String batchStats(String ok, String failed, String left) {
    return 'Correctas: $ok | Fallidas: $failed | Restantes: $left';
  }

  @override
  String get waitingForTag => 'Esperando etiqueta...';

  @override
  String get batchFinishButton => 'Finalizar escritura por lotes';

  @override
  String get writeError => 'Error de escritura';

  @override
  String get batchConfirmCancelTitle => 'Cancelar escritura por lotes';

  @override
  String get batchConfirmCancelMessage =>
      '¿Terminar la sesión por lotes? Las etiquetas escritas se conservan; las restantes no se escribirán.';

  @override
  String get cancelled => 'Cancelado';

  @override
  String get batchCancelledSnack =>
      'Escritura por lotes cancelada. Su contenido se conservó.';

  @override
  String get cancelAndClose => 'Cancelar y cerrar';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'Análisis de URL sin conexión';

  @override
  String get urlSafetyScheme => 'Esquema (Protocolo):';

  @override
  String get urlSafetyPort => 'Puerto:';

  @override
  String get urlSafetyUserInfoLabel => 'Info de usuario:';

  @override
  String get urlSafetyIpLiteral => 'Dirección IP directa:';

  @override
  String get urlSafetyDomain => 'No (Nombre de dominio)';

  @override
  String get urlSafetyPunycodeLabel => 'Internacional / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => 'Sí (Sospecha de homoglifo)';

  @override
  String get urlSafetyWarningsHeader => 'Alertas de seguridad / advertencia:';

  @override
  String get urlSafetyDisclaimer =>
      'NOTA: Análisis sin conexión. No escanea virus en línea. La URL no se abre automáticamente.';

  @override
  String get templateSaveEmptyError =>
      'Añada registros antes de guardar como plantilla.';

  @override
  String templateDefaultName(String n) {
    return 'Plantilla $n';
  }

  @override
  String get templateNameSample => 'ej: Web de empresa y contacto';

  @override
  String get templateSavedSnack => 'Plantilla guardada.';

  @override
  String get ruleNoteRequiresNdef =>
      'La etiqueta debe contener al menos un registro NDEF para añadir una nota.';

  @override
  String get ruleNoteAddTitle => 'Añadir nota personalizada';

  @override
  String get ruleNoteDigestExplanation =>
      'Vinculada al digest SHA-256 de NDEF. Solo muestra esta descripción al escanear.';

  @override
  String get ruleNoteSavedSnack => 'Nota de etiqueta guardada.';

  @override
  String get ruleNoteDeleteConfirm =>
      'Se eliminará la nota para esta etiqueta. ¿Continuar?';

  @override
  String get ruleNoteDeletedSnack => 'Nota de etiqueta eliminada.';

  @override
  String get backupExportTitle => 'Exportar copia de seguridad';

  @override
  String get backupExportWarningTitle => 'AVISO DE PRIVACIDAD Y SEGURIDAD';

  @override
  String get backupExportWarningBody =>
      'La copia de seguridad (JSON) está en texto plano. Puede contener contraseñas de Wi-Fi o datos personales. Guárdela de forma segura.';

  @override
  String get backupIncludedItems => 'Elementos a incluir:';

  @override
  String backupTemplatesCount(String count) {
    return '• Plantillas: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• Notas/reglas de etiquetas: $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Incluir historial de escaneos (Opcional)';

  @override
  String backupHistoryCount(String count) {
    return '$count entradas del historial';
  }

  @override
  String get backupHistoryDisabled =>
      'El historial de escaneo está desactivado en este dispositivo';

  @override
  String get backupExportAndShare => 'Exportar y compartir';

  @override
  String get backupFileNameLabel => 'Archivo de respaldo NFC Tag Master';

  @override
  String get backupFileShareSubject =>
      'Copia de seguridad de plantillas y datos (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'Archivo de respaldo exportado y compartido con éxito.';

  @override
  String get backupExportCancelled => 'Compartición de exportación cancelada.';

  @override
  String get backupImportTitle => 'Importar copia de seguridad';

  @override
  String get backupMergeRuleTitle => 'POLÍTICA DE SEGURIDAD Y FUSIÓN';

  @override
  String get backupMergeRule1 =>
      '• La importación FUSIONA los datos; sus registros actuales NUNCA se borran.\n';

  @override
  String get backupMergeRule2 =>
      '• Puede contener contraseñas Wi-Fi o datos personales; use solo fuentes fiables.\n';

  @override
  String get backupMergeRule3 =>
      '• Límite: 2 MiB. Se realiza estricta validación de esquema y Base64 antes de cargar.';

  @override
  String get backupSelectFilePrompt =>
      'Seleccione un archivo de respaldo .json válido para fusionar.';

  @override
  String get selectFileButton => 'Seleccionar archivo';

  @override
  String get fileSelectionCancelled => 'Selección de archivo cancelada.';

  @override
  String get backupFileExceedsLimit =>
      'El archivo seleccionado supera el límite de 2 MiB permitido.';

  @override
  String fileReadError(String error) {
    return 'Error al leer el archivo: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Error al validar la copia: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Historial de escaneo detectado';

  @override
  String get backupHistoryDetectedPrompt =>
      '¿Desea importar y activar el historial? ¿O solo plantillas y notas?';

  @override
  String get backupSkipHistoryOption =>
      'Omitir historial (cargar solo plantillas y notas)';

  @override
  String get backupEnableHistoryOption => 'Activar historial y cargar';

  @override
  String get nfcReadyStatus => 'NFC listo';

  @override
  String get nfcReadyDesc => 'El hardware NFC está activo y listo para usar';

  @override
  String get nfcDisabledStatus => 'NFC desactivado';

  @override
  String get nfcDisabledDesc =>
      'NFC está desactivado. Actívelo en los ajustes del dispositivo.';

  @override
  String get template => 'Plantilla';

  @override
  String get nfcScannerTitle => 'Escáner NFC';

  @override
  String get composeRecord => 'Crear registro';

  @override
  String get protectOrRemove => 'Proteger / quitar';

  @override
  String get previousScans => 'Escaneos anteriores';

  @override
  String get noScannedTagYet => 'Aún no se ha escaneado ninguna etiqueta NFC';

  @override
  String get tapScanPrompt =>
      'Pulse \"Iniciar escaneo\" y acerque la etiqueta al teléfono.';

  @override
  String get ndefCopyAndRewriteTitle => 'Copia y reescritura de contenido NDEF';

  @override
  String get savedTagNoteHeader =>
      'Nota de etiqueta guardada (regla en la app)';

  @override
  String get tagNoteOrRule => 'Nota / regla de etiqueta';

  @override
  String get editNote => 'Editar nota';

  @override
  String get deleteNote => 'Eliminar nota';

  @override
  String get tagNoteDigestNotice =>
      'Coincide con el hash SHA-256 de los bytes NDEF. No activa acciones externas.';

  @override
  String get addCustomTagNotePrompt =>
      'Puede añadir una nota local personalizada para este contenido NDEF.';

  @override
  String get addNoteToThisTag => 'Añadir nota a esta etiqueta';

  @override
  String get ndefSupport => 'Compatibilidad NDEF:';

  @override
  String get usedSpace => 'Espacio usado:';

  @override
  String get freeSpace => 'Espacio libre:';

  @override
  String get noNdefMessageOnTag =>
      'No se encontró ningún mensaje NDEF en la etiqueta.';

  @override
  String get hideDetails => 'Ocultar detalles';

  @override
  String get advancedRecordInspector => 'Inspector de registros (Avanzado)';

  @override
  String get ndefRecordInspectorTitle =>
      'Inspector de registros NDEF (Avanzado)';

  @override
  String get inspectorType => 'Tipo:';

  @override
  String get inspectorPayloadLength => 'Longitud de carga útil:';

  @override
  String get inspectorRawHexPreview =>
      'Vista previa hexadecimal sin procesar (limitada):';

  @override
  String get ndefRecordsToWriteTitle => 'Registros NDEF para escribir';

  @override
  String get pasteFromClipboardAction =>
      'Pegar desde el portapapeles (Reemplazar / Añadir)';

  @override
  String get importAction => 'Importar';

  @override
  String get importFromTagAction => 'Importar desde etiqueta NFC';

  @override
  String get importFromQrAction => 'Importar desde código QR';

  @override
  String get importFromCsvAction => 'Importar desde archivo CSV';

  @override
  String get composerEmptyDescription =>
      'Puede escribir texto, webs, Wi-Fi, teléfonos, correos, contactos y más en etiquetas.';

  @override
  String get urlSafetyReview => 'Revisión de URL';

  @override
  String get inspector => 'Inspector';

  @override
  String get typeLabel => 'Tipo:';

  @override
  String get payloadLabel => 'Carga útil:';

  @override
  String get writeAndVerify => 'Escribir en etiqueta y verificar';

  @override
  String get batchWriteButtonLabel => 'Escritura por lotes (2..100 etiquetas)';

  @override
  String get clearTagButtonLabel => 'Restablecer etiqueta (borrar contenido)';

  @override
  String get confirmWriteTitle => 'Confirmar escritura en etiqueta';

  @override
  String get confirmWriteMessage1 =>
      'Esta operación SOBRESCRIBE COMPLETAMENTE el contenido NDEF actual.';

  @override
  String get confirmWriteMessage2 =>
      'Asegúrese de que sea escribible. El contenido se verificará automáticamente.';

  @override
  String get yesWrite => 'Sí, escribir';

  @override
  String get scanHistoryDisabledTitle => 'Historial de escaneo desactivado';

  @override
  String get scanHistoryDisabledDesc =>
      'Por privacidad, no se guarda el historial por defecto. Puede activarlo en ajustes.';

  @override
  String get enableHistory => 'Activar historial';

  @override
  String get historySearchHint =>
      'Buscar por UID, texto o tipo (ej: URL, Wi-Fi, 04A1...)';

  @override
  String get noHistoryYet => 'No hay historial de escaneo guardado todavía.';

  @override
  String get tryDifferentQuery =>
      'Pruebe con otro UID, contenido de texto o tipo de registro.';

  @override
  String get clearSearch => 'Borrar búsqueda';

  @override
  String get deleteThisRecord => 'Eliminar este registro';

  @override
  String get qrPreview => 'Vista previa QR';

  @override
  String get lockTagConfirmTitle => 'Bloquear etiqueta permanentemente';

  @override
  String get lockTagWarning2 =>
      'Asegúrese de haber escrito el contenido correcto primero.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'Vista previa del código QR';

  @override
  String get unknownParentheses => '(Desconocido)';

  @override
  String get ok => 'Aceptar';

  @override
  String rewriteSourceUid(String uid) {
    return 'UID de origen: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return 'Registros a escribir: $count';
  }

  @override
  String rewriteFailed(String message) {
    return 'Error al reescribir: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return 'Registros escritos: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'UID de la etiqueta escaneada: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return 'Datos escritos: $count registros ($bytes bytes)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'Datos escaneados: $count registros ($bytes bytes)';
  }

  @override
  String batchTargetCount(String count) {
    return 'Etiquetas objetivo: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return 'Lista de escritura: $count registros ($bytes bytes)';
  }

  @override
  String batchNext(String current, String total) {
    return 'Siguiente: etiqueta #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return 'Correcto ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return 'Fallido: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'Etiqueta #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'Toca y escribe la etiqueta #$n';
  }

  @override
  String batchPrompt(String current, String total) {
    return 'Escritura por lotes: acerque la etiqueta #$current / $total';
  }

  @override
  String batchWrittenVerified(String count) {
    return '$count registros escritos y verificados';
  }

  @override
  String templateLoaded(String name) {
    return 'Los registros de «$name» se añadieron a la lista.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'Huella del contenido NDEF (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return 'Error de exportación: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'La copia tiene $count entradas de historial, pero el historial está desactivado aquí.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'Importación correcta:\n$summary';
  }

  @override
  String mergeError(String error) {
    return 'Error al combinar: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'Portapapeles NDEF: $count registros ($bytes B) - $source';
  }

  @override
  String get heroScanSubtitle =>
      'Acerque la etiqueta a la parte superior del teléfono; verá al instante contenido, capacidad y número de serie.';

  @override
  String lastTagLabel(String uid) {
    return 'Última etiqueta: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'Error de escaneo: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count registros ($bytes bytes) - solo se copian datos NDEF, no el UID.';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'Etiqueta $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'Error: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return 'Registros NDEF leídos ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return 'Registros NDEF a escribir ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return 'Nota: la carga tiene $bytes bytes; solo se muestran los primeros 64.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return 'Tamaño total: $bytes bytes | Registros: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return 'Escribir y verificar ($bytes bytes)';
  }

  @override
  String savedScansCount(String count) {
    return 'Escaneos guardados: $count';
  }

  @override
  String historyNoResults(String query) {
    return 'Sin resultados para «$query».';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count registros';
  }

  @override
  String historyCapacity(String max, String used) {
    return 'Capacidad: $max B | Usado: $used B';
  }

  @override
  String historySourceLabel(String uid) {
    return 'Historial UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count registros | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return 'Reglas/notas guardadas: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return 'Bytes escritos: $bytes | Verificación: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'Una etiqueta bloqueada queda de solo lectura: su contenido NUNCA podrá cambiarse ni borrarse y el bloqueo NO se puede quitar. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'Tamaño del mensaje: $bytes bytes';
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
  String get valueNone => 'Ninguno';

  @override
  String get valueYesIp => 'Sí (dirección IP)';

  @override
  String get nfcMissingShort => 'Sin NFC';

  @override
  String get clearClipboard => 'Vaciar portapapeles';

  @override
  String get statLibrary => 'Biblioteca';

  @override
  String get scanTagTitle => 'Escanear etiqueta';

  @override
  String get readingInProgress => 'Leyendo...';

  @override
  String get rawMemorySubtitle => 'Memoria sin procesar';

  @override
  String get copyToClipboard => 'Copiar al portapapeles';

  @override
  String get serialUidLabel => 'N.º de serie (UID):';

  @override
  String get totalCapacityLabel => 'Capacidad total:';

  @override
  String get technologiesLabel => 'Tecnologías:';

  @override
  String get idLabel => 'Identificador (ID):';

  @override
  String get undoTooltip => 'Deshacer';

  @override
  String get clearComposer => 'Vaciar lista';

  @override
  String composerTotalSize(String bytes) {
    return 'Tamaño total: $bytes bytes';
  }

  @override
  String get yesClear => 'Sí, borrar';

  @override
  String get ssidTooLong => 'El SSID puede tener como máximo 32 bytes.';

  @override
  String get locationPlace => 'Ubicación / Lugar';

  @override
  String get targetWebUrl => 'URL de destino *';

  @override
  String get languageCodeLabel => 'Código de idioma (ISO 639-1) *';

  @override
  String get utf8Text => 'Texto UTF-8';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf, tamaño: $bytes bytes';
  }

  @override
  String get quickGallerySubtitle => 'Listo en un toque';

  @override
  String get quickLibraryTitle => 'Mi biblioteca';

  @override
  String get quickLibrarySubtitle => 'Etiquetas guardadas';

  @override
  String get saveToLibrary => 'Guardar en la biblioteca';

  @override
  String libraryMatch(String name) {
    return 'En tu biblioteca: $name';
  }

  @override
  String tagChipLabel(String chip) {
    return 'Chip: $chip';
  }

  @override
  String tagManufacturerLabel(String name) {
    return 'Fabricante: $name';
  }

  @override
  String get settingsLibrarySubtitle =>
      'Tus etiquetas con nombres, notas y fotos';

  @override
  String get showOnboardingAgain => 'Ver de nuevo la introducción';

  @override
  String get importFromGallery => 'Añadir desde plantillas';

  @override
  String get appearanceTitle => 'Apariencia';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get valuePresentRisky => 'Presente (puede ser arriesgado)';

  @override
  String get supportedValue => 'Compatible';

  @override
  String get notSupportedValue => 'No compatible';

  @override
  String get nfcUnsupportedDesc => 'Este dispositivo no admite NFC';

  @override
  String get ndefTrailingData => 'Datos de más tras el mensaje NDEF';

  @override
  String get ndefMissingEnd => 'Falta el final del mensaje NDEF';

  @override
  String vcardPhoneShort(String value) {
    return 'Tel.: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'Correo: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return 'Empresa: $value';
  }

  @override
  String get pageUidLock => 'UID / Bloqueo';

  @override
  String get pageData => 'Datos';

  @override
  String get pageLock => 'Bloqueo';

  @override
  String memoryPageLine(String page) {
    return 'Pág. $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (teléfono)';

  @override
  String get mapApple => 'Mapas de Apple';

  @override
  String get mapGoogle => 'Google Maps';

  @override
  String get whatsappMessageHint => 'Hola, quisiera información';

  @override
  String get facetimeTargetHint => '+34612345678 o nombre@icloud.com';

  @override
  String get bluetoothMacLabel => 'Dirección MAC Bluetooth';

  @override
  String get webAddressUrlLabel => 'Dirección web (URL)';

  @override
  String get latitudeLabel => 'Latitud (Lat)';

  @override
  String get longitudeLabel => 'Longitud (Lng)';

  @override
  String get emailAddressLabel => 'Correo electrónico';

  @override
  String get websiteLabel => 'Sitio web';

  @override
  String get wifiAuthWpa2Home => 'WPA2 Personal (estándar hogar/oficina)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 Personal (mixto)';

  @override
  String get hostLabel => 'Servidor / Host:';

  @override
  String get readOnlyLocked => 'Solo lectura (bloqueada)';

  @override
  String get redoTooltip => 'Rehacer';

  @override
  String historyFoundCount(String found, String total) {
    return 'Encontrados: $found / $total';
  }

  @override
  String get addToWriteListShort => 'Añadir a la lista';

  @override
  String get mimeTypeHint => 'application/json o text/plain';

  @override
  String get hapticsToggle => 'Vibración';

  @override
  String get hapticsToggleSubtitle =>
      'Vibración breve al terminar de leer o escribir';

  @override
  String get soundsToggle => 'Sonidos';

  @override
  String get soundsToggleSubtitle => 'Reproducir un breve sonido del sistema';

  @override
  String get backupLibraryMustBeList => 'La biblioteca debe ser una lista.';

  @override
  String get backupInvalidLibraryEntry => 'Entrada de biblioteca no válida.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'La biblioteca puede tener como máximo $max entradas.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'Biblioteca: $added añadidos';
  }

  @override
  String backupLibraryCount(String count) {
    return '• Biblioteca: $count (sin fotos)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return 'Última etiqueta: $bytes / $max B';
  }

  @override
  String get contentTooLargeForChips =>
      'Demasiado grande para etiquetas comunes; acorta el texto o usa un enlace corto.';

  @override
  String get tagReportTitle => 'Informe de etiqueta';

  @override
  String get tagReportSubtitle => 'Chip, bloqueos, contraseña y uso';

  @override
  String get tagReportPrompt => 'Acerque la etiqueta a revisar';

  @override
  String get tagReportBusy => 'Revisando la etiqueta...';

  @override
  String tagReportDone(String chip) {
    return 'Informe listo: $chip';
  }

  @override
  String get unknownChip => 'Chip desconocido';

  @override
  String get yes => 'Sí';

  @override
  String get reportChip => 'Chip';

  @override
  String get reportNdefFormatted => 'Con formato NDEF';

  @override
  String get reportWritable => 'Escribible';

  @override
  String get reportStaticLock => 'Bloqueo estático';

  @override
  String get reportDynamicLock => 'Bloqueo dinámico';

  @override
  String get reportPassword => 'Protección con contraseña';

  @override
  String get reportReadProtected => 'Lectura protegida';

  @override
  String get reportNdefUsage => 'Uso NDEF';

  @override
  String get reportVerdictWritable => 'Etiqueta lista para escribir';

  @override
  String get reportVerdictRestricted => 'La etiqueta tiene restricciones';

  @override
  String get reportCopied => 'Informe copiado';

  @override
  String get compareTagsTitle => 'Comparar dos etiquetas';

  @override
  String get compareTagsSubtitle =>
      'Comprueba si una copia coincide con el original';

  @override
  String get compareStepFirst =>
      'Primero escanea la primera etiqueta (original).';

  @override
  String get compareStepSecond => 'Ahora escanea la segunda etiqueta.';

  @override
  String get compareIdentical => 'El contenido coincide';

  @override
  String get compareDifferent => 'El contenido es distinto';

  @override
  String get compareSameTag => 'Se escaneó dos veces la misma etiqueta.';

  @override
  String get compareDifferentTags => 'Dos etiquetas distintas.';

  @override
  String get compareRecordSame => 'Igual';

  @override
  String get compareRecordChanged => 'Distinto';

  @override
  String get compareRecordOnlyFirst => 'Solo en A';

  @override
  String get compareRecordOnlySecond => 'Solo en B';

  @override
  String get compareBothEmpty => 'Ambas etiquetas están vacías.';

  @override
  String capacityExceededShort(String needed, String max) {
    return 'Contenido demasiado grande: $needed / $max bytes';
  }

  @override
  String get verifyFailedAfterWrite =>
      'No se pudo verificar; mantén la etiqueta más tiempo.';

  @override
  String get blankTagTitle => 'La etiqueta aún no está lista';

  @override
  String get blankTagBody =>
      'Esta etiqueta es nueva y no tiene formato NDEF. La app puede prepararla y escribir el contenido en un solo toque (NTAG y MIFARE Ultralight).';

  @override
  String get blankTagAction => 'Preparar y escribir';

  @override
  String get shareTag => 'Compartir';

  @override
  String get shareAsText => 'Compartir como texto';

  @override
  String get shareAsFile => 'Compartir como archivo (.json)';

  @override
  String get shareAsFileSubtitle =>
      'Los registros se pueden escribir igual en otro dispositivo';

  @override
  String get importFromJsonFile => 'Desde un archivo de etiqueta (.json)';

  @override
  String get invalidTagFile => 'Archivo de etiqueta no válido.';

  @override
  String get continuousScanTitle => 'Escaneo continuo';

  @override
  String get continuousScanSubtitle =>
      'Escanea etiquetas seguidas y comparte la lista en CSV';

  @override
  String continuousScanCount(String count) {
    return '$count etiquetas escaneadas';
  }

  @override
  String get exportCsv => 'Compartir como CSV';

  @override
  String get clearList => 'Vaciar lista';

  @override
  String get csvColumnTime => 'Hora';

  @override
  String get csvColumnRecords => 'Registros';

  @override
  String get csvColumnContent => 'Contenido';

  @override
  String get csvColumnCapacity => 'Capacidad (B)';

  @override
  String get csvColumnUsed => 'Usado (B)';

  @override
  String get batchSerialToggle => 'Añadir números de serie';

  @override
  String batchSerialHint(String token) {
    return 'Escribe $token en un registro para colocar ahí el número; si no, se añade a cada etiqueta un registro de texto con el número.';
  }

  @override
  String get batchSerialPrefix => 'Prefijo';

  @override
  String get batchSerialStart => 'Inicio';

  @override
  String get batchSerialDigits => 'Dígitos';

  @override
  String batchSerialPreview(String first, String last) {
    return 'Primero: $first · Último: $last';
  }

  @override
  String get batchFromCsvButton => 'Desde un CSV (una fila por etiqueta)';

  @override
  String get batchCsvTitle => 'Escritura por lotes desde CSV';

  @override
  String batchCsvSummary(String count) {
    return 'Se escribirán $count etiquetas. Cada una recibe una fila del CSV, en orden.';
  }

  @override
  String batchCsvTruncated(String max) {
    return 'La escritura por lotes usa como máximo $max filas; el resto se omitió.';
  }

  @override
  String get cloneTagTitle => 'Clonar etiqueta';

  @override
  String get cloneTagSubtitle =>
      'Lee una etiqueta y escribe su contenido en otras';

  @override
  String get cloneSourceStep =>
      'Paso 1: escanea la etiqueta de origen. Solo se copia el contenido NDEF; el UID no se puede clonar.';

  @override
  String get cloneSourceEmpty =>
      'La etiqueta de origen no tiene registros NDEF.';

  @override
  String get cloneReadyTitle => 'Origen leído';

  @override
  String cloneReadySummary(String count, String bytes) {
    return 'Se copiarán $count registros ($bytes bytes). Elige cuántas etiquetas escribir.';
  }

  @override
  String get cloneEditFirst => 'Editar primero';

  @override
  String get tapPreviewTitle => '¿Qué pasa al acercar un teléfono?';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'La etiqueta está vacía; no pasa nada.';

  @override
  String tapIosUrl(String target) {
    return 'Aparece una notificación; al tocarla, $target se abre en Safari o en la app correspondiente.';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target se abre directamente en el navegador o en la app correspondiente.';
  }

  @override
  String tapIosApp(String target) {
    return 'Aparece una notificación; la app se abre con «$target» si está instalada.';
  }

  @override
  String tapAndroidApp(String target) {
    return 'La app se abre con «$target» si está instalada.';
  }

  @override
  String tapIosCall(String target) {
    return 'Aparece una notificación; al tocarla se llama a $target.';
  }

  @override
  String tapAndroidCall(String target) {
    return 'La app de teléfono se abre con $target.';
  }

  @override
  String tapIosSms(String target) {
    return 'Aparece una notificación; Mensajes abre un mensaje nuevo para $target.';
  }

  @override
  String tapAndroidSms(String target) {
    return 'La app de mensajes se abre para $target.';
  }

  @override
  String tapIosEmail(String target) {
    return 'Aparece una notificación; Mail abre un correo nuevo para $target.';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'La app de correo se abre para $target.';
  }

  @override
  String get tapIosMap =>
      'El iPhone no abre ubicaciones «geo:» por sí solo. Usa un enlace de Apple o Google Maps (Enlaces rápidos).';

  @override
  String get tapAndroidMap => 'La app de mapas se abre en esta ubicación.';

  @override
  String get tapIosNeedsApp =>
      'El iPhone no hace nada con este contenido por sí solo; hay que leerlo con una app NFC.';

  @override
  String get tapAndroidText =>
      'En la mayoría de teléfonos no pasa nada o el texto aparece en una pantalla del sistema.';

  @override
  String get tapAndroidContact => 'Ofrece añadir el contacto.';

  @override
  String get tapAndroidWifi =>
      'Ofrece conectarse a la red (Android 10 o posterior).';

  @override
  String get tapAndroidCalendar =>
      'Si la app de calendario lo admite, ofrece añadir el evento.';

  @override
  String get tapAndroidOther =>
      'Solo se abre si hay una app compatible instalada.';

  @override
  String tapIgnoredRecords(String count) {
    return 'Los teléfonos solo ejecutan el primer registro; los otros $count se ven en apps NFC.';
  }

  @override
  String get tapIosRequirement =>
      'El iPhone XS o posterior lee en segundo plano si está desbloqueado y Cámara/Cartera no están abiertas.';

  @override
  String get galleryCatBusiness => 'Negocio';

  @override
  String get galleryCatSocial => 'Social';

  @override
  String get galleryCatHome => 'Hogar';

  @override
  String get galleryCatPersonal => 'Personal';

  @override
  String get galleryCatAutomation => 'Automatización';

  @override
  String get galleryFavorites => 'Favoritos';

  @override
  String get gallerySearchHint => 'Buscar plantillas...';

  @override
  String get galleryNoResults => 'No hay plantillas que coincidan.';

  @override
  String get galleryAddFavorite => 'Añadir a favoritos';

  @override
  String get galleryRemoveFavorite => 'Quitar de favoritos';

  @override
  String get presetEventTitle => 'Invitación a evento';

  @override
  String get presetEventDesc =>
      'Escribe el evento en formato iCalendar; Android puede añadirlo al calendario.';

  @override
  String get eventNameLabel => 'Nombre del evento';

  @override
  String get eventDateLabel => 'Fecha (AAAA-MM-DD)';

  @override
  String get eventTimeLabel => 'Hora (HH:MM)';

  @override
  String get eventDateTimeInvalid =>
      'Fecha u hora no válida. Ejemplo: 2026-12-31 y 19:00';

  @override
  String get presetLuggageTitle => 'Etiqueta de equipaje';

  @override
  String get presetLuggageDesc =>
      'Si se pierde, quien lo encuentre podrá contactarte.';

  @override
  String luggageMessage(String name, String contact) {
    return 'Este equipaje pertenece a $name. Si lo encuentras, contacta: $contact';
  }

  @override
  String get presetPlaylistTitle => 'Lista de reproducción';

  @override
  String get presetPlaylistDesc =>
      'Abre una lista de Spotify, Apple Music o YouTube.';

  @override
  String get playlistLinkLabel => 'Enlace de la lista';

  @override
  String get presetEmailMeTitle => 'Escríbeme';

  @override
  String get presetEmailMeDesc =>
      'Abre un correo nuevo para ti con el asunto listo.';

  @override
  String get presetCallMeTitle => 'Llámame';

  @override
  String get presetCallMeDesc => 'El teléfono llama a tu número.';

  @override
  String get presetRunShortcutTitle => 'Ejecutar un atajo';

  @override
  String get presetRunShortcutDesc =>
      'Ejecuta el atajo de iPhone indicado: encender luces, poner música, cambiar Concentración...';

  @override
  String get shortcutNameLabel => 'Nombre del atajo';

  @override
  String get recipesSection => 'Recetas de automatización';

  @override
  String get recipesIntro =>
      'Crea en Atajos un atajo con el nombre indicado y añade las acciones. Luego vincúlalo a una automatización NFC o usa «Añadir a la etiqueta» para escribir un enlace que lo ejecute.';

  @override
  String get recipeAddToTag => 'Añadir a la etiqueta';

  @override
  String get recipeBedTitle => 'Buenas noches';

  @override
  String get recipeBedActions =>
      'Mesilla: Concentración Dormir · poner alarma · apagar luces';

  @override
  String get recipeCarTitle => 'Modo coche';

  @override
  String get recipeCarActions =>
      'Soporte coche: Concentración Conducción · ruta a casa · música';

  @override
  String get recipeDoorTitle => 'Ya estoy en casa';

  @override
  String get recipeDoorActions =>
      'Entrada: luces · Wi-Fi activado · mensaje «Ya llegué» a la familia';

  @override
  String get recipeDeskTitle => 'Modo trabajo';

  @override
  String get recipeDeskActions =>
      'Escritorio: Concentración Trabajo · temporizador 25 min · lista de música';

  @override
  String get recipeGymTitle => 'Entreno';

  @override
  String get recipeGymActions =>
      'Bolsa de deporte: iniciar entreno · lista de música · No molestar';

  @override
  String get recipeKitchenTitle => 'Temporizador de cocina';

  @override
  String get recipeKitchenActions =>
      'Cocina: temporizador 10 min · abrir la lista de la compra';

  @override
  String get libraryLabelsField => 'Etiquetas / carpetas (separadas por comas)';

  @override
  String get libraryLabelsHint => 'oficina, planta 2';

  @override
  String librarySaveFailed(String error) {
    return 'No se pudo guardar: $error';
  }

  @override
  String get csvColumnLabels => 'Etiquetas';

  @override
  String get firstNameLabel => 'Nombre';

  @override
  String get lastNameLabel => 'Apellido';

  @override
  String get wifiPasswordMinHint => 'Al menos 8 caracteres';

  @override
  String get emailExampleHint => 'nombre@ejemplo.com';

  @override
  String get wifiSsidExampleHint => 'Casa_WiFi_5G';

  @override
  String get nfcErrUnavailable =>
      'El NFC no está disponible o está desactivado en este dispositivo.';

  @override
  String get nfcErrBusy =>
      'Hay otra operación NFC en curso; espera a que termine.';

  @override
  String get nfcErrCancelled => 'La operación se canceló.';

  @override
  String get nfcErrAppPaused =>
      'La operación se canceló porque la app pasó a segundo plano.';

  @override
  String get nfcErrUnsupportedTag => 'Este tipo de etiqueta no es compatible.';

  @override
  String get nfcErrNtagOnly =>
      'Esta herramienta solo funciona con etiquetas NTAG / MIFARE Ultralight.';

  @override
  String get nfcErrNotNdefRead =>
      'Etiqueta detectada, pero no tiene formato NDEF.';

  @override
  String get nfcErrNotNdefWrite =>
      'La etiqueta no tiene formato NDEF; este teléfono no puede escribir NDEF directamente.';

  @override
  String get nfcErrReadOnly => 'La etiqueta es de solo lectura (bloqueada).';

  @override
  String get nfcErrNoData => 'No hay datos para escribir.';

  @override
  String nfcErrCapacity(String required, String max) {
    return 'Espacio insuficiente: se necesitan $required bytes y hay $max.';
  }

  @override
  String get nfcErrCapacityShort => 'Espacio insuficiente en la etiqueta.';

  @override
  String get nfcErrVerify =>
      'Falló la verificación: los datos leídos no coinciden.';

  @override
  String get nfcErrConnectionLost =>
      'Se perdió la conexión con la etiqueta; mantenla quieta e inténtalo de nuevo.';

  @override
  String get nfcErrAlreadyLocked =>
      'La etiqueta ya está bloqueada (solo lectura).';

  @override
  String get nfcErrLockNotNdef =>
      'La etiqueta no tiene formato NDEF; escribe un registro antes de bloquearla.';

  @override
  String get nfcErrLockNotSupported =>
      'Este tipo de etiqueta no admite bloqueo.';

  @override
  String get nfcSheetConnected => 'Etiqueta conectada, procesando...';

  @override
  String get nfcSheetReadOk => '¡Etiqueta leída!';

  @override
  String get nfcSheetEmptyRead => '¡Etiqueta vacía leída!';

  @override
  String get nfcSheetMultipleTags =>
      'Se detectó más de una etiqueta. Acerca solo una.';

  @override
  String get nfcSheetWriteVerified => '¡Escrito y verificado!';

  @override
  String get nfcSheetWritten => '¡Escrito en la etiqueta!';

  @override
  String get nfcSheetLocked => '¡La etiqueta quedó bloqueada para siempre!';

  @override
  String get nfcWriteDone => 'Escrito en la etiqueta correctamente.';

  @override
  String get errorWidgetMessage =>
      'No se pudo mostrar esta parte. Vuelve atrás e inténtalo de nuevo.';
}
