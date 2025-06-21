part of 'login_bloc.dart';

abstract class LoginBlocEvent {}

class InitEvent extends LoginBlocEvent {}


class EmailFieldEvent extends LoginBlocEvent {
  final String email;

  EmailFieldEvent({required this.email});
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
class LoginSubmitEvent extends LoginBlocEvent {}