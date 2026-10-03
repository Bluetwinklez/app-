import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nfc_tag_master/services/app_storage_service.dart';
import 'package:nfc_tag_master/ui/app_lock_gate.dart';

void main() {
  const channel = MethodChannel('com.antigravity.nfc_tag_master/launch');

  Future<void> pump(WidgetTester tester, InMemoryAppStorageService storage) async {
    await tester.pumpWidget(MaterialApp(
      home: AppLockGate(storage: storage, child: const Text('SECRET')),
    ));
    await tester.pumpAndSettle();
  }

  testWidgets('off: content is shown directly', (tester) async {
    await pump(tester, InMemoryAppStorageService());
    expect(find.text('SECRET'), findsOneWidget);
  });

  testWidgets('on: stays locked until authentication succeeds', (tester) async {
    final storage = InMemoryAppStorageService();
    await storage.setAppLockEnabled(true);
    var answer = false;
    var calls = 0;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'authenticate') {
        calls++;
        return answer;
      }
      return null;
    });
    addTearDown(() => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, null));

    await pump(tester, storage);
    expect(calls, 1, reason: 'prompts at launch');
    expect(find.text('SECRET'), findsNothing);

    answer = true;
    await tester.tap(find.byIcon(Icons.face_unlock_outlined));
    await tester.pumpAndSettle();
    expect(find.text('SECRET'), findsOneWidget);
  });

  testWidgets('relocks after the configured background delay', (tester) async {
    final storage = InMemoryAppStorageService();
    await storage.setAppLockEnabled(true);
    await storage.setLockAfterSeconds(0);
    var calls = 0;
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (call) async {
      if (call.method == 'authenticate') {
        calls++;
        return true;
      }
      return null;
    });
    addTearDown(() => tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, null));

    await pump(tester, storage);
    expect(find.text('SECRET'), findsOneWidget);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.hidden);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.inactive);
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.resumed);
    await tester.pumpAndSettle();
    expect(calls, 2, reason: 'asked again on return');
    expect(find.text('SECRET'), findsOneWidget);
  });
}
