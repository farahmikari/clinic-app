import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/app/auth_prompt/views/screens/auth_prompt_screen.dart';
import 'package:clinic_app/app/book_appointment/views/screens/book_appointment_with_doctor_screen.dart';
import 'package:clinic_app/app/doctor/models/doctor_model.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAppointmentWithDoctorScreenAuthDecisionWidget
    extends StatelessWidget {
  const BookAppointmentWithDoctorScreenAuthDecisionWidget({
    super.key,
    required this.doctor,
  });
  final DoctorModel doctor;

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
            return BookAppointmentWithDoctorScreen(doctor: doctor);
          case UserUnAuthenticated():
            return AuthPromptScreen(
              title: "Sign In to Book Your Appointment",
              subtitle:
                  "Log in to your account to select your preferred time, and confirm your clinic visit.",
            );
        }
      },
    );
  }
}
