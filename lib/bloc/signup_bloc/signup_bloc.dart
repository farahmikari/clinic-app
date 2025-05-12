import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/helpers/validators.dart';
import 'package:clinic_app/models/form_model.dart';
import 'package:flutter/material.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc()
    : super(
        SignupState(
          phone: FormModelItem(),
          email: FormModelItem(),
          password: FormModelItem(),
          conPassword: FormModelItem(),
          firstName: FormModelItem(),
          lastName: FormModelItem(),
          birthDate: FormModelItem(),
          gender: FormModelItem(),
        ),
      ) {
    on<SPhoneFieldEvent>(_phoneEvent);
    on<SEmailFieldEvent>(_emailEvent);
    on<SButtonVerifyEvent>(_buttonVerifyEvent);
    on<SFirstNameFieldEvent>(_firstNameEvent);
    on<SLastNameFieldEvent>(_lastNameEvent);
    on<SGenderFieldEvent>(_genderEvent);
    on<SBirthFieldEvent>(_birthEvent);
    on<SObscureEvent>(_obscureEvent);
    on<SPasswordFieldEvent>(_passwordEvent);
    on<SConObscureEvent>(_conObscureEvent);
    on<SConPasswordFieldEvent>(_conPasswordEvent);
    on<SButtonEvent>(_buttonEvent);
  }
  void _phoneEvent(SPhoneFieldEvent event, Emitter<SignupState> emit) {
    String phone = event.phone;
    String? error = Validators.validatePhone(phone);

    emit(state.copyWith(phone: FormModelItem(value: phone, error: error)));
  }

  void _emailEvent(SEmailFieldEvent event, Emitter<SignupState> emit) {
    String email = event.email;

    String? error = Validators.validateEmail(email);

    emit(state.copyWith(email: FormModelItem(value: email, error: error)));
  }

  void _buttonVerifyEvent(SButtonVerifyEvent event, Emitter<SignupState> emit) {
    bool button = state.phone.value.isNotEmpty && state.phone.error == null;

    emit(state.copyWith(buttonVerify: button));
  }

  void _firstNameEvent(SFirstNameFieldEvent event, Emitter<SignupState> emit) {
    String firstName = event.name;
    String? error = Validators.validateRequired(firstName);

    emit(
      state.copyWith(firstName: FormModelItem(value: firstName, error: error)),
    );
  }

  void _lastNameEvent(SLastNameFieldEvent event, Emitter<SignupState> emit) {
    String lastName = event.name;
    String? error = Validators.validateRequired(lastName);

    emit(
      state.copyWith(lastName: FormModelItem(value: lastName, error: error)),
    );
  }

  void _birthEvent(SBirthFieldEvent event, Emitter<SignupState> emit) {
    String birth = event.birth;
    String? error = Validators.validateRequired(birth);

    emit(state.copyWith(birthDate: FormModelItem(value: birth, error: error)));
  }

  void _genderEvent(SGenderFieldEvent event, Emitter<SignupState> emit) {
    String gender = event.gender;
    String? error = Validators.validateRequired(gender);

    emit(state.copyWith(gender: FormModelItem(value: gender, error: error)));
  }

  void _obscureEvent(SObscureEvent event, Emitter<SignupState> emit) {
    bool obscure = event.obscure;

    emit(state.copyWith(obscure: !obscure));
  }

  void _passwordEvent(SPasswordFieldEvent event, Emitter<SignupState> emit) {
    final String password = event.password;
    String? error = Validators.validatePassword(password);

    emit(
      state.copyWith(password: FormModelItem(value: password, error: error)),
    );
  }

  void _conObscureEvent(SConObscureEvent event, Emitter<SignupState> emit) {
    bool obscure = event.conObscure;

    emit(state.copyWith(conObscure: !obscure));
  }

  void _conPasswordEvent(
    SConPasswordFieldEvent event,
    Emitter<SignupState> emit,
  ) {
    final String password = event.password;
    String? error = Validators.validateConPassword(
      password,
      state.password.value,
    );

    emit(
      state.copyWith(conPassword: FormModelItem(value: password, error: error)),
    );
  }

  void _buttonEvent(SButtonEvent event, Emitter<SignupState> emit) {
    bool button = false;
    if (state.email.value.isNotEmpty &&
        state.email.error == null &&
        state.birthDate.value.isNotEmpty &&
        state.birthDate.error == null &&
        state.firstName.value.isNotEmpty &&
        state.firstName.error == null &&
        state.lastName.value.isNotEmpty &&
        state.lastName.error == null &&
        state.gender.value.isNotEmpty &&
        state.gender.error == null &&
        state.password.value.isNotEmpty &&
        state.password.error == null &&
        state.conPassword.value.isNotEmpty &&
        state.conPassword.error == null) {
      button = true;
    }
    emit(state.copyWith(buttonEvent: button));
  }
}
