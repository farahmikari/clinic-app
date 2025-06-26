import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.accept] = "application/json";
    options.headers[ApiKey.authorization] =
        "Bearer ${getIt<GetStorage>().read('token')}";
    options.connectTimeout = Duration(seconds: 2);
    super.onRequest(options, handler);
  }
}
