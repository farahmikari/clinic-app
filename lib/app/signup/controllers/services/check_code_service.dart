

import 'package:clinic_app/app/signup/models/email_verification_model.dart';
import 'package:clinic_app/core/helper/api.dart';


class CheckCodeService {
  Future<dynamic> checkCode({required EmailVerificationModel emailModel}) async {
    Map<String, dynamic>map = await Api().post(

      url: '/verify-email',
      body: {
        'email': emailModel.email.replaceAll(" ", ""),
        'code': emailModel.code,
      },
      header: {
        'Accept': 'application/json'
      },
    );
    bool isArrive = map['isArrive'];
    return isArrive;

  }
}
