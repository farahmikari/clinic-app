part of 'verification_bloc.dart';

abstract class VerificationState {
  final GlobalKey<FormState>? formKey;
  final bool canSubmit;
  bool signUp;
  final EmailVerificationModel? emailModel;
  VerificationState({this.emailModel, this.formKey, this.canSubmit = false,this.signUp=true});
}

final class VerificationInitial extends VerificationState {
  VerificationInitial({super.canSubmit, required super.emailModel});
}

final class VerificationLoading extends VerificationState {}

final class VerificationSuccess extends VerificationState {
  VerificationSuccess({required super.emailModel});

}

final class VerificationFailed extends VerificationState {
  final String message;

  VerificationFailed({super.formKey, super.canSubmit, required this.message});
}
