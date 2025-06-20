import 'dart:io';

import 'package:clinic_app/app/signup/controllers/services/signup_service.dart';
import 'package:clinic_app/app/signup/models/signup_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/core/utils/validators.dart';
import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:flutter/material.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupBaseState> {
  SignupBloc()
    : super(
        SignupInitial(
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
        ),
      ) {
    on<SPhoneFieldEvent>(_phoneEvent);
    on<SImageEvent>(_imageEvent);
    on<SEmailFieldEvent>(_emailEvent);
    on<SFirstNameFieldEvent>(_firstNameEvent);
    on<SLastNameFieldEvent>(_lastNameEvent);
    on<SGenderFieldEvent>(_genderEvent);
    on<SBirthFieldEvent>(_birthEvent);
    on<SObscureEvent>(_obscureEvent);
    on<SPasswordFieldEvent>(_passwordEvent);
    on<SConObscureEvent>(_conObscureEvent);
    on<SConPasswordFieldEvent>(_conPasswordEvent);
    on<SButtonEvent>(_buttonEvent);
    on<SignupSubmitEvent>(_onSubmit);
  }
  void _imageEvent(SImageEvent event, Emitter<SignupBaseState> emit) {
    final currentState = state.data;

    emit(SignupInitial(currentState.copyWith(image: event.image)));
  }

  void _emailEvent(SEmailFieldEvent event, Emitter<SignupBaseState> emit) {
    final currentState = state.data;
    String email = event.email;
    String? error = Validators.validateEmail(email);

    emit(
      SignupInitial(
        currentState.copyWith(email: FormModelItem(value: email, error: error)),
      ),
    );
  }

  void _phoneEvent(SPhoneFieldEvent event, Emitter<SignupBaseState> emit) {
    final currentState = state.data;
    String phone = event.phone;
    String? error = Validators.validatePhone(phone);

    emit(
      SignupInitial(
        currentState.copyWith(phone: FormModelItem(value: phone, error: error)),
      ),
    );
  }

  void _firstNameEvent(
    SFirstNameFieldEvent event,
    Emitter<SignupBaseState> emit,
  ) {
    final currentState = state.data;
    String firstName = event.name;
    String? error = Validators.validateRequired(firstName);

    emit(
      SignupInitial(
        currentState.copyWith(
          firstName: FormModelItem(value: firstName, error: error),
        ),
      ),
    );
  }

  void _lastNameEvent(
    SLastNameFieldEvent event,
    Emitter<SignupBaseState> emit,
  ) {
    final currentState = state.data;
    String lastName = event.name;
    String? error = Validators.validateRequired(lastName);

    emit(
      SignupInitial(
        currentState.copyWith(
          lastName: FormModelItem(value: lastName, error: error),
        ),
      ),
    );
  }

  void _birthEvent(SBirthFieldEvent event, Emitter<SignupBaseState> emit) {
    final currentState = state.data;
    String birth = event.birth;
    String? error = Validators.validateRequired(birth);

    emit(
      SignupInitial(
        currentState.copyWith(
          birthDate: FormModelItem(value: birth, error: error),
        ),
      ),
    );
  }

  void _genderEvent(SGenderFieldEvent event, Emitter<SignupBaseState> emit) {
    final currentState = state.data;
    String gender = event.gender;
    String? error = Validators.validateRequired(gender);

    emit(
      SignupInitial(
        currentState.copyWith(
          gender: FormModelItem(value: gender, error: error),
        ),
      ),
    );
  }

  void _obscureEvent(SObscureEvent event, Emitter<SignupBaseState> emit) {
    final currentState = state.data;
    bool obscure = event.obscure;

    emit(SignupInitial(currentState.copyWith(obscure: !obscure)));
  }

  void _passwordEvent(
    SPasswordFieldEvent event,
    Emitter<SignupBaseState> emit,
  ) {
    final currentState = state.data;
    final String password = event.password;
    String? error = Validators.validatePassword(password);

    emit(
      SignupInitial(
        currentState.copyWith(
          password: FormModelItem(value: password, error: error),
        ),
      ),
    );
  }

  void _conObscureEvent(SConObscureEvent event, Emitter<SignupBaseState> emit) {
    bool obscure = event.conObscure;
    final currentState = state.data;
    emit(SignupInitial(currentState.copyWith(conObscure: !obscure)));
  }

  void _conPasswordEvent(
    SConPasswordFieldEvent event,
    Emitter<SignupBaseState> emit,
  ) {
    final currentState = state.data;
    final String password = event.password;
    String? error = Validators.validateConPassword(
      password,
      currentState.password.value,
    );

    emit(
      SignupInitial(
        currentState.copyWith(
          conPassword: FormModelItem(value: password, error: error),
        ),
      ),
    );
  }

  void _buttonEvent(SButtonEvent event, Emitter<SignupBaseState> emit) {
    final currentState = state.data;
    final isValid = [
      currentState.phone,
      currentState.birthDate,
      currentState.firstName,
      currentState.lastName,
      currentState.gender,
      currentState.password,
      currentState.conPassword,
    ].every((field) => field.value.isNotEmpty && field.error == null);

    emit(SignupInitial(currentState.copyWith(buttonEvent: isValid)));
  }

  Future<void> _onSubmit(
    SignupSubmitEvent event,
    Emitter<SignupBaseState> emit,
  ) async {
    final currentState = state.data;
    emit(SignupLoading(currentState));
    try {
      Map<String, dynamic> map = await SignupService().signupUser(
        firstName: currentState.firstName.value,
        lastName: currentState.lastName.value,
        gender: currentState.gender.value,
        birthDate: currentState.birthDate.value,
        password: currentState.password.value,
        passwordCon: currentState.conPassword.value,
        email: currentState.email.value,
        phoneNumber: currentState.phone.value,
        image: currentState.image,
      );
      bool isArrive = map['isArrive'] ?? false;
      if (isArrive) {
      SignupModel model = SignupModel.fromJson(map['response']);
     print("Token signup is :${model.token}");
      
        emit(SignupSuccess(currentState));
      } else {
        emit(SignupFailed(currentState, message: 'error in signup'));
      }
    } on Exception catch (e) {
      emit(SignupFailed(currentState, message: e.toString()));
    }
  }
}
