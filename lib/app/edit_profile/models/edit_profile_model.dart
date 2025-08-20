import 'dart:convert';

String editProfileModelToJson(EditProfileModel model) =>
    json.encode(model.toString);

class EditProfileModel {
  String? firstName;
  String? lastName;
  String? gender;
  String? phoneNumber;
  String? birthDate;

  EditProfileModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "birth_date": birthDate,
    "gender": gender,
    "phone_number": phoneNumber,
  };
}
