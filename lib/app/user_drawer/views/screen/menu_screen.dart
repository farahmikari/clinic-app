import 'package:clinic_app/app/settings/views/screens/settings_screen.dart';
import 'package:clinic_app/app/user_drawer/views/widgets/list_tile_drawer.dart';
import 'package:clinic_app/app/user_drawer/views/widgets/list_tile_logout_widget.dart';
import 'package:clinic_app/app/user_profile/views/screens/profile_screen.dart';
import 'package:clinic_app/app/vital_signals/views/screen/vital_signal_screen.dart';
import 'package:clinic_app/core/constants/app_logo.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
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
            iconColor: Theme.of(context).primaryColor,
            backgroundIconColor: Theme.of(context).transparentPrimaryColor,
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
            iconColor: Theme.of(context).darkBlueColor,
            backgroundIconColor: Theme.of(context).transparentBlueColor,
            title: S.current.vital_signs,
            onTap:
                () => Get.to(
                  () => VitalSignalScreen(),
                  transition: getx.Transition.cupertino,
                ),
          ),

          ListTileDrawerWidget(
            icon: Icons.settings,
            iconColor: Theme.of(context).darkPurpleColor,
            backgroundIconColor: Theme.of(context).transparentPurpleColor,
            title: S.current.setting,
            onTap:
                () => Get.to(
                  () => SettingsScreen(),
                  transition: getx.Transition.cupertino,
                ),
          ),

          ListTileDrawerWidget(
            icon: Icons.warning,
            iconColor: Theme.of(context).accentColor,
            backgroundIconColor: Theme.of(context).transparentAccentColor,
            title: S.current.about_us,
          ),

          ListTileLogoutWidget(),
        ],
      ),
    );
  }
}
