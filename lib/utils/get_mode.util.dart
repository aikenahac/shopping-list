import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ThemeMode> getCurrentMode() async {
  SharedPreferences storage = await SharedPreferences.getInstance();

  String setMode = storage.getString('mode') ?? 'light';

  switch (setMode) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.light;
  }
}
