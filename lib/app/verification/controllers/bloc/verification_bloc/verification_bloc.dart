import 'package:clinic_app/app/forget_password/controllers/services/check_code_forget_password_service.dart';
import 'package:clinic_app/app/verification/controllers/bloc/verification_bloc/verification_event.dart';
import 'package:clinic_app/app/verification/controllers/services/check_code_service.dart';
import 'package:clinic_app/app/verification/model/email_verification_model.dart';
import 'package:clinic_app/app/verification/model/verification_goto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'verification_state.dart';

class VerificationBloc extends Bloc<VerificationEvent, VerificationState> {
  final List<String> _otp = List.filled(6, '');

  VerificationBloc()
    : super(
        VerificationInitial(
          emailModel: EmailVerificationModel(email: '', code: ''),
        ),
      ) {
    on<VerificationEvent>(_verificationEvent);
  }

  Future<void> _verificationEvent(event, emit) async {
    if (event is OtpChangedEvent) {
      _otp[event.index] = event.value;
      final code = _otp.join();
      final bool isComplete = _otp.every((element) => element.length == 1);
      emit(
        VerificationInitial(
          emailModel: EmailVerificationModel(email: event.email, code: code),
          canSubmit: isComplete,
        ),
      );
    } else if (event is CanSubmitVerificationEvent) {
      bool isArrive;
      try {
        emit(VerificationLoading());
        switch (event.source) {
          case VerificationGoto.signup:
            isArrive = await CheckCodeService().checkCode(
              emailModel: EmailVerificationModel(
                email: event.emailModel.email,
                code: event.emailModel.code,
              ),
            );
            break;
          case VerificationGoto.forgetPassword:
            isArrive = await CheckCodeForgetPasswordService().checkCode(
              emailModel: EmailVerificationModel(
                email: event.emailModel.email,
                code: event.emailModel.code,
              ),
            );
            break;
          case VerificationGoto.changeEmail:
            isArrive = true;
            break;
          default:
            isArrive = false;
            break;
        }
        if (isArrive) {
          emit(
            VerificationSuccess(
              emailModel: EmailVerificationModel(
                email: event.emailModel.email,
                code: event.emailModel.code,
              ),
            ),
          );
        } else {
          emit(VerificationFailed(message: 'Verification failed'));
        }
      } catch (e) {
        emit(VerificationFailed(message: e.toString()));
      }
    }
  }
}
