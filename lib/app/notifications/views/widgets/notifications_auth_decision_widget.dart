import 'package:clinic_app/app/auth_prompt/controllers/check_user_authentication_bloc/check_user_authentication_bloc.dart';
import 'package:clinic_app/app/auth_prompt/views/screens/auth_prompt_screen.dart';
import 'package:clinic_app/app/notifications/views/screens/notification_screen.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsAuthDecisionWidget extends StatelessWidget {
  const NotificationsAuthDecisionWidget({super.key});

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
            return NotificationsScreen();
          case UserUnAuthenticated():
            return AuthPromptScreen(
              title: S.current.notifications_auth_prompt_title,
              subtitle: S.current.notifications_auth_prompt_subtitle,
            );
        }
      },
    );
  }
}
