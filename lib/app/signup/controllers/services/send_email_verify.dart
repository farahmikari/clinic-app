import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class SendEmailVerify {
  Future<bool> sendEmailVerifyService({required String email}) async {
    if (kDebugMode) {
      print(email.replaceAll(" ", ""));
    }
    DioConsumer dio = DioConsumer(dio: Dio());
    Map<String, dynamic> map = await dio.post(
       EndPoints.sendEmailVerify(),
      data:  {'email': email.replaceAll(" ", "")},
    );
    bool isArrive = map[ApiKey.errorMessage] == "Verification code sent.";
    return isArrive;
  }
}
