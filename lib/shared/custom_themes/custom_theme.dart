import 'package:cara_ou_coroa_gigachad_edition/shared/custom_themes/custom_appbar_theme.dart';
import 'package:cara_ou_coroa_gigachad_edition/shared/custom_themes/custom_color_scheme.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: CustomAppbarTheme.lightAppBarTheme,
    colorScheme: CustomColorScheme.lightColorScheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: CustomAppbarTheme.darkAppBarTheme,
    colorScheme: CustomColorScheme.darkColorScheme,
  );
}
