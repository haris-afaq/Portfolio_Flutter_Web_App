import 'package:flutter/material.dart';

sealed class AppColors {
  static const seed = Color(0xFF00E5FF); // Neon Cyan

  static const neonPink = Color(0xFFFF2EDF);
  static const neonGreen = Color(0xFF39FF14);
  static const neonPurple = Color(0xFF8A2BE2);

  static const surfaceDark = Color(0xFF0A0A0F);
  static const backgroundDark = Color(0xFF050507);
}


sealed class AppRadii {
  static const card = BorderRadius.all(Radius.circular(20));
  static const button = BorderRadius.all(Radius.circular(14));
}

sealed class AppTheme {

  static ThemeData get dark {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.seed,
      onPrimary: Colors.black,
      secondary: AppColors.neonPink,
      onSecondary: Colors.black,
      tertiary: AppColors.neonGreen,
      error: Colors.redAccent,
      onError: Colors.black,
      surface: AppColors.surfaceDark,
      onSurface: Colors.white,
      background: AppColors.backgroundDark,
      onBackground: Colors.white,
      outline: AppColors.seed.withOpacity(0.9),
      outlineVariant: AppColors.seed.withOpacity(0.5),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,

      /// TEXT
      textTheme: _textTheme(ThemeData.dark().textTheme).apply(
        bodyColor: Colors.white,
        displayColor: Colors.white,
      ),

      /// APP BAR
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: colorScheme.primary,
        centerTitle: false,
      ),

      /// CARDS (NEON GLOW)
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: AppRadii.card),
        shadowColor: colorScheme.primary.withOpacity(0.7),
      ),

      /// INPUTS
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        labelStyle: TextStyle(color: colorScheme.primary),
        border: OutlineInputBorder(
          borderRadius: AppRadii.button,
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadii.button,
          borderSide: BorderSide(
            color: colorScheme.outlineVariant,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadii.button,
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
      ),

      /// BUTTONS
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: Colors.black,
          elevation: 8,
          shadowColor: colorScheme.primary.withOpacity(0.9),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadii.button,
          ),
        ),
      ),

      /// OUTLINED BUTTONS
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: AppRadii.button,
          ),
        ),
      ),

      /// DIVIDERS
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 0.6,
      ),
    );
  }

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: Brightness.light,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: _textTheme(ThemeData.light().textTheme),
    );
  }

  static TextTheme _textTheme(TextTheme base) {
    return base.copyWith(
      headlineLarge: base.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: 1.1,
      ),
      titleLarge: base.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      labelLarge: base.labelLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

