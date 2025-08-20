import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class EditEmailService {
  Future<bool> editEmailProfileService({
    required dynamic emailModel,
  }) async {
    DioConsumer dio = DioConsumer(dio: Dio());
     await dio.put(
      EndPoints.editEmail(),
      data: emailModel,
    );
    return true;
  }
}
