import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class EmailForgetPasswordService {
  Future<bool> sendEmailForgetPasswordService({required String email}) async {
    if (kDebugMode) {
      print(email.replaceAll(" ", ""));
    }
    DioConsumer dio = DioConsumer(dio: Dio());
       await dio.post(
       EndPoints.sendEmailForgetPassword(),
      data: {'email': email.replaceAll(" ", "")},
    );
    
    return true;
  }
}
