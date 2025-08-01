import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:flutter/widgets.dart';

class EditPasswordState {
  final FormModelItem password;
  final FormModelItem conPassword;
  final FormModelItem oldPassword;
  final bool obscure;
  final bool conObscure;
  final bool oldObscure;
  final bool buttonEvent;
  final GlobalKey<FormState>? formKey;

  EditPasswordState({
    required this.oldPassword,
    required this.password,
    required this.conPassword,
    this.formKey,
    this.obscure = true,
    this.conObscure = true,
    this.oldObscure = true,
    this.buttonEvent=false
  });

  EditPasswordState copyWith({
    FormModelItem? password,
    FormModelItem? conPassword,
    FormModelItem? oldPassword,
    bool? obscure,
    bool? conObscure,
    bool? oldObscure,
    bool? buttonEvent,
  }) {
    return EditPasswordState(
      oldPassword: oldPassword ?? this.oldPassword,
      password: password ?? this.password,
      conPassword: conPassword ?? this.conPassword,
      formKey: formKey,
      obscure: obscure ?? this.obscure,
      conObscure: conObscure ?? this.conObscure,
      oldObscure: oldObscure ?? this.oldObscure,
    );
  }
}

abstract class EditPasswordBaseState {
  final EditPasswordState data;
  EditPasswordBaseState({required this.data});
}

final class EditPasswordInitial extends EditPasswordBaseState {
  EditPasswordInitial(EditPasswordState data) : super(data: data);
}

final class EditPasswordLoading extends EditPasswordBaseState {
  EditPasswordLoading(EditPasswordState data) : super(data: data);
}

final class EditPasswordSuccess extends EditPasswordBaseState {
  EditPasswordSuccess(EditPasswordState data) : super(data: data);
}

final class EditPasswordFailed extends EditPasswordBaseState {
  final String message;
  EditPasswordFailed(EditPasswordState data, {required this.message})
    : super(data: data);
}
