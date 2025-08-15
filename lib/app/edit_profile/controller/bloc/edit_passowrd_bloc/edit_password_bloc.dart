import 'package:clinic_app/app/edit_profile/controller/bloc/edit_passowrd_bloc/edit_password_event.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_passowrd_bloc/edit_password_state.dart';
import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:clinic_app/core/utils/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPasswordBloc extends Bloc<EditPasswordEvent, EditPasswordBaseState> {
  EditPasswordBloc()
    : super(
        EditPasswordInitial(
          EditPasswordState(
            oldPassword: FormModelItem(),
            password: FormModelItem(),
            conPassword: FormModelItem(),
          ),
        ),
      ) {
    on<PasswordEvent>(_passwordEvent);
    on<OldPasswordEvent>(_oldPasswordEvent);
    on<ConPasswordEvent>(_conPassword);
    on<ObscurEvent>(_obscure);
    on<OldObscurEvent>(_oldObscure);
    on<ConObscurEvent>(_conObscure);
    on<EditButtonEvent>(_buttonEvent);
  }
  void _oldPasswordEvent(
    OldPasswordEvent event,
    Emitter<EditPasswordBaseState> emit,
  ) {
    final currentState = state.data;
    String oldPassword = event.password;
    String? error = Validators.validatePassword(oldPassword);
    emit(
      EditPasswordInitial(
        currentState.copyWith(
          oldPassword: FormModelItem(value: oldPassword, error: error),
        ),
      ),
    );
  }

  void _oldObscure(OldObscurEvent event, Emitter<EditPasswordBaseState> emit) {
    final currentState = state.data;
    bool obscure = event.obscure;

    emit(EditPasswordInitial(currentState.copyWith(oldObscure: !obscure)));
  }

  void _passwordEvent(
    PasswordEvent event,
    Emitter<EditPasswordBaseState> emit,
  ) {
    final currentState = state.data;
    String password = event.password;
    String? error = Validators.validatePassword(password);
    emit(
      EditPasswordInitial(
        currentState.copyWith(
          password: FormModelItem(value: password, error: error),
        ),
      ),
    );
  }

  void _obscure(ObscurEvent event, Emitter<EditPasswordBaseState> emit) {
    final currentState = state.data;
    bool obscure = event.obscure;

    emit(EditPasswordInitial(currentState.copyWith(obscure: !obscure)));
  }

  void _conPassword(
    ConPasswordEvent event,
    Emitter<EditPasswordBaseState> emit,
  ) {
    final currentState = state.data;
    String conPassword = event.password;
    String? error = Validators.validateConPassword(
      conPassword,
      currentState.password.value,
    );
    emit(
      EditPasswordInitial(
        currentState.copyWith(
          conPassword: FormModelItem(value: conPassword, error: error),
        ),
      ),
    );
  }

  void _conObscure(ConObscurEvent event, Emitter<EditPasswordBaseState> emit) {
    final currentState = state.data;
    bool obscure = event.obscure;

    emit(EditPasswordInitial(currentState.copyWith(conObscure: !obscure)));
  }

    void _buttonEvent(EditButtonEvent event, Emitter<EditPasswordBaseState> emit) {
    final currentState = state.data;
    final isValid = [
      currentState.password,
      currentState.conPassword,
      currentState.oldPassword
    ].every((field) => field.value.isNotEmpty && field.error == null);

    emit(EditPasswordInitial(currentState.copyWith(buttonEvent: isValid)));
  }
  

}
