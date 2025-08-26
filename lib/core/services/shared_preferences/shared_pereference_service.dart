import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/app/settings/models/localization_mode_model.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _token = 'auth_token';
  static const String _themeMode = 'theme_mode';
  static const String _fcm = 'fcm';
  static const String _localizationMode = 'localization_mode';

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_token, token);
    getIt<CheckUserAuthenticationBloc>().add(UserAuthenticationIsChecked());
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_token);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_token);
    getIt<CheckUserAuthenticationBloc>().add(UserAuthenticationIsChecked());
  }

  static Future<void> saveFcm(String fcm) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_fcm, fcm);
  }

  static Future<String?> getFcm() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fcm);
  }

  static Future<void> saveThemeMode(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeMode, themeMode.name);
  }

  static Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    String themeMode = prefs.getString(_themeMode) ?? 'system';

    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  static Future<void> saveLocalizationMode(
    LocalizationMode localizationMode,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localizationMode, localizationMode.name);
  }

  static Future<LocalizationMode> getLocalizationMode() async {
    final prefs = await SharedPreferences.getInstance();
    String localizationMode = prefs.getString(_localizationMode) ?? 'system';

    switch (localizationMode) {
      case 'english':
        return LocalizationMode.english;
      case 'arabic':
        return LocalizationMode.arabic;
      default:
        return LocalizationMode.system;
    }
  }
}
