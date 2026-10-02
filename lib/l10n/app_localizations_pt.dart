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
  String get nfcPromptScan =>
      'Aproxime a etiqueta da parte superior do telefone';

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
  String get statusCancelled => 'Cancelado';

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
  String get verificationNotChecked => 'Não verificado';

  @override
  String get verificationPassed => 'Aprovado';

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

  @override
  String get unknown => 'Desconhecido';

  @override
  String get error => 'Erro';

  @override
  String get nfcPromptReady => 'Aproxime a etiqueta';

  @override
  String get invalidResponseFormat => 'Formato de resposta inválido recebido';

  @override
  String get nfcReadError => 'Erro de leitura NFC';

  @override
  String get invalidPlatformResponse =>
      'Resposta inválida recebida da plataforma';

  @override
  String get writeFailed => 'Falha ao gravar';

  @override
  String get lockFailed => 'Falha ao bloquear';

  @override
  String get failedToConnectTag => 'Não foi possível conectar à etiqueta';

  @override
  String get invalidTagResponse => 'Resposta inválida da etiqueta';

  @override
  String get commandFailed => 'Comando falhou';

  @override
  String get ndefTypeOrIdTooLong => 'O tipo ou ID NDEF excede 255 bytes';

  @override
  String get ndefUnsupportedOrInvalidRecord =>
      'Registro NDEF não suportado ou inválido';

  @override
  String get ndefMissingTypeLength => 'Comprimento do tipo NDEF ausente';

  @override
  String get ndefMissingPayloadLength =>
      'Comprimento da carga útil NDEF ausente';

  @override
  String get ndefMissingIdLength => 'Comprimento do ID NDEF ausente';

  @override
  String get ndefMissingType => 'Tipo NDEF ausente';

  @override
  String get ndefMissingId => 'ID NDEF ausente';

  @override
  String get ndefMissingPayload => 'Carga útil NDEF ausente';

  @override
  String get unprotected => '(Sem senha)';

  @override
  String get binaryDataPreview => '(Dados binários)';

  @override
  String get emptyValue => '(Vazio)';

  @override
  String get tnfEmpty => '0: Empty (Vazio)';

  @override
  String get tnfWellKnown => '1: NFC Forum Well-Known (RTD)';

  @override
  String get tnfMedia => '2: Media-Type (RFC 2046 MIME)';

  @override
  String get tnfAbsoluteUri => '3: Absolute URI (RFC 3986)';

  @override
  String get tnfExternal => '4: NFC Forum External';

  @override
  String get tnfUnknown => '5: Unknown (Desconhecido)';

  @override
  String get tnfUnchanged => '6: Unchanged (NDEF fragmentado)';

  @override
  String get tnfReserved => '7: Reserved (Reservado)';

  @override
  String get ntagUnsupportedChip =>
      'Esta operação é suportada apenas em etiquetas NTAG213/215/216 e MIFARE Ultralight EV1.';

  @override
  String ntagPageReadFailed(String page) {
    return 'Não foi possível ler a página $page (etiqueta não respondeu ou área protegida).';
  }

  @override
  String ntagPageWriteFailedError(String page, String error) {
    return 'Não foi possível gravar a página $page: $error';
  }

  @override
  String ntagPageWriteFailed(String page) {
    return 'Não foi possível gravar a página $page (rejeitada; bloqueada ou protegida).';
  }

  @override
  String ntagProtectedArea(String page) {
    return 'Não foi possível ler além da página $page; esta área pode estar protegida por senha.';
  }

  @override
  String get ntagPasswordPackSize =>
      'A senha deve ter 4 bytes e o PACK 2 bytes.';

  @override
  String get ntagPasswordSize => 'A senha deve ter 4 bytes.';

  @override
  String get ntagPasswordWrongOrAuthFailed =>
      'Senha incorreta ou etiqueta rejeitou autenticação.';

  @override
  String get ntagPasswordWrong => 'Senha incorreta.';

  @override
  String get ntagCcInvalid =>
      'A área CC possui um valor não NDEF; esta área OTP não pode ser formatada.';

  @override
  String get ntagDumpTooShort =>
      'Arquivo dump muito curto; não contém dados de usuário.';

  @override
  String get ntagInvalidHex =>
      'Insira um valor hexadecimal válido (ex.: 30 04).';

  @override
  String get googleReviewFieldLabel => 'Link de avaliação ou Place ID';

  @override
  String get menuLinkFieldLabel => 'Link do menu';

  @override
  String get menuTitleHint => 'Nosso cardápio';

  @override
  String get petName => 'Nome do animal';

  @override
  String get ownerPhone => 'Telefone do dono';

  @override
  String petTagMessage(String pet, String phone, String note) {
    return 'Olá, sou $pet! Por favor ligue para meu dono: $phone$note';
  }

  @override
  String get bloodType => 'Tipo sanguíneo';

  @override
  String get allergies => 'Alergias / Medicamentos';

  @override
  String get emergencyContact => 'Contato de emergência';

  @override
  String get emergencyInfo => 'INFORMAÇÕES DE EMERGÊNCIA';

  @override
  String emergencyBlood(String blood) {
    return 'Tipo sanguíneo: $blood';
  }

  @override
  String emergencyAllergies(String allergies) {
    return 'Alergias: $allergies';
  }

  @override
  String emergencyCall(String contact) {
    return 'Em caso de emergência ligue: $contact';
  }

  @override
  String get storeLink => 'Link da loja';

  @override
  String get link => 'Link';

  @override
  String get title => 'Título';

  @override
  String get webAddress => 'Endereço web';

  @override
  String get address => 'Endereço';

  @override
  String backupSummaryTemplates(String added, String updated) {
    return 'Modelos: $added adicionados, $updated atualizados';
  }

  @override
  String backupSummaryRules(String added, String updated) {
    return 'Notas/Regras de etiquetas: $added adicionadas, $updated atualizadas';
  }

  @override
  String backupSummaryHistoryDisabled(String skipped) {
    return 'Histórico ignorado pois está desativado no dispositivo: $skipped';
  }

  @override
  String backupSummaryHistory(String added, String skipped) {
    return 'Histórico: $added adicionado, $skipped existente/ignorado';
  }

  @override
  String get backupSummaryNoNewData =>
      'Nenhum novo dado para importar (correspondeu aos registros existentes).';

  @override
  String backupFieldMustBeString(String field) {
    return '$field deve ser uma string de texto.';
  }

  @override
  String backupFieldMustBeDate(String field) {
    return '$field deve ser uma data válida.';
  }

  @override
  String get rawTypeHexLabel => 'Tipo (Bytes hex)';

  @override
  String get rawIdHexLabel => 'ID (Bytes hex, opcional)';

  @override
  String get rawPayloadHexLabel => 'Carga útil (Bytes hex)';

  @override
  String get rawOptionalHexHint => 'Bytes hex opcionais';

  @override
  String get saveChanges => 'Salvar alterações';

  @override
  String get edit => 'Editar';

  @override
  String get clearAllButton => 'Limpar tudo';

  @override
  String ntagPagesRead(String chip, int count) {
    return '$chip: $count páginas lidas';
  }

  @override
  String ntagFormatted(String chip) {
    return '$chip formatado';
  }

  @override
  String get ntagInvalidDumpFile =>
      'Arquivo dump inválido (deve ser múltiplo de 4 bytes, 32–1024 bytes).';

  @override
  String ntagPagesWritten(int count) {
    return '$count páginas gravadas';
  }

  @override
  String ntagPasswordSet(String chip) {
    return '$chip: proteção por senha ativada';
  }

  @override
  String ntagPasswordRemoved(String chip) {
    return '$chip: senha removida';
  }

  @override
  String get memoryDumpCopied => 'Despejo de memória copiado';

  @override
  String ntagCommandsSent(int count) {
    return '$count comandos enviados';
  }

  @override
  String get emptyResponse => '(resposta vazia)';

  @override
  String pagesAndBytes(int pages, int bytes) {
    return '$pages páginas · $bytes bytes';
  }

  @override
  String get composeTextEmpty => 'O conteúdo do texto não pode estar vazio.';

  @override
  String get composeTextTooLong =>
      'Texto muito longo (máximo de 5000 caracteres).';

  @override
  String get composeUrlInvalid =>
      'Insira um endereço válido (ex: https://example.com ou link app://).';

  @override
  String get composeUrlTooLong =>
      'URL muito longo (máximo de 2000 caracteres).';

  @override
  String get composeEmailInvalid =>
      'Insira um e-mail válido (ex: nome@dominio.com).';

  @override
  String get composePhoneInvalid =>
      'Insira um número de telefone válido (ex: +905551234567).';

  @override
  String get composeSmsPhoneInvalid =>
      'Insira um número de telefone de destinatário válido.';

  @override
  String get composeLatInvalid => 'A latitude deve estar entre -90 e +90.';

  @override
  String get composeLngInvalid => 'A longitude deve estar entre -180 e +180.';

  @override
  String get composeVcardNameEmpty => 'O nome do contato não pode estar vazio.';

  @override
  String get composeVcardNameTooLong =>
      'Nome do contato muito longo (máximo de 200 caracteres).';

  @override
  String get composeVcardEmailInvalid => 'Insira um endereço de e-mail válido.';

  @override
  String get composeVcardPhoneInvalid => 'Insira um número de telefone válido.';

  @override
  String get composeVcardUrlInvalid =>
      'Insira um endereço web válido (ex: https://...).';

  @override
  String get composeCalSummaryEmpty =>
      'O título do evento não pode estar vazio.';

  @override
  String get composeCalSummaryTooLong =>
      'Título do evento muito longo (máximo de 250 caracteres).';

  @override
  String get composeCalDateInvalid =>
      'A hora de término deve ser posterior à hora de início.';

  @override
  String get composeSpUriInvalid =>
      'Insira uma URL de destino válida (ex: https://...).';

  @override
  String get composeSpLangInvalid =>
      'Insira um código de idioma ISO válido (ex: pt, en).';

  @override
  String get composeMimeTypeInvalid =>
      'Insira um tipo MIME válido (ex: application/json, text/plain).';

  @override
  String get composeMimeHexInvalid =>
      'Insira uma string hexadecimal válida (número par de caracteres hex).';

  @override
  String get composeMimePayloadTooLarge =>
      'Tamanho da carga útil muito grande (máximo de 10 KB).';

  @override
  String get composeWifiSsidEmpty =>
      'O nome da rede (SSID) não pode estar vazio.';

  @override
  String get composeWifiPasswordRequired =>
      'A senha do Wi-Fi é obrigatória para redes criptografadas.';

  @override
  String get composeWifiPasswordLength =>
      'A senha WPA/WPA2 deve ter entre 8 e 63 caracteres.';

  @override
  String get composeEditNdefRecord => 'Editar registro NDEF';

  @override
  String get composeNewNdefRecord => 'Criar novo registro NDEF';

  @override
  String get quickLinksHeader => 'Links rápidos';

  @override
  String get quickLinkCustomUri => 'URI personalizada';

  @override
  String get quickLinkSocial => 'Redes sociais';

  @override
  String get quickLinkVideo => 'Vídeo';

  @override
  String get quickLinkSearch => 'Busca';

  @override
  String get quickLinkFile => 'Arquivo';

  @override
  String get quickLinkFacetimeAudio => 'FaceTime Áudio';

  @override
  String get quickLinkAddress => 'Endereço';

  @override
  String get quickLinkPayment => 'Link de pagamento';

  @override
  String get quickLinkApp => 'Aplicativo (Android)';

  @override
  String get updateRecord => 'Atualizar registro';

  @override
  String get addToList => 'Adicionar à lista';

  @override
  String get quickCustomUriError =>
      'Insira um endereço com esquema (ex: spotify:track:... ou myapp://pagina).';

  @override
  String get quickFileEmptyMessage => 'Insira o link do arquivo.';

  @override
  String get quickPaymentEmptyMessage => 'Insira o link de pagamento.';

  @override
  String get quickCustomUriDesc =>
      'Qualquer endereço com esquema pode ser usado; o celular abrirá o aplicativo correspondente.';

  @override
  String get quickSocialLabel => 'Rede social';

  @override
  String get quickVideoLabel => 'Link do vídeo';

  @override
  String get quickVideoHint => 'https://youtu.be/... ou ID do vídeo';

  @override
  String get quickVideoDesc =>
      'Link do YouTube, Vimeo, etc. ou apenas o ID do vídeo do YouTube.';

  @override
  String get quickSearchHint => 'ex: Clima Lisboa';

  @override
  String get quickFileLabel => 'Link do arquivo';

  @override
  String get quickFileDesc =>
      'Devido à capacidade reduzida da etiqueta, grava-se o link web em vez do arquivo em si.';

  @override
  String get quickPhoneOrAppleId => 'Telefone ou ID Apple';

  @override
  String get quickFacetimeVideoDesc =>
      'Um iPhone ao tocar na etiqueta inicia uma chamada de vídeo FaceTime.';

  @override
  String get quickFacetimeAudioDesc =>
      'Um iPhone ao tocar na etiqueta inicia apenas uma chamada de áudio FaceTime.';

  @override
  String get quickMapProvider => 'Aplicativo de mapas';

  @override
  String get quickAddressHint => 'ex: Avenida Paulista 1000, São Paulo';

  @override
  String get quickPaymentDesc =>
      'Links de pagamento como PayPal.me, Stripe podem ser usados. Dados do cartão nunca são gravados.';

  @override
  String get quickAppDesc =>
      'Celulares Android abrem este app ao aproximar (ou a Play Store). iPhone ignora este tipo; adicione o link da App Store como URL.';

  @override
  String get quickDeviceNameOptional => 'Nome do dispositivo (opcional)';

  @override
  String get quickSpeakerHint => 'ex: Alto-falante';

  @override
  String get quickBluetoothDesc =>
      'Celulares Android sugerem emparelhamento com este dispositivo. iPhone não suporta tags de emparelhamento Bluetooth.';

  @override
  String get composeTextContent => 'Conteúdo do texto';

  @override
  String get composeTextHint => 'Insira o texto que deseja gravar';

  @override
  String get composeEmailSubjectOptional => 'Assunto (opcional)';

  @override
  String get composeEmailBodyOptional => 'Corpo da mensagem (opcional)';

  @override
  String get composeSmsRecipient => 'Número de telefone do destinatário';

  @override
  String get composeSmsHint => 'Mensagem SMS a enviar...';

  @override
  String get composeVcardFullName => 'Nome completo (nome de exibição) *';

  @override
  String get composeVcardNameHint => 'João Silva';

  @override
  String get composeVcardNote => 'Nota / Descrição';

  @override
  String get composeCalTitle => 'Título do evento *';

  @override
  String get composeCalTitleHint => 'Reunião de projeto';

  @override
  String get composeCalLocationHint => 'Sala de reuniões 2 ou online';

  @override
  String get composeCalDesc => 'Descrição do evento';

  @override
  String get composeCalStartEndTime => 'Hora de início e término:';

  @override
  String get composeSpTitleLabel => 'Título (texto visível)';

  @override
  String get composeSpTitleHint => 'Folheto da empresa';

  @override
  String get composeMimeTypeLabel => 'Tipo MIME *';

  @override
  String get composeDataFormat => 'Formato dos dados: ';

  @override
  String get composeFormatHex => 'Hexadecimal';

  @override
  String get composeMimeHexBytes => 'Bytes hexadecimais *';

  @override
  String get composeMimeTextPayload => 'Texto da carga útil (UTF-8) *';

  @override
  String get composeWifiWarningTitle => 'Aviso de segurança e plataforma:';

  @override
  String get composeWifiWarningBody =>
      '• A senha do Wi-Fi é gravada em texto simples e pode ser lida por qualquer pessoa.\n• A conexão automática não é garantida; pode exigir confirmação do usuário.';

  @override
  String get composeWifiSsidLabel => 'Nome da rede (SSID) *';

  @override
  String get composeWifiAuthTypeLabel => 'Tipo de segurança (autenticação)';

  @override
  String get composeWifiOpenNetwork => 'Rede aberta (nenhuma)';

  @override
  String get composeWifiPasswordLabel => 'Senha do Wi-Fi *';

  @override
  String get composeWifiEncryptionLabel => 'Tipo de criptografia';

  @override
  String get composeWifiAesRecommended => 'AES (recomendado)';

  @override
  String get quickSearchTextLabel => 'Texto a pesquisar';

  @override
  String get readTagMemoryPrompt =>
      'Aproxime a etiqueta do celular para ler a memória';

  @override
  String get readingTagMemoryStatus => 'Lendo memória...';

  @override
  String get formatTagConfirmTitle => 'Formatar memória';

  @override
  String get formatTagConfirmMessage =>
      'Os dados da etiqueta serão apagados e preparados como NDEF em branco. Continuar?';

  @override
  String get formatButton => 'Formatar';

  @override
  String get formatTagPrompt => 'Aproxime a etiqueta para formatar';

  @override
  String get formattingStatus => 'Formatando...';

  @override
  String filePickerFailed(String error) {
    return 'Falha no seletor de arquivos: $error';
  }

  @override
  String get writeButton => 'Gravar';

  @override
  String get writeDumpPrompt => 'Aproxime a etiqueta para gravar o dump';

  @override
  String get writingDumpStatus => 'Gravando dump...';

  @override
  String get setPasswordWarning =>
      'Se esquecer a senha, não poderá mais alterar o conteúdo. A leitura permanece aberta a todos.';

  @override
  String get setPasswordAction => 'Definir senha';

  @override
  String get setPasswordPrompt => 'Aproxime a etiqueta para definir a senha';

  @override
  String get settingPasswordStatus => 'Definindo senha...';

  @override
  String get removePasswordPromptMessage =>
      'Insira a senha definida anteriormente na etiqueta.';

  @override
  String get remove => 'Remover';

  @override
  String get removePasswordPrompt => 'Aproxime a etiqueta para remover a senha';

  @override
  String get removingPasswordStatus => 'Removendo senha...';

  @override
  String get sendCommandsPrompt => 'Aproxime a etiqueta para enviar comandos';

  @override
  String get sendingCommandsStatus => 'Enviando comandos...';

  @override
  String get sendButton => 'Enviar';

  @override
  String get tagNoteEditTitle => 'Editar nota da etiqueta';

  @override
  String get tagNoteInputLabel => 'Nota / Descrição no app';

  @override
  String get tagNoteInputHint =>
      'ex: Info da sala de reuniões ou Prateleira #12';

  @override
  String get tagNoteDeleteTitle => 'Excluir nota da etiqueta';

  @override
  String get clearAllTagRulesTitle => 'Excluir todas as notas';

  @override
  String get clearAllTagRulesConfirm =>
      'Todas as notas de etiqueta salvas serão excluídas. Confirmar?';

  @override
  String get deleteAll => 'Excluir tudo';

  @override
  String get tagRulesExplanation =>
      'Apenas a nota salva é mostrada para etiquetas correspondentes ao hash SHA-256 do NDEF.';

  @override
  String get noTagRulesDefined => 'Nenhuma nota de etiqueta definida ainda.';

  @override
  String lastUpdated(String time) {
    return 'Última atualização: $time';
  }

  @override
  String get tagLibraryNoMatch => 'Nenhuma etiqueta correspondeu à sua busca.';

  @override
  String get tagLibraryAddToLibrary => 'Adicionar à biblioteca';

  @override
  String get name => 'Nome';

  @override
  String get tagLibraryAddTag => 'Adicionar etiqueta';

  @override
  String get all => 'Todos';

  @override
  String tagLibraryPhotoError(String error) {
    return 'Não foi possível selecionar a foto: $error';
  }

  @override
  String get tagLibraryDeleteTitle => 'Excluir etiqueta';

  @override
  String get tagLibraryNameHint => 'ex: Chaveiro do escritório';

  @override
  String get tagLibraryNoTagContent =>
      'Nenhum conteúdo de etiqueta neste registro.';

  @override
  String get tagLibrarySourceLastScanned => 'Última leitura';

  @override
  String get tagLibraryEmpty => 'Nenhuma etiqueta salva ainda.';

  @override
  String get tagLibrarySourceEmpty => 'Registro vazio';

  @override
  String get tagLibraryNamePrompt => 'Insira um nome para a etiqueta';

  @override
  String get tagLibrarySearchHint =>
      'Buscar por nome, categoria ou localização...';

  @override
  String get tagLibrarySourceWriteList => 'Lista de gravação';

  @override
  String get tagLibraryLocationHint => 'ex: Mesa, Porta da frente';

  @override
  String tagLibraryDeleteConfirm(String name) {
    return 'Tem certeza de que deseja excluir a etiqueta \"$name\" da biblioteca?';
  }

  @override
  String get noContent => 'Sem conteúdo';

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
  String get rawTypeHexHint => '41 (A) ou 55 (U) etc.';

  @override
  String backupContextRecordsMustBeList(String context) {
    return '$context: O campo \"records\" deve ser uma lista.';
  }

  @override
  String backupContextMaxRecords(String context, num max) {
    return '$context: Um item pode ter no máximo $max registros NDEF.';
  }

  @override
  String backupContextRecordMustBeObject(String context, num index) {
    return '$context - O registro #$index não é um objeto válido.';
  }

  @override
  String backupContextInvalidTnf(String context, num index, String tnf) {
    return '$context - Registro #$index: Valor TNF inválido ($tnf).';
  }

  @override
  String backupContextTypeMustBeString(String context, num index) {
    return '$context - Registro #$index: \"type\" deve ser uma string Base64.';
  }

  @override
  String backupContextInvalidTypeBase64(
      String context, num index, String error) {
    return '$context - Registro #$index: \"type\" não são dados Base64 válidos ($error).';
  }

  @override
  String backupContextIdMustBeString(String context, num index) {
    return '$context - Registro #$index: \"id\" deve ser uma string Base64.';
  }

  @override
  String backupContextInvalidIdBase64(String context, num index, String error) {
    return '$context - Registro #$index: \"id\" não são dados Base64 válidos ($error).';
  }

  @override
  String backupContextPayloadMustBeString(String context, num index) {
    return '$context - Registro #$index: \"payload\" deve ser uma string Base64.';
  }

  @override
  String backupContextInvalidPayloadBase64(
      String context, num index, String error) {
    return '$context - Registro #$index: \"payload\" não são dados Base64 válidos ($error).';
  }

  @override
  String get composerUndoSnack => 'Última alteração desfeita.';

  @override
  String get composerRedoSnack => 'Alteração refeita.';

  @override
  String get noRecordsToCopy => 'Nenhum registro NDEF para copiar.';

  @override
  String recordsCopiedToClipboardDetails(num count, num bytes) {
    return '$count registros NDEF ($bytes B) copiados para a área de transferência.\n(Apenas conteúdo NDEF é copiado; UID ou setores criptografados nunca são clonados)';
  }

  @override
  String recordsAddedFromSource(String source, num count) {
    return '$source: $count registros adicionados.';
  }

  @override
  String get tagEmptyNoRecordsToImport =>
      'A etiqueta está vazia; nenhum registro para importar.';

  @override
  String get sourceTag => 'Da etiqueta';

  @override
  String get sourceQr => 'Do código QR';

  @override
  String filePickerError(String error) {
    return 'Não foi possível abrir o seletor de arquivos: $error';
  }

  @override
  String get csvFileTooLarge => 'Arquivo CSV muito grande (máximo de 512 KB).';

  @override
  String get noRecordsFound => 'Nenhum registro encontrado';

  @override
  String get someRowsSkipped => 'Algumas linhas ignoradas';

  @override
  String get expectedFormat => 'Formato esperado:';

  @override
  String get noClipboardContent =>
      'Nenhum conteúdo NDEF copiado na área de transferência.';

  @override
  String get pasteFromClipboardTitle => 'Colar da área de transferência NDEF';

  @override
  String clipboardDataSummary(num count, num bytes, String source) {
    return 'Dados da área de transferência: $count registros, $bytes bytes ($source)';
  }

  @override
  String get clipboardPastePrompt =>
      'Deseja substituir os registros atuais ou adicionar ao final?';

  @override
  String get pasteOverwriteOption => 'Sobrescrever (Substituir)';

  @override
  String pasteOverwriteSubtitle(num count) {
    return 'Os $count registros atuais serão substituídos pelo conteúdo da área de transferência (requer confirmação).';
  }

  @override
  String get pasteEmptySubtitle =>
      'Conteúdo da área de transferência inserido no compositor.';

  @override
  String get pasteAppendOption => 'Adicionar ao final';

  @override
  String get pasteAppendSubtitle =>
      'Os registros atuais são mantidos; os registros da área de transferência são adicionados ao final.';

  @override
  String recordsAddedToComposer(num count) {
    return '$count registros adicionados.';
  }

  @override
  String get confirmOverwriteTitle => 'Sobrescrever registros?';

  @override
  String confirmOverwriteMessage(num currentCount, num newCount) {
    return 'Existem $currentCount registros. Eles serão substituídos pelos $newCount da área de transferência. Continuar?';
  }

  @override
  String recordsReplacedInComposer(num count) {
    return 'Registros substituídos por $count novos.';
  }

  @override
  String get yesReplace => 'Sim, substituir';

  @override
  String recordsImportedToComposer(num count) {
    return '$count registros importados.';
  }

  @override
  String get noContentToCopy => 'Nenhum conteúdo NDEF encontrado para copiar.';

  @override
  String recordsCopiedAndStaged(num count) {
    return '$count registros NDEF copiados e adicionados (Conteúdo copiado, UID não clonado).';
  }

  @override
  String get noContentToRewrite =>
      'Nenhum conteúdo NDEF encontrado para regravar.';

  @override
  String get rewriteTagTitle => 'Regravar etiqueta';

  @override
  String get importantNotice => 'AVISO IMPORTANTE:';

  @override
  String get rewriteNotice1 =>
      '• Esta operação SOBRESCREVE COMPLETAMENTE o conteúdo NDEF; não adiciona ao final.\n';

  @override
  String get rewriteNotice2 =>
      '• A etiqueta de destino deve ser gravável (desbloqueada).\n';

  @override
  String get rewriteNotice3 =>
      '• Não grava silenciosamente na etiqueta anterior; requer nova aproximação NFC.';

  @override
  String rewriteSourceUidLabel(String uid) {
    return 'UID de origem: $uid';
  }

  @override
  String rewriteRecordCountLabel(num count) {
    return 'Registros a gravar: $count';
  }

  @override
  String get rewriteInstruction =>
      'Prepare a etiqueta, toque em \"Aproximar e gravar\" e aproxime-a do celular.';

  @override
  String get tapAndWrite => 'Aproximar e gravar';

  @override
  String get rewritePromptMessage =>
      'Aproxime a etiqueta do dispositivo (o conteúdo será totalmente renovado)';

  @override
  String rewriteFailedMessage(String error) {
    return 'Falha ao regravar: $error';
  }

  @override
  String get writeVerifiedTitle => 'Gravação verificada';

  @override
  String get writeVerifiedDesc =>
      'Conteúdo NDEF gravado e verificado com sucesso na etiqueta.';

  @override
  String writtenRecordCount(num count) {
    return 'Registros gravados: $count';
  }

  @override
  String get writeVerifiedHint =>
      'Você pode iniciar a próxima leitura para verificar ou comparar os dados.';

  @override
  String get scanAndCompareNow => 'Ler e comparar agora';

  @override
  String get contentMatchesExactly => 'O conteúdo corresponde exatamente';

  @override
  String get differenceDetected => 'Diferença detectada';

  @override
  String compareScannedUid(String uid) {
    return 'UID da etiqueta lida: $uid';
  }

  @override
  String compareWrittenData(num count, num bytes) {
    return 'Dados gravados: $count registros ($bytes bytes)';
  }

  @override
  String compareScannedData(num count, num bytes) {
    return 'Dados lidos: $count registros ($bytes bytes)';
  }

  @override
  String get compareMatchDesc =>
      'A mensagem NDEF da etiqueta corresponde byte a byte à mensagem de origem.';

  @override
  String get compareDiffDesc =>
      'Há diferença entre dados lidos e pretendidos. Verifique se a etiqueta está bloqueada.';

  @override
  String get batchEmptyComposerError =>
      'Adicione pelo menos um registro antes de iniciar a gravação em lote.';

  @override
  String get batchWriteTitle => 'Gravação em lote de etiquetas';

  @override
  String get batchWriteSubtitle =>
      'Grave o mesmo conteúdo NDEF em várias etiquetas sequencialmente.';

  @override
  String get attention => 'ATENÇÃO:';

  @override
  String get batchNotice1 =>
      '• Para evitar regravações acidentais, cada gravação é iniciada com \"Gravar próximo\".\n';

  @override
  String get batchNotice2 =>
      '• Nenhuma leitura contínua automática; cada etiqueta deve ser trocada fisicamente.';

  @override
  String batchTargetCountLabel(num count) {
    return 'Quantidade de etiquetas alvo: $count';
  }

  @override
  String batchComposerSummary(num count, num bytes) {
    return 'Registros: $count ($bytes bytes)';
  }

  @override
  String get batchStartButton => 'Iniciar gravação em lote';

  @override
  String get batchControlPanelTitle => 'Painel de controle de gravação em lote';

  @override
  String get batchCancelOrClose => 'Cancelar / Fechar';

  @override
  String get batchAllCompleted => 'Todas as tentativas concluídas!';

  @override
  String batchNextTag(num current, num total) {
    return 'Próxima: Etiqueta #$current / $total';
  }

  @override
  String batchStats(num success, num fail, num remaining) {
    return 'Sucesso: $success | Falha: $fail | Restantes: $remaining';
  }

  @override
  String batchSuccessMsg(String message) {
    return 'Sucesso ($message)';
  }

  @override
  String batchFailMsg(String message) {
    return 'Falhou: $message';
  }

  @override
  String tagNumberLabel(num index) {
    return 'Etiqueta #$index: ';
  }

  @override
  String get waitingForTag => 'Aguardando etiqueta...';

  @override
  String tapToWriteForTag(num index) {
    return 'Aproximar e gravar para etiqueta #$index';
  }

  @override
  String get batchFinishButton => 'Concluir gravação em lote';

  @override
  String batchPromptMessage(num current, num total) {
    return 'Gravação em lote: Aproxime a etiqueta #$current / $total';
  }

  @override
  String batchTagSuccessSummary(num count) {
    return '$count registros gravados e verificados';
  }

  @override
  String get writeError => 'Erro de gravação';

  @override
  String get batchConfirmCancelTitle => 'Cancelar gravação em lote';

  @override
  String get batchConfirmCancelMessage =>
      'Encerrar sessão em lote? As etiquetas já gravadas são mantidas; as restantes não serão gravadas.';

  @override
  String get cancelled => 'Cancelado';

  @override
  String get batchCancelledSnack =>
      'Gravação em lote cancelada. Seu conteúdo foi mantido.';

  @override
  String get cancelAndClose => 'Cancelar e fechar';

  @override
  String get urlSafetyOfflineAnalysisTitle => 'Análise de URL offline';

  @override
  String get urlSafetyScheme => 'Esquema (Protocolo):';

  @override
  String get urlSafetyPort => 'Porta:';

  @override
  String get urlSafetyUserInfoLabel => 'Info do usuário:';

  @override
  String get urlSafetyIpLiteral => 'Endereço IP direto:';

  @override
  String get urlSafetyDomain => 'Não (Nome de domínio)';

  @override
  String get urlSafetyPunycodeLabel => 'Internacional / Punycode (xn--):';

  @override
  String get urlSafetyHomoglyphRisk => 'Sim (Suspeita de homóglifo)';

  @override
  String get urlSafetyWarningsHeader => 'Avisos de segurança / atenção:';

  @override
  String get urlSafetyDisclaimer =>
      'NOTA: Análise offline. Não faz varredura de vírus online. A URL não é aberta automaticamente.';

  @override
  String templateLoadedToComposer(String name) {
    return 'Registros do modelo \"$name\" carregados.';
  }

  @override
  String get templateSaveEmptyError =>
      'Adicione registros antes de salvar como modelo.';

  @override
  String templateDefaultName(num index) {
    return 'Modelo $index';
  }

  @override
  String get templateNameSample => 'ex: Site da empresa e contato';

  @override
  String get templateSavedSnack => 'Modelo salvo.';

  @override
  String get ruleNoteRequiresNdef =>
      'A etiqueta deve conter pelo menos um registro NDEF para adicionar uma nota.';

  @override
  String get ruleNoteAddTitle => 'Adicionar nota personalizada';

  @override
  String get ruleNoteDigestExplanation =>
      'Vinculada ao hash SHA-256 do NDEF. Apenas mostra esta descrição ao ler a etiqueta.';

  @override
  String ruleNoteShaSummary(String sha) {
    return 'Resumo do conteúdo NDEF (SHA-256):\n$sha';
  }

  @override
  String get ruleNoteSavedSnack => 'Nota da etiqueta salva.';

  @override
  String get ruleNoteDeleteTitle => 'Excluir nota da etiqueta';

  @override
  String get ruleNoteDeleteConfirm =>
      'A nota desta etiqueta será excluída. Continuar?';

  @override
  String get ruleNoteDeletedSnack => 'Nota da etiqueta excluída.';

  @override
  String get backupExportTitle => 'Exportar backup';

  @override
  String get backupExportWarningTitle => 'AVISO DE PRIVACIDADE E SEGURANÇA';

  @override
  String get backupExportWarningBody =>
      'O arquivo de backup (JSON) é texto sem formatação. Pode conter senhas de Wi-Fi ou dados sensíveis. Guarde com segurança.';

  @override
  String get backupIncludedItems => 'Itens a incluir:';

  @override
  String backupTemplatesCount(num count) {
    return '• Modelos: $count';
  }

  @override
  String backupRulesCount(num count) {
    return '• Notas/regras de etiquetas: $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Incluir histórico de leituras (Opcional)';

  @override
  String backupHistoryCount(num count) {
    return '$count registros de histórico';
  }

  @override
  String get backupHistoryDisabled =>
      'O histórico de leituras está desativado neste dispositivo';

  @override
  String get backupExportAndShare => 'Exportar e compartilhar';

  @override
  String get backupFileNameLabel => 'Arquivo de backup do NFC Tag Master';

  @override
  String get backupFileShareSubject =>
      'Backup de modelos e dados do NFC Tag Master (JSON)';

  @override
  String get backupExportSuccessSnack =>
      'Arquivo de backup exportado e compartilhado com sucesso.';

  @override
  String get backupExportCancelled => 'Compartilhamento do backup cancelado.';

  @override
  String backupExportError(String error) {
    return 'Erro de exportação: $error';
  }

  @override
  String get backupImportTitle => 'Importar backup';

  @override
  String get backupMergeRuleTitle => 'POLÍTICA DE SEGURANÇA E MESCLAGEM';

  @override
  String get backupMergeRule1 =>
      '• A importação funciona por MESCLAGEM; seus registros NUNCA são apagados.\n';

  @override
  String get backupMergeRule2 =>
      '• Pode conter senhas de Wi-Fi ou dados pessoais; carregue apenas de fontes confiáveis.\n';

  @override
  String get backupMergeRule3 =>
      '• Limite: 2 MiB. Os dados passam por validação estrita de esquema e Base64.';

  @override
  String get backupSelectFilePrompt =>
      'Selecione um arquivo de backup .json válido para mesclar.';

  @override
  String get selectFileButton => 'Selecionar arquivo';

  @override
  String get fileSelectionCancelled => 'Seleção de arquivo cancelada.';

  @override
  String get backupFileExceedsLimit =>
      'O arquivo selecionado excede o limite permitido de 2 MiB.';

  @override
  String fileReadError(String error) {
    return 'Erro ao ler arquivo: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Erro de validação do backup: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Histórico de leituras detectado';

  @override
  String backupHistoryDetectedMsg(num count) {
    return 'O backup contém $count registros de histórico, mas o recurso está desativado.\n\n';
  }

  @override
  String get backupHistoryDetectedPrompt =>
      'Deseja importar e ativar o histórico? Ou importar apenas modelos e notas?';

  @override
  String get backupSkipHistoryOption =>
      'Pular histórico (carregar apenas modelos e notas)';

  @override
  String get backupEnableHistoryOption => 'Ativar histórico e carregar';

  @override
  String backupImportSuccessWithSummary(String summary) {
    return 'Importação bem-sucedida:\n$summary';
  }

  @override
  String backupMergeError(String error) {
    return 'Erro de mesclagem: $error';
  }

  @override
  String get nfcReadyStatus => 'NFC pronto';

  @override
  String get nfcReadyDesc => 'Hardware NFC ativo e pronto para uso';

  @override
  String get nfcDisabledStatus => 'NFC desativado';

  @override
  String get nfcDisabledDesc =>
      'O NFC está desativado. Ative nas configurações do aparelho.';

  @override
  String ndefClipboardBanner(num count, num bytes, String source) {
    return 'Área de transferência NDEF: $count registros ($bytes B) - $source';
  }

  @override
  String get template => 'Modelo';

  @override
  String get nfcScannerTitle => 'Leitor NFC';

  @override
  String lastScannedTagId(String id) {
    return 'Última etiqueta: $id';
  }

  @override
  String get composeRecord => 'Criar registro';

  @override
  String get protectOrRemove => 'Proteger / remover';

  @override
  String get previousScans => 'Leituras anteriores';

  @override
  String scanErrorWithMsg(String error) {
    return 'Erro de leitura: $error';
  }

  @override
  String get noScannedTagYet => 'Nenhuma etiqueta NFC lida ainda';

  @override
  String get tapScanPrompt =>
      'Toque em \"Iniciar leitura\" e aproxime a etiqueta do celular.';

  @override
  String get ndefCopyAndRewriteTitle => 'Cópia e regravação de conteúdo NDEF';

  @override
  String ndefCopyNotice(num count, num bytes) {
    return '$count registros ($bytes bytes) - Apenas dados NDEF são processados, UID não clonado.';
  }

  @override
  String tagIdHeader(String id) {
    return 'Etiqueta $id';
  }

  @override
  String get savedTagNoteHeader => 'Nota da etiqueta salva (regra no app)';

  @override
  String get tagNoteOrRule => 'Nota / regra de etiqueta';

  @override
  String get editNote => 'Editar nota';

  @override
  String get deleteNote => 'Excluir nota';

  @override
  String get tagNoteDigestNotice =>
      'Corresponde ao hash SHA-256 dos bytes NDEF exatos. Não aciona ações externas.';

  @override
  String get addCustomTagNotePrompt =>
      'Você pode adicionar uma nota local personalizada para este conteúdo NDEF.';

  @override
  String get addNoteToThisTag => 'Adicionar nota a esta etiqueta';

  @override
  String get ndefSupport => 'Suporte a NDEF:';

  @override
  String get usedSpace => 'Espaço utilizado:';

  @override
  String get freeSpace => 'Espaço livre:';

  @override
  String errorWithMsg(String error) {
    return 'Erro: $error';
  }

  @override
  String get noNdefMessageOnTag =>
      'Nenhuma mensagem NDEF encontrada na etiqueta.';

  @override
  String readNdefRecordsHeader(num count) {
    return 'Registros NDEF lidos ($count)';
  }

  @override
  String stagedNdefRecordsHeader(num count) {
    return 'Registros NDEF compostos ($count)';
  }

  @override
  String get hideDetails => 'Ocultar detalhes';

  @override
  String get advancedRecordInspector => 'Inspetor de registros (Avançado)';

  @override
  String get ndefRecordInspectorTitle =>
      'Inspetor de registros NDEF (Avançado)';

  @override
  String get inspectorType => 'Tipo:';

  @override
  String get inspectorPayloadLength => 'Comprimento da carga útil:';

  @override
  String get inspectorRawHexPreview =>
      'Pré-visualização hexadecimal bruta (limitada):';

  @override
  String inspectorPayloadTruncated(num length) {
    return 'Nota: A carga útil tem $length bytes; mostrando os primeiros 64 bytes.';
  }

  @override
  String get ndefRecordsToWriteTitle => 'Registros NDEF a gravar';

  @override
  String get pasteFromClipboardAction =>
      'Colar da área de transferência (Substituir / Adicionar)';

  @override
  String get importAction => 'Importar';

  @override
  String get importFromTagAction => 'Importar de etiqueta NFC';

  @override
  String get importFromQrAction => 'Importar de código QR';

  @override
  String get importFromCsvAction => 'Importar de arquivo CSV';

  @override
  String composerTotalSizeAndCount(num bytes, num count) {
    return 'Tamanho total: $bytes bytes | Registros: $count';
  }

  @override
  String get composerEmptyDescription =>
      'Você pode gravar texto, links, Wi-Fi, telefone, e-mail, contatos e mais nas etiquetas.';

  @override
  String get urlSafetyReview => 'Revisão de URL';

  @override
  String get inspector => 'Inspetor';

  @override
  String get typeLabel => 'Tipo:';

  @override
  String get payloadLabel => 'Carga útil:';

  @override
  String get writeAndVerify => 'Gravar na etiqueta e verificar';

  @override
  String writeAndVerifyWithBytes(num bytes) {
    return 'Gravar na etiqueta e verificar ($bytes bytes)';
  }

  @override
  String get batchWriteButtonLabel => 'Gravação em lote (2..100 etiquetas)';

  @override
  String get clearTagButtonLabel => 'Redefinir etiqueta (limpar conteúdo)';

  @override
  String get confirmWriteTitle => 'Confirmar gravação na etiqueta';

  @override
  String get confirmWriteMessage1 =>
      'Esta operação SOBRESCREVE COMPLETAMENTE o conteúdo NDEF existente.';

  @override
  String confirmWriteRecordCount(num count) {
    return 'Quantidade de registros a gravar: $count';
  }

  @override
  String get confirmWriteMessage2 =>
      'Certifique-se de que a etiqueta é gravável. O conteúdo será verificado automaticamente.';

  @override
  String get yesWrite => 'Sim, gravar';

  @override
  String get scanHistoryDisabledTitle => 'Histórico de leituras desativado';

  @override
  String get scanHistoryDisabledDesc =>
      'Por privacidade, o histórico não é salvo por padrão. Você pode ativá-lo nas configurações.';

  @override
  String get enableHistory => 'Ativar histórico';

  @override
  String get historySearchHint =>
      'Pesquisar por UID, texto ou tipo (ex: URL, Wi-Fi, 04A1...)';

  @override
  String historyScansCount(num count) {
    return 'Leituras salvas: $count';
  }

  @override
  String get noHistoryYet => 'Nenhum histórico de leitura salvo ainda.';

  @override
  String noHistoryResultsForQuery(String query) {
    return 'Nenhum resultado encontrado para \"$query\".';
  }

  @override
  String get tryDifferentQuery =>
      'Tente um UID, conteúdo de texto ou tipo diferente.';

  @override
  String get clearSearch => 'Limpar busca';

  @override
  String historyItemHeader(String time, num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros',
      one: '1 registro',
    );
    return '$time | $_temp0';
  }

  @override
  String get deleteThisRecord => 'Excluir este registro';

  @override
  String historyCapacitySummary(num cap, num used) {
    return 'Capacidade: ${cap}B | Usado: ${used}B';
  }

  @override
  String historyUidHeader(String uid) {
    return 'UID do histórico $uid';
  }

  @override
  String get qrPreview => 'Pré-visualização QR';

  @override
  String templateRecordCountWithDate(num count, String date) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count registros',
      one: '1 registro',
    );
    return '$_temp0 | $date';
  }

  @override
  String writeVerificationSummary(num bytes, String status) {
    return 'Bytes gravados: $bytes | Verificação: $status';
  }

  @override
  String get lockTagConfirmTitle => 'Bloquear etiqueta permanentemente';

  @override
  String get lockTagWarning1 =>
      'A etiqueta bloqueada torna-se somente leitura: o conteúdo NÃO pode ser alterado ou desbloqueado.';

  @override
  String get lockTagWarning2 =>
      'Certifique-se de ter gravado o conteúdo correto primeiro.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langEn => 'English';

  @override
  String get langDe => 'Deutsch';

  @override
  String get langFr => 'Français';

  @override
  String get langEs => 'Español';

  @override
  String get langIt => 'Italiano';

  @override
  String get langPt => 'Português';

  @override
  String get langRu => 'Русский';

  @override
  String get langAr => 'العربية';

  @override
  String get langJa => '日本語';

  @override
  String get langZh => '中文';

  @override
  String get langKo => '한국어';

  @override
  String get langNl => 'Nederlands';

  @override
  String get langUk => 'Українська';

  @override
  String get qrPreviewTooltip => 'Pré-visualização do código QR';

  @override
  String get unknownParentheses => '(Desconhecido)';

  @override
  String get ok => 'OK';
}
