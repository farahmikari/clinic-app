import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    String message;
    String token;

    SignupModel({
        required this.message,
        required this.token,
    });

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "token": token,
    };
}


