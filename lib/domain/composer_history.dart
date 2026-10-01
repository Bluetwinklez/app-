import 'dart:typed_data';
import 'ndef_record.dart';

/// Pure Dart bounded undo/redo history manager for NDEF composer records.
class ComposerHistory {
  final int maxSnapshots;
  final List<List<NdefRecordModel>> _undoStack = [];
  final List<List<NdefRecordModel>> _redoStack = [];

  ComposerHistory({this.maxSnapshots = 30}) : assert(maxSnapshots > 0);

  /// Deep clones a list of [NdefRecordModel]s to ensure immutable snapshots.
  static List<NdefRecordModel> cloneRecords(List<NdefRecordModel> records) {
    return records.map((r) {
      return NdefRecordModel(
        tnf: r.tnf,
        type: Uint8List.fromList(r.type),
        id: Uint8List.fromList(r.id),
        payload: Uint8List.fromList(r.payload),
      );
    }).toList();
  }

  /// Whether undo is currently available.
  bool get canUndo => _undoStack.isNotEmpty;

  /// Whether redo is currently available.
  bool get canRedo => _redoStack.isNotEmpty;

  /// Number of undo snapshots available.
  int get undoCount => _undoStack.length;

  /// Number of redo snapshots available.
  int get redoCount => _redoStack.length;

  /// Pushes the [currentRecords] before a mutation takes place.
  /// Clears the redo stack and bounds the undo stack to [maxSnapshots].
  void push(List<NdefRecordModel> currentRecords) {
    _undoStack.add(cloneRecords(currentRecords));
    if (_undoStack.length > maxSnapshots) {
      _undoStack.removeAt(0);
    }
    _redoStack.clear();
  }

  /// Reverts to the previous snapshot, placing [currentRecords] onto the redo stack.
  /// Returns the restored records list, or null if cannot undo.
  List<NdefRecordModel>? undo(List<NdefRecordModel> currentRecords) {
    if (!canUndo) return null;
    final previous = _undoStack.removeLast();
    _redoStack.add(cloneRecords(currentRecords));
    if (_redoStack.length > maxSnapshots) {
      _redoStack.removeAt(0);
    }
    return cloneRecords(previous);
  }

  /// Re-applies the next snapshot, placing [currentRecords] onto the undo stack.
  /// Returns the restored records list, or null if cannot redo.
  List<NdefRecordModel>? redo(List<NdefRecordModel> currentRecords) {
    if (!canRedo) return null;
    final next = _redoStack.removeLast();
    _undoStack.add(cloneRecords(currentRecords));
    if (_undoStack.length > maxSnapshots) {
      _undoStack.removeAt(0);
    }
    return cloneRecords(next);
  }

  /// Clears all undo and redo history.
  void clear() {
    _undoStack.clear();
    _redoStack.clear();
  }
}
