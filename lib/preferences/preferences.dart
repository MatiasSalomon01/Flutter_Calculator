import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  static String _screen = '';

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static set screen(String value) {
    _screen = value;
    _prefs.setString('screen', value);
  }

  static String get screen {
    return _prefs.getString('screen') ?? _screen;
  }
}
