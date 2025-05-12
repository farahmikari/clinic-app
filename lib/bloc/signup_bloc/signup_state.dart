part of 'signup_bloc.dart';

class SignupState {
  final FormModelItem phone;
  final FormModelItem email;
  final FormModelItem password;
  final FormModelItem conPassword;
  final FormModelItem birthDate;
  final FormModelItem firstName;
  final FormModelItem lastName;
  final FormModelItem gender;
  final bool obscure;
  final bool conObscure;
  final bool buttonVerify;
  final bool buttonEvent;
  final GlobalKey<FormState>? formKey;
  SignupState( {
    required this.phone,
    required this.email,
    required this.password,
    required this.conPassword,
    required this.birthDate,
    required this.firstName,
    required this.lastName,
    required this.gender,
    this.formKey,
    this.obscure = true,
    this.conObscure=true,
    this.buttonVerify = false,
    this.buttonEvent=false
  });

  SignupState copyWith({
    FormModelItem? phone,
    FormModelItem? email,
    FormModelItem? password,
    FormModelItem? conPassword,
    FormModelItem?birthDate,
    FormModelItem? firstName,
    FormModelItem? lastName,
    FormModelItem? gender,
    bool? conObscure,
    bool? obscure,
    bool? buttonVerify,
    bool? buttonEvent
  }) {
    return SignupState(
      phone: phone ?? this.phone,
      email: email??this.email,
      password: password ?? this.password,
      conPassword: conPassword ?? this.conPassword,
      birthDate: birthDate??this.birthDate,
      formKey: formKey,
      obscure: obscure ?? this.obscure,
      conObscure: conObscure??this.conObscure,
      buttonVerify: buttonVerify ?? this.buttonVerify,
      buttonEvent: buttonEvent??this.buttonEvent,
      firstName: firstName??this.firstName,
      lastName: lastName??this.lastName,
      gender: gender??this.gender 
    );
  }
}
