import 'package:flutter/material.dart';

class AppAssets {
  static Color primaryColor = const Color(0xFFF96E46);

  static final inputDecoration = InputDecoration(
    border: const OutlineInputBorder(),
    focusColor: AppAssets.primaryColor,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppAssets.primaryColor, width: 2.0),
    ),
  );
}
