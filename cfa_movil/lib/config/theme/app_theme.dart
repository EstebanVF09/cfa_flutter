import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() {
    const seedColor = Color(0xff005487);

    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: seedColor,
        listTileTheme: const ListTileThemeData(iconColor: seedColor));
  }
}

const appBarColor = Color(0xff005487);
const principalTextColor = Color(0xff005487);
const primaryButtonColor = Color(0xff005487);
const secondaryButtonColor = Color(0xff0091be);
