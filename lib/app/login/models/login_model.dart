import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String message;
    User user;
    String token;

    LoginModel({
        required this.message,
        required this.user,
        required this.token,
    });

    factory LoginModel.fromJson(json) => LoginModel(
        message: json["message"],
        user: User.fromJson(json["User"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "User": user.toJson(),
        "token": token,
    };
}

class User {
    int id;
    String firstName;
    String lastName;
    String gender;
    String email;
    int isPatient;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.email,
        required this.isPatient,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        email: json["email"],
        isPatient: json["is_patient"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "email": email,
        "is_patient": isPatient,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
