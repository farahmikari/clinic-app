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
  final File? image;
  final bool obscure;
  final bool conObscure;
  final bool buttonEvent;
  final GlobalKey<FormState>? formKey;
  SignupState({
    required this.phone,
    required this.email,
    required this.password,
    required this.conPassword,
    required this.birthDate,
    required this.firstName,
    required this.lastName,
    required this.gender,
    this.image,
    this.obscure = true,
    this.conObscure = true,
    this.buttonEvent = false,
    this.formKey,
  });

  SignupState copyWith({
    FormModelItem? phone,
    FormModelItem? email,
    FormModelItem? password,
    FormModelItem? conPassword,
    FormModelItem? birthDate,
    FormModelItem? firstName,
    FormModelItem? lastName,
    FormModelItem? gender,
    File? image,
    bool? conObscure,
    bool? obscure,
    bool? buttonEvent,
  }) {
    return SignupState(
      phone: phone ?? this.phone,
      email: email ?? this.email,
      password: password ?? this.password,
      conPassword: conPassword ?? this.conPassword,
      birthDate: birthDate ?? this.birthDate,
      formKey: formKey,
      obscure: obscure ?? this.obscure,
      conObscure: conObscure ?? this.conObscure,
      buttonEvent: buttonEvent ?? this.buttonEvent,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image?? this.image
    );
  }
}

abstract class SignupBaseState {
  final SignupState data;

  SignupBaseState({required this.data});
}

final class SignupInitial extends SignupBaseState {
  SignupInitial(SignupState data) : super(data: data);
}

final class SignupLoading extends SignupBaseState {
  SignupLoading(SignupState data) : super(data: data);
}

final class SignupSuccess extends SignupBaseState {
  SignupSuccess(SignupState data) : super(data: data);
}

final class SignupFailed extends SignupBaseState {
  final String message;
  SignupFailed(SignupState data, {required this.message}) : super(data: data);
}
