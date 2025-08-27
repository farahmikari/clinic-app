import 'package:clinic_app/app/settings/controllers/localization_bloc/localization_bloc.dart';
import 'package:clinic_app/app/settings/models/localization_mode_model.dart';
import 'package:clinic_app/app/user_drawer/views/screen/drawer_screen.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

Future<dynamic> selectLanguageUtil(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) {
      return BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return AlertDialog(
            backgroundColor: Theme.of(context).accentBackgroundColor,
            titlePadding: EdgeInsets.all(AppDimensions.mp),
            contentPadding: EdgeInsets.all(AppDimensions.mp),
            title: Text(
              S.current.app_language_title,
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
                RadioListTile<LocalizationMode>(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Theme.of(context).primaryColor,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  title: Text(
                    S.current.use_device_language,
                    style: TextStyle(
                      color: Theme.of(context).primaryTextColor,
                      fontSize: AppDimensions.mfs,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: LocalizationMode.system,
                  groupValue: state.localizationMode,
                  onChanged: (localizationMode) {
                    if (localizationMode != null) {
                      context.read<LocalizationBloc>().add(
                        LocalizationModeIsChanged(
                          localizationMode: localizationMode,
                        ),
                      );
                      Get.offAll(() => DrawerScreen());
                    }
                  },
                ),
                RadioListTile<LocalizationMode>(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Theme.of(context).primaryColor,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  title: Text(
                    S.current.english,
                    style: TextStyle(
                      color: Theme.of(context).primaryTextColor,
                      fontSize: AppDimensions.mfs,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: LocalizationMode.english,
                  groupValue: state.localizationMode,
                  onChanged: (localizationMode) {
                    if (localizationMode != null) {
                      context.read<LocalizationBloc>().add(
                        LocalizationModeIsChanged(
                          localizationMode: localizationMode,
                        ),
                      );
                      Get.offAll(() => DrawerScreen());
                    }
                  },
                ),
                RadioListTile<LocalizationMode>(
                  contentPadding: EdgeInsets.zero,
                  activeColor: Theme.of(context).primaryColor,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  title: Text(
                    S.current.arabic,
                    style: TextStyle(
                      color: Theme.of(context).primaryTextColor,
                      fontSize: AppDimensions.mfs,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  value: LocalizationMode.arabic,
                  groupValue: state.localizationMode,
                  onChanged: (localizationMode) {
                    if (localizationMode != null) {
                      context.read<LocalizationBloc>().add(
                        LocalizationModeIsChanged(
                          localizationMode: localizationMode,
                        ),
                      );
                      Get.offAll(() => DrawerScreen());
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
