import 'package:clinic_app/app/languages/controllers_2/bloc/localization_bloc.dart';
import 'package:clinic_app/app/languages/models/language_model.dart';
import 'package:clinic_app/app/setting/views/widgets/container_setting_widget.dart';
import 'package:clinic_app/app/setting/views/widgets/switcher_mode_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_bloc.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_state.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var groupValue = context.read<LocalizationBloc>().state.locale.languageCode;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(
              S.current.setting,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                color: AppColors.backgroundColor,
              ),
            ),
            iconTheme: IconThemeData(color: AppColors.backgroundColor),
          ),
          body: Column(
            children: [
              ContainerSettingWidget(child: SwitcherModeWidget(state: state)),
              ContainerSettingWidget(
                child: BlocConsumer<LocalizationBloc, LocalizationState>(
                  listener: (context, state) {
                    groupValue = state.locale.languageCode;
                  },
                  builder: (context, state) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        var item = languageModel[index];
                        return RadioListTile(
                          value: item.languageCode,
                          groupValue: groupValue,
                          title: Text(item.language),
                          subtitle: Text(item.subLanguage),
                          onChanged: (value) {
                            context.read<LocalizationBloc>().add(
                              LocaleIsChanged(
                                locale: Locale(item.languageCode),
                              ),
                            );
                          },
                        );
                      },
                      itemCount: languageModel.length,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
