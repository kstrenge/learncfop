import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.teal,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      minimumSize: MaterialStateProperty.all(Size(double.infinity, 48)),
      backgroundColor: MaterialStateProperty.all(Colors.teal),
    ),
  ),
);
