part of 'signup_bloc.dart';

abstract class SignupEvent {}

class InitEvent extends SignupEvent {}

class SFirstNameFieldEvent extends SignupEvent {
  final String name;

  SFirstNameFieldEvent({required this.name});
}

class SLastNameFieldEvent extends SignupEvent {
  final String name;

  SLastNameFieldEvent({required this.name});
}

class SGenderFieldEvent extends SignupEvent {
  final String gender;

  SGenderFieldEvent({required this.gender});
}


class SPhoneFieldEvent extends SignupEvent {
  final String phone;

  SPhoneFieldEvent({required this.phone});
}

class SEmailFieldEvent extends SignupEvent {
  final String email;

  SEmailFieldEvent({required this.email});
}


class SBirthFieldEvent extends SignupEvent {
  final String birth;

  SBirthFieldEvent({required this.birth});
}

class SPasswordFieldEvent extends SignupEvent {
  final String password;

  SPasswordFieldEvent({required this.password});
}


class SConPasswordFieldEvent extends SignupEvent {
  final String password;

  SConPasswordFieldEvent({required this.password});
}

class SConObscureEvent extends SignupEvent {
  final bool conObscure;

  SConObscureEvent({required this.conObscure});
}

class SObscureEvent extends SignupEvent {
  final bool obscure;

  SObscureEvent({required this.obscure});
}

class SButtonVerifyEvent extends SignupEvent {}

class SButtonEvent extends SignupEvent {}
