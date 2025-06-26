import 'dart:io';
import 'package:clinic_app/core/helper/api.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

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
        'fcm_token': getIt<GetStorage>().read('fcm_token'),
      }),
      header: {'Accept': 'application/json'},
    );
    await getIt<GetStorage>().write('token', map['response']['token']);
    return map;
  }
}
