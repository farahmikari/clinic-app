import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class VitalService {
  Future<dynamic> vitalSignalsService() async {
    DioConsumer dio = DioConsumer(dio: Dio());
    Map<String, dynamic> map = await dio.get(EndPoints.showVitalSignals());
    return map;
  }
}
