import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  fontFamily: 'PoppinsRegular',
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
  ),
  useMaterial3: true,
  buttonTheme: const ButtonThemeData(),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 72,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 42,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 30,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontSize: 24,
      color: Colors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.white,
    ),
    bodySmall: TextStyle(
      fontSize: 10,
      color: Colors.white,
    ),
    headlineLarge: TextStyle(
      fontSize: 42,
      fontFamily: 'PoppinsBold',
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      fontFamily: 'PoppinsBold',
      color: Colors.white,
    ),
    headlineSmall: TextStyle(
      fontSize: 28,
      fontFamily: 'PoppinsBold',
      color: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      side: MaterialStateProperty.all(const BorderSide(color: Colors.grey)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(56),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        fontFamily: 'PoppinsRegular',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 4,
      shadowColor: const Color(0xF4845F82),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        fontFamily: 'PoppinsRegular',
      ),
    ),
  ),
  brightness: Brightness.dark,
  inputDecorationTheme: const InputDecorationTheme(
    prefixStyle: TextStyle(
      fontSize: 18,
      fontFamily: 'PoppinsRegular',
      color: Colors.white,
    ),
    hintStyle: TextStyle(
      fontSize: 16,
      fontFamily: 'PoppinsRegular',
      color: Colors.white,
    ),
    labelStyle: TextStyle(
      fontSize: 16,
      fontFamily: 'PoppinsRegular',
      color: Colors.white,
    ),
    counterStyle: TextStyle(
      fontSize: 16,
      fontFamily: 'PoppinsRegular',
      color: Colors.white,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  ),
  progressIndicatorTheme:
      const ProgressIndicatorThemeData(circularTrackColor: Colors.black),
);
