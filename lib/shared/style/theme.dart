import 'package:flutter/material.dart';

ThemeData lightmode = ThemeData(
    inputDecorationTheme:  InputDecorationTheme(
    ),
textTheme: const TextTheme(
  bodyText1: TextStyle(
    fontFamily:  'Qilgabe',
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black
  ),
),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        fontFamily: 'Qilgabe',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30.0
    ),
    titleSpacing: 20,
    backgroundColor: Colors.white,
    elevation: 0.0,
  ),
  iconTheme: IconThemeData(
      color: Colors.black,
      size: 30.0
  ),
);