import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class TjColors extends ThemeExtension<TjColors> {
  const TjColors({
    required this.sage,
    required this.mist,
    required this.ink,
    required this.softAccent,
    required this.surfaceElevated,
    required this.dangerSoft,
  });

  final Color sage;
  final Color mist;
  final Color ink;
  final Color softAccent;
  final Color surfaceElevated;
  final Color dangerSoft;

  static const light = TjColors(
    sage: Color(0xFF3F6F5C),
    mist: Color(0xFFE7F0EB),
    ink: Color(0xFF1C2B24),
    softAccent: Color(0xFF2F5D74),
    surfaceElevated: Color(0xFFF7FAF8),
    dangerSoft: Color(0xFF8B3A3A),
  );

  static const dark = TjColors(
    sage: Color(0xFF8FBFAB),
    mist: Color(0xFF1A2620),
    ink: Color(0xFFE8F2EC),
    softAccent: Color(0xFF7EB0C9),
    surfaceElevated: Color(0xFF243029),
    dangerSoft: Color(0xFFE08A8A),
  );

  @override
  TjColors copyWith({
    Color? sage,
    Color? mist,
    Color? ink,
    Color? softAccent,
    Color? surfaceElevated,
    Color? dangerSoft,
  }) {
    return TjColors(
      sage: sage ?? this.sage,
      mist: mist ?? this.mist,
      ink: ink ?? this.ink,
      softAccent: softAccent ?? this.softAccent,
      surfaceElevated: surfaceElevated ?? this.surfaceElevated,
      dangerSoft: dangerSoft ?? this.dangerSoft,
    );
  }

  @override
  TjColors lerp(ThemeExtension<TjColors>? other, double t) {
    if (other is! TjColors) return this;
    return TjColors(
      sage: Color.lerp(sage, other.sage, t)!,
      mist: Color.lerp(mist, other.mist, t)!,
      ink: Color.lerp(ink, other.ink, t)!,
      softAccent: Color.lerp(softAccent, other.softAccent, t)!,
      surfaceElevated: Color.lerp(surfaceElevated, other.surfaceElevated, t)!,
      dangerSoft: Color.lerp(dangerSoft, other.dangerSoft, t)!,
    );
  }
}

ThemeData buildTjTheme({required Brightness brightness}) {
  final isDark = brightness == Brightness.dark;
  final colors = isDark ? TjColors.dark : TjColors.light;
  final base = isDark ? ColorScheme.dark() : ColorScheme.light();
  final scheme = base.copyWith(
    primary: colors.sage,
    secondary: colors.softAccent,
    surface: colors.surfaceElevated,
    onSurface: colors.ink,
    onPrimary: isDark ? const Color(0xFF102018) : Colors.white,
    error: colors.dangerSoft,
  );

  final display = GoogleFonts.frauncesTextTheme();
  final body = GoogleFonts.sourceSans3TextTheme();

  return ThemeData(
    useMaterial3: true,
    brightness: brightness,
    colorScheme: scheme,
    scaffoldBackgroundColor: isDark ? const Color(0xFF121916) : colors.mist,
    textTheme: body.copyWith(
      displayLarge: display.displayLarge?.copyWith(
        color: colors.ink,
        fontWeight: FontWeight.w600,
      ),
      displayMedium: display.displayMedium?.copyWith(
        color: colors.ink,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: display.headlineLarge?.copyWith(
        color: colors.ink,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: display.headlineMedium?.copyWith(
        color: colors.ink,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: display.headlineSmall?.copyWith(
        color: colors.ink,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: body.titleLarge?.copyWith(
        color: colors.ink,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: body.bodyLarge?.copyWith(color: colors.ink, height: 1.4),
      bodyMedium: body.bodyMedium?.copyWith(
        color: colors.ink.withValues(alpha: 0.9),
        height: 1.4,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: colors.ink,
      centerTitle: false,
      titleTextStyle: display.titleLarge?.copyWith(
        color: colors.ink,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colors.sage,
      foregroundColor: scheme.onPrimary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.surfaceElevated.withValues(alpha: isDark ? 0.5 : 0.85),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: colors.sage.withValues(alpha: 0.25)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: colors.sage, width: 1.5),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    extensions: [colors],
  );
}

extension TjThemeX on BuildContext {
  TjColors get tjColors => Theme.of(this).extension<TjColors>()!;
}
