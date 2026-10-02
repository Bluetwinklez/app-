import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'controllers/nfc_controller.dart';
import 'services/app_storage_service.dart';
import 'services/nfc_service.dart';
import 'ui/home_screen.dart';
import 'ui/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage service
  AppStorageService storage;
  try {
    final Directory docDir = await getApplicationDocumentsDirectory();
    final storageDir = '${docDir.path}/nfc_tag_master_data';
    storage = LocalFileAppStorageService(baseDirectoryPath: storageDir);
    await storage.init();
  } catch (e) {
    debugPrint('Fallback to InMemoryAppStorageService: $e');
    storage = InMemoryAppStorageService();
    await storage.init();
  }

  final controller = NfcStateController(
    service: MethodChannelNfcService(),
    storage: storage,
  );

  runApp(NfcTagMasterApp(controller: controller));
}

class NfcTagMasterApp extends StatelessWidget {
  final NfcStateController? controller;

  const NfcTagMasterApp({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    final appController = controller;
    if (appController == null) return _buildApp(null);
    return ListenableBuilder(
      listenable: appController,
      builder: (context, _) => _buildApp(appController),
    );
  }

  Widget _buildApp(NfcStateController? appController) {
    return MaterialApp(
      title: 'NFC Etiket Yöneticisi',
      debugShowCheckedModeBanner: false,
      locale: appController?.locale ?? const Locale('tr'),
      supportedLocales: [
        for (final code in NfcStateController.supportedLanguageCodes) Locale(code),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: appController?.themeMode ?? ThemeMode.light,
      home: HomeScreen(controller: controller),
    );
  }
}
