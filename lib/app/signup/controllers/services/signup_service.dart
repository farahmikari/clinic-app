import 'dart:io';
import 'package:clinic_app/app/signup/models/signup_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:dio/dio.dart';

class SignupService {
  Future<Map<String, dynamic>> signupUser({
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
    final fcm = await SharedPreferencesService.getFcm();
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
        'fcm_token': fcm,
      },
      isFormData: true,
    );
    SignupModel model = SignupModel.fromJson(response);

    if (model.token.isNotEmpty) {
      SharedPreferencesService.saveToken(model.token);
    }
    return response;
  }
}
