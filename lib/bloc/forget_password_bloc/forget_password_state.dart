part of 'forget_password_bloc.dart';

 class ForgetPasswordState {

  final FormModelItem email;
  final FormModelItem password;
  final FormModelItem conPassword;
  final bool obscure;
  final bool conObscure;
  final bool button;
  final bool buttonEmail;
  final GlobalKey<FormState>? formKey;
  ForgetPasswordState({
    required this.email,
    required this.password,
    required this.conPassword,
    this.formKey,
    this.obscure=true ,
    this.conObscure=true,
    this.button=false,
    this.buttonEmail=false,
  });

  ForgetPasswordState copyWith({
    FormModelItem? email,
    FormModelItem? password,
    FormModelItem? conPassword,
    bool? obscure,
    bool? conObscure,
    bool? button,
    bool? buttonEmail,
  }) {
    return ForgetPasswordState(
      email: email ?? this.email,
      password: password ?? this.password,
      conPassword: conPassword??this.conPassword,
      formKey: formKey,
      obscure: obscure??this.obscure,
      conObscure: conObscure??this.conObscure,
      button: button??this.button,
      buttonEmail: buttonEmail??this.buttonEmail
    );
  }

}

