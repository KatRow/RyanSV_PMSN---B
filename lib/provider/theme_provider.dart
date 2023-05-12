import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int selectedTheme = 0;
  bool isDarkModeEnabled =
      false; // Variable para controlar el estado del modo oscuro

  ThemeData getThemeData() {
    switch (selectedTheme) {
      case 0:
        return getLightThemeData();
      case 1:
        return getDarkThemeData();
      case 2:
        return getCustomThemeData();
      default:
        return getLightThemeData();
    }
  }

  ThemeData getLightThemeData() {
    return ThemeData.light().copyWith(
      primaryColor: Colors.blue,
      accentColor: Colors.blue,
      // Otros atributos de estilo...
    );
  }

  ThemeData getDarkThemeData() {
    // Modo oscuro
    return ThemeData.dark().copyWith(
      primaryColor: Colors.grey,
      accentColor: Colors.grey,
      // Otros atributos de estilo...
    );
  }

  ThemeData getCustomThemeData() {
    // Tema personalizado con color rojo adicional
    final baseTheme = ThemeData.dark();
    print(selectedTheme);
    return baseTheme.copyWith(
      primaryColor: Colors.red,
      accentColor: Colors.red,
    );
  }

  void setTheme(int themeId) {
    selectedTheme = themeId;
    notifyListeners();
  }
}
