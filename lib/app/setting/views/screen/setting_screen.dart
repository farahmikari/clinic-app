import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/theme/app_theme.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_bloc.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_event.dart';
import 'package:clinic_app/core/theme/bloc/theme_bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rolling_switch/rolling_switch.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          //backgroundColor: AppColors.backgroundColor,
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text(
              "Setting",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20,
                color: AppColors.backgroundColor,
              ),
            ),
            iconTheme: IconThemeData(color: AppColors.backgroundColor),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 100.0.wp,
              height: 20.0.hp,
              decoration: BoxDecoration(
                color: const Color(0x4617B8A5),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryColor),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.0.wp,
                      vertical: 4.0.hp,
                    ),
                    child: Text(
                      "change theme Dark / Light mode : ",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.darkGreyColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  RollingSwitch.icon(
                    onChanged: (bool state) {
                      context.read<ThemeBloc>().add(
                        ChangeThemeEvent(
                          myThemes:
                              state ? AppTheme.lightTheme : AppTheme.darkTheme,
                        ),
                      );
                    },
                    initialState: state is LoadedThemeState?state.themeData==AppTheme.lightTheme:false,
                    rollingInfoRight: RollingIconInfo(
                      text: Text(
                        'Light',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          // color: AppColors.backgroundColor,
                          fontSize: 16,
                        ),
                      ),
                      icon: Icons.sunny,
                      iconColor: Colors.orangeAccent,
                      backgroundColor: Colors.orangeAccent,
                    ),
                    rollingInfoLeft: RollingIconInfo(
                      text: Text(
                        'Dark',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          // color: AppColors.backgroundColor,
                          fontSize: 16,
                        ),
                      ),
                      icon: Icons.nights_stay,
                      iconColor: Colors.grey,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
