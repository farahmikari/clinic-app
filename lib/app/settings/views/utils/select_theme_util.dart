import 'package:clinic_app/app/settings/controllers/theme_bloc/theme_bloc.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

Future<dynamic> selectThemeUtil(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) {
      return BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: Theme.of(context).accentBackgroundColor,
            titlePadding: EdgeInsets.all(AppDimensions.mp),
            contentPadding: EdgeInsets.all(AppDimensions.mp),
            title: Text(
              S.current.appearance_title,
              style: TextStyle(
                color: Theme.of(context).primaryTextColor,
                fontSize: AppDimensions.mfs,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile<ThemeMode>(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Theme.of(context).primaryColor,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  title: Text(
                    S.current.use_device_theme,
                    style: TextStyle(
                      color: Theme.of(context).primaryTextColor,
                      fontSize: AppDimensions.mfs,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: ThemeMode.system,
                  groupValue: state.themeMode,
                  onChanged: (themeMode) {
                    if (themeMode != null) {
                      context.read<ThemeBloc>().add(
                        ThemeModeIsChanged(themeMode: themeMode),
                      );
                      Get.back();
                    }
                  },
                ),
                RadioListTile<ThemeMode>(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Theme.of(context).primaryColor,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  title: Text(
                    S.current.light_theme,
                    style: TextStyle(
                      color: Theme.of(context).primaryTextColor,
                      fontSize: AppDimensions.mfs,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: ThemeMode.light,
                  groupValue: state.themeMode,
                  onChanged: (themeMode) {
                    if (themeMode != null) {
                      context.read<ThemeBloc>().add(
                        ThemeModeIsChanged(themeMode: themeMode),
                      );
                      Get.back();
                    }
                  },
                ),
                RadioListTile<ThemeMode>(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Theme.of(context).primaryColor,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  title: Text(
                    S.current.dark_theme,
                    style: TextStyle(
                      color: Theme.of(context).primaryTextColor,
                      fontSize: AppDimensions.mfs,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: ThemeMode.dark,
                  groupValue: state.themeMode,
                  onChanged: (themeMode) {
                    if (themeMode != null) {
                      context.read<ThemeBloc>().add(
                        ThemeModeIsChanged(themeMode: themeMode),
                      );
                      Get.back();
                    }
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
