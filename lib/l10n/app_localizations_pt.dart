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
  String get backupFileSizeExceeded => 'O tamanho do ficheiro excede 2 MiB.';

  @override
  String get backupHistoryMustBeList =>
      'O campo \"history\" deve ser uma lista.';

  @override
  String backupInvalidJson(String error) {
    return 'Formato JSON inválido: $error';
  }

  @override
  String get backupInvalidRuleNote => 'Nota de regra inválida.';

  @override
  String get backupInvalidRuleSha => 'Hash SHA-256 de regra inválido.';

  @override
  String get backupInvalidTemplateId => 'ID de modelo inválido.';

  @override
  String get backupInvalidTemplateName => 'Nome de modelo inválido.';

  @override
  String backupMaxHistoryExceeded(int count, int max) {
    return 'Limite de $max históricos excedido ($count).';
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
  String get clearConfirmMessage =>
      'Esta ação irá apagar todos os registos NDEF gravando um registo vazio. Pretende continuar?';

  @override
  String get clearConfirmTitle => 'Repor conteúdo da etiqueta';

  @override
  String get clearHistory => 'Limpar histórico';

  @override
  String get clearTagSubtitle =>
      'Elimina todos os registos e grava um NDEF vazio';

  @override
  String get clearTagTitle => 'Limpar etiqueta';

  @override
  String get close => 'Fechar';

  @override
  String get commandsEmptyError => 'Introduza pelo menos um comando.';

  @override
  String get commandsLabel => 'Comandos';

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
  String get contactPhone => 'Telefone';

  @override
  String get contactTitle => 'Cargo / Título';

  @override
  String get contactWebsite => 'Website';

  @override
  String get copy => 'Copiar';

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
  String get deleteTemplateTooltip => 'Eliminar modelo';

  @override
  String get deviceNameTooLong => 'Nome do dispositivo demasiado longo.';

  @override
  String get dismiss => 'Dispensar';

  @override
  String get editRecordTitle => 'Editar registo';

  @override
  String get emailRecipient => 'Destinatário';

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
  String get flashlight => 'Lanterna';

  @override
  String get formatMemorySubtitle =>
      'Prepara para NDEF (etiquetas vazias ou corrompidas)';

  @override
  String get formatMemoryTitle => 'Formatar memória';

  @override
  String get idTooLarge => 'O comprimento do ID não pode exceder 255 bytes';

  @override
  String get importBackup => 'Importar (Unir)';

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
  String get locationLabel => 'Onde se encontra?';

  @override
  String get lockAcknowledge => 'Compreendo que esta ação não pode ser anulada';

  @override
  String get lockTagSubtitle =>
      'Torna a etiqueta apenas de leitura permanentemente';

  @override
  String get lockTagTitle => 'Bloquear etiqueta';

  @override
  String get manage => 'Gerir';

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
  String get rawRecordDetailsTitle => 'Detalhes do registo (Apenas leitura)';

  @override
  String get rawRecordEditorTitle => 'Editar registo NDEF em bruto';

  @override
  String get readHeroButton => 'Iniciar leitura';

  @override
  String get readMemorySubtitle =>
      'Memória bruta página a página; copiar ou guardar como .bin';

  @override
  String get readMemoryTitle => 'Ler memória';

  @override
  String get readyTemplates => 'Modelos prontos';

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
  String get redo => 'Refazer';

  @override
  String get removePasswordSubtitle =>
      'Remove a proteção através da palavra-passe conhecida';

  @override
  String get removePasswordTitle => 'Remover palavra-passe';

  @override
  String get rewriteTag => 'Regravar';

  @override
  String ruleDeleteConfirm(String note) {
    return 'Eliminar a regra com a nota \"$note\"?';
  }

  @override
  String get ruleNoteDialogTitle => 'Editar nota da etiqueta';

  @override
  String get ruleNoteLabel => 'Nota / Rótulo local';

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
  String get scanFabLabel => 'Ler etiqueta';

  @override
  String get scannedTag => 'Etiqueta lida';

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
  String get socialUsername => 'Nome de utilizador';

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
  String get tabContact => 'Contacto (vCard)';

  @override
  String get tabCustomMime => 'MIME personalizado';

  @override
  String get tabEmail => 'E-mail';

  @override
  String get tabPhone => 'Telefone';

  @override
  String get tabSms => 'SMS';

  @override
  String get tabText => 'Texto';

  @override
  String get tabUrl => 'URL Web';

  @override
  String get tabWifi => 'Wi-Fi';

  @override
  String get tagInfoTitle => 'Informações da etiqueta';

  @override
  String get tagLibraryTitle => 'A minha biblioteca de etiquetas';

  @override
  String tagRulesCount(int count) {
    return 'Regras / notas guardadas: $count';
  }

  @override
  String get tagRulesSubtitle =>
      'Apresenta apenas a nota guardada com base no hash SHA-256 do conteúdo NDEF.';

  @override
  String get tagWritable => 'Gravável';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get templateNameHint => 'Nome do modelo';

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
  String get videoUrlOrIdPrompt =>
      'Introduza a URL (https://...) ou o ID do vídeo.';

  @override
  String get wifiAuthOpen => 'Aberta (Sem proteção)';

  @override
  String get wifiPassword => 'Palavra-passe';

  @override
  String get wifiSsid => 'Nome da rede (SSID)';

  @override
  String get withSiri => 'Com a Siri';

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
    return 'Não foi possível abrir o seletor: $error';
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
  String get rewriteInstruction =>
      'Prepare a etiqueta, toque em \"Aproximar e gravar\" e aproxime-a do celular.';

  @override
  String get tapAndWrite => 'Aproximar e gravar';

  @override
  String get rewritePromptMessage =>
      'Aproxime a etiqueta do dispositivo (o conteúdo será totalmente renovado)';

  @override
  String get writeVerifiedTitle => 'Gravação verificada';

  @override
  String get writeVerifiedDesc =>
      'Conteúdo NDEF gravado e verificado com sucesso na etiqueta.';

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
  String get batchStartButton => 'Iniciar gravação em lote';

  @override
  String get batchControlPanelTitle => 'Painel de controle de gravação em lote';

  @override
  String get batchCancelOrClose => 'Cancelar / Fechar';

  @override
  String get batchAllCompleted => 'Todas as tentativas concluídas!';

  @override
  String batchStats(String ok, String failed, String left) {
    return 'Sucesso: $ok | Falhas: $failed | Restantes: $left';
  }

  @override
  String get waitingForTag => 'Aguardando etiqueta...';

  @override
  String get batchFinishButton => 'Concluir gravação em lote';

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
  String get templateSaveEmptyError =>
      'Adicione registros antes de salvar como modelo.';

  @override
  String templateDefaultName(String n) {
    return 'Modelo $n';
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
  String get ruleNoteSavedSnack => 'Nota da etiqueta salva.';

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
  String backupTemplatesCount(String count) {
    return '• Modelos: $count';
  }

  @override
  String backupRulesCount(String count) {
    return '• Notas/regras de tags: $count';
  }

  @override
  String get backupIncludeHistoryOptional =>
      'Incluir histórico de leituras (Opcional)';

  @override
  String backupHistoryCount(String count) {
    return '$count entradas do histórico';
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
    return 'Erro ao ler o arquivo: $error';
  }

  @override
  String backupValidationError(String error) {
    return 'Erro ao validar o backup: $error';
  }

  @override
  String get backupHistoryDetectedTitle => 'Histórico de leituras detectado';

  @override
  String get backupHistoryDetectedPrompt =>
      'Deseja importar e ativar o histórico? Ou importar apenas modelos e notas?';

  @override
  String get backupSkipHistoryOption =>
      'Pular histórico (carregar apenas modelos e notas)';

  @override
  String get backupEnableHistoryOption => 'Ativar histórico e carregar';

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
  String get template => 'Modelo';

  @override
  String get nfcScannerTitle => 'Leitor NFC';

  @override
  String get composeRecord => 'Criar registro';

  @override
  String get protectOrRemove => 'Proteger / remover';

  @override
  String get previousScans => 'Leituras anteriores';

  @override
  String get noScannedTagYet => 'Nenhuma etiqueta NFC lida ainda';

  @override
  String get tapScanPrompt =>
      'Toque em \"Iniciar leitura\" e aproxime a etiqueta do celular.';

  @override
  String get ndefCopyAndRewriteTitle => 'Cópia e regravação de conteúdo NDEF';

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
  String get noNdefMessageOnTag =>
      'Nenhuma mensagem NDEF encontrada na etiqueta.';

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
  String get batchWriteButtonLabel => 'Gravação em lote (2..100 etiquetas)';

  @override
  String get clearTagButtonLabel => 'Redefinir etiqueta (limpar conteúdo)';

  @override
  String get confirmWriteTitle => 'Confirmar gravação na etiqueta';

  @override
  String get confirmWriteMessage1 =>
      'Esta operação SOBRESCREVE COMPLETAMENTE o conteúdo NDEF existente.';

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
  String get noHistoryYet => 'Nenhum histórico de leitura salvo ainda.';

  @override
  String get tryDifferentQuery =>
      'Tente um UID, conteúdo de texto ou tipo diferente.';

  @override
  String get clearSearch => 'Limpar busca';

  @override
  String get deleteThisRecord => 'Excluir este registro';

  @override
  String get qrPreview => 'Pré-visualização QR';

  @override
  String get lockTagConfirmTitle => 'Bloquear etiqueta permanentemente';

  @override
  String get lockTagWarning2 =>
      'Certifique-se de ter gravado o conteúdo correto primeiro.';

  @override
  String get langTr => 'Türkçe';

  @override
  String get langFr => 'Français';

  @override
  String get qrPreviewTooltip => 'Pré-visualização do código QR';

  @override
  String get unknownParentheses => '(Desconhecido)';

  @override
  String get ok => 'OK';

  @override
  String rewriteSourceUid(String uid) {
    return 'UID de origem: $uid';
  }

  @override
  String recordsToWriteCount(String count) {
    return 'Registros a gravar: $count';
  }

  @override
  String rewriteFailed(String message) {
    return 'Falha ao regravar: $message';
  }

  @override
  String writtenRecordsCount(String count) {
    return 'Registros gravados: $count';
  }

  @override
  String scannedTagUid(String uid) {
    return 'UID da tag lida: $uid';
  }

  @override
  String writtenDataSummary(String count, String bytes) {
    return 'Dados gravados: $count registros ($bytes bytes)';
  }

  @override
  String scannedDataSummary(String count, String bytes) {
    return 'Dados lidos: $count registros ($bytes bytes)';
  }

  @override
  String batchTargetCount(String count) {
    return 'Tags de destino: $count';
  }

  @override
  String composerRecordsSummary(String count, String bytes) {
    return 'Lista de gravação: $count registros ($bytes bytes)';
  }

  @override
  String batchNext(String current, String total) {
    return 'Próxima: tag #$current / $total';
  }

  @override
  String batchAttemptOk(String message) {
    return 'Sucesso ($message)';
  }

  @override
  String batchAttemptFailed(String message) {
    return 'Falhou: $message';
  }

  @override
  String batchAttemptLabel(String n) {
    return 'Tag #$n: ';
  }

  @override
  String batchTapToWrite(String n) {
    return 'Toque e grave a tag #$n';
  }

  @override
  String batchPrompt(String current, String total) {
    return 'Gravação em lote: aproxime a tag #$current / $total';
  }

  @override
  String batchWrittenVerified(String count) {
    return '$count registros gravados e verificados';
  }

  @override
  String templateLoaded(String name) {
    return 'Os registros de \"$name\" foram adicionados à lista.';
  }

  @override
  String ndefSha256Summary(String sha) {
    return 'Resumo do conteúdo NDEF (SHA-256):\n$sha';
  }

  @override
  String exportError(String error) {
    return 'Erro de exportação: $error';
  }

  @override
  String backupHistoryDetected(String count, String prompt) {
    return 'O backup tem $count entradas de histórico, mas o histórico está desativado aqui.\n\n$prompt';
  }

  @override
  String importSucceeded(String summary) {
    return 'Importação concluída:\n$summary';
  }

  @override
  String mergeError(String error) {
    return 'Erro ao mesclar: $error';
  }

  @override
  String clipboardBannerText(String count, String bytes, String source) {
    return 'Área NDEF: $count registros ($bytes B) - $source';
  }

  @override
  String get heroScanSubtitle =>
      'Aproxime a tag da parte de cima do telefone; conteúdo, capacidade e número de série aparecem na hora.';

  @override
  String lastTagLabel(String uid) {
    return 'Última tag: $uid';
  }

  @override
  String scanErrorWithMessage(String message) {
    return 'Erro de leitura: $message';
  }

  @override
  String copyContentSummary(String count, String bytes) {
    return '$count registros ($bytes bytes) - só os dados NDEF são copiados, não o UID.';
  }

  @override
  String tagSourceLabel(String uid) {
    return 'Tag $uid';
  }

  @override
  String errorWithMessage(String message) {
    return 'Erro: $message';
  }

  @override
  String readRecordsHeader(String count) {
    return 'Registros NDEF lidos ($count)';
  }

  @override
  String composedRecordsHeader(String count) {
    return 'Registros NDEF a gravar ($count)';
  }

  @override
  String payloadTruncatedNote(String bytes) {
    return 'Nota: a carga tem $bytes bytes; só os primeiros 64 são mostrados.';
  }

  @override
  String composerTotals(String bytes, String count) {
    return 'Tamanho total: $bytes bytes | Registros: $count';
  }

  @override
  String writeAndVerifyWithSize(String bytes) {
    return 'Gravar e verificar ($bytes bytes)';
  }

  @override
  String savedScansCount(String count) {
    return 'Leituras salvas: $count';
  }

  @override
  String historyNoResults(String query) {
    return 'Nenhum resultado para \"$query\".';
  }

  @override
  String historyItemMeta(String date, String count) {
    return '$date | $count registros';
  }

  @override
  String historyCapacity(String max, String used) {
    return 'Capacidade: $max B | Usado: $used B';
  }

  @override
  String historySourceLabel(String uid) {
    return 'Histórico UID $uid';
  }

  @override
  String templateMeta(String count, String date) {
    return '$count registros | $date';
  }

  @override
  String rulesCountLabel(String count) {
    return 'Regras/notas salvas: $count';
  }

  @override
  String writeResultDetails(String bytes, String verification) {
    return 'Bytes gravados: $bytes | Verificação: $verification';
  }

  @override
  String lockTagWarningFull(String more) {
    return 'Uma tag bloqueada fica somente leitura: o conteúdo NUNCA poderá ser alterado ou apagado e o bloqueio NÃO pode ser removido. $more';
  }

  @override
  String messageSizeBytes(String bytes) {
    return 'Tamanho da mensagem: $bytes bytes';
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
  String get valueNone => 'Nenhum';

  @override
  String get valueYesIp => 'Sim (endereço IP)';

  @override
  String get nfcMissingShort => 'Sem NFC';

  @override
  String get clearClipboard => 'Limpar área';

  @override
  String get statLibrary => 'Biblioteca';

  @override
  String get scanTagTitle => 'Ler tag';

  @override
  String get readingInProgress => 'Lendo...';

  @override
  String get rawMemorySubtitle => 'Memória bruta';

  @override
  String get copyToClipboard => 'Copiar';

  @override
  String get serialUidLabel => 'N.º de série (UID):';

  @override
  String get totalCapacityLabel => 'Capacidade total:';

  @override
  String get technologiesLabel => 'Tecnologias:';

  @override
  String get idLabel => 'Identificador (ID):';

  @override
  String get undoTooltip => 'Desfazer';

  @override
  String get clearComposer => 'Limpar lista';

  @override
  String composerTotalSize(String bytes) {
    return 'Tamanho total: $bytes bytes';
  }

  @override
  String get yesClear => 'Sim, limpar';

  @override
  String get ssidTooLong => 'O SSID pode ter no máximo 32 bytes.';

  @override
  String get locationPlace => 'Local';

  @override
  String get targetWebUrl => 'URL de destino *';

  @override
  String get languageCodeLabel => 'Código de idioma (ISO 639-1) *';

  @override
  String get utf8Text => 'Texto UTF-8';

  @override
  String recordDebugSummary(String tnf, String bytes) {
    return 'TNF: $tnf, tamanho: $bytes bytes';
  }

  @override
  String get quickGallerySubtitle => 'Pronto com um toque';

  @override
  String get quickLibraryTitle => 'Minhas tags';

  @override
  String get quickLibrarySubtitle => 'Tags salvas';

  @override
  String get saveToLibrary => 'Salvar na biblioteca';

  @override
  String libraryMatch(String name) {
    return 'Na biblioteca: $name';
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
  String get settingsLibrarySubtitle => 'Suas tags com nomes, notas e fotos';

  @override
  String get showOnboardingAgain => 'Ver a introdução novamente';

  @override
  String get importFromGallery => 'Adicionar dos modelos';

  @override
  String get appearanceTitle => 'Aparência';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Escuro';

  @override
  String get valuePresentRisky => 'Presente (pode ser arriscado)';

  @override
  String get supportedValue => 'Compatível';

  @override
  String get notSupportedValue => 'Não compatível';

  @override
  String get nfcUnsupportedDesc => 'Este dispositivo não suporta NFC';

  @override
  String get ndefTrailingData => 'Dados extras após a mensagem NDEF';

  @override
  String get ndefMissingEnd => 'Falta o fim da mensagem NDEF';

  @override
  String vcardPhoneShort(String value) {
    return 'Tel.: $value';
  }

  @override
  String vcardEmailShort(String value) {
    return 'E-mail: $value';
  }

  @override
  String vcardOrgShort(String value) {
    return 'Empresa: $value';
  }

  @override
  String get pageUidLock => 'UID / Bloqueio';

  @override
  String get pageData => 'Dados';

  @override
  String get pageLock => 'Bloqueio';

  @override
  String memoryPageLine(String page) {
    return 'Pág. $page';
  }

  @override
  String get socialWhatsappPhone => 'WhatsApp (telefone)';

  @override
  String get mapApple => 'Mapas da Apple';

  @override
  String get mapGoogle => 'Google Maps';

  @override
  String get whatsappMessageHint => 'Olá, gostaria de informações';

  @override
  String get facetimeTargetHint => '+5511912345678 ou nome@icloud.com';

  @override
  String get bluetoothMacLabel => 'Endereço MAC Bluetooth';

  @override
  String get webAddressUrlLabel => 'Endereço web (URL)';

  @override
  String get latitudeLabel => 'Latitude (Lat)';

  @override
  String get longitudeLabel => 'Longitude (Lng)';

  @override
  String get emailAddressLabel => 'Endereço de e-mail';

  @override
  String get websiteLabel => 'Site';

  @override
  String get wifiAuthWpa2Home => 'WPA2 Pessoal (padrão casa/escritório)';

  @override
  String get wifiAuthMixed => 'WPA/WPA2 Pessoal (misto)';

  @override
  String get hostLabel => 'Servidor / Host:';

  @override
  String get readOnlyLocked => 'Somente leitura (bloqueada)';

  @override
  String get redoTooltip => 'Refazer';

  @override
  String historyFoundCount(String found, String total) {
    return 'Encontrados: $found / $total';
  }

  @override
  String get addToWriteListShort => 'Adicionar à lista';

  @override
  String get mimeTypeHint => 'application/json ou text/plain';

  @override
  String get hapticsToggle => 'Vibração';

  @override
  String get hapticsToggleSubtitle =>
      'Vibração curta ao terminar leitura ou gravação';

  @override
  String get soundsToggle => 'Sons';

  @override
  String get soundsToggleSubtitle => 'Tocar um som curto do sistema';

  @override
  String get backupLibraryMustBeList => 'A biblioteca deve ser uma lista.';

  @override
  String get backupInvalidLibraryEntry => 'Entrada da biblioteca inválida.';

  @override
  String backupMaxLibraryExceeded(String max) {
    return 'A biblioteca pode ter no máximo $max entradas.';
  }

  @override
  String backupSummaryLibrary(String added) {
    return 'Biblioteca: $added adicionados';
  }

  @override
  String backupLibraryCount(String count) {
    return '• Biblioteca: $count (sem fotos)';
  }

  @override
  String lastTagCapacityFit(String bytes, String max) {
    return 'Última tag: $bytes / $max B';
  }

  @override
  String get contentTooLargeForChips =>
      'Grande demais para tags comuns; encurte o texto ou use um link curto.';

  @override
  String get tagReportTitle => 'Relatório da tag';

  @override
  String get tagReportSubtitle => 'Chip, bloqueios, senha e uso';

  @override
  String get tagReportPrompt => 'Aproxime a tag a verificar';

  @override
  String get tagReportBusy => 'Verificando a tag...';

  @override
  String tagReportDone(String chip) {
    return 'Relatório pronto: $chip';
  }

  @override
  String get unknownChip => 'Chip desconhecido';

  @override
  String get yes => 'Sim';

  @override
  String get reportChip => 'Chip';

  @override
  String get reportNdefFormatted => 'Formatada NDEF';

  @override
  String get reportWritable => 'Gravável';

  @override
  String get reportStaticLock => 'Bloqueio estático';

  @override
  String get reportDynamicLock => 'Bloqueio dinâmico';

  @override
  String get reportPassword => 'Proteção por senha';

  @override
  String get reportReadProtected => 'Leitura protegida';

  @override
  String get reportNdefUsage => 'Uso NDEF';

  @override
  String get reportVerdictWritable => 'Tag pronta para gravar';

  @override
  String get reportVerdictRestricted => 'A tag tem restrições';

  @override
  String get reportCopied => 'Relatório copiado';

  @override
  String get compareTagsTitle => 'Comparar duas tags';

  @override
  String get compareTagsSubtitle => 'Veja se uma cópia é igual à original';

  @override
  String get compareStepFirst => 'Primeiro, leia a primeira tag (original).';

  @override
  String get compareStepSecond => 'Agora leia a segunda tag.';

  @override
  String get compareIdentical => 'Os conteúdos são iguais';

  @override
  String get compareDifferent => 'Os conteúdos diferem';

  @override
  String get compareSameTag => 'A mesma tag foi lida duas vezes.';

  @override
  String get compareDifferentTags => 'Duas tags diferentes.';

  @override
  String get compareRecordSame => 'Igual';

  @override
  String get compareRecordChanged => 'Diferente';

  @override
  String get compareRecordOnlyFirst => 'Só na A';

  @override
  String get compareRecordOnlySecond => 'Só na B';

  @override
  String get compareBothEmpty => 'As duas tags estão vazias.';

  @override
  String capacityExceededShort(String needed, String max) {
    return 'Conteúdo grande demais: $needed / $max bytes';
  }

  @override
  String get verifyFailedAfterWrite =>
      'Não foi possível verificar; segure a tag por mais tempo.';

  @override
  String get blankTagTitle => 'A tag ainda não está pronta';

  @override
  String get blankTagBody =>
      'Esta tag é nova e não está formatada para NDEF. O app pode prepará-la e gravar o conteúdo com um toque (NTAG e MIFARE Ultralight).';

  @override
  String get blankTagAction => 'Preparar e gravar';

  @override
  String get shareTag => 'Compartilhar';

  @override
  String get shareAsText => 'Compartilhar como texto';

  @override
  String get shareAsFile => 'Compartilhar como arquivo (.json)';

  @override
  String get shareAsFileSubtitle =>
      'Os registros podem ser gravados iguais em outro aparelho';

  @override
  String get importFromJsonFile => 'De um arquivo de tag (.json)';

  @override
  String get invalidTagFile => 'Arquivo de tag inválido.';

  @override
  String get continuousScanTitle => 'Leitura contínua';

  @override
  String get continuousScanSubtitle =>
      'Leia tags em sequência e compartilhe a lista em CSV';

  @override
  String continuousScanCount(String count) {
    return '$count tags lidas';
  }

  @override
  String get exportCsv => 'Compartilhar como CSV';

  @override
  String get clearList => 'Limpar lista';

  @override
  String get csvColumnTime => 'Hora';

  @override
  String get csvColumnRecords => 'Registros';

  @override
  String get csvColumnContent => 'Conteúdo';

  @override
  String get csvColumnCapacity => 'Capacidade (B)';

  @override
  String get csvColumnUsed => 'Usado (B)';

  @override
  String get batchSerialToggle => 'Adicionar números de série';

  @override
  String batchSerialHint(String token) {
    return 'Coloque $token num registro para inserir o número ali; caso contrário, um registro de texto com o número é adicionado a cada tag.';
  }

  @override
  String get batchSerialPrefix => 'Prefixo';

  @override
  String get batchSerialStart => 'Início';

  @override
  String get batchSerialDigits => 'Dígitos';

  @override
  String batchSerialPreview(String first, String last) {
    return 'Primeiro: $first · Último: $last';
  }

  @override
  String get batchFromCsvButton => 'De um CSV (uma linha por tag)';

  @override
  String get batchCsvTitle => 'Gravação em lote via CSV';

  @override
  String batchCsvSummary(String count) {
    return 'Serão gravadas $count tags. Cada tag recebe uma linha do CSV, na ordem.';
  }

  @override
  String batchCsvTruncated(String max) {
    return 'A gravação em lote usa no máximo $max linhas; o restante foi ignorado.';
  }

  @override
  String get cloneTagTitle => 'Clonar tag';

  @override
  String get cloneTagSubtitle => 'Leia uma tag e grave o conteúdo em outras';

  @override
  String get cloneSourceStep =>
      'Passo 1: leia a tag de origem. Só o conteúdo NDEF é copiado; o UID não pode ser clonado.';

  @override
  String get cloneSourceEmpty => 'A tag de origem não tem registros NDEF.';

  @override
  String get cloneReadyTitle => 'Origem lida';

  @override
  String cloneReadySummary(String count, String bytes) {
    return 'Serão copiados $count registros ($bytes bytes). Escolha quantas tags gravar.';
  }

  @override
  String get cloneEditFirst => 'Editar antes';

  @override
  String get tapPreviewTitle => 'O que acontece quando um telefone toca?';

  @override
  String get tapPreviewIphone => 'iPhone';

  @override
  String get tapPreviewAndroid => 'Android';

  @override
  String get tapNone => 'A tag está vazia; nada acontece.';

  @override
  String tapIosUrl(String target) {
    return 'Aparece uma notificação; ao tocar, $target abre no Safari ou no app correspondente.';
  }

  @override
  String tapAndroidUrl(String target) {
    return '$target abre direto no navegador ou no app correspondente.';
  }

  @override
  String tapIosApp(String target) {
    return 'Aparece uma notificação; o app abre via \"$target\" se estiver instalado.';
  }

  @override
  String tapAndroidApp(String target) {
    return 'O app abre via \"$target\" se estiver instalado.';
  }

  @override
  String tapIosCall(String target) {
    return 'Aparece uma notificação; ao tocar, liga para $target.';
  }

  @override
  String tapAndroidCall(String target) {
    return 'O app de telefone abre com $target.';
  }

  @override
  String tapIosSms(String target) {
    return 'Aparece uma notificação; Mensagens abre uma nova mensagem para $target.';
  }

  @override
  String tapAndroidSms(String target) {
    return 'O app de mensagens abre para $target.';
  }

  @override
  String tapIosEmail(String target) {
    return 'Aparece uma notificação; o Mail abre um novo e-mail para $target.';
  }

  @override
  String tapAndroidEmail(String target) {
    return 'O app de e-mail abre para $target.';
  }

  @override
  String get tapIosMap =>
      'O iPhone não abre locais \"geo:\" sozinho. Use um link do Apple ou Google Maps (Links rápidos).';

  @override
  String get tapAndroidMap => 'O app de mapas abre neste local.';

  @override
  String get tapIosNeedsApp =>
      'O iPhone não faz nada com este conteúdo sozinho; é preciso ler com um app NFC.';

  @override
  String get tapAndroidText =>
      'Na maioria dos telefones nada acontece ou o texto aparece numa tela do sistema.';

  @override
  String get tapAndroidContact => 'Oferece adicionar o contato.';

  @override
  String get tapAndroidWifi =>
      'Oferece conectar-se à rede (Android 10 ou superior).';

  @override
  String get tapAndroidCalendar =>
      'Se o app de calendário suportar, oferece adicionar o evento.';

  @override
  String get tapAndroidOther =>
      'Só abre se houver um app compatível instalado.';

  @override
  String tapIgnoredRecords(String count) {
    return 'Os telefones só executam o primeiro registro; os outros $count aparecem em apps NFC.';
  }

  @override
  String get tapIosRequirement =>
      'iPhone XS ou posterior lê em segundo plano se desbloqueado e com Câmera/Carteira fechadas.';

  @override
  String get galleryCatBusiness => 'Negócios';

  @override
  String get galleryCatSocial => 'Social';

  @override
  String get galleryCatHome => 'Casa';

  @override
  String get galleryCatPersonal => 'Pessoal';

  @override
  String get galleryCatAutomation => 'Automação';

  @override
  String get galleryFavorites => 'Favoritos';

  @override
  String get gallerySearchHint => 'Buscar modelos...';

  @override
  String get galleryNoResults => 'Nenhum modelo encontrado.';

  @override
  String get galleryAddFavorite => 'Adicionar aos favoritos';

  @override
  String get galleryRemoveFavorite => 'Remover dos favoritos';

  @override
  String get presetEventTitle => 'Convite de evento';

  @override
  String get presetEventDesc =>
      'Grava o evento em iCalendar; o Android pode adicioná-lo à agenda.';

  @override
  String get eventNameLabel => 'Nome do evento';

  @override
  String get eventDateLabel => 'Data (AAAA-MM-DD)';

  @override
  String get eventTimeLabel => 'Hora (HH:MM)';

  @override
  String get eventDateTimeInvalid =>
      'Data ou hora inválida. Exemplo: 2026-12-31 e 19:00';

  @override
  String get presetLuggageTitle => 'Etiqueta de bagagem';

  @override
  String get presetLuggageDesc =>
      'Se perder, quem encontrar pode falar com você.';

  @override
  String luggageMessage(String name, String contact) {
    return 'Esta bagagem pertence a $name. Se encontrar, contate: $contact';
  }

  @override
  String get presetPlaylistTitle => 'Playlist';

  @override
  String get presetPlaylistDesc =>
      'Abre uma playlist do Spotify, Apple Music ou YouTube.';

  @override
  String get playlistLinkLabel => 'Link da playlist';

  @override
  String get presetEmailMeTitle => 'Me mande um e-mail';

  @override
  String get presetEmailMeDesc =>
      'Abre um novo e-mail para você com assunto pronto.';

  @override
  String get presetCallMeTitle => 'Me ligue';

  @override
  String get presetCallMeDesc => 'O telefone liga para seu número.';

  @override
  String get presetRunShortcutTitle => 'Executar atalho';

  @override
  String get presetRunShortcutDesc =>
      'Executa o atalho do iPhone indicado: luzes, música, mudar o Foco...';

  @override
  String get shortcutNameLabel => 'Nome do atalho';

  @override
  String get recipesSection => 'Receitas de automação';

  @override
  String get recipesIntro =>
      'Crie em Atalhos um atalho com o nome abaixo e adicione as ações. Depois vincule a uma automação NFC ou use \"Adicionar à tag\" para gravar um link que o executa.';

  @override
  String get recipeAddToTag => 'Adicionar à tag';

  @override
  String get recipeBedTitle => 'Boa noite';

  @override
  String get recipeBedActions =>
      'Mesa de cabeceira: Foco Sono · despertador · apagar luzes';

  @override
  String get recipeCarTitle => 'Modo carro';

  @override
  String get recipeCarActions =>
      'Suporte do carro: Foco Direção · rota para casa · música';

  @override
  String get recipeDoorTitle => 'Cheguei em casa';

  @override
  String get recipeDoorActions =>
      'Entrada: luzes · Wi-Fi ligado · mensagem \"Cheguei\" para a família';

  @override
  String get recipeDeskTitle => 'Modo trabalho';

  @override
  String get recipeDeskActions =>
      'Mesa: Foco Trabalho · timer de 25 min · playlist';

  @override
  String get recipeGymTitle => 'Treino';

  @override
  String get recipeGymActions =>
      'Bolsa de academia: iniciar treino · playlist · Não perturbe';

  @override
  String get recipeKitchenTitle => 'Timer de cozinha';

  @override
  String get recipeKitchenActions =>
      'Cozinha: timer de 10 min · abrir lista de compras';

  @override
  String get libraryLabelsField => 'Rótulos / pastas (separados por vírgula)';

  @override
  String get libraryLabelsHint => 'escritório, 2º andar';

  @override
  String librarySaveFailed(String error) {
    return 'Não foi possível salvar: $error';
  }

  @override
  String get csvColumnLabels => 'Rótulos';

  @override
  String get firstNameLabel => 'Nome';

  @override
  String get lastNameLabel => 'Sobrenome';

  @override
  String get wifiPasswordMinHint => 'Pelo menos 8 caracteres';

  @override
  String get emailExampleHint => 'nome@exemplo.com';

  @override
  String get wifiSsidExampleHint => 'Casa_WiFi_5G';

  @override
  String get nfcErrUnavailable =>
      'O NFC não está disponível ou está desligado neste aparelho.';

  @override
  String get nfcErrBusy => 'Outra operação NFC está em andamento; aguarde.';

  @override
  String get nfcErrCancelled => 'A operação foi cancelada.';

  @override
  String get nfcErrAppPaused =>
      'A operação foi cancelada porque o app foi para segundo plano.';

  @override
  String get nfcErrUnsupportedTag => 'Este tipo de tag não é compatível.';

  @override
  String get nfcErrNtagOnly =>
      'Esta ferramenta só funciona com tags NTAG / MIFARE Ultralight.';

  @override
  String get nfcErrNotNdefRead =>
      'Tag detectada, mas não está em formato NDEF.';

  @override
  String get nfcErrNotNdefWrite =>
      'A tag não está em formato NDEF; este telefone não consegue gravar NDEF nela diretamente.';

  @override
  String get nfcErrReadOnly => 'A tag é somente leitura (bloqueada).';

  @override
  String get nfcErrNoData => 'Não há dados para gravar.';

  @override
  String nfcErrCapacity(String required, String max) {
    return 'Espaço insuficiente: $required bytes necessários, $max disponíveis.';
  }

  @override
  String get nfcErrCapacityShort => 'Espaço insuficiente na tag.';

  @override
  String get nfcErrVerify =>
      'Falha na verificação: os dados lidos não correspondem.';

  @override
  String get nfcErrConnectionLost =>
      'A conexão com a tag caiu; mantenha-a parada e tente de novo.';

  @override
  String get nfcErrAlreadyLocked =>
      'A tag já está bloqueada (somente leitura).';

  @override
  String get nfcErrLockNotNdef =>
      'A tag não está em formato NDEF; grave um registro antes de bloquear.';

  @override
  String get nfcErrLockNotSupported => 'Este tipo de tag não permite bloqueio.';

  @override
  String get nfcSheetConnected => 'Tag conectada, processando...';

  @override
  String get nfcSheetReadOk => 'Tag lida!';

  @override
  String get nfcSheetEmptyRead => 'Tag vazia lida!';

  @override
  String get nfcSheetMultipleTags =>
      'Mais de uma tag detectada. Aproxime só uma.';

  @override
  String get nfcSheetWriteVerified => 'Gravado e verificado!';

  @override
  String get nfcSheetWritten => 'Gravado na tag!';

  @override
  String get nfcSheetLocked => 'A tag foi bloqueada permanentemente!';

  @override
  String get nfcWriteDone => 'Gravado na tag com sucesso.';
}
