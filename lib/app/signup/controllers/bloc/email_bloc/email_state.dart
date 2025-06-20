import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:flutter/widgets.dart';

class EmailState {
  final GlobalKey<FormState>? formKey;
  final bool canSubmit;
  bool signUp;
  EmailState({this.canSubmit = false, this.formKey,this.signUp=true});
}

final class EmailInitial extends EmailState {
  final FormModelItem email;

  EmailInitial({super.canSubmit, required this.email});
}

final class EmailLoading extends EmailState {}

final class EmailSuccess extends EmailState {}

final class EmailFailed extends EmailState {
  final String message;

  EmailFailed({required this.message});
}
