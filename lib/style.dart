import 'package:flutter/material.dart';

Color primaryBlack = const Color(0x232323);
Color primaryGray = const Color(0xF4F4F4);
Color primaryWhite = const Color(0xFFFFFF);

Color primaryRed = const Color(0xF44336);
Color secondaryRed = const Color(0xF88D84);
Color lightPink = const Color(0xFDD8D3);

ThemeData mainTheme = ThemeData(
  backgroundColor: primaryGray,
  primaryColor: primaryRed,
  accentColor: secondaryRed,
  fontFamily: 'Roboto',
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 18.0),
    bodyText2: TextStyle(fontSize: 16.0),

  ),
  buttonTheme: primaryButtonTheme,
);

ButtonThemeData primaryButtonTheme = ButtonThemeData(
  buttonColor: primaryRed,
  padding: const EdgeInsets.symmetric(horizontal: 100),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
);
