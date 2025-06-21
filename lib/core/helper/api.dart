import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  Dio dio = Dio();
  bool isArrive = false;
  String path = 'http://10.2.0.2:8000/api';
  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required dynamic header,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    headers.addAll(header);
    if (kDebugMode) {
      print('body is : $body,url is $path$url ,headers is : $headers');
    }
    try {
      var response = await dio.post(
        '$path$url',
        data: body,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        isArrive = true;
        // ignore: avoid_print
        print("✅$response");
      } else {
        isArrive = false;
        // ignore: avoid_print
        print('❌status code is : ${response.statusCode}');
      }
      return {"isArrive": isArrive, "response": response.data};
    } on DioException catch (e) {
      isArrive = false;
      if (e.response != null) {
        // ignore: avoid_print
        print('❌status code is : ${e.response?.statusCode}');
      } else {
        // ignore: avoid_print
        print('❌ Error sending request');
      }
      return {"isArrive": isArrive, "response": e.response?.data ?? "null"};
    }
  }
}
