import 'package:clinic_app/app/settings/views/utils/select_language_util.dart';
import 'package:clinic_app/app/settings/views/utils/select_theme_util.dart';
import 'package:clinic_app/app/settings/views/widgets/setting_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.settings,
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
            title: S.current.appearance_title,
            subtitle: S.current.appearance_subtitle,
            onTap: () {
              selectThemeUtil(context);
            },
          ),
          SizedBox(height: AppDimensions.sp),
          SettingWidget(
            icon: AppIcons.languages,
            title: S.current.app_language_title,
            subtitle: S.current.app_language_subtitle,
            onTap: () {
              selectLanguageUtil(context);
            },
          ),
        ],
      ),
    );
  }
}
