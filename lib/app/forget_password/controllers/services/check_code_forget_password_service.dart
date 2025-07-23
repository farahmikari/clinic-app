import 'package:clinic_app/app/verification/model/email_verification_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class CheckCodeForgetPasswordService {
  Future<bool> checkCode({required EmailVerificationModel emailModel}) async {
    DioConsumer dio = DioConsumer(dio: Dio());
    await dio.post(
      EndPoints.checkOTPForgetPassword(),
      data: {
        'email': emailModel.email.replaceAll(" ", ""),
        'code': emailModel.code,
      },
    );

    return true;
  }
}
