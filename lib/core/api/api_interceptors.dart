import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[ApiKey.accept] = "application/json";
    options.headers[ApiKey.authorization] =
        "Bearer 2|H3HKKiSNwrSD4rqK3JsD0bEmHdkavQWCze6ChURuabacc64a";
    options.connectTimeout = Duration(seconds: 2);
    super.onRequest(options, handler);
  }
}
