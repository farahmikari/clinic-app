part of 'login_bloc.dart';

class LoginBlocState {
  final FormModelItem email;
  final FormModelItem password;
  final bool obscure;
  final bool button;
  final GlobalKey<FormState>? formKey;
  LoginBlocState({
    required this.email,
    required this.password,
    this.formKey,
    this.obscure=true ,
    this.button=false
  });

  LoginBlocState copyWith({
    FormModelItem? email,
    FormModelItem? password,
    bool? obscure,
    bool? button
  }) {
    return LoginBlocState(
      email: email ?? this.email,
      password: password ?? this.password,
      formKey: formKey,
      obscure: obscure??this.obscure,
      button: button??this.button
    );
  }
}
abstract class LoginBaseState {
  final LoginBlocState data;

  LoginBaseState({required this.data});
}

final class LoginInitial extends LoginBaseState {
  LoginInitial(LoginBlocState data) : super(data: data);
}

final class LoginLoading extends LoginBaseState {
  LoginLoading(LoginBlocState data) : super(data: data);
}

final class LoginSuccess extends LoginBaseState {
  LoginSuccess(LoginBlocState data) : super(data: data);
}

final class LoginFailed extends LoginBaseState {
  final String message;
  LoginFailed(LoginBlocState data, {required this.message}) : super(data: data);
}

