import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData().copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.onPrimaryContainer,
    foregroundColor: lightColorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: lightColorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.primaryContainer,
    ),
  ),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: lightColorScheme.onSecondaryContainer,
      fontSize: 16,
    ),
  ),
);

var appDarkTheme = ThemeData.dark().copyWith(
  colorScheme: darkColorTheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: darkColorTheme.onPrimaryContainer,
    foregroundColor: darkColorTheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: darkColorTheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: darkColorTheme.primaryContainer,
    ),
  ),
  textTheme: GoogleFonts.robotoTextTheme().copyWith(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: darkColorTheme.onSecondaryContainer,
      fontSize: 16,
    ),
  ),
  iconTheme: IconThemeData().copyWith(
    color: darkColorTheme.onSecondaryContainer,
  ),
  // TODO: Improve this
  bottomSheetTheme: BottomSheetThemeData().copyWith(
    backgroundColor: darkColorTheme.primaryContainer,
  ), 
);

var lightColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var darkColorTheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 16, 56, 86),
);
