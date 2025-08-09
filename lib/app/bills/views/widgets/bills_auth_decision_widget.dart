import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/app/auth_prompt/views/screens/auth_prompt_screen.dart';
import 'package:clinic_app/app/bills/views/screens/bills_screen.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsAuthDecisionWidget extends StatelessWidget {
  const BillsAuthDecisionWidget({super.key});

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
            return BillsScreen();

          case UserUnAuthenticated():
            return AuthPromptScreen(
              title: "Sign in to access your bills",
              subtitle:
                  "To securely access and review all your billing details, please sign in to your account.",
            );
        }
      },
    );
  }
}
