import 'package:clinic_app/core/helper/api.dart';
import 'package:flutter/foundation.dart';

class EmailForgetPasswordService {
    Future<bool> sendEmailForgetPasswordService({required String email}) async {
    if (kDebugMode) {
      print(email.replaceAll(" ", ""));
    }
    Map<String, dynamic> map = await Api().post(
      url: '/password/email',
      body: {'email': email.replaceAll(" ", "")},
      header: {'Accept': 'application/json'},
    );
    bool isArrive = map['isArrive'];
    return isArrive;
  }
}