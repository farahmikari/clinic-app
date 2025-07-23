
import 'package:clinic_app/app/verification/model/email_verification_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';


class CheckCodeService {
  Future<bool> checkCode({required EmailVerificationModel emailModel}) async {
    DioConsumer dio = DioConsumer(dio: Dio());
    Map<String, dynamic>map = await dio.post(
     EndPoints.checkOTPcode(),
      data: {
        'email': emailModel.email.replaceAll(" ", ""),
        'code': emailModel.code,
      },
    );
    bool isArrive = map[ApiKey.errorMessage]=="Email verified successfully.";
    return isArrive;

  }
}
