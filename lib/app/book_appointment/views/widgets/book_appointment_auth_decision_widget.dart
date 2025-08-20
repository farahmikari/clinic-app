import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/app/auth_prompt/views/screens/auth_prompt_screen.dart';
import 'package:clinic_app/app/book_appointment/views/screens/book_appointment_screen.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAppointmentAuthDecisionWidget extends StatelessWidget {
  const BookAppointmentAuthDecisionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      CheckUserAuthenticationBloc,
      CheckUserAuthenticationState
    >(
      builder: (context, state) {
        switch (state) {
          case CheckUserAuthenticationLoading():
            return Scaffold(body: LoadingWidget());
          case UserAuthenticated():
            return BookAppointmentScreen();
          case UserUnAuthenticated():
            return AuthPromptScreen(
              title: "Sign In to Book Your Appointment",
              subtitle:
                  "To schedule a visit with our doctors, please sign in to your account or create a new one. This will allow you to choose your preferred doctor, select a convenient time, and confirm your booking easily.",
            );
        }
      },
    );
  }
}
