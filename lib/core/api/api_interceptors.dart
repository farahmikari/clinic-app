import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.accept] = "application/json";
    options.headers[ApiKey.authorization] =
        "Bearer 4|JLaO2ehb047cdmsnUDCrTdUEWtUIpHyggqHf6RjZ64cb29ff";
    super.onRequest(options, handler);
  }
}
