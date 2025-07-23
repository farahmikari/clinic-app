import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class LogoutService {
  Future<Map<String, dynamic>> logout() async {
    DioConsumer dio = DioConsumer(dio: Dio());
    Map<String, dynamic> response = await dio.post(EndPoints.logout());
    return response;
  }
}
