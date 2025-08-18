import 'dart:developer';

import 'package:clinic_app/app/languages/controllers_2/bloc/localization_bloc.dart';
import 'package:clinic_app/app/languages/models/language_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguagesScreen extends StatelessWidget {
  const LanguagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var groupValue = context.read<LocalizationBloc>().state.locale.languageCode;
    return BlocConsumer<LocalizationBloc, LocalizationState>(
      listener: (context, state) {
        groupValue = state.locale.languageCode;
      },
      builder: (context, state) {
        log(S.current.language);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              S.current.language,
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: AppDimensions.lfs,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              var item = languageModel[index];
              return RadioListTile(
                value: item.languageCode,
                groupValue: groupValue,
                title: Text(item.language),
                subtitle: Text(item.subLanguage),
                onChanged: (value) {
                  context.read<LocalizationBloc>().add(
                    LocaleIsChanged(locale: Locale(item.languageCode)),
                  );
                },
              );
            },
            itemCount: languageModel.length,
          ),
        );
      },
    );
  }
}
