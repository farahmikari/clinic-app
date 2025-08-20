import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class ChangePasswordService {
  Future<Map<String, dynamic>> changePassword({
    required changePasswordModel,
  }) async {
    DioConsumer dio = DioConsumer(dio: Dio());
    Map<String, dynamic> response = await dio.put(
      EndPoints.changePassword(),
      data: changePasswordModel,
    );
    return response;
  }
}
