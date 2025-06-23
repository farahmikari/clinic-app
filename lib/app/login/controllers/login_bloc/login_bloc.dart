import 'package:clinic_app/app/login/controllers/services/login_service.dart';
import 'package:clinic_app/app/login/models/login_model.dart';
import 'package:clinic_app/core/utils/validators.dart';
import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBlocBloc extends Bloc<LoginBlocEvent, LoginBaseState> {
  LoginBlocBloc()
    : super(
        LoginInitial(
          LoginBlocState(email: FormModelItem(), password: FormModelItem()),
        ),
      ) {
    on<EmailFieldEvent>(_emailEvent);
    on<PasswordFieldEvent>(_passwordEvent);
    on<ObscureEvent>(_obscureEvent);
    on<ButtonEvent>(_buttonEvent);
    on<LoginSubmitEvent>(_onSubmit);
  }

  void _emailEvent(EmailFieldEvent event, Emitter<LoginBaseState> emit) {
    String email = event.email;
    String? error = Validators.validateEmail(email);
    final currentState = state.data;

    emit(
      LoginInitial(
        currentState.copyWith(email: FormModelItem(value: email, error: error)),
      ),
    );
  }

  void _passwordEvent(PasswordFieldEvent event, Emitter<LoginBaseState> emit) {
    final String password = event.password;
    String? error = Validators.validatePassword(password);
    final currentState = state.data;
    emit(
      LoginInitial(
        currentState.copyWith(
          password: FormModelItem(value: password, error: error),
        ),
      ),
    );
  }

  void _buttonEvent(ButtonEvent event, Emitter<LoginBaseState> emit) {
    final currentState = state.data;
    final isValid = [
      currentState.email,
      currentState.password,
    ].every((field) => field.value.isNotEmpty && field.error == null);
    emit(LoginInitial(currentState.copyWith(button: isValid)));
  }

  void _obscureEvent(ObscureEvent event, Emitter<LoginBaseState> emit) {
    bool obscure = event.obscure;
    final currentState = state.data;
    emit(LoginInitial(currentState.copyWith(obscure: !obscure)));
  }

  Future<void> _onSubmit(
    LoginSubmitEvent event,
    Emitter<LoginBaseState> emit,
  ) async {
    final currentState = state.data;

    emit(LoginLoading(currentState));
    try {
      Map<String, dynamic> map = await LoginService().loginService(
        email: currentState.email.value,
        password: currentState.password.value,
      );

      bool isArrive = map['isArrive'] ?? false;
      if (isArrive) {
        LoginModel model = LoginModel.fromJson(map['response']);
        // ignore: avoid_print
        print("Token login is :${model.token}");

        emit(LoginSuccess(currentState));
      } else {
        emit(LoginFailed(currentState, message: 'error im login'));
      }
    } on Exception catch (e) {
      emit(LoginFailed(currentState, message: e.toString()));
    }
  }
}
