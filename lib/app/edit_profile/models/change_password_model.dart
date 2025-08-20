class ChangePasswordModel {
  String oldPassword;
  String newPassword;
  String confirmPassword;

  ChangePasswordModel({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() => {
    "old_password": oldPassword,
    "new_password": newPassword,
    "new_password_confirmation": confirmPassword,
  };
}
