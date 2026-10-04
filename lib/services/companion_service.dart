import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

/// Why an iCloud backup could not be saved.
enum ICloudError { noAccount, tooLarge, failed }

class ICloudException implements Exception {
  final ICloudError error;
  const ICloudException(this.error);
}

/// iCloud key-value backup and the Apple Watch link (iPhone only).
class CompanionService {
  static const MethodChannel _channel = MethodChannel('com.antigravity.nfc_tag_master/launch');

  /// Whether this build carries the iCloud capability.
  static Future<bool> iCloudSupported() async {
    try {
      return await _channel.invokeMethod<bool>('iCloudSupported') ?? false;
    } on MissingPluginException {
      return false;
    } on PlatformException {
      return false;
    }
  }

  static Future<bool> iCloudAvailable() async {
    try {
      return await _channel.invokeMethod<bool>('iCloudAvailable') ?? false;
    } on MissingPluginException {
      return false;
    } on PlatformException {
      return false;
    }
  }

  /// Stores [json] gzip-compressed; replaces the previous backup.
  static Future<void> iCloudSave(String json) async {
    final data = Uint8List.fromList(gzip.encode(utf8.encode(json)));
    try {
      final ok = await _channel.invokeMethod<bool>('iCloudSave', {'data': data}) ?? false;
      if (!ok) throw const ICloudException(ICloudError.failed);
    } on PlatformException catch (e) {
      throw ICloudException(switch (e.code) {
        'NO_ACCOUNT' => ICloudError.noAccount,
        'TOO_LARGE' => ICloudError.tooLarge,
        _ => ICloudError.failed,
      });
    } on MissingPluginException {
      throw const ICloudException(ICloudError.failed);
    }
  }

  /// The backup in iCloud and when it was saved; null when there is none.
  static Future<({String json, DateTime savedAt})?> iCloudLoad() async {
    try {
      final res = await _channel.invokeMapMethod<String, Object?>('iCloudLoad');
      final data = res?['data'];
      if (data is! Uint8List) return null;
      final seconds = (res?['savedAt'] as num?) ?? 0;
      return (
        json: utf8.decode(gzip.decode(data)),
        savedAt: DateTime.fromMillisecondsSinceEpoch((seconds * 1000).round()),
      );
    } on MissingPluginException {
      return null;
    } on PlatformException {
      return null;
    } on FormatException {
      return null;
    }
  }

  /// Sends what the watch app shows. False when no watch is paired.
  static Future<bool> updateWatch(Map<String, Object?> context) async {
    try {
      return await _channel.invokeMethod<bool>('updateWatch', context) ?? false;
    } on MissingPluginException {
      return false;
    } on PlatformException {
      return false;
    }
  }

  /// Actions taken on the watch since the last call.
  static Future<List<Object?>> takeWatchEvents() async {
    try {
      return await _channel.invokeListMethod<Object?>('takeWatchEvents') ?? const [];
    } on MissingPluginException {
      return const [];
    } on PlatformException {
      return const [];
    }
  }
}
