import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/user_drawer/controllers/bloc/logout_bloc/logout_bloc.dart';
import 'package:clinic_app/app/user_drawer/views/screen/drawer_screen.dart';
import 'package:clinic_app/app/user_drawer/views/widgets/list_tile_drawer.dart';
import 'package:clinic_app/app/user_profile/views/screens/profile_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_logo.dart';
import 'package:clinic_app/core/utils/show_dialog_alert.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.3,
            width: width * 0.5,
            child: Image.asset(AppLogo.logoWithoutBakcground),
          ),

          ListTileDrawerWidget(
            icon: Icons.person,
            iconColor: AppColors.primaryColor,
            backgroundIconColor: AppColors.transparentGreen,
            title: 'Profile',
            onTap: () {
              Get.to(() => ProfileScreen());
            },
          ),
          ListTileDrawerWidget(
            icon: Icons.article,
            iconColor: AppColors.darkBlueColor,
            backgroundIconColor: const Color(0x844489FF),
            title: 'Vital signs',
          ),

          ListTileDrawerWidget(
            icon: Icons.settings,
            iconColor: Colors.deepPurple,
            backgroundIconColor: const Color(0x7C683AB7),
            title: 'Setting',
          ),

          ListTileDrawerWidget(
            icon: Icons.warning,
            iconColor: Colors.orangeAccent,
            backgroundIconColor: const Color(0x84FFAC40),
            title: 'About Us',
          ),
          
          BlocListener<LogoutBloc, LogoutState>(
            listener: (context, state) {
              if (state is LogoutLoading) {
                Get.dialog(
                  const Center(
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
                    title: "Success",
                    message: "Logout Successfully",
                    contentType: ContentType.success,
                  );
                  Get.offAll(() => LoginScreen());
                  break;
                case LogoutFailure():
                  showSnackBar(
                    context,
                    title: "Failed",
                    message: "Failed Logout",
                    contentType: ContentType.failure,
                  );
                  break;
                default:
                  break;
              }
            },

            child: ListTileDrawerWidget(
              icon: Icons.report,
              iconColor: const Color(0xFFD50404),
              backgroundIconColor: const Color(0x82D50404),
              title: 'Logout',
              onTap: () {
                final logout = context.read<LogoutBloc>();
                showDialogAlert(
                  context: context,
                  title: "Logout",
                  content: "Are you sure you want to logout ?!",
                  onPressed: () {
                    logout.add(LogoutEvent());
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
