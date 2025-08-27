import 'package:clinic_app/app/appointments/views/screens/appointments_screen.dart';
import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/app/auth_prompt/views/screens/auth_prompt_screen.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsAuthDecisionWidget extends StatelessWidget {
  const AppointmentsAuthDecisionWidget({super.key});

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
            return AppointmentsScreen();

          case UserUnAuthenticated():
            return AuthPromptScreen(
              title: S.current.appointments_auth_prompt_title,
              subtitle: S.current.appointments_auth_prompt_subtitle,
            );
        }
      },
    );
  }
}
