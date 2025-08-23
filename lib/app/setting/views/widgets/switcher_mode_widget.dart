import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/theme/app_theme.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_bloc.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_event.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_state.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rolling_switch/rolling_switch.dart';

class SwitcherModeWidget extends StatelessWidget {
  const SwitcherModeWidget({super.key, required this.state});
  final ThemeState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 4.0.hp),
          child: Text(
            S.current.change_theme_Dark_Light_mode,
            style: Theme.of(
              context,
            ).textTheme.titleLarge!.copyWith(fontSize: 18),
          ),
        ),
        RollingSwitch.icon(
          onChanged: (bool state) {
            context.read<ThemeBloc>().add(
              ChangeThemeEvent(
                myThemes: state ? AppTheme.lightTheme : AppTheme.darkTheme,
              ),
            );
          },
          initialState:
              state is LoadedThemeState
                  ? (state as LoadedThemeState).themeData == AppTheme.lightTheme
                  : false,
          rollingInfoRight: RollingIconInfo(
            text: Text(
              S.current.light,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 16),
            ),
            icon: Icons.sunny,
            iconColor: Colors.orangeAccent,
            backgroundColor: Colors.orangeAccent,
          ),
          rollingInfoLeft: RollingIconInfo(
            text: Text(
              S.current.dark,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(fontSize: 16),
            ),
            icon: Icons.nights_stay,
            iconColor: Colors.grey,
            backgroundColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
