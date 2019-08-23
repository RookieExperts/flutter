
import 'package:flutter/material.dart';

class AppTheme{
  final darkTheme = ThemeData(
    backgroundColor: Colors.black,
    primaryColor: Colors.black,
    brightness: Brightness.dark
  );

  final lightTheme = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: Colors.green,
    primarySwatch: Colors.orange,
    brightness: Brightness.light
  );
}