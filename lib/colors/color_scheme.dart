import 'package:flutter/material.dart';

const Color blackColor = Color.fromARGB(255, 0, 0, 0);
const Color darkColor = Color.fromARGB(255, 28, 48, 74);
const Color mediumColor = Color.fromARGB(255, 4, 107, 153);
const Color brightColor = Color.fromARGB(255, 255, 126, 126);
const Color lightColor = Color.fromARGB(255, 179, 239, 255);
const Color whiteColor = Color.fromARGB(255, 255, 255, 255);

ColorScheme defaultColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: mediumColor,
  onPrimary: darkColor,
  primaryContainer: mediumColor.withAlpha(100),
  onPrimaryContainer: darkColor,
  secondary: brightColor,
  onSecondary: darkColor,
  secondaryContainer: brightColor.withAlpha(100),
  onSecondaryContainer: darkColor,
  tertiary: lightColor,
  onTertiary: darkColor,
  tertiaryContainer: lightColor.withAlpha(100),
  onTertiaryContainer: darkColor,
  background: whiteColor,
  onBackground: darkColor,
  surface: lightColor,
  onSurface: whiteColor,
  surfaceVariant: brightColor.withAlpha(10),
  onSurfaceVariant: darkColor,
  outline: mediumColor,
  shadow: darkColor,
  inverseSurface: mediumColor,
  onInverseSurface: whiteColor,
  inversePrimary: whiteColor,
  surfaceTint: whiteColor.withAlpha(100),
  error: brightColor,
  onError: whiteColor,
  errorContainer: brightColor.withAlpha(100),
  onErrorContainer: blackColor,
);
ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: whiteColor.withAlpha(200),
  onPrimary: darkColor,
  primaryContainer: mediumColor.withAlpha(200),
  onPrimaryContainer: darkColor,
  secondary: whiteColor.withAlpha(200),
  onSecondary: darkColor,
  secondaryContainer: brightColor.withAlpha(200),
  onSecondaryContainer: whiteColor,
  tertiary: lightColor,
  onTertiary: darkColor,
  tertiaryContainer: lightColor.withAlpha(100),
  onTertiaryContainer: darkColor,
  background: darkColor,
  onBackground: whiteColor,
  surface: mediumColor,
  onSurface: darkColor,
  surfaceVariant: brightColor.withAlpha(10),
  onSurfaceVariant: darkColor,
  outline: mediumColor,
  shadow: darkColor,
  inverseSurface: mediumColor,
  onInverseSurface: whiteColor,
  inversePrimary: whiteColor,
  surfaceTint: whiteColor.withAlpha(100),
  error: brightColor,
  onError: whiteColor,
  errorContainer: brightColor.withAlpha(100),
  onErrorContainer: blackColor,
);
