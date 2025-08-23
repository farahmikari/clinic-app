import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/user_drawer/controllers/bloc/logout_bloc/logout_bloc.dart';
import 'package:clinic_app/app/user_drawer/views/widgets/list_tile_drawer.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/utils/show_dialog_alert.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ListTileLogoutWidget extends StatelessWidget {
  const ListTileLogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogoutBloc, LogoutState>(
      builder: (context, state) {
        if (state is LogoutVisitor) {
          return const SizedBox.shrink();
        }
        return BlocListener<LogoutBloc, LogoutState>(
          listener: (context, state) {
            if (state is LogoutLoading) {
              Get.dialog(
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
                barrierDismissible: false,
              );
            } else {
              if (Get.isDialogOpen ?? false) Get.back();
            }
            switch (state) {
              case LogoutSuccess():
                showSnackBar(
                  context,
                  title: S.current.success,
                  message: S.current.logout_successfully,
                  contentType: ContentType.success,
                );
                Get.offAll(() => LoginScreen());
                break;
              case LogoutFailure():
                showSnackBar(
                  context,
                  title: S.current.failed,
                  message: S.current.failed_logout,
                  contentType: ContentType.failure,
                );
                break;
              default:
                break;
            }
          },
          child: ListTileDrawerWidget(
            icon: Icons.logout,
            iconColor: const Color(0xFFD50404),
            backgroundIconColor: const Color(0x82D50404),
            title: S.current.logout,
            onTap: () {
              final logout = context.read<LogoutBloc>();
              showDialogAlert(
                context: context,
                title: S.current.logout,
                content: S.current.are_you_sure_you_want_to_logout,
                onPressed: () {
                  logout.add(LogoutUserEvent());
                },
              );
            },
          ),
        );
      },
    );
  }
}
