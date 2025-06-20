import 'package:clinic_app/app/forget_password/controllers/services/resest_password_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/core/utils/validators.dart';
import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:flutter/material.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordBaseState> {
  ForgetPasswordBloc()
    : super(
        ForgetPasswordInitial(
          ForgetPasswordState(
            email: FormModelItem(),
            password: FormModelItem(),
            conPassword: FormModelItem(),
          ),
        ),
      ) {
    on<FObscureEvent>(_obscureEvent);
    on<FPasswordFieldEvent>(_passwordEvent);
    on<FConObscureEvent>(_conObscureEvent);
    on<FConPasswordFieldEvent>(_conPasswordEvent);
    on<FButtonEvent>(_buttonEvent);
    on<ForgetSubmitEvent>(_onSubmit);
  }

  void _obscureEvent(
    FObscureEvent event,
    Emitter<ForgetPasswordBaseState> emit,
  ) {
    bool obscure = event.obscure;
    final currentState = state.data;

    emit(ForgetPasswordInitial(currentState.copyWith(obscure: !obscure)));
  }

  void _passwordEvent(
    FPasswordFieldEvent event,
    Emitter<ForgetPasswordBaseState> emit,
  ) {
    final String password = event.password;
    String? error = Validators.validatePassword(password);
    final currentState = state.data;
    emit(
      ForgetPasswordInitial(
        currentState.copyWith(
          password: FormModelItem(value: password, error: error),
        ),
      ),
    );
  }

  void _conObscureEvent(
    FConObscureEvent event,
    Emitter<ForgetPasswordBaseState> emit,
  ) {
    bool obscure = event.conObscure;
    final currentState = state.data;
    emit(ForgetPasswordInitial(currentState.copyWith(conObscure: !obscure)));
  }

  void _conPasswordEvent(
    FConPasswordFieldEvent event,
    Emitter<ForgetPasswordBaseState> emit,
  ) {
    final String password = event.password;
    final currentState = state.data;
    String? error = Validators.validateConPassword(
      password,
      currentState.password.value,
    );

    emit(
      ForgetPasswordInitial(
        currentState.copyWith(
          conPassword: FormModelItem(value: password, error: error),
        ),
      ),
    );
  }

  // void _buttonEmailEvent(
  //   FEmailButtonEvent event,
  //   Emitter<ForgetPasswordState> emit,
  // ) {
  //   bool button = false;
  //   if (state.email.value.isNotEmpty && state.email.error == null) {
  //     button = true;
  //   }
  //   emit(state.copyWith(buttonEmail: button));
  // }

  void _buttonEvent(FButtonEvent event, Emitter<ForgetPasswordBaseState> emit) {
    final currentState = state.data;
    final isValid = [
      currentState.password,
      currentState.conPassword,
    ].every((field) => field.value.isNotEmpty && field.error == null);
    emit(ForgetPasswordInitial(currentState.copyWith(button: isValid)));
  }

  Future<void> _onSubmit(
    ForgetSubmitEvent event,
    Emitter<ForgetPasswordBaseState> emit,
  ) async {
    final currentState = state.data;
    emit(ForgetPasswordLoading(currentState));
    try {
      bool isArrive = await ResestPasswordService().resetPassword(
        email: event.email,
        code: event.code,
        password: currentState.password.value,
        conPassword: currentState.conPassword.value,
      );
      if (isArrive) {
        emit(ForgetPasswordSuccess(currentState));
      } else {
        emit(
          ForgetPasswordFailed(
            currentState,
            message: "Failed in reset password",
          ),
        );
      }
    } on Exception catch (e) {
      emit(ForgetPasswordFailed(currentState, message: e.toString()));
    }
  }
}
