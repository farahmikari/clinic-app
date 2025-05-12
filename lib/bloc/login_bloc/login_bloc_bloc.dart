import 'package:clinic_app/helpers/validators.dart';
import 'package:clinic_app/models/formModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_bloc_event.dart';
part 'login_bloc_state.dart';


class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBlocState> {
  LoginBlocBloc()
    : super(LoginBlocState(phone: FormModelItem(), password: FormModelItem())) {
    on<PhoneFieldEvent>(_phoneEvent);
    on<PasswordFieldEvent>(_passwordEvent);
    on<ObscureEvent>(_obscureEvent);
    on<ButtonEvent>(_buttonEvent);
  }

  void _phoneEvent(PhoneFieldEvent event, Emitter<LoginBlocState> emit) {
    String phone = event.phone;
    String? error=Validators.validatePhone(phone);
    
    emit(state.copyWith(phone: FormModelItem(value: phone, error: error)));
  }

  void _passwordEvent(PasswordFieldEvent event, Emitter<LoginBlocState> emit) {
    final String password = event.password;
    String? error=Validators.validatePassword(password);
    emit(
      state.copyWith(password: FormModelItem(value: password, error: error)),
    );
  }

  void _buttonEvent(ButtonEvent event, Emitter<LoginBlocState> emit) {
    bool button = false;
    if (state.phone.value.isNotEmpty &&
        state.phone.error == null &&
        state.password.value.isNotEmpty &&
        state.password.error == null) {
      button = true;
    }
    emit(state.copyWith(button: button));
  }

  void _obscureEvent(ObscureEvent event, Emitter<LoginBlocState> emit) {
    bool obscure = event.obscure;

    emit(state.copyWith(obscure: !obscure));
  }
}
