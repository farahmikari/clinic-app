import 'package:clinic_app/app/about_us/views/screen/about_us_screen.dart';
import 'package:clinic_app/app/setting/views/screen/setting_screen.dart';
import 'package:clinic_app/app/user_drawer/views/widgets/list_tile_drawer.dart';
import 'package:clinic_app/app/user_drawer/views/widgets/list_tile_logout_widget.dart';
import 'package:clinic_app/app/user_profile/views/screens/profile_screen.dart';
import 'package:clinic_app/app/vital_signals/views/screen/vital_signal_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_logo.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;

    return Scaffold(
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
            title: S.current.profile,
            onTap: () {
              Get.to(
                () => ProfileScreen(),
                transition: getx.Transition.cupertino,
              );
            },
          ),
          ListTileDrawerWidget(
            icon: Icons.article,
            iconColor: AppColors.darkBlueColor,
            backgroundIconColor: const Color(0x844489FF),
            title: S.current.vital_signs,
            onTap:
                () => Get.to(
                 ()=> VitalSignalScreen(),
                  transition: getx.Transition.cupertino,
                ),
          ),

          ListTileDrawerWidget(
            icon: Icons.settings,
            iconColor: Colors.deepPurple,
            backgroundIconColor: const Color(0x7C683AB7),
            title: S.current.setting,
            onTap:
                () => Get.to(
                  () => SettingScreen(),
                  transition: getx.Transition.cupertino,
                ),
          ),

          ListTileDrawerWidget(
            icon: Icons.warning,
            iconColor: Colors.orangeAccent,
            backgroundIconColor: const Color(0x84FFAC40),
            title: S.current.about_us,
            onTap: () => Get.to(
                  () => AboutUsScreen(),
                  transition: getx.Transition.cupertino,
                ),
          ),

          ListTileLogoutWidget(),
        ],
      ),
    );
  }
}
