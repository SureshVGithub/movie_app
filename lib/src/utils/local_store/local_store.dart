import 'package:shared_preferences/shared_preferences.dart';

class LocalStore {
  final String keyLanguageSelected = 'language_selected';
  final String keyUserName = 'user_name';
  final String keyEmail = 'email';
  final String keyTheme = 'theme';
  LocalStore._internal();
  static final LocalStore _instance = LocalStore._internal();
  static SharedPreferences? _prefs;

  /// store user data in shared prefences. That gives you flexibilty to access the stored data scross the app.
  factory LocalStore() {
    return _instance;
  }

  static LocalStore getInstance() {
    initPref();
    return _instance;
  }

  static initPref() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  String? getLanguageSelected() {
    return _prefs!.getString(keyLanguageSelected);
  }

  void setLanguageSelected(String languageSelected) {
    if (languageSelected.isEmpty) {
      _prefs!.remove(keyLanguageSelected);
    } else {
      _prefs!.setString(keyLanguageSelected, languageSelected);
    }
  }

  String? getName() {
    return _prefs!.getString(keyUserName);
  }

  Future<void> setName(String name) async {
    if (name.isEmpty) {
      await _prefs!.remove(keyUserName);
    } else {
      await _prefs!.setString(keyUserName, name);
    }
  }

  String? getEmail() {
    return _prefs!.getString(keyEmail);
  }

  Future<void> setEmail(String email) async {
    if (email.isEmpty) {
      await _prefs!.remove(keyEmail);
    } else {
      await _prefs!.setString(keyEmail, email);
    }
  }

  String? getTheme() {
    return _prefs!.getString(keyTheme);
  }

  Future<void> setTheme(String isDarkTheme) async {
    if (isDarkTheme.isEmpty) {
      await _prefs!.remove(keyTheme);
    } else {
      await _prefs!.setString(keyTheme, isDarkTheme);
    }
  }
}
