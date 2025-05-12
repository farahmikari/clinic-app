part of 'login_bloc_bloc.dart';

abstract class LoginBlocEvent {}

class InitEvent extends LoginBlocEvent {}


class PhoneFieldEvent extends LoginBlocEvent {
  final String phone;

  PhoneFieldEvent({required this.phone});
}

class PasswordFieldEvent extends LoginBlocEvent {
  final String password;

  PasswordFieldEvent({required this.password});
}



class ObscureEvent extends LoginBlocEvent {
  final bool obscure;

  ObscureEvent({required this.obscure});
}

class ButtonEvent extends LoginBlocEvent {
  
  ButtonEvent();
}
