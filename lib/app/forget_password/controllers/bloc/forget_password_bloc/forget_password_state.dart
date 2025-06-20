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
    this.obscure = true,
    this.conObscure = true,
    this.button = false,
    this.buttonEmail = false,
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
      conPassword: conPassword ?? this.conPassword,
      formKey: formKey,
      obscure: obscure ?? this.obscure,
      conObscure: conObscure ?? this.conObscure,
      button: button ?? this.button,
      buttonEmail: buttonEmail ?? this.buttonEmail,
    );
  }
}

abstract class ForgetPasswordBaseState {
  final ForgetPasswordState data;

  ForgetPasswordBaseState({required this.data});
}

final class ForgetPasswordInitial extends ForgetPasswordBaseState {
  ForgetPasswordInitial(ForgetPasswordState data) : super(data: data);
}

final class ForgetPasswordLoading extends ForgetPasswordBaseState {
  ForgetPasswordLoading(ForgetPasswordState data) : super(data: data);
}

final class ForgetPasswordSuccess extends ForgetPasswordBaseState {
  ForgetPasswordSuccess(ForgetPasswordState data) : super(data: data);
}

final class ForgetPasswordFailed extends ForgetPasswordBaseState {
  final String message;
  ForgetPasswordFailed(ForgetPasswordState data, {required this.message}) : super(data: data);
}
