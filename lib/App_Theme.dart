import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/SizeConfig.dart';
import 'AppColors.dart';

class AppTheme {
  AppTheme._();

  /// ✅ Light Theme
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.lightPrimary,

    /// 🎨 Colors for light mode
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.lightPrimary, // Old primary
      onPrimary: AppColors.lightOnPrimary, // Text/icon on primary
      secondary: AppColors.lightSecondary, // Accent color
      onSecondary: AppColors.lightOnPrimary,
      error: Colors.red,
      onError: Colors.white,
      background: AppColors.lightPrimary, // Scaffold background
      onBackground: AppColors.lightOnPrimary,
      surface: AppColors.lightCard, // Card bg
      onSurface: AppColors.lightOnPrimary,
    ),

    /// 📌 AppBar styling
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightPrimaryVariant, // Old primaryVariant
      elevation: 8,
      titleTextStyle: GoogleFonts.lobster(
        color: AppColors.lightAppBarText,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(color: AppColors.lightPrimary),
    ),

    iconTheme: const IconThemeData(color: AppColors.lightIcon),

    // Light theme card
    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      shadowColor: AppColors.lightShadow,
      elevation: 6,
      surfaceTintColor: AppColors.lightCard, // prevents Material3 overlay tint
    ),

    dividerColor: AppColors.lightDivider,

    /// ✍ Text theme (updated names: headline1 → displayLarge, bodyText1 → bodyLarge, subtitle1 → titleMedium)
    textTheme: TextTheme(
      displayLarge: GoogleFonts.oswald(
        // OLD: headline1
        fontSize: 2.68 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.bold,
        color: AppColors.lightOnPrimary,
        letterSpacing: 1,
      ),
      bodyLarge: GoogleFonts.ptSans(
        // OLD: bodyText1
        fontSize: 2.23 * SizeConfig.textMultiplier,
        color: AppColors.lightOnPrimary,
        letterSpacing: .5,
      ),
      titleMedium: GoogleFonts.ptSans(
        // OLD: subtitle1
        fontSize: 1.79 * SizeConfig.textMultiplier,
        color: AppColors.lightOnPrimary,
        letterSpacing: .3,
      ),
    ),

    /// 🔲 Input fields
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightPrimaryVariant),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.lightPrimaryVariant),
      ),
      hintStyle: GoogleFonts.ptSans(
        fontSize: 2.23 * SizeConfig.textMultiplier,
        color: AppColors.lightOnPrimary,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),

    /// 🔘 Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightButton,
        foregroundColor: AppColors.darkPrimary,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );

  /// 🌙 Dark Theme
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkPrimary,

    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkPrimary,
      onPrimary: AppColors.darkOnPrimary,
      secondary: AppColors.darkSecondary,
      onSecondary: AppColors.darkOnPrimary,
      error: Colors.red,
      onError: Colors.white,
      background: AppColors.darkPrimary,
      onBackground: AppColors.darkOnPrimary,
      surface: AppColors.darkCard,
      onSurface: AppColors.darkOnPrimary,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimaryVariant,
      elevation: 8,
      titleTextStyle: GoogleFonts.lobster(
        color: AppColors.darkAppBarText,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(color: AppColors.darkOnPrimary),
    ),

    iconTheme: const IconThemeData(color: AppColors.darkIcon),

    // Dark theme card
    cardTheme: CardThemeData(
      color: AppColors.darkCard,
      shadowColor: AppColors.darkShadow,
      elevation: 6,
      surfaceTintColor: AppColors.darkCard,
    ),

    dividerColor: AppColors.darkDivider,

    textTheme: TextTheme(
      displayLarge: GoogleFonts.oswald(
        // OLD: headline1
        fontSize: 2.68 * SizeConfig.textMultiplier,
        fontWeight: FontWeight.bold,
        color: AppColors.darkOnPrimary,
        letterSpacing: 1,
      ),
      bodyLarge: GoogleFonts.ptSans(
        // OLD: bodyText1
        fontSize: 2.23 * SizeConfig.textMultiplier,
        color: AppColors.darkOnPrimary,
        letterSpacing: .5,
      ),
      titleMedium: GoogleFonts.ptSans(
        // OLD: subtitle1
        fontSize: 1.79 * SizeConfig.textMultiplier,
        color: AppColors.darkOnPrimary,
        letterSpacing: .3,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkPrimaryVariant),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.darkPrimaryVariant),
      ),
      hintStyle: GoogleFonts.ptSans(
        fontSize: 2.23 * SizeConfig.textMultiplier,
        color: AppColors.darkOnPrimary,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkButton,
        foregroundColor: AppColors.darkButtonText,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    ),
  );
}
