import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_event.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';

void selectGender(
  BuildContext context,
  List<String> genderOption,
  TextEditingController genderController,
  EditProfileBloc bloc,
) {
  showModalBottomSheet(
    backgroundColor: Theme.of(context).primaryBackgroundColor,
    context: context,
    builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children:
            genderOption.map((gender) {
              return ListTile(
                leading: Icon(
                  gender == 'Male' ? Icons.male : Icons.female,
                  color: Theme.of(context).accentTextColor,
                ),
                title: Text(
                  gender,
                  style: TextStyle(
                    color: Theme.of(context).primaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () {
                  bloc.add(EditGenderFieldEvent(gender: gender));
                  bloc.add(EditButtonEvent());
                  genderController.text = gender;
                  Navigator.pop(context);
                },
              );
            }).toList(),
      );
    },
  );
}
