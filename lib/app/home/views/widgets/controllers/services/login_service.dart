import 'package:clinic_app/core/helper/api.dart';

class LoginService {
  Future<Map<String, dynamic>> loginService({required String email,required String password}) async {
    
    Map<String, dynamic> map = await Api().post(
      url: '/user_login',
      body: {'email': email.replaceAll(" ", ""),
      "password":password},
      header: {'Accept': 'application/json'},
    );
    
   
    return map;
  }
}