import 'package:clinic_app/app/forget_password/controllers/services/email_forget_password_service.dart';
import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_event.dart';
import 'package:clinic_app/app/signup/controllers/bloc/email_bloc/email_state.dart';
import 'package:clinic_app/app/signup/controllers/services/send_email_verify.dart';
import 'package:clinic_app/core/utils/validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  EmailBloc() : super(EmailInitial(email: FormModelItem())) {
    on<EmailEvent>(_emailEvent);
  }

  Future<void> _emailEvent(event, emit) async {
    if (event is InitEmailEvent) {
      String? email = event.email;
      String? error = Validators.validateEmail(email);
      bool canSubmit = email.isNotEmpty && error == null;
      emit(
        EmailInitial(
          email: FormModelItem(value: email, error: error),
          canSubmit: canSubmit,
        ),
      );
    } else if (event is CanSubmitEmail) {
      bool isArrive;
      try {
        emit(EmailLoading());
        isArrive =  event.signUp? await SendEmailVerify().sendEmailVerifyService(email: event.email )
        :await EmailForgetPasswordService().sendEmailForgetPasswordService(email: event.email);
        if (isArrive) {
          emit(EmailSuccess());
        }
        else{
          emit(EmailFailed(message: 'Verify code failed to send'));
        }
      } catch (e) {
        emit(EmailFailed(message: e.toString()));
      }
    }
  }
}
