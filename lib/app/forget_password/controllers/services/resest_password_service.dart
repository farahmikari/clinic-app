import 'package:clinic_app/core/helper/api.dart';

class ResestPasswordService {
  Future<bool> resetPassword({
    required String email,
    required String code,
    required String password,
    required String conPassword,
  }) async {
    Map<String, dynamic> map = await Api().post(
      url: '/password/reset/email',
      body: {
        'email': email,
        'code': code,
        'password': password,
        'password_confirmation': conPassword,
      },
      header: {'Accept': 'application/json'},
    );
    bool isArrive = map['isArrive'];
    return isArrive;
  }
}
