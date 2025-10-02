import 'package:cara_ou_coroa_gigachad_edition/shared/contants/color_palette.dart';
import 'package:flutter/material.dart';

class CustomColorScheme {
  static ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorPalette.green,
    onPrimary: ColorPalette.white2,
    secondary: ColorPalette.greenOpacity,
    onSecondary: ColorPalette.black1,
    secondaryContainer: ColorPalette.greenOpacity,
    onSecondaryContainer: ColorPalette.black1,
    error: ColorPalette.golden,
    onError: ColorPalette.black1,
    surface: ColorPalette.white2,
    onSurface: ColorPalette.black1,
  );

  static ColorScheme darkColorScheme = lightColorScheme.copyWith(
    brightness: Brightness.dark,
    onSecondary: ColorPalette.white2,
    onSecondaryContainer: ColorPalette.white2,
    surface: ColorPalette.black1,
    onSurface: ColorPalette.white2,
  );
}
