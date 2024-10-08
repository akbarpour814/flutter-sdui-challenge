import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/configs/gen/fonts.gen.dart';

ThemeData themeConfig(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    fontFamily: FontFamily.iranSans,
    appBarTheme: AppBarTheme(
        color: Theme.of(context).primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamily.iranSans,
        )),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Theme.of(context).primaryColor),
    )),
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8))),
    useMaterial3: true,
  );
}
