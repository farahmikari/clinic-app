import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/helpers/validators.dart';
import 'package:clinic_app/models/form_model.dart';
import 'package:flutter/material.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc()
    : super(
        ForgetPasswordState(
          email: FormModelItem(),
          password: FormModelItem(),
          conPassword: FormModelItem(),
        ),
      ) {
    on<FEmailFieldEvent>(_emailEvent);
    on<FObscureEvent>(_obscureEvent);
    on<FPasswordFieldEvent>(_passwordEvent);
    on<FConObscureEvent>(_conObscureEvent);
    on<FConPasswordFieldEvent>(_conPasswordEvent);
    on<FEmailButtonEvent>(_buttonEmailEvent);
    on<FButtonEvent>(_buttonEvent);
  }
  void _emailEvent(FEmailFieldEvent event, Emitter<ForgetPasswordState> emit) {
    String email = event.email;

    String? error = Validators.validateEmail(email);

    emit(state.copyWith(email: FormModelItem(value: email, error: error)));
  }

  void _obscureEvent(FObscureEvent event, Emitter<ForgetPasswordState> emit) {
    bool obscure = event.obscure;

    emit(state.copyWith(obscure: !obscure));
  }

  void _passwordEvent(
    FPasswordFieldEvent event,
    Emitter<ForgetPasswordState> emit,
  ) {
    final String password = event.password;
    String? error = Validators.validatePassword(password);

    emit(
      state.copyWith(password: FormModelItem(value: password, error: error)),
    );
  }

  void _conObscureEvent(
    FConObscureEvent event,
    Emitter<ForgetPasswordState> emit,
  ) {
    bool obscure = event.conObscure;

    emit(state.copyWith(conObscure: !obscure));
  }

  void _conPasswordEvent(
    FConPasswordFieldEvent event,
    Emitter<ForgetPasswordState> emit,
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

  void _buttonEmailEvent(
    FEmailButtonEvent event,
    Emitter<ForgetPasswordState> emit,
  ) {
    bool button = false;
    if (state.email.value.isNotEmpty && state.email.error == null) {
      button = true;
    }
    emit(state.copyWith(buttonEmail: button));
  }

  void _buttonEvent(FButtonEvent event, Emitter<ForgetPasswordState> emit) {
    bool button = false;
    if (state.password.value.isNotEmpty &&
        state.password.error == null &&
        state.conPassword.value.isNotEmpty &&
        state.conPassword.error == null) {
      button = true;
    }
    emit(state.copyWith(button: button));
  }
}
