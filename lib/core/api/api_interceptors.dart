import 'package:clinic_app/core/api/end_points.dart';

import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';

import 'package:dio/dio.dart';


class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers[ApiKey.accept] = "application/json";
    final token = await SharedPereferenceService.getToken();
    if (token!=null) {
  options.headers[ApiKey.authorization] =
      "Bearer $token";
}
options.connectTimeout = Duration(seconds: 2);

    super.onRequest(options, handler);
  }
}
