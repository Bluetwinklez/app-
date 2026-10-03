import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'controllers/nfc_controller.dart';
import 'services/app_storage_service.dart';
import 'services/nfc_service.dart';
import 'ui/home_screen.dart';
import 'ui/app_theme.dart';

import 'l10n/app_localizations.dart';
import 'l10n/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _installErrorHandlers();

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

/// Keeps the app running after unexpected errors: async errors are logged
/// instead of crashing, and a broken widget shows a short message instead of
/// a red/grey box in release builds.
void _installErrorHandlers() {
  final previous = FlutterError.onError;
  FlutterError.onError = (details) {
    previous?.call(details);
    debugPrint('FlutterError: ${details.exceptionAsString()}');
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    debugPrint('Uncaught error: $error\n$stack');
    return true;
  };
  if (kReleaseMode) {
    ErrorWidget.builder = (details) => Material(
          color: Colors.transparent,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                L10n.current.errorWidgetMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
          ),
        );
  }
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
      onGenerateTitle: (context) => AppLocalizations.of(context)?.appTitle ?? L10n.current.appTitle,
      debugShowCheckedModeBanner: false,
      locale: appController?.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        if (deviceLocale != null) {
          for (final supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == deviceLocale.languageCode) {
              return supportedLocale;
            }
          }
        }
        return const Locale('en');
      },
      builder: (context, child) {
        L10n.update(Localizations.localeOf(context));
        AppColors.setDark(Theme.of(context).brightness == Brightness.dark);
        return child ?? const SizedBox.shrink();
      },
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: appController?.themeMode ?? ThemeMode.light,
      home: HomeScreen(controller: controller),
    );
  }
}
