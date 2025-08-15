import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_event.dart';
import 'package:flutter/material.dart';

void selectGender(
    BuildContext context,
    List<String> genderOption,
    TextEditingController genderController,
    EditProfileBloc bloc
  ) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children:
              genderOption.map((gender) {
                return ListTile(
                  leading: Icon(gender == 'Male' ? Icons.male : Icons.female),
                  title: Text(
                    gender,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  onTap: () {
                    bloc.add(
                      EditGenderFieldEvent(gender: gender),
                    );
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