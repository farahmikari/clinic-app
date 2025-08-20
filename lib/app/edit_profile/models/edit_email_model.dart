class EditEmailModel {
  String email;
  String code;

  EditEmailModel({required this.email, required this.code});

  Map<String, dynamic> toJson() => {
    "email": email,
    "code": code,
  };
}
