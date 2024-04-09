import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData().copyWith(
  colorScheme: colorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: colorScheme.onPrimaryContainer,
    foregroundColor: colorScheme.primaryContainer,
  ),
  cardTheme: const CardTheme().copyWith(
    color: colorScheme.secondaryContainer,
    margin: const EdgeInsets.symmetric(
      horizontal: 12,
      vertical: 6,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primaryContainer,
    ),
  ),
  textTheme: GoogleFonts.robotoTextTheme(),
);

var colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
