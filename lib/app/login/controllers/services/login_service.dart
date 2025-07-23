import 'package:clinic_app/app/login/models/login_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart' show SharedPereferenceService;
import 'package:dio/dio.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:get_storage/get_storage.dart';


class LoginService {
  Future<Map<String, dynamic>> loginService({
    required String email,
    required String password,
  }) async {

    DioConsumer dio = DioConsumer(dio: Dio());
    Map<String, dynamic> response = await dio.post(
       EndPoints.login(),
      data:{'email': email.replaceAll(" ", ""), "password": password,
      "fcm_token": getIt<GetStorage>().read('fcm_token'),},
    );
  LoginModel model = LoginModel.fromJson(response);
  if (model.token.isNotEmpty) {
  SharedPereferenceService.saveToken(model.token);
}
    return response;
  
  }
}
