part of 'home_screen.dart';

/// Composer reordering and the offline URL safety dialog.
extension _ComposerHelpers on _HomeScreenState {
  // -------------------------------------------------------------
  // Workflow 4: Composer Record Reordering
  // -------------------------------------------------------------

  void _moveComposerRecordUp(int index) {
    if (index <= 0) return;
    _refresh(() {
      _composerHistory.push(_recordsToWrite);
      final item = _recordsToWrite.removeAt(index);
      _recordsToWrite.insert(index - 1, item);
    });
  }

  void _moveComposerRecordDown(int index) {
    if (index >= _recordsToWrite.length - 1) return;
    _refresh(() {
      _composerHistory.push(_recordsToWrite);
      final item = _recordsToWrite.removeAt(index);
      _recordsToWrite.insert(index + 1, item);
    });
  }

  /// Drag-and-drop reordering (onReorderItem: newIndex is already the final
  /// position after removing the dragged item).
  void _reorderComposerRecord(int oldIndex, int newIndex) {
    if (oldIndex == newIndex) return;
    _refresh(() {
      _composerHistory.push(_recordsToWrite);
      final item = _recordsToWrite.removeAt(oldIndex);
      _recordsToWrite.insert(newIndex, item);
      _expandedComposerIndices.clear();
    });
  }

  // -------------------------------------------------------------
  // Workflow 5: Offline URL Safety Dialog
  // -------------------------------------------------------------

  void _showUrlSafetyDialog(String rawUrl) {
    final assessment = UrlSafetyAssessment.evaluate(rawUrl);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(
              assessment.warnings.isEmpty
                  ? Icons.security
                  : Icons.warning_amber_rounded,
              color: assessment.warnings.isEmpty
                  ? AppColors.success
                  : AppColors.warning,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(L10n.current.urlSafetyOfflineAnalysisTitle,
                  style: const TextStyle(fontSize: 16)),
            ),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.subtleFill,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  assessment.rawUrl,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              const SizedBox(height: 12),
              _buildSafetyParam(L10n.current.urlSafetyScheme,
                  assessment.scheme.isEmpty ? '(Eksik)' : assessment.scheme),
              _buildSafetyParam(L10n.current.hostLabel,
                  assessment.host.isEmpty ? L10n.current.unknownParentheses : assessment.host),
              if (assessment.port != null)
                _buildSafetyParam(
                    L10n.current.urlSafetyPort, assessment.port.toString()),
              _buildSafetyParam(
                L10n.current.urlSafetyUserInfoLabel,
                assessment.hasUserInfo ? L10n.current.valuePresentRisky : L10n.current.valueNone,
                highlight: assessment.hasUserInfo,
              ),
              _buildSafetyParam(
                L10n.current.urlSafetyIpLiteral,
                assessment.isIpLiteral
                    ? L10n.current.valueYesIp
                    : L10n.current.urlSafetyDomain,
                highlight: assessment.isIpLiteral,
              ),
              _buildSafetyParam(
                L10n.current.urlSafetyPunycodeLabel,
                assessment.isPunycode ? L10n.current.urlSafetyHomoglyphRisk : L10n.current.no,
                highlight: assessment.isPunycode,
              ),
              const Divider(height: 20),
              if (assessment.warnings.isNotEmpty) ...[
                Text(
                  L10n.current.urlSafetyWarningsHeader,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.warning,
                      fontSize: 13),
                ),
                const SizedBox(height: 4),
                ...assessment.warnings.map(
                  (w) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('⚠️ ', style: TextStyle(fontSize: 12)),
                        Expanded(
                          child: Text(w,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.brown)),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.neutralSoft,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  L10n.current.urlSafetyDisclaimer,
                  style: TextStyle(fontSize: 11, color: AppColors.secondary),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(L10n.current.close),
          ),
        ],
      ),
    );
  }

  Widget _buildSafetyParam(String label, String value,
      {bool highlight = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(
                  fontSize: 12,
                  color: AppColors.ink,
                  fontWeight: FontWeight.w500)),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: highlight ? AppColors.danger : AppColors.ink,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
