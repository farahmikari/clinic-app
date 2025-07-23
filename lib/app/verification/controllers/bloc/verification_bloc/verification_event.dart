import 'package:clinic_app/app/verification/model/email_verification_model.dart';

abstract class VerificationEvent {
  VerificationEvent();
}

class InitVerificationEvent extends VerificationEvent {
  final EmailVerificationModel emailModel;
  InitVerificationEvent({required this.emailModel});
}

class CanSubmitVerificationEvent extends VerificationEvent {
  final EmailVerificationModel emailModel;
  bool signUp;
  CanSubmitVerificationEvent({required this.emailModel,required this.signUp});
}

class OtpChangedEvent extends VerificationEvent {
  final int index;
  final String value;
  final String email;

  OtpChangedEvent({
    required this.index,
    required this.value,
    required this.email,
  });
}
