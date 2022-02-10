import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.red;
  static final ThemeData theme = ThemeData.dark().copyWith(
      primaryColor: primary,
      //scaffoldBackgroundColor: Colors.grey[300],
      appBarTheme: const AppBarTheme(elevation: 0, color: primary),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 0),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          //unselectedLabelStyle: TextStyle(color: Colors.redAccent),
          //selectedLabelStyle: TextStyle(color: primary),
          selectedItemColor: primary),
      progressIndicatorTheme: const ProgressIndicatorThemeData(color: primary),
      iconTheme: const IconThemeData(color: Colors.grey));
}
