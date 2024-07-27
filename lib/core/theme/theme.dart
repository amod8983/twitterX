import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color twitterBlue = Color(0xFF1DA1F2);

// Light Theme
final ThemeData lightTheme = ThemeData(
  primaryColor: twitterBlue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  textTheme: GoogleFonts.openSansTextTheme().copyWith(
    bodyMedium: const TextStyle(color: Colors.black),
    bodySmall: const TextStyle(color: Colors.black),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: twitterBlue,
  ),
);

// Dark Theme
final ThemeData darkTheme = ThemeData(
  primaryColor: twitterBlue,
  scaffoldBackgroundColor: const Color(0xFF15202B),
  appBarTheme: const AppBarTheme(
    color: Color(0xFF15202B),
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: GoogleFonts.openSansTextTheme().copyWith(
    bodyMedium: const TextStyle(color: Colors.white),
    bodySmall: const TextStyle(color: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: twitterBlue,
  ),
);
