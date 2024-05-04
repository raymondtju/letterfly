import "package:flutter/material.dart";
import "package:flutter/widgets.dart";

class GlobalThemeData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  ThemeData lightThemeData = themeData(lightColorScheme, _lightFocusColor);
  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
        colorScheme: colorScheme,
        canvasColor: colorScheme.background,
        scaffoldBackgroundColor: colorScheme.background,
        highlightColor: Colors.transparent,
        focusColor: focusColor);
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(40, 42, 45, 1),
    onPrimary: Color.fromRGBO(249, 249, 249, 1),
    secondary: Color.fromRGBO(40, 42, 45, 1),
    onSecondary: Color.fromRGBO(249, 249, 249, 1),
    background: Color.fromRGBO(249, 249, 249, 1),
    onBackground: Color.fromRGBO(40, 42, 45, 1),
    error: Colors.red,
    onError: Colors.white,
    surface: Color.fromRGBO(249, 249, 249, 1),
    onSurface: Color.fromRGBO(40, 42, 45, 1),
  );
}
