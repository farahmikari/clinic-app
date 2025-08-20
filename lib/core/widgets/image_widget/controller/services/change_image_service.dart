import 'dart:io';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class ChangeImageService {
  Future<bool> imageChanged({required File image}) async {
    dynamic imagePath;
    imagePath = await MultipartFile.fromFile(image.path, filename: 'image');
    DioConsumer dio = DioConsumer(dio: Dio());
    await dio.post(
      EndPoints.changeImage(),
      data: {if (imagePath != null) 'image': imagePath},
      isFormData: true,
    );
    return true;
  }
}
