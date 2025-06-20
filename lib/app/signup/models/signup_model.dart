import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
    String message;
    User user;
    String token;

    SignupModel({
        required this.message,
        required this.user,
        required this.token,
    });

    factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
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
    DateTime birthDate;
    String phoneNumber;
    String email;
    int isPatient;
    String image;

    User({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.birthDate,
        required this.phoneNumber,
        required this.email,
        required this.isPatient,
        required this.image,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        birthDate: DateTime.parse(json["birth_date"]),
        phoneNumber: json["phone_number"],
        email: json["email"],
        isPatient: json["is_patient"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "birth_date": "${birthDate.year.toString().padLeft(4, '0')}-${birthDate.month.toString().padLeft(2, '0')}-${birthDate.day.toString().padLeft(2, '0')}",
        "phone_number": phoneNumber,
        "email": email,
        "is_patient": isPatient,
        "image": image,
    };
}
