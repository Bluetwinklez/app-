import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'controllers/nfc_controller.dart';
import 'services/app_storage_service.dart';
import 'services/nfc_service.dart';
import 'ui/home_screen.dart';

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
    return MaterialApp(
      title: 'NFC Etiket Yöneticisi',
      debugShowCheckedModeBanner: false,
      locale: const Locale('tr', 'TR'),
      supportedLocales: const [
        Locale('tr', 'TR'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          elevation: 2,
        ),
      ),
      home: HomeScreen(controller: controller),
    );
  }
}
