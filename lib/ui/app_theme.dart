import 'package:flutter/material.dart';

/// Design tokens. Neutrals and the single action blue follow the Apple design
/// system from open-design (design-systems/apple); the soft canvas gradient
/// and floating navigation follow the reference screens.
class _Palette {
  final Color ink;
  final Color secondary;
  final Color border;
  final Color canvas;
  final Color surface;
  final Color subtleFill;
  final Color accent;
  final Color accentBright;
  final Color accentSoft;
  final Color success;
  final Color warning;
  final Color danger;
  final Color shadow;
  final List<Color> canvasStops;

  const _Palette({
    required this.ink,
    required this.secondary,
    required this.border,
    required this.canvas,
    required this.surface,
    required this.subtleFill,
    required this.accent,
    required this.accentBright,
    required this.accentSoft,
    required this.success,
    required this.warning,
    required this.danger,
    required this.shadow,
    required this.canvasStops,
  });
}

/// Design tokens. Neutrals and the single action blue follow the Apple design
/// system from open-design (design-systems/apple); the soft canvas gradient
/// and floating navigation follow the reference screens. Values switch with
/// the active brightness (see [AppColors.setDark]).
class AppColors {
  static const _Palette _light = _Palette(
    ink: Color(0xFF1D1D1F),
    secondary: Color(0xFF6E6E73),
    border: Color(0xFFD2D2D7),
    canvas: Color(0xFFF5F5F7),
    surface: Colors.white,
    subtleFill: Color(0xFFF2F2F7),
    accent: Color(0xFF0071E3),
    accentBright: Color(0xFF2997FF),
    accentSoft: Color(0xFFE8F1FC),
    success: Color(0xFF1E8E3E),
    warning: Color(0xFFB25E00),
    danger: Color(0xFFD70015),
    shadow: Color(0x141D3B6E),
    canvasStops: [Color(0xFFE9EEF6), Color(0xFFF5F5F7), Color(0xFFEFF3F8)],
  );

  static const _Palette _dark = _Palette(
    ink: Color(0xFFF5F5F7),
    secondary: Color(0xFF98989D),
    border: Color(0xFF38383A),
    canvas: Color(0xFF000000),
    surface: Color(0xFF1C1C1E),
    subtleFill: Color(0xFF2C2C2E),
    accent: Color(0xFF0A84FF),
    accentBright: Color(0xFF64D2FF),
    accentSoft: Color(0xFF0F2A47),
    success: Color(0xFF30D158),
    warning: Color(0xFFFF9F0A),
    danger: Color(0xFFFF453A),
    shadow: Color(0x66000000),
    canvasStops: [Color(0xFF0B0F17), Color(0xFF000000), Color(0xFF0A0E16)],
  );

  static bool _isDark = false;
  static int _accentIndex = 0;

  /// (light accent, dark accent, light soft, dark soft) per preset: blue,
  /// green, purple, orange, pink.
  static const List<(Color, Color, Color, Color)> accentPresets = [
    (Color(0xFF0071E3), Color(0xFF0A84FF), Color(0xFFE8F1FC), Color(0xFF0F2A47)),
    (Color(0xFF1B8A4B), Color(0xFF30D158), Color(0xFFE6F4EC), Color(0xFF0F3320)),
    (Color(0xFF7A3FD1), Color(0xFFBF5AF2), Color(0xFFF1EAFB), Color(0xFF2E1847)),
    (Color(0xFFC65A00), Color(0xFFFF9F0A), Color(0xFFFCEFE3), Color(0xFF3F2508)),
    (Color(0xFFC2185B), Color(0xFFFF375F), Color(0xFFFCE8EF), Color(0xFF451425)),
    (Color(0xFFC62828), Color(0xFFFF453A), Color(0xFFFCE9E9), Color(0xFF4A1414)),
    (Color(0xFF00897B), Color(0xFF40C8E0), Color(0xFFE0F4F2), Color(0xFF0B3A36)),
    (Color(0xFFA67C00), Color(0xFFFFD60A), Color(0xFFFBF3DC), Color(0xFF3D2F06)),
    (Color(0xFF3F51B5), Color(0xFF5E5CE6), Color(0xFFE8EAF6), Color(0xFF1A1F4A)),
  ];

