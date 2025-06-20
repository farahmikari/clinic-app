part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent {}

class InitEvent extends ForgetPasswordEvent {}

class FEmailFieldEvent extends ForgetPasswordEvent {
  final String email;

  FEmailFieldEvent({required this.email});
}

class FPasswordFieldEvent extends ForgetPasswordEvent {
  final String password;

  FPasswordFieldEvent({required this.password});
}

class FConPasswordFieldEvent extends ForgetPasswordEvent {
  final String password;

  FConPasswordFieldEvent({required this.password});
}

class FConObscureEvent extends ForgetPasswordEvent {
  final bool conObscure;

  FConObscureEvent({required this.conObscure});
}

class FObscureEvent extends ForgetPasswordEvent {
  final bool obscure;

  FObscureEvent({required this.obscure});
}

class FButtonEvent extends ForgetPasswordEvent {
  FButtonEvent();
}

class ForgetSubmitEvent extends ForgetPasswordEvent {
  final String email;
  final String code;
  ForgetSubmitEvent({required this.email,required this.code});
}
