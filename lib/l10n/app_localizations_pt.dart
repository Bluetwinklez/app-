// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get addRecord => 'Adicionar registo';

  @override
  String get addRule => 'Adicionar regra';

  @override
  String get addTag => 'Adicionar etiqueta';

  @override
  String get addToComposerList => 'Adicionar à lista de gravação';

  @override
  String get addToWriteList => 'Adicionar à lista de gravação';

  @override
  String get addressCannotBeEmpty => 'A morada não pode estar vazia.';

  @override
  String get advancedCommandsDesc =>
      'Um comando hex por linha. Ex: 60 = GET_VERSION, 30 04 = ler página 4. Comandos incorretos podem danificar a etiqueta.';

  @override
  String get advancedCommandsSubtitle =>
      'Envia comandos hexadecimais brutos para a etiqueta';

  @override
  String get advancedCommandsTitle => 'Comandos NFC avançados';

  @override
  String get allRulesCleared => 'Todas as regras eliminadas';

  @override
  String get appLinksDesc =>
      'Ao gravá-las numa etiqueta, tocá-la apresenta uma notificação e abre a app no respetivo ecrã.';

  @override
  String get appLinksSection => 'Ligações da aplicação';

  @override
  String get appPackageName => 'Nome do pacote Android';

  @override
  String get appSettings => 'Definições da aplicação';

  @override
  String get appTitle => 'NFC Tag Master';

  @override
  String get autoRunOnTap => 'Executar automaticamente ao encostar';

  @override
  String get backupExportSuccess =>
      'Ficheiro de cópia de segurança guardado com sucesso';

  @override
  String get backupFileSizeExceeded => 'O tamanho do ficheiro excede 2 MiB.';

  @override
  String get backupHistoryMustBeList =>
      'O campo \"history\" deve ser uma lista.';

  @override
  String backupImportFailed(String error) {
    return 'Falha ao importar cópia de segurança: $error';
  }

  @override
  String backupImportSuccess(int history, int rules, int templates) {
    return 'Cópia importada com sucesso: $templates modelos, $rules regras e $history históricos adicionados';
  }

  @override
  String backupInvalidBase64Id(String id) {
    return 'ID inválido em Base64: $id';
  }

  @override
  String backupInvalidBase64Payload(String payload) {
    return 'Carga útil inválida em Base64: $payload';
  }

  @override
  String backupInvalidBase64Type(String type) {
    return 'Tipo inválido em Base64: $type';
  }

  @override
  String backupInvalidJson(String error) {
    return 'Formato JSON inválido: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Nota de regra inválida.';

  @override
  String get backupInvalidRuleSha => 'Hash SHA-256 de regra inválido.';

  @override
  String backupInvalidTemplateCreatedAt(String date) {
    return 'Data de criação do modelo inválida: $date';
  }

  @override
  String get backupInvalidTemplateId => 'ID de modelo inválido.';

  @override
  String get backupInvalidTemplateName => 'Nome de modelo inválido.';

  @override
  String backupInvalidTnf(String tnf) {
    return 'Valor TNF inválido ($tnf). Deve situar-se entre 0 e 7.';
  }

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Limite de $max históricos excedido ($count).';
  }

  @override
  String backupMaxRecordsExceeded(int count, int max) {
    return 'Limite de $max registos excedido ($count).';
  }

  @override
  String backupMaxTagRulesExceeded(int count, int max) {
    return 'Limite de $max regras excedido ($count).';
  }

  @override
  String backupMaxTemplatesExceeded(int count, int max) {
    return 'Limite de $max modelos excedido ($count).';
  }

  @override
  String get backupMissingSchemaVersion => 'Campo \"schemaVersion\" em falta.';

  @override
  String get backupRecordMustBeObject =>
      'Cada registo NDEF deve ser um objeto JSON.';

  @override
  String get backupRecordsMustBeList => 'Os registos devem ser uma lista.';

  @override
  String get backupRestoreSubtitle =>
      'Guarde os seus modelos, notas e histórico em formato JSON ou sincronize com os dados existentes.';

  @override
  String get backupRestoreTitle => 'Cópia de segurança e Restauro (JSON)';

  @override
  String get backupRootMustBeObject => 'A raiz deve ser um objeto JSON.';

  @override
  String get backupRuleMustBeObject => 'Cada regra deve ser um objeto JSON.';

  @override
  String get backupSchemaVersionMustBeInt =>
      'O campo \"schemaVersion\" deve ser um número inteiro.';

  @override
  String backupSizeExceeded(int bytes) {
    return 'A cópia excede o limite de 2 MiB ($bytes bytes).';
  }

  @override
  String get backupTagRulesMustBeList =>
      'O campo \"tagRules\" deve ser uma lista.';

  @override
  String get backupTemplateMustBeObject =>
      'Cada modelo deve ser um objeto JSON.';

  @override
  String get backupTemplatesMustBeList =>
      'O campo \"templates\" deve ser uma lista.';

  @override
  String backupUnsupportedSchemaVersion(String version) {
    return 'Versão de esquema não suportada: $version.';
  }

  @override
  String get batchWrite => 'Gravação em lote';

  @override
  String get bluetoothDeviceName => 'Nome do dispositivo (Opcional)';

  @override
  String get bluetoothMac => 'Endereço MAC Bluetooth';

  @override
  String bytesWrittenWithVerification(int bytes, String status) {
    return 'Bytes gravados: $bytes | Verificação: $status';
  }

  @override
  String cameraError(String error) {
    return 'Não foi possível aceder à câmara. Permita o acesso em Definições > Privacidade > Câmara.\n($error)';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get catBusiness => 'Empresa';

  @override
  String get catCar => 'Carro';

  @override
  String get catHome => 'Casa';

  @override
  String get catOther => 'Outro';

  @override
  String get catPersonal => 'Pessoal';

  @override
  String get catWork => 'Trabalho';

  @override
  String get categoryLabel => 'Categoria';

  @override
  String get chooseFromGallery => 'Escolher da galeria';

  @override
  String get clear => 'Limpar';

  @override
  String get clearAll => 'Limpar tudo';

  @override
  String get clearAllRulesConfirm =>
      'Eliminar todas as notas locais guardadas?';

  @override
  String get clearConfirmButton => 'Sim, limpar';

  @override
  String get clearConfirmMessage =>
      'Esta ação irá apagar todos os registos NDEF gravando um registo vazio. Pretende continuar?';

  @override
  String get clearConfirmTitle => 'Repor conteúdo da etiqueta';

  @override
  String get clearHistory => 'Limpar histórico';

  @override
  String get clearList => 'Limpar lista';

  @override
  String get clearTagSubtitle =>
      'Elimina todos os registos e grava um NDEF vazio';

  @override
  String get clearTagTitle => 'Limpar etiqueta';

  @override
  String clipboardBanner(int bytes, int count, String source) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registos na área de transferência',
      one: '1 registo na área de transferência',
    );
    return '$_temp0 ($bytes B) · $source';
  }

  @override
  String get close => 'Fechar';

  @override
  String get commandsEmptyError => 'Introduza pelo menos um comando.';

  @override
  String get commandsLabel => 'Comandos';

  @override
  String get composeRecordTitle => 'Adicionar registo';

  @override
  String get confirmClearHistoryContent =>
      'Todo o histórico de leituras guardado no dispositivo será eliminado. Tem a certeza?';

  @override
  String get confirmClearHistoryTitle => 'Limpar histórico';

  @override
  String get confirmClearTemplatesContent =>
      'Todos os modelos de gravação guardados serão eliminados. Tem a certeza?';

  @override
  String get confirmClearTemplatesTitle => 'Limpar modelos';

  @override
  String get contactCompany => 'Empresa / Instituição';

  @override
  String get contactEmail => 'E-mail';

  @override
  String get contactFullName => 'Nome completo';

  @override
  String get contactNote => 'Nota';

  @override
  String get contactPhone => 'Telefone';

  @override
  String get contactTitle => 'Cargo / Título';

  @override
  String get contactWebsite => 'Website';

  @override
  String contentSummary(String content, int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registos',
      one: '1 registo',
    );
    return 'Conteúdo: $_temp0 · $content';
  }

  @override
  String get copy => 'Copiar';

  @override
  String get copyAllRecords => 'Copiar todos os registos';

  @override
  String get copyTagUid => 'Copiar UID';

  @override
  String get copyToComposer => 'Copiar para lista de gravação';

  @override
  String get csvInvalidAddress => 'endereço inválido.';

  @override
  String get csvInvalidEmail => 'e-mail inválido.';

  @override
  String get csvInvalidLocation =>
      'indique latitude e longitude (ex.: localizacao,41.0082,28.9784).';

  @override
  String csvMaxRowsExceeded(int max) {
    return 'Foram importados no máximo $max registos; linhas restantes ignoradas.';
  }

  @override
  String csvRowEmptyValue(int row) {
    return 'Linha $row: valor vazio.';
  }

  @override
  String csvRowError(String error, int row) {
    return 'Linha $row: $error';
  }

  @override
  String csvUnknownType(String type) {
    return 'tipo desconhecido \"$type\".';
  }

  @override
  String get csvWifiPasswordLength =>
      'A palavra-passe Wi-Fi deve ter entre 8 e 63 carateres.';

  @override
  String get delete => 'Eliminar';

  @override
  String deleteTagConfirmContent(String name) {
    return 'Eliminar \"$name\" da biblioteca? A etiqueta física não será alterada.';
  }

  @override
  String get deleteTagConfirmTitle => 'Eliminar etiqueta';

  @override
  String get deleteTemplateTooltip => 'Eliminar modelo';

  @override
  String get deviceNameTooLong => 'Nome do dispositivo demasiado longo.';

  @override
  String get dismiss => 'Dispensar';

  @override
  String get editRecordTitle => 'Editar registo';

  @override
  String get editRule => 'Editar regra';

  @override
  String get editTag => 'Editar etiqueta';

  @override
  String get emailBody => 'Corpo do e-mail';

  @override
  String get emailRecipient => 'Destinatário';

  @override
  String get emailSubject => 'Assunto';

  @override
  String get emptyComposerSubtitle =>
      'Toque em \"Adicionar registo\" para criar endereços Web, texto, Wi-Fi, contactos e mais.';

  @override
  String get emptyComposerTitle => 'Nenhum registo adicionado';

  @override
  String get emptyHistorySubtitle => 'As etiquetas lidas surgirão aqui.';

  @override
  String get emptyHistoryTitle => 'Sem histórico de leitura';

  @override
  String get emptyLibrary =>
      'Nenhuma etiqueta guardada ainda.\nLeia uma etiqueta e guarde-a aqui com nome e foto.';

  @override
  String get eventDescription => 'Descrição';

  @override
  String get eventEnd => 'Fim';

  @override
  String get eventLocation => 'Local';

  @override
  String get eventStart => 'Início';

  @override
  String get eventTitle => 'Título do evento';

  @override
  String get exportBackup => 'Exportar';

  @override
  String get facetimePrompt =>
      'Introduza o número de telefone ou e-mail do ID Apple.';

  @override
  String fieldCannotBeEmpty(String field) {
    return '\"$field\" não pode estar vazio.';
  }

  @override
  String get fieldTextPrompt => 'Texto a gravar na etiqueta';

  @override
  String get fieldUrlPrompt => 'Endereço web (https://...)';

  @override
  String get fileUrl => 'URL do ficheiro';

  @override
  String get filterAll => 'Todas';

  @override
  String get flashlight => 'Lanterna';

  @override
  String get formatConfirmButton => 'Formatar';

  @override
  String get formatConfirmMessage =>
      'Os dados existentes serão apagados e formatados como NDEF em branco. Continuar?';

  @override
  String get formatMemorySubtitle =>
      'Prepara para NDEF (etiquetas vazias ou corrompidas)';

  @override
  String get formatMemoryTitle => 'Formatar memória';

  @override
  String get hardwareAvailable => 'Hardware NFC pronto';

  @override
  String get hardwareDisabled => 'NFC desativado';

  @override
  String get hardwareNotSupported => 'NFC não suportado';

  @override
  String get historyFilteredEmpty =>
      'Nenhum resultado encontrado no histórico.';

  @override
  String get idTooLarge => 'O comprimento do ID não pode exceder 255 bytes';

  @override
  String get importBackup => 'Importar (Unir)';

  @override
  String get importCsv => 'Importar CSV';

  @override
  String get inAppTagRules => 'Regras locais de etiqueta';

  @override
  String get invalidHexId => 'ID hexadecimal inválido';

  @override
  String get invalidHexPayload => 'Carga útil hexadecimal inválida';

  @override
  String get invalidHexType => 'Tipo hexadecimal inválido';

  @override
  String get languageTitle => 'Dil / Language';

  @override
  String get latitude => 'Latitude (Lat)';

  @override
  String get linkCopied => 'Ligação copiada';

  @override
  String get linkHistoryDesc => 'Abre o histórico';

  @override
  String get linkScanDesc => 'Abre a app e inicia a leitura';

  @override
  String get linkToolsDesc => 'Abre o ecrã de ferramentas';

  @override
  String get linkWriteDesc => 'Abre o ecrã de gravação';

  @override
  String get loadToComposerTooltip => 'Carregar no compositor';

  @override
  String get locationHint => 'Ex.: Porta do frigorífico';

  @override
  String get locationLabel => 'Onde se encontra?';

  @override
  String get lockAcknowledge => 'Compreendo que esta ação não pode ser anulada';

  @override
  String get lockButton => 'Bloquear';

  @override
  String get lockTagSubtitle =>
      'Torna a etiqueta apenas de leitura permanentemente';

  @override
  String get lockTagTitle => 'Bloquear etiqueta';

  @override
  String get lockWarning =>
      'Uma etiqueta bloqueada torna-se permanentemente apenas de leitura: NÃO poderá ser alterada nem desbloqueada.';

  @override
  String get longitude => 'Longitude (Lng)';

  @override
  String get manage => 'Gerir';

  @override
  String get matchedRule => 'Regra / Nota associada';

  @override
  String get mimePayloadHex => 'Carga útil (Hex / Texto)';

  @override
  String get mimeTypeLabel => 'Tipo MIME';

  @override
  String get nameRequired => 'Indique um nome para a etiqueta.';

  @override
  String get navHistory => 'Hist.';

  @override
  String get navHistoryTitle => 'Histórico';

  @override
  String get navRead => 'Ler';

  @override
  String get navReadTitle => 'Ler etiqueta';

  @override
  String get navSettings => 'Ajustes';

  @override
  String get navSettingsTitle => 'Modelos e Ajustes';

  @override
  String get navTools => 'Ferram.';

  @override
  String get navToolsTitle => 'Ferramentas';

  @override
  String get navWrite => 'Gravar';

  @override
  String get navWriteTitle => 'Gravar etiqueta';

  @override
  String ndefRecordsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Registos',
      one: '1 Registo',
    );
    return '$_temp0';
  }

  @override
  String get ndefRecordsTitle => 'Registos NDEF';

  @override
  String get nfcPromptClear => 'Aproxime a etiqueta para restaurar';

  @override
  String get nfcPromptLock =>
      'Aproxime a etiqueta para bloquear permanentemente';

  @override
  String get nfcPromptScan => 'Aproxime a etiqueta NFC para ler';

  @override
  String get nfcPromptWrite => 'Aproxime a etiqueta NFC para guardar os dados';

  @override
  String get no => 'Não';

  @override
  String get noContentInTag => 'Sem conteúdo de etiqueta associado.';

  @override
  String get noLibraryMatches => 'Nenhuma etiqueta encontrada.';

  @override
  String get noRecordsOnTag => 'Nenhum registo NDEF encontrado na etiqueta.';

  @override
  String get noTemplates =>
      'Ainda não existem modelos de gravação guardados.\nCrie registos no separador \"Gravar\" para guardar.';

  @override
  String get noteLabel => 'Nota';

  @override
  String get onboardingContinue => 'Continuar';

  @override
  String get onboardingSkip => 'Saltar';

  @override
  String get onboardingStart => 'Começar';

  @override
  String get onboardingStep1Body =>
      'Toque no botão azul em baixo e aproxime o topo do telefone da etiqueta. Conteúdo, capacidade e UID surgem no ecrã.';

  @override
  String get onboardingStep1Title => 'Ler etiqueta';

  @override
  String get onboardingStep2Body =>
      'No separador \"Gravar\", toque em \"Adicionar registo\": links web, Wi-Fi, contactos, redes sociais e modelos prontos.';

  @override
  String get onboardingStep2Title => 'Gravar livremente';

  @override
  String get onboardingStep3Body =>
      'Inspecione a memória, configure palavras-passe, bloqueie ou formate etiquetas no separador \"Ferramentas\".';

  @override
  String get onboardingStep3Title => 'Ferramentas avançadas';

  @override
  String get onboardingStep4Body =>
      'Guarde etiquetas com nomes, notas e fotos na sua biblioteca. Ajuste idioma e tema nas Definições.';

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
  String get pageRoleData => 'Dados';

  @override
  String get pageRoleLock => 'Bloqueio';

  @override
  String get pageRoleUid => 'UID';

  @override
  String get pageRoleUidLock => 'UID / Bloqueio';

  @override
  String get passwordDialogAction => 'Definir';

  @override
  String get passwordDialogTitle => 'Definir palavra-passe';

  @override
  String get passwordDialogWarning =>
      'Se esquecer esta palavra-passe, não poderá voltar a gravar na etiqueta. A leitura continua aberta.';

  @override
  String get passwordError =>
      'Introduza exatamente 4 carateres ou 8 dígitos hex.';

  @override
  String get passwordHint => '4 carateres (ex.: 1234) ou 8 dígitos hex';

  @override
  String get passwordLabel => 'Palavra-passe';

  @override
  String get paste => 'Colar';

  @override
  String get phoneNumber => 'Número de telefone';

  @override
  String get phoneWithCountryCode =>
      'Introduza o telefone com o indicativo do país (ex.: 351912345678).';

  @override
  String get presetAppDownloadDesc =>
      'Abre ou convida a instalar a sua aplicação Android.';

  @override
  String get presetAppDownloadTitle => 'Transferência da app';

  @override
  String get presetBusinessCardDesc =>
      'Adiciona o contacto à lista telefónica ao tocar.';

  @override
  String get presetBusinessCardTitle => 'Cartão de visita digital';

  @override
  String get presetDirectionsDesc => 'Mostra a morada ou destino no mapa.';

  @override
  String get presetDirectionsTitle => 'Localização / Como chegar';

  @override
  String get presetEmergencyDesc =>
      'Tipo sanguíneo, contactos de emergência e notas.';

  @override
  String get presetEmergencyTitle => 'Cartão de emergência (ICE)';

  @override
  String get presetGoogleReviewDesc =>
      'Encaminha para a página de comentários do Google.';

  @override
  String get presetGoogleReviewTitle => 'Avaliação no Google';

  @override
  String get presetGuestWifiDesc =>
      'Permite ligar à rede sem ter de digitar a senha.';

  @override
  String get presetGuestWifiTitle => 'Cartão Wi-Fi de convidados';

  @override
  String get presetInstagramDesc =>
      'Abre diretamente o seu perfil de Instagram.';

  @override
  String get presetInstagramTitle => 'Perfil de Instagram';

  @override
  String get presetMenuLinkDesc =>
      'Para colar nas mesas e mostrar a ementa de imediato.';

  @override
  String get presetMenuLinkTitle => 'Menu de restaurante';

  @override
  String get presetPetTagDesc =>
      'Permite a quem encontrar o animal telefonar logo.';

  @override
  String get presetPetTagTitle => 'Coleira para animais';

  @override
  String get presetShortcutDesc =>
      'Inicia atalhos da Apple ou ações da aplicação.';

  @override
  String get presetShortcutTitle => 'Ativador de atalhos';

  @override
  String get presetWebsiteDesc => 'Redireciona para qualquer página web.';

  @override
  String get presetWebsiteTitle => 'Website';

  @override
  String get presetWhatsappDesc =>
      'Inicia conversa sem guardar o número nos contactos.';

  @override
  String get presetWhatsappTitle => 'Conversa WhatsApp';

  @override
  String get qrCode => 'Código QR';

  @override
  String qrContentChars(int chars) {
    return 'Conteúdo ($chars Carateres):';
  }

  @override
  String get qrContentEmpty => 'O conteúdo a codificar está vazio.';

  @override
  String qrContentTooLarge(int chars) {
    return 'O conteúdo é demasiado longo para o código QR ($chars carateres, máximo 2048).';
  }

  @override
  String get qrFrameInstructions =>
      'Enquadre o código QR. Endereços web, Wi-Fi e texto serão convertidos em registos.';

  @override
  String qrGenerationFailed(String error) {
    return 'Falha ao gerar código QR: $error';
  }

  @override
  String qrPreviewTitle(String title) {
    return 'Pré-visualização do código QR: $title';
  }

  @override
  String get qrScanTitle => 'Ler código QR';

  @override
  String get qrSecurityNote =>
      'A pré-visualização de QR é suportada apenas para texto e URLs web.\n\nPalavras-passe de Wi-Fi e dados binários não são convertidos por motivos de privacidade.';

  @override
  String get qrUserOnlyNote => 'Abre apenas a pedido do utilizador.';

  @override
  String get rawInspection => 'Inspeção detalhada';

  @override
  String get rawRecordDetailsTitle => 'Detalhes do registo (Apenas leitura)';

  @override
  String get rawRecordEditorTitle => 'Editar registo NDEF em bruto';

  @override
  String get readHeroButton => 'Iniciar leitura';

  @override
  String get readHeroEyebrow => 'LEITOR NFC';

  @override
  String get readHeroScanning => 'A ler...';

  @override
  String get readHeroSubtitle =>
      'Aproxime o topo do telefone de uma etiqueta NFC para ler os seus registos NDEF e dados do chip.';

  @override
  String get readHeroTitle => 'Ler etiqueta';

  @override
  String get readMemorySubtitle =>
      'Memória bruta página a página; copiar ou guardar como .bin';

  @override
  String get readMemoryTitle => 'Ler memória';

  @override
  String get readyTemplates => 'Modelos prontos';

  @override
  String get recordCopied => 'Conteúdo copiado';

  @override
  String recordIndex(int index) {
    return 'Registo #$index';
  }

  @override
  String get recordTypeCalendar => 'Evento de calendário (iCal)';

  @override
  String recordTypeCustomMime(String mime) {
    return 'MIME personalizado ($mime)';
  }

  @override
  String get recordTypeEmail => 'Registo de e-mail';

  @override
  String get recordTypeLocation => 'Localização / GPS';

  @override
  String get recordTypePhone => 'Número de telefone';

  @override
  String get recordTypeSmartPoster => 'Smart Poster';

  @override
  String recordTypeSmartPosterCorrupt(int bytes) {
    return 'Conteúdo de Smart Poster danificado ($bytes bytes)';
  }

  @override
  String get recordTypeSmartPosterInvalid => 'Smart Poster (Inválido)';

  @override
  String get recordTypeSms => 'Registo de SMS';

  @override
  String get recordTypeText => 'Registo de texto';

  @override
  String get recordTypeUnknown => 'Registo desconhecido';

  @override
  String get recordTypeUrl => 'Ligação Web (URL)';

  @override
  String get recordTypeVCard => 'Cartão de contacto (vCard)';

  @override
  String get recordTypeWifi => 'Configuração Wi-Fi (WSC)';

  @override
  String get recordTypeWifiCorrupt => 'Carga útil WSC danificada';

  @override
  String recordsCopiedToClipboard(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registos copiados',
      one: '1 registo copiado',
    );
    return '$_temp0';
  }

  @override
  String get redo => 'Refazer';

  @override
  String get removePasswordDialogTitle => 'Remover palavra-passe';

  @override
  String get removePasswordDialogWarning =>
      'Introduza a palavra-passe atual da etiqueta.';

  @override
  String get removePasswordSubtitle =>
      'Remove a proteção através da palavra-passe conhecida';

  @override
  String get removePasswordTitle => 'Remover palavra-passe';

  @override
  String get removePhoto => 'Remover';

  @override
  String get rewriteTag => 'Regravar';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Eliminar a regra com a nota \"$note\"?';
  }

  @override
  String get ruleDeleted => 'Regra eliminada';

  @override
  String get ruleNoteDialogTitle => 'Editar nota da etiqueta';

  @override
  String get ruleNoteHint => 'Ex.: Prateleira #4 ou Sala de Reuniões';

  @override
  String get ruleNoteLabel => 'Nota / Rótulo local';

  @override
  String get ruleSaved => 'Regra guardada';

  @override
  String get save => 'Guardar';

  @override
  String get saveAsTemplate => 'Guardar como modelo';

  @override
  String get saveBin => 'Guardar .bin';

  @override
  String get saveLocalHistory => 'Guardar histórico local de leitura';

  @override
  String get saveLocalHistorySubtitle =>
      'Quando desligado, as leituras não são guardadas. Quando ativo, as leituras com sucesso são guardadas.';

  @override
  String get saveTemplateDialogTitle => 'Guardar como modelo';

  @override
  String get saveToLibrary => 'Guardar na biblioteca';

  @override
  String get scanFabLabel => 'Ler etiqueta';

  @override
  String get scanQrToRecord => 'Ler código QR';

  @override
  String get scannedTag => 'Etiqueta lida';

  @override
  String get searchEngine => 'Motor de busca';

  @override
  String get searchHistoryHint =>
      'Pesquisar histórico (UID, conteúdo, tipo)...';

  @override
  String get searchLibraryHint => 'Procurar por nome, nota, local ou conteúdo';

  @override
  String get searchQuery => 'Termo de pesquisa';

  @override
  String get searchQueryCannotBeEmpty =>
      'O termo de pesquisa não pode estar vazio.';

  @override
  String get securityRestriction => 'Restrição de segurança';

  @override
  String get send => 'Enviar';

  @override
  String get setPasswordSubtitle =>
      'Protege o conteúdo contra gravações não autorizadas';

  @override
  String get setPasswordTitle => 'Definir palavra-passe';

  @override
  String get shareRecords => 'Partilhar registos';

  @override
  String get shortcutAutomationNote =>
      'Nota: A automação associa-se ao UID e funciona mesmo que o conteúdo mude.';

  @override
  String get shortcutStep1 =>
      'Abra a app Atalhos e toque em \"Automação\" no fundo.';

  @override
  String get shortcutStep2 =>
      'Toque em \"Nova automação\" (+) → selecione \"NFC\".';

  @override
  String get shortcutStep3 =>
      'Toque em \"Ler\", aproxime a etiqueta do iPhone e dê-lhe um nome.';

  @override
  String get shortcutStep4 =>
      'Escolha \"Executar imediatamente\" e adicione as ações pretendidas.';

  @override
  String get shortcutStep5 =>
      'Para abrir esta aplicação, escolha \"Ler etiqueta\" ou \"Gravar etiqueta\".';

  @override
  String get shortcutsGuideSubtitle =>
      'Execute ações automáticas ao tocar numa etiqueta ou comande por voz via Siri.';

  @override
  String get shortcutsGuideTitle => 'Siri e Atalhos';

  @override
  String get siriPhraseScan => '\"Ei Siri, ler etiqueta com NFC Tag Master\"';

  @override
  String get siriPhraseWrite =>
      '\"Ei Siri, gravar etiqueta com NFC Tag Master\"';

  @override
  String get siriShortcutsNote =>
      'Estes comandos também surgem na app Atalhos e na pesquisa do Spotlight.';

  @override
  String get smsMessage => 'Mensagem de texto';

  @override
  String get socialNetwork => 'Plataforma';

  @override
  String get socialUsername => 'Nome de utilizador';

  @override
  String get sourceComposer => 'Registos na lista de gravação';

  @override
  String get sourceEmpty => 'Sem conteúdo (apenas nota)';

  @override
  String get sourceLastScan => 'Última etiqueta lida';

  @override
  String get sourceSelectPrompt => 'De onde deve ser retirado o conteúdo?';

  @override
  String get statusCancelled => 'Operação cancelada.';

  @override
  String statusClearError(String error) {
    return 'Erro ao formatar: $error';
  }

  @override
  String statusClearFailed(String error) {
    return 'Falha ao limpar: $error';
  }

  @override
  String get statusClearSuccess => 'Conteúdo da etiqueta limpo com sucesso.';

  @override
  String get statusClearing => 'Modo de limpeza ativo. Aproxime a etiqueta...';

  @override
  String statusLockError(String error) {
    return 'Erro ao bloquear: $error';
  }

  @override
  String statusLockFailed(String error) {
    return 'Falha ao bloquear: $error';
  }

  @override
  String get statusLockSuccess =>
      'Etiqueta bloqueada permanentemente (apenas leitura).';

  @override
  String get statusLocking => 'Modo de bloqueio ativo. Aproxime a etiqueta...';

  @override
  String get statusNfcDisabled =>
      'NFC desativado. Ative-o nas definições do sistema.';

  @override
  String get statusNfcNotSupported =>
      'Hardware NFC não suportado neste dispositivo.';

  @override
  String get statusNfcUnavailable => 'NFC indisponível de momento.';

  @override
  String get statusReady => 'Pronto';

  @override
  String statusScanError(String error) {
    return 'Erro de leitura: $error';
  }

  @override
  String statusScanSuccess(String id) {
    return 'Etiqueta lida com sucesso ($id).';
  }

  @override
  String get statusScanning =>
      'A ler etiqueta... Aproxime o telefone da etiqueta.';

  @override
  String statusUnexpectedError(String error) {
    return 'Erro inesperado: $error';
  }

  @override
  String statusWriteError(String error) {
    return 'Erro de gravação: $error';
  }

  @override
  String statusWriteFailed(String error) {
    return 'Não foi possível gravar: $error';
  }

  @override
  String statusWriteSuccess(int bytes) {
    return 'Gravação e verificação concluídas! ($bytes bytes)';
  }

  @override
  String get statusWriting => 'Modo de gravação ativo. Aproxime a etiqueta...';

  @override
  String get systemLanguage => 'Idioma do sistema';

  @override
  String get tabApp => 'Aplicação';

  @override
  String get tabBluetooth => 'Bluetooth';

  @override
  String get tabCalendar => 'Calendário';

  @override
  String get tabContact => 'Contacto (vCard)';

  @override
  String get tabCustomMime => 'MIME personalizado';

  @override
  String get tabEmail => 'E-mail';

  @override
  String get tabFile => 'Ficheiro';

  @override
  String get tabLocation => 'Localização';

  @override
  String get tabPhone => 'Telefone';

  @override
  String get tabSearch => 'Pesquisa';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabSocial => 'Redes sociais';

  @override
  String get tabText => 'Texto';

  @override
  String get tabUrl => 'URL Web';

  @override
  String get tabVideo => 'Vídeo';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagCapacity => 'Capacidade';

  @override
  String tagCapacityValue(int available, int max, int used) {
    return '$used / $max bytes ($available bytes livres)';
  }

  @override
  String get tagInfoTitle => 'Informações da etiqueta';

  @override
  String get tagLibraryTitle => 'A minha biblioteca de etiquetas';

  @override
  String get tagNameHint => 'Ex.: Etiqueta da cozinha';

  @override
  String get tagNameLabel => 'Nome';

  @override
  String get tagReadOnly => 'Apenas Leitura (Bloqueada)';

  @override
  String tagRulesCount(int count) {
    return 'Regras / notas guardadas: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Apresenta apenas a nota guardada com base no hash SHA-256 do conteúdo NDEF.';

  @override
  String get tagSerialNumber => 'Número de série (UID)';

  @override
  String get tagTechnology => 'Tecnologia';

  @override
  String get tagType => 'Tipo';

  @override
  String get tagUidCopied => 'UID copiado';

  @override
  String get tagWritable => 'Gravável';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get templateGalleryTitle => 'Modelos prontos';

  @override
  String get templateNameHint => 'Nome do modelo';

  @override
  String templateRecordCount(int count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Registos',
      one: '1 Registo',
    );
    return '$_temp0 | $date';
  }

  @override
  String get templateSaved => 'Modelo guardado com sucesso';

  @override
  String get toolsExpertSection => 'Avançado';

  @override
  String get toolsFooterNote =>
      'Ferramentas de memória, palavra-passe e comandos compatíveis com NTAG213/215/216 e MIFARE Ultralight EV1.';

  @override
  String get toolsMemorySection => 'Memória';

  @override
  String get toolsSecuritySection => 'Segurança';

  @override
  String get toolsTagSection => 'Etiqueta';

  @override
  String get totalBytes => 'Tamanho total';

  @override
  String get typeTooLarge => 'O comprimento do tipo não pode exceder 255 bytes';

  @override
  String get undo => 'Desfazer';

  @override
  String get unknownChip16Pages => 'Chip desconhecido (primeiras 16 páginas)';

  @override
  String get urlSafetyInvalidUrl => 'Formato de URL inválido.';

  @override
  String get urlSafetyIpv4 => 'O destino contém um endereço IPv4 numérico.';

  @override
  String get urlSafetyIpv6 => 'O destino contém um endereço IPv6 numérico.';

  @override
  String get urlSafetyMissingScheme => 'Esquema de protocolo em falta na URL.';

  @override
  String urlSafetyNonStandardPort(String port) {
    return 'Porta de rede fora do padrão (Porta: $port).';
  }

  @override
  String get urlSafetyPunycode =>
      'Domínio internacionalizado / Punycode detetado (\"xn--\").';

  @override
  String urlSafetySuspiciousScheme(String scheme) {
    return 'Esquema de URL não padronizado: \"$scheme\".';
  }

  @override
  String get urlSafetyUnencrypted => 'Ligação não encriptada (http://).';

  @override
  String get urlSafetyUserInfo =>
      'A URL contém credenciais de autenticação (userinfo). Risco de phishing.';

  @override
  String get usernameCannotBeEmpty =>
      'O nome de utilizador não pode estar vazio.';

  @override
  String get usernameNoSpaces =>
      'O nome de utilizador não pode conter espaços.';

  @override
  String get validAndroidPackage =>
      'Introduza um pacote Android válido (ex.: com.whatsapp).';

  @override
  String get validBluetoothMac =>
      'Introduza um endereço MAC Bluetooth válido (ex.: 00:11:22:AA:BB:CC).';

  @override
  String get validVideoUrl => 'Introduza uma ligação de vídeo válida.';

  @override
  String get validWebAddress =>
      'Introduza um endereço web válido (ex.: https://example.com/ficheiro.pdf).';

  @override
  String get verificationNotChecked => 'Não verificada';

  @override
  String get verificationPassed => 'Aprovada';

  @override
  String get videoUrlCannotBeEmpty =>
      'A ligação do vídeo não pode estar vazia.';

  @override
  String get videoUrlOrId => 'URL do vídeo ou ID do YouTube';

  @override
  String get videoUrlOrIdPrompt =>
      'Introduza a URL (https://...) ou o ID do vídeo.';

  @override
  String get wifiAuthOpen => 'Aberta (Sem proteção)';

  @override
  String get wifiAuthType => 'Tipo de segurança';

  @override
  String get wifiAuthWpa => 'WPA Personal';

  @override
  String get wifiAuthWpa2 => 'WPA2 Personal';

  @override
  String get wifiAuthWpaWpa2 => 'WPA/WPA2 Personal';

  @override
  String get wifiHidden => 'Rede oculta';

  @override
  String get wifiPassword => 'Palavra-passe';

  @override
  String get wifiSsid => 'Nome da rede (SSID)';

  @override
  String get withSiri => 'Com a Siri';

  @override
  String get writeDumpConfirmButton => 'Gravar';

  @override
  String writeDumpConfirmMessage(int bytes, String name) {
    return '\"$name\" ($bytes bytes) será gravado na memória de utilizador. UID e definições permanecem intactos.';
  }

  @override
  String get writeDumpSubtitle =>
      'Grava ficheiro binário de memória na etiqueta';

  @override
  String get writeDumpTitle => 'Gravar dump (.bin)';

  @override
  String get writeHeroButton => 'Iniciar gravação';

  @override
  String get writeHeroEyebrow => 'GRAVADOR NDEF';

  @override
  String get writeHeroSubtitle =>
      'Prepare vários registos NDEF e grave-os na etiqueta de uma só vez.';

  @override
  String get writeHeroTitle => 'Gravar etiqueta';

  @override
  String get writeHeroWriting => 'A gravar...';

  @override
  String get writeResultFailed => 'Falha na operação';

  @override
  String get writeResultSuccess => 'Operação bem-sucedida';

  @override
  String get writeTemplates => 'Modelos de gravação';

  @override
  String get writeTemplatesSubtitle =>
      'Guarde conteúdos NDEF frequentes como modelos para gravar rapidamente a qualquer momento.';

  @override
  String get yes => 'Sim';
}