  static _Palette get _p => _withAccent(_isDark ? _dark : _light, _isDark);

  static _Palette _withAccent(_Palette base, bool dark) {
    if (_accentIndex == 0) return base;
    final a = accentPresets[_accentIndex];
    return _Palette(
      ink: base.ink,
      secondary: base.secondary,
      border: base.border,
      canvas: base.canvas,
      surface: base.surface,
      subtleFill: base.subtleFill,
      accent: dark ? a.$2 : a.$1,
      accentBright: a.$2,
      accentSoft: dark ? a.$4 : a.$3,
      success: base.success,
      warning: base.warning,
      danger: base.danger,
      shadow: base.shadow,
      canvasStops: base.canvasStops,
    );
  }

  /// Called when the accent setting changes (before the app rebuilds).
  static void setAccent(int index) =>
      _accentIndex = index >= 0 && index < accentPresets.length ? index : 0;
  static int get accentIndex => _accentIndex;

  /// Called from MaterialApp.builder with the resolved brightness.
  static void setDark(bool value) => _isDark = value;
  static bool get isDark => _isDark;

  static Color get ink => _p.ink;
  static Color get secondary => _p.secondary;
  static Color get border => _p.border;
  static Color get canvas => _p.canvas;
  static Color get surface => _p.surface;
  static Color get subtleFill => _p.subtleFill;
  static Color get accent => _p.accent;
  static Color get accentBright => _p.accentBright;
  static Color get accentSoft => _p.accentSoft;
  static Color get success => _p.success;
  static Color get warning => _p.warning;
  static Color get danger => _p.danger;

  /// Tinted backgrounds for notices; readable in both themes.
  static Color get successSoft => _p.success.withValues(alpha: _isDark ? 0.18 : 0.10);
  static Color get warningSoft => _p.warning.withValues(alpha: _isDark ? 0.18 : 0.10);
  static Color get dangerSoft => _p.danger.withValues(alpha: _isDark ? 0.18 : 0.08);
  static Color get neutralSoft => _p.subtleFill;

  static LinearGradient get canvasGradient => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: _p.canvasStops,
      );

  static LinearGradient get heroGradient {
    final a = accentPresets[_accentIndex].$1;
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [a, Color.lerp(a, Colors.white, 0.3)!, Color.lerp(a, Colors.white, 0.75)!],
    );
  }

  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: _p.shadow,
          blurRadius: 24,
          offset: const Offset(0, 8),
        ),
      ];
}

class AppTheme {
  static ThemeData dark() => _build(AppColors._withAccent(AppColors._dark, true), Brightness.dark);

  static ThemeData light() => _build(AppColors._withAccent(AppColors._light, false), Brightness.light);

  static ThemeData _build(_Palette c, Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: c.accent,
      brightness: brightness,
    ).copyWith(
      primary: c.accent,
      onPrimary: Colors.white,
      surface: c.surface,
      onSurface: c.ink,
      onSurfaceVariant: c.secondary,
      outline: c.border,
      outlineVariant: c.border,
      error: c.danger,
    );

    final base = ThemeData(useMaterial3: true, brightness: brightness, colorScheme: scheme);
    final text = base.textTheme.apply(bodyColor: c.ink, displayColor: c.ink);

