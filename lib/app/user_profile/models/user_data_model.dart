import 'dart:convert';

UserDataModel userDataModelFromJson(String data) =>
    UserDataModel.fromJson(json.decode(data));
String userDataModelToJson(UserDataModel data) => json.encode(data.toString());

class UserDataModel {
  String firstName;
  String lastName;
  String gender;
  String birthDate;
  String phoneNumber;
  String email;
  String password;
  String? image;

  UserDataModel({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.birthDate,
    required this.phoneNumber,
    required this.email,
    required this.password,
    this.image,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    firstName: json["First Name"],
    lastName: json["Last Name"],
    gender: json["Gender"],
    birthDate: json["Birth Date"],
    phoneNumber: json["Phone Number"],
    email: json["email"],
    password: json["password"],
    image: json["image"],
  );

  Map<String,dynamic> toJson() =>{
    "First Name": firstName,
    "Last Name": lastName,
    "Birth Date": birthDate,
    "Gender": gender,
    "Phone Number": phoneNumber,
    "email": email,
    "password": password,
    "image":image
};
}
