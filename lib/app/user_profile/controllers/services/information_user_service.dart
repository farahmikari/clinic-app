import 'package:clinic_app/app/user_profile/models/user_data_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class InformationUserService {
  Future<UserDataModel?> showInfoUser() async {
    DioConsumer dio = DioConsumer(dio: Dio());

    Map<String, dynamic>? response = await dio.get(EndPoints.showInfoProfile());
    if (response != null) {
      UserDataModel? user = UserDataModel.fromJson(response);
      return user;
    }
    return null;
  }
}
