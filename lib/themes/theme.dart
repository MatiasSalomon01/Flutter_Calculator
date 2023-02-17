import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData _themeData;

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromRGBO(229, 231, 233, 3),
          foregroundColor: Colors.black),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
        brightness: Brightness.dark,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(121, 125, 127, 3),
            foregroundColor: Colors.white));
  }

  static ButtonStyle textButton(bool state) {
    ButtonStyle x;
    if (state == true) {
      x = TextButton.styleFrom(
          backgroundColor: const Color.fromRGBO(228, 228, 228, 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          textStyle: TextStyle(
              foreground: Paint()..color = Colors.black, fontSize: 30));
    } else {
      x = TextButton.styleFrom(
          backgroundColor: const Color.fromRGBO(65, 65, 65, 3),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          textStyle: TextStyle(
              foreground: Paint()..color = Colors.white, fontSize: 30));
    }

    return x;
  }

  static BoxDecoration conteinerTheme(bool state) {
    BoxDecoration x;
    if (state == true) {
      x = const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: Color.fromRGBO(238, 238, 238, 5),
      );
    } else {
      x = const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: Color.fromRGBO(73, 73, 73, 5),
      );
    }
    return x;
  }

  ThemeChanger(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }
}
