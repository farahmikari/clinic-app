import 'package:clinic_app/core/api/end_points.dart';

//import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';

import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers[ApiKey.accept] = "application/json";
    options.headers[ApiKey.authorization] =
        "Bearer 1|eDuzRRT8uUvf7uDynLuKlQsE6oNYShneQ779UC1R2e5231c5";
    // final token = await SharedPereferenceService.getToken();
    // if (token != null) {
    //   options.headers[ApiKey.authorization] = "Bearer $token";
    // }
    options.connectTimeout = Duration(seconds: 2);

    super.onRequest(options, handler);
  }
}
