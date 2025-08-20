import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class EditProfileService {
  Future<Map<String, dynamic>> editProfileService({required dynamic editModel}) async {
    DioConsumer dio = DioConsumer(dio: Dio());
    Map<String, dynamic> response = await dio.put(
      EndPoints.editProfile(),
      data: editModel,
    );
    return response;
  }
}
