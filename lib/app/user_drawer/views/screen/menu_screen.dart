import 'package:clinic_app/app/setting/views/screen/setting_screen.dart';
import 'package:clinic_app/app/user_drawer/views/widgets/list_tile_drawer.dart';
import 'package:clinic_app/app/user_drawer/views/widgets/list_tile_logout_widget.dart';
import 'package:clinic_app/app/user_profile/views/screens/profile_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_logo.dart';
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
     // backgroundColor: AppColors.backgroundColor,
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
              Get.to(() => ProfileScreen(), transition: getx.Transition.fade);
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
            onTap:
                () => Get.to(
                  () => SettingScreen(),
                  transition: getx.Transition.zoom,
                ),
          ),

          ListTileDrawerWidget(
            icon: Icons.warning,
            iconColor: Colors.orangeAccent,
            backgroundIconColor: const Color(0x84FFAC40),
            title: 'About Us',
          ),

          ListTileLogoutWidget(),
        ],
      ),
    );
  }
}