    const stadium = StadiumBorder();
    const buttonPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 14);
    const buttonText = TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -0.2);

    return base.copyWith(
      scaffoldBackgroundColor: c.canvas,
      textTheme: text.copyWith(
        headlineMedium: text.headlineMedium?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.6),
        headlineSmall: text.headlineSmall?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.4),
        titleLarge: text.titleLarge?.copyWith(fontWeight: FontWeight.w700, letterSpacing: -0.3),
        titleMedium: text.titleMedium?.copyWith(fontWeight: FontWeight.w600, letterSpacing: -0.2),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: c.ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: c.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        shadowColor: const Color(0xFF1D3B6E).withValues(alpha: 0.18),
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: c.accent,
          foregroundColor: Colors.white,
          disabledBackgroundColor: c.border.withValues(alpha: 0.6),
          elevation: 0,
          shape: stadium,
          padding: buttonPadding,
          textStyle: buttonText,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: c.accent,
          shape: stadium,
          padding: buttonPadding,
          textStyle: buttonText,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.ink,
          backgroundColor: c.surface,
          side: BorderSide(color: c.border),
          shape: stadium,
          padding: buttonPadding,
          textStyle: buttonText,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: c.accent,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: StadiumBorder(side: BorderSide(color: c.border)),
        backgroundColor: c.surface,
        selectedColor: c.accent,
        secondarySelectedColor: c.accent,
        labelStyle: TextStyle(color: c.ink, fontWeight: FontWeight.w500),
        secondaryLabelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        checkmarkColor: Colors.white,
        showCheckmark: false,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: c.surface,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: c.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: c.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: c.accent, width: 1.6),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: c.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: c.surface,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      dividerTheme: const DividerThemeData(color: Color(0xFFE5E5EA), space: 24),
      listTileTheme: ListTileThemeData(iconColor: c.secondary),
      progressIndicatorTheme: ProgressIndicatorThemeData(color: c.accent),
    );
  }
}

/// White rounded card with the soft shadow used across the app.
class SoftCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const SoftCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        boxShadow: AppColors.softShadow,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(padding: padding, child: child),
        ),
      ),
    );
  }
}

/// Section title with an optional trailing action, e.g. "Öne çıkanlar  Tümünü gör >".
class SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const SectionHeader({super.key, required this.title, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 20, 4, 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w700, letterSpacing: -0.3),
            ),
          ),
          if (actionLabel != null)
            TextButton(
              onPressed: onAction,
              style: TextButton.styleFrom(foregroundColor: AppColors.secondary),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(actionLabel!),
                  const Icon(Icons.chevron_right, size: 18),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// Compact metric tile: label + icon on top, big number below.
class StatTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const StatTile({super.key, required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SoftCard(
      padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 13, color: AppColors.secondary, fontWeight: FontWeight.w500),
                ),
              ),
              Icon(icon, size: 18, color: AppColors.secondary),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, letterSpacing: -0.8),
          ),
        ],
      ),
    );
  }
}

/// Large gradient call-to-action card.
class HeroActionCard extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String subtitle;
  final String buttonLabel;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool busy;

  const HeroActionCard({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.icon,
    this.onPressed,
    this.busy = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.heroGradient,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.accent.withValues(alpha: 0.25),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          PositionedDirectional(
            end: -40,
            top: -40,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.25), width: 1.5),
              ),
            ),
          ),
          PositionedDirectional(
            end: 20,
            bottom: 20,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.18),
                border: Border.all(color: Colors.white.withValues(alpha: 0.5)),
              ),
              child: Icon(icon, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(22, 20, 22, 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eyebrow.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.8,
                  ),
                ),
                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsetsDirectional.only(end: 60),
                  child: Text(
                    subtitle,
                    style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 14, height: 1.35),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF1D1D1F),
                    disabledForegroundColor: const Color(0xFF6E6E73),
                    disabledBackgroundColor: Colors.white.withValues(alpha: 0.6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (busy)
                        const Padding(
                          padding: EdgeInsetsDirectional.only(end: 10),
                          child: SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2)),
                        ),
                      Flexible(child: Text(buttonLabel, textAlign: TextAlign.center)),
                      if (!busy) ...[
                        const SizedBox(width: 6),
                        const Icon(Icons.north_east, size: 16),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Tappable tool row used on the tools screen.
class ToolTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color? color;
  final VoidCallback? onTap;

  const ToolTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final tint = color ?? AppColors.accent;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SoftCard(
        onTap: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: tint.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: tint),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(subtitle, style: TextStyle(fontSize: 13, color: AppColors.secondary)),
                ],
              ),
            ),
            Icon(Icons.chevron_right, color: onTap == null ? AppColors.border : AppColors.secondary),
          ],
        ),
      ),
    );
  }
}
