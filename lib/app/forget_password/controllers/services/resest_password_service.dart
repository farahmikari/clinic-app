import 'package:clinic_app/core/api/dio_consumer.dart' ;
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class ResestPasswordService {
  Future<bool> resetPassword({
    required String email,
    required String code,
    required String password,
    required String conPassword,
  }) async {
    DioConsumer dio = DioConsumer(dio: Dio());
    await dio.post(
       EndPoints.resetPassword(),
      data: {
        'email': email,
        'code': code,
        'password': password,
        'password_confirmation': conPassword,
      },
      
    );
    
    return true;
  }
}
