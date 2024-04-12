import 'package:flutter/material.dart';

class ChatoTheme {
  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Inter',
    scaffoldBackgroundColor: Colors.grey.shade300,
    colorScheme: ColorScheme.light(
      primary: Colors.grey.shade900,
      secondary: Colors.grey.shade500,
      background: Colors.grey.shade300,
      surface: Colors.grey.shade200,
      surfaceTint: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.grey.shade800,
    ),
    textTheme: TextTheme(
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.grey.shade900,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.grey.shade900,
      ),
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      actionsIconTheme: IconThemeData(color: Colors.grey.shade900),
      color: Colors.transparent,
      titleTextStyle: TextStyle(
        color: Colors.grey.shade900,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.grey.shade900,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
