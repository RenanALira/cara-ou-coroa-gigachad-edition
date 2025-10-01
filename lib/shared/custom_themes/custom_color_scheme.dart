import 'package:cara_ou_coroa_gigachad_edition/shared/contants/color_palette.dart';
import 'package:flutter/material.dart';

class CustomColorScheme {
  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorPalette.primary,
    onPrimary: ColorPalette.white1,
    secondary: ColorPalette.secondary,
    onSecondary: ColorPalette.black1,
    tertiary: ColorPalette.tertiary,
    onTertiary: ColorPalette.black1,
    error: ColorPalette.golden,
    onError: ColorPalette.black1,
    surface: ColorPalette.white1,
    onSurface: ColorPalette.black1,
  );

  static ColorScheme darkColorScheme = lightColorScheme.copyWith(
    brightness: Brightness.dark,
    surface: ColorPalette.black1,
    onSurface: ColorPalette.white1,
  );
}
