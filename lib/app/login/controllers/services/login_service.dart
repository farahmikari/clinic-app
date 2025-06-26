import 'package:clinic_app/core/helper/api.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:get_storage/get_storage.dart';

class LoginService {
  Future<Map<String, dynamic>> loginService({
    required String email,
    required String password,
  }) async {
    Map<String, dynamic> map = await Api().post(
      url: '/user_login',
      body: {
        "email": email.replaceAll(" ", ""),
        "password": password,
        "fcm_token": getIt<GetStorage>().read('fcm_token'),
      },
      header: {'Accept': 'application/json'},
    );
    await getIt<GetStorage>().write('token', map['response']['token']);
    return map;
  }
}
