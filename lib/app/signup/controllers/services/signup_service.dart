import 'dart:io';
import 'package:clinic_app/core/helper/api.dart';
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
    Map<String, dynamic> map = await Api().post(
      url: '/user_register',
      body: FormData.fromMap({
        'first_name': firstName,
        'last_name': lastName,
        'gender': gender,
        'birth_date': birthDate,
        'password': password,
        'password_confirmation': passwordCon,
        'email': email,
        'phone_number': phoneNumber,
        'image': imagePath,
      }),
      header: {'Accept': 'application/json'},
    );

    return map;
  }
}
