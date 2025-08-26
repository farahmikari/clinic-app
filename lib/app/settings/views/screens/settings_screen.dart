import 'package:clinic_app/app/settings/views/utils/select_language_util.dart';
import 'package:clinic_app/app/settings/views/utils/select_theme_util.dart';
import 'package:clinic_app/app/settings/views/widgets/setting_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppDimensions.mp),
        children: [
          SettingWidget(
            icon: AppIcons.themes,
            title: "Appearance",
            subtitle: "Choose your light or dark theme",
            onTap: () {
              selectThemeUtil(context);
            },
          ),
          SizedBox(height: AppDimensions.sp),
          SettingWidget(
            icon: AppIcons.languages,
            title: "App Language",
            subtitle: "Switch between English and Arabic",
            onTap: () {
              selectLanguageUtil(context);
            },
          ),
        ],
      ),
    );
  }
}
