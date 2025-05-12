part of 'login_bloc_bloc.dart';

class LoginBlocState {
  final FormModelItem phone;
  final FormModelItem password;
  final bool obscure;
  final bool button;
  final GlobalKey<FormState>? formKey;
  LoginBlocState({
    required this.phone,
    required this.password,
    this.formKey,
    this.obscure=true ,
    this.button=false
  });

  LoginBlocState copyWith({
    FormModelItem? phone,
    FormModelItem? password,
    bool? obscure,
    bool? button
  }) {
    return LoginBlocState(
      phone: phone ?? this.phone,
      password: password ?? this.password,
      formKey: formKey,
      obscure: obscure??this.obscure,
      button: button??this.button
    );
  }
}
