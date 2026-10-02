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
  String get addRule => 'Añadir regla';

  @override
  String get addTag => 'Añadir etiqueta';

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
  String get allRulesCleared => 'Todas las reglas eliminadas';

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
  String get backupExportSuccess => 'Copia de seguridad guardada con éxito';

  @override
  String get backupFileSizeExceeded => 'El archivo de copia supera 2 MiB.';

  @override
  String get backupHistoryMustBeList =>
      'El campo \"history\" debe ser una lista.';

  @override
  String backupImportFailed(String error) {
    return 'Error al importar la copia de seguridad: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'Copia importada: se añadieron $templates plantillas, $rules reglas y $history registros';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'ID no válido en Base64: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Carga útil no válida en Base64: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Tipo no válido en Base64: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'Formato JSON no válido: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Nota de regla no válida.';

  @override
  String get backupInvalidRuleSha => 'Hash SHA-256 no válido.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'Fecha de creación no válida: $date';
  }

  @override
  String get backupInvalidTemplateId => 'ID de plantilla no válido.';

  @override
  String get backupInvalidTemplateName => 'Nombre de plantilla no válido.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'Valor TNF no válido ($tnf). Debe estar entre 0 y 7.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Superado el límite de $max elementos de historial ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'Superado el límite de $max registros ($count).';
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
  String get backupRecordsMustBeList => 'Los registros deben ser una lista.';

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
  String get batchWrite => 'Escritura por lotes';

  @override
  String get bluetoothDeviceName => 'Nombre del dispositivo (Opcional)';

  @override
  String get bluetoothMac => 'Dirección MAC Bluetooth';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'Bytes escritos: $bytes | Verificación: $status';
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
  String get clearAllRulesConfirm =>
      '¿Eliminar todas las notas locales guardadas?';

  @override
  String get clearConfirmButton => 'Sí, borrar';

  @override
  String get clearConfirmMessage =>
      'Se borrarán todos los registros NDEF y se escribirá un registro vacío. ¿Desea continuar?';

  @override
  String get clearConfirmTitle => 'Restablecer contenido';

  @override
  String get clearHistory => 'Borrar historial';

  @override
  String get clearList => 'Limpiar lista';

  @override
  String get clearTagSubtitle =>
      'Elimina todos los registros y escribe un NDEF vacío';

  @override
  String get clearTagTitle => 'Borrar etiqueta';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros listos en el portapapeles',
      one: '1 registro listo en el portapapeles',
    );
    return '$_temp0 ($bytes B) · $source';
  }

  @override
  String get close => 'Cerrar';

  @override
  String get commandsEmptyError => 'Introduzca al menos un comando.';

  @override
  String get commandsLabel => 'Comandos';

  @override
  String get composeRecordTitle => 'Añadir registro';

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
  String get contactNote => 'Nota';

  @override
  String get contactPhone => 'Teléfono';

  @override
  String get contactTitle => 'Cargo / Puesto';

  @override
  String get contactWebsite => 'Sitio web';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros',
      one: '1 registro',
    );
    return 'Contenido: $_temp0 · $content';
  }

  @override
  String get copy => 'Copiar';

  @override
  String get copyAllRecords => 'Copiar todos los registros';

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
  String deleteTagConfirmContent(String name) {
    return '¿Eliminar \"$name\" de la biblioteca? La etiqueta física no cambiará.';
  }

  @override
  String get deleteTagConfirmTitle => 'Eliminar etiqueta';

  @override
  String get deleteTemplateTooltip => 'Eliminar plantilla';

  @override
  String get deviceNameTooLong => 'Nombre de dispositivo demasiado largo.';

  @override
  String get dismiss => 'Descartar';

  @override
  String get editRecordTitle => 'Editar registro';

  @override
  String get editRule => 'Editar regla';

  @override
  String get editTag => 'Editar etiqueta';

  @override
  String get emailBody => 'Cuerpo del mensaje';

  @override
  String get emailRecipient => 'Destinatario';

  @override
  String get emailSubject => 'Asunto';

  @override
  String get emptyComposerSubtitle =>
      'Toque \"Añadir registro\" para crear URL web, texto, Wi-Fi, tarjeta de contacto y más.';

  @override
  String get emptyComposerTitle => 'Aún no hay registros';

  @override
  String get emptyHistorySubtitle =>
      'Los registros escaneados se mostrarán aquí.';

  @override
  String get emptyHistoryTitle => 'Sin historial de escaneos';

  @override
  String get emptyLibrary =>
      'No hay etiquetas guardadas aún.\nEscanee una etiqueta y guárdela aquí con nombre y foto.';

  @override
  String get eventDescription => 'Descripción';

  @override
  String get eventEnd => 'Fin';

  @override
  String get eventLocation => 'Lugar / Ubicación';

  @override
  String get eventStart => 'Inicio';

  @override
  String get eventTitle => 'Título del evento';

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
  String get fieldTextPrompt => 'Texto a escribir en la etiqueta';

  @override
  String get fieldUrlPrompt => 'Dirección web (https://...)';

  @override
  String get fileUrl => 'Enlace del archivo (URL)';

  @override
  String get filterAll => 'Todas';

  @override
  String get flashlight => 'Linterna';

  @override
  String get formatConfirmButton => 'Formatear';

  @override
  String get formatConfirmMessage =>
      'Se borrarán los datos y se preparará como etiqueta NDEF vacía. ¿Desea continuar?';

  @override
  String get formatMemorySubtitle =>
      'Prepara para NDEF (etiquetas vacías o corruptas)';

  @override
  String get formatMemoryTitle => 'Formatear memoria';

  @override
  String get hardwareAvailable => 'Hardware NFC listo';

  @override
  String get hardwareDisabled => 'NFC desactivado';

  @override
  String get hardwareNotSupported => 'NFC no compatible';

  @override
  String get historyFilteredEmpty =>
      'No se encontraron coincidencias en el historial.';

  @override
  String get idTooLarge => 'El ID no puede superar 255 bytes';

  @override
  String get importBackup => 'Importar (Combinar)';

  @override
  String get importCsv => 'Importar CSV';

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
  String get latitude => 'Latitud (Lat)';

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
  String get loadToComposerTooltip => 'Cargar en el compositor';

  @override
  String get locationHint => 'Ej: Puerta del frigorífico';

  @override
  String get locationLabel => '¿Dónde está?';

  @override
  String get lockAcknowledge => 'Entiendo que esta acción no se puede deshacer';

  @override
  String get lockButton => 'Bloquear';

  @override
  String get lockTagSubtitle =>
      'Convierte en solo lectura permanentemente (irreversible)';

  @override
  String get lockTagTitle => 'Bloquear etiqueta';

  @override
  String get lockWarning =>
      'Una etiqueta bloqueada será de solo lectura permanente: su contenido NO se podrá cambiar ni desbloquear. Compruébelo antes.';

  @override
  String get longitude => 'Longitud (Lng)';

  @override
  String get manage => 'Gestionar';

  @override
  String get matchedRule => 'Regla / Nota coincidente';

  @override
  String get mimePayloadHex => 'Carga útil (Hex / Texto)';

  @override
  String get mimeTypeLabel => 'Tipo MIME';

  @override
  String get nameRequired => 'Indique un nombre para la etiqueta.';

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
  String get ndefRecordsTitle => 'Registros NDEF';

  @override
  String get nfcPromptClear =>
      'Acerque la etiqueta al dispositivo para restablecerla';

  @override
  String get nfcPromptLock =>
      'Acerque la etiqueta para bloquearla permanentemente';

  @override
  String get nfcPromptScan =>
      'Acerque la etiqueta NFC al dispositivo para leerla';

  @override
  String get nfcPromptWrite => 'Acerque la etiqueta NFC para guardar los datos';

  @override
  String get no => 'No';

  @override
  String get noContentInTag => 'No hay contenido en esta entrada.';

  @override
  String get noLibraryMatches => 'No hay etiquetas coincidentes.';

  @override
  String get noRecordsOnTag =>
      'No se encontraron registros NDEF en la etiqueta.';

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
  String pageN(int page) {
    return 'Página $page';
  }

  @override
  String get pageRoleCc => 'CC';

  @override
  String get pageRoleData => 'Datos';

  @override
  String get pageRoleLock => 'Bloqueo';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / Bloqueo';

  @override
  String get passwordDialogAction => 'Configurar';

  @override
  String get passwordDialogTitle => 'Establecer contraseña';

  @override
  String get passwordDialogWarning =>
      'Si olvida la contraseña, no podrá volver a cambiar el contenido. La lectura seguirá siendo pública.';

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
  String get rawInspection => 'Inspección detallada';

  @override
  String get rawRecordDetailsTitle => 'Detalles del registro (Solo lectura)';

  @override
  String get rawRecordEditorTitle => 'Editar registro NDEF sin formato';

  @override
  String get readHeroButton => 'Iniciar escaneo';

  @override
  String get readHeroEyebrow => 'LECTOR NFC';

  @override
  String get readHeroScanning => 'Escaneando...';

  @override
  String get readHeroSubtitle =>
      'Acerque la parte superior del teléfono a una etiqueta NFC para leer sus registros NDEF y datos de hardware.';

  @override
  String get readHeroTitle => 'Escanear etiqueta';

  @override
  String get readMemorySubtitle =>
      'Memoria sin procesar página a página; copiar o guardar como .bin';

  @override
  String get readMemoryTitle => 'Leer memoria';

  @override
  String get readyTemplates => 'Plantillas listas';

  @override
  String get recordCopied => 'Contenido copiado';

  @override
  String recordIndex(int index) {
    return 'Registro #$index';
  }

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
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros copiados',
      one: '1 registro copiado',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'Rehacer';

  @override
  String get removePasswordDialogTitle => 'Quitar contraseña';

  @override
  String get removePasswordDialogWarning =>
      'Introduzca la contraseña actual de la etiqueta.';

  @override
  String get removePasswordSubtitle =>
      'Elimina la protección con la contraseña conocida';

  @override
  String get removePasswordTitle => 'Quitar contraseña';

  @override
  String get removePhoto => 'Quitar';

  @override
  String get rewriteTag => 'Reescribir';

  @override
  String ruleDeleteConfirm(String note) {
    return '¿Eliminar la regla con nota \"$note\"?';
  }

  @override
  String get ruleDeleted => 'Regla eliminada';

  @override
  String get ruleNoteDialogTitle => 'Editar nota de etiqueta';

  @override
  String get ruleNoteHint => 'Ej: Estante #4 o Sala de reuniones';

  @override
  String get ruleNoteLabel => 'Nota / Descripción local';

  @override
  String get ruleSaved => 'Regla guardada';

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
  String get saveTemplateDialogTitle => 'Guardar como plantilla';

  @override
  String get saveToLibrary => 'Guardar en biblioteca';

  @override
  String get scanFabLabel => 'Escanear etiqueta';

  @override
  String get scanQrToRecord => 'Escanear QR';

  @override
  String get scannedTag => 'Etiqueta escaneada';

  @override
  String get searchEngine => 'Buscador';

  @override
  String get searchHistoryHint =>
      'Buscar en historial (UID, contenido, tipo)...';

  @override
  String get searchLibraryHint => 'Buscar por nombre, nota, lugar o contenido';

  @override
  String get searchQuery => 'Término de búsqueda';

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
  String get shareRecords => 'Compartir';

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
  String get socialNetwork => 'Plataforma';

  @override
  String get socialUsername => 'Usuario / Perfil';

  @override
  String get sourceComposer => 'Registros en la lista de escritura';

  @override
  String get sourceEmpty => 'Sin contenido (solo nota)';

  @override
  String get sourceLastScan => 'Última etiqueta escaneada';

  @override
  String get sourceSelectPrompt => '¿De dónde se debe tomar el contenido?';

  @override
  String get statusCancelled => 'Operación cancelada.';

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
  String get tabApp => 'Aplicación';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'Calendario';

  @override
  String get tabContact => 'Contacto (vCard)';

  @override
  String get tabCustomMime => 'MIME personalizado';

  @override
  String get tabEmail => 'Correo';

  @override
  String get tabFile => 'Archivo';

  @override
  String get tabLocation => 'Ubicación';

  @override
  String get tabPhone => 'Teléfono';

  @override
  String get tabSearch => 'Búsqueda';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'Redes sociales';

  @override
  String get tabText => 'Texto';

  @override
  String get tabUrl => 'URL Web';

  @override
  String get tabVideo => 'Vídeo';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'Capacidad';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max bytes ($available bytes libres)';
  }

  @override
  String get tagInfoTitle => 'Información de la etiqueta';

  @override
  String get tagLibraryTitle => 'Mi biblioteca de etiquetas';

  @override
  String get tagNameHint => 'Ej: Etiqueta de la cocina';

  @override
  String get tagNameLabel => 'Nombre';

  @override
  String get tagReadOnly => 'Solo lectura (Bloqueada)';

  @override
  String tagRulesCount(int count) {
    return 'Reglas / notas guardadas: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Muestra solo la nota guardada según el hash SHA-256 exacto del contenido NDEF.';

  @override
  String get tagSerialNumber => 'Número de serie (UID)';

  @override
  String get tagTechnology => 'Tecnología';

  @override
  String get tagType => 'Tipo';

  @override
  String get tagUidCopied => 'UID de etiqueta copiado';

  @override
  String get tagWritable => 'Modificable';

  @override
  String get takePhoto => 'Hacer foto';

  @override
  String get templateGalleryTitle => 'Plantillas listas';

  @override
  String get templateNameHint => 'Nombre de la plantilla';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Registros',
      one: '1 Registro',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'Plantilla guardada con éxito';

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
  String get totalBytes => 'Tamaño total';

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
  String get verificationNotChecked => 'No comprobada';

  @override
  String get verificationPassed => 'Correcta';

  @override
  String get videoUrlCannotBeEmpty =>
      'El enlace de vídeo no puede estar vacío.';

  @override
  String get videoUrlOrId => 'Enlace de vídeo o ID de YouTube';

  @override
  String get videoUrlOrIdPrompt =>
      'Introduzca URL (https://...) o ID del vídeo.';

  @override
  String get wifiAuthOpen => 'Abierta (Sin clave)';

  @override
  String get wifiAuthType => 'Tipo de seguridad';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'Red oculta';

  @override
  String get wifiPassword => 'Contraseña';

  @override
  String get wifiSsid => 'Nombre de la red (SSID)';

  @override
  String get withSiri => 'Con Siri';

  @override
  String get writeDumpConfirmButton => 'Escribir';

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
  String get writeHeroButton => 'Iniciar escritura';

  @override
  String get writeHeroEyebrow => 'ESCRITOR NDEF';

  @override
  String get writeHeroSubtitle =>
      'Prepare varios registros NDEF y escríbalos en la etiqueta NFC de una sola vez.';

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
  String get yes => 'Sí';
}
