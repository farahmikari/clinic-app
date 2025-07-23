import 'dart:io';
import 'package:clinic_app/app/signup/models/signup_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class SignupService {
  Future<void> signupUser({
    required String firstName,
    required String lastName,
    required String gender,
    required String birthDate,
    required String password,
    required String passwordCon,
    required String email,
    required String phoneNumber,
    File? image,
  }) async {
    dynamic imagePath;
    if (image != null) {
      imagePath = await MultipartFile.fromFile(image.path, filename: 'image');
    }
    DioConsumer dio = DioConsumer(dio: Dio());
    Map<String, dynamic> response = await dio.post(
      EndPoints.signup(),
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'gender': gender,
        'birth_date': birthDate,
        'password': password,
        'password_confirmation': passwordCon,
        'email': email,
        'phone_number': phoneNumber,
        if (imagePath != null) 'image': imagePath,
        'fcm_token': getIt<GetStorage>().read('fcm_token'),
      },
      isFormData: true,
    );
    SignupModel model = SignupModel.fromJson(response);

    if (model.token.isNotEmpty) {
  SharedPereferenceService.saveToken(model.token);
}
    
  }
}
