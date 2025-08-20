import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static const String _token = 'auth_token';

  static const String _theme = 'theme';

  static const String _fcm = 'fcm';


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
  }

  static Future<void> saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_theme,theme);
  }
   static Future<String?> getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_theme);

  }

  static Future<void> saveFcm(String fcm) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_fcm, fcm);
  }

  static Future<String?> getFcm() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_fcm);
  }
}
