import 'package:clinic_app/app/appointments/views/screens/appointments_screen.dart';
import 'package:clinic_app/app/appointments/views/widgets/appointments_app_bar_widget.dart';
import 'package:clinic_app/app/bottom_navigation_bar/controllers/bottom%20navigation%20bar%20bloc/bottom_navigation_bar_bloc.dart';
import 'package:clinic_app/app/bottom_navigation_bar/views/widgets/salomon_bottom_bar_widget.dart';
import 'package:clinic_app/app/home/views/screens/home_screen.dart';
import 'package:clinic_app/app/home/views/widgets/app%20bar%20widgets/home_app_bar_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget selectedAppBar(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomeAppBarWidget();
        case 1:
          return AppointmentsAppBarWidget();
        default:
          return AppBar();
      }
    }

    return BlocProvider(
      create:
          (context) =>
              getIt<BottomNavigationBarBloc>()..add(CurrentIndexChanged(0)),
      child:
          BlocSelector<BottomNavigationBarBloc, BottomNavigationBarState, int>(
            selector: (state) {
              return state.currentIndex;
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: AppColors.backgroundColor,
                appBar: selectedAppBar(state),
                body: IndexedStack(
                  index: state,
                  children: [
                    const HomeScreen(),
                    const AppointmentsScreen(),
                    Center(child: Text("Bills")),
                    Center(child: Text("Settings")),
                  ],
                ),
                bottomNavigationBar: SalomonBottomBarWidget(),
              );
            },
          ),
    );
  }
}
