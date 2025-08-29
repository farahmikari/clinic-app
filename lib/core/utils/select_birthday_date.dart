import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_event.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';

import 'package:flutter/material.dart';

Future<void> selectDate(
  BuildContext context,
  String? valueBirth,
  TextEditingController birthdayController,
  EditProfileBloc bloc,
) async {
  DateTime? picked = await showDatePicker(
    builder: (context, child) {
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
              isDark
                  ? ColorScheme.dark(
                    primary: Theme.of(context).primaryColor,
                    surface: Theme.of(context).accentBackgroundColor,
                  )
                  : ColorScheme.light(
                    primary: Theme.of(context).primaryColor,
                    surface: Theme.of(context).accentBackgroundColor,
                  ),
        ),
        child: child!,
      );
    },
    context: context,
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
    initialDate: DateTime.now(),
  );
  if (picked != null) {
    valueBirth = picked.toString().split(' ')[0];
    birthdayController.text = valueBirth;
    bloc.add(EditBirthFieldEvent(birth: valueBirth));
    bloc.add(EditButtonEvent());
  }
}
