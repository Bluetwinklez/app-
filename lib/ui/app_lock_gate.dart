import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../l10n/l10n.dart';
import '../services/app_storage_service.dart';
import '../services/launch_action_service.dart';
import 'app_theme.dart';

/// Covers the app with a lock screen when the app lock is on: at launch and
/// after [AppStorageService.lockAfterSeconds] in the background. Also applies
/// the app switcher privacy cover setting at start.
class AppLockGate extends StatefulWidget {
  final AppStorageService storage;
  final Widget child;

  const AppLockGate({
    super.key,
    required this.storage,
    required this.child,
  });

  @override
  State<AppLockGate> createState() => _AppLockGateState();
}

class _AppLockGateState extends State<AppLockGate> with WidgetsBindingObserver {
  late bool _locked = widget.storage.appLockEnabled;
  DateTime? _backgroundSince;
  bool _authenticating = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    LaunchActionService.setPrivacyCover(widget.storage.hideInSwitcher);
    if (_locked) WidgetsBinding.instance.addPostFrameCallback((_) => _unlock());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!widget.storage.appLockEnabled || _authenticating) return;
    if (state == AppLifecycleState.paused) {
      _backgroundSince = DateTime.now();
    } else if (state == AppLifecycleState.resumed && _backgroundSince != null) {
      final away = DateTime.now().difference(_backgroundSince!);
      _backgroundSince = null;
      if (away.inSeconds >= widget.storage.lockAfterSeconds) {
        setState(() => _locked = true);
        _unlock();
      }
    }
  }

  Future<void> _unlock() async {
    if (_authenticating || !mounted) return;
    _authenticating = true;
    final loc = L10n.current;
    final ok = await LaunchActionService.authenticate(reason: loc.appLockReason, title: loc.appTitle);
    _authenticating = false;
    if (!mounted) return;
    // No device lock any more (null): don't trap the user outside their data.
    if (ok == true || ok == null) setState(() => _locked = false);
  }

  @override
  Widget build(BuildContext context) {
    if (!_locked) return widget.child;
    final loc = AppLocalizations.of(context) ?? L10n.current;
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(gradient: AppColors.canvasGradient),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 84,
                height: 84,
                decoration: BoxDecoration(gradient: AppColors.heroGradient, borderRadius: BorderRadius.circular(24)),
                child: const Icon(Icons.lock_rounded, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 16),
              Text(loc.appLockLocked, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              const SizedBox(height: 20),
              FilledButton.icon(
                onPressed: _unlock,
                icon: const Icon(Icons.face_unlock_outlined),
                label: Text(loc.appLockUnlock),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
