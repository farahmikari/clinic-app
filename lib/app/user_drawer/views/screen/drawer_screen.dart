import 'package:clinic_app/app/bottom_navigation_bar/views/screens/bottom_navigation_bar_screen.dart';
import 'package:clinic_app/app/user_drawer/controllers/bloc/drawer_bloc/drawer_bloc.dart';
import 'package:clinic_app/app/user_drawer/controllers/bloc/logout_bloc/logout_bloc.dart';
import 'package:clinic_app/app/user_drawer/views/screen/menu_screen.dart';
import 'package:clinic_app/app/user_profile/controllers/bloc/profile_bloc/profile_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  final ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DrawerBloc(zoomDrawerController)),
        BlocProvider(
          create: (context) => LogoutBloc()..add(LogoutVisitorEvent()),
        ),
        BlocProvider(create: (context) => ProfileBloc()),
      ],
      child: BlocBuilder<DrawerBloc, DrawState>(
        builder: (context, state) {
          return ZoomDrawer(
            controller: zoomDrawerController,
            angle: 0.0,
            menuScreen: MenuScreen(),
            mainScreen: BottomNavigationBarScreen(),
            borderRadius: 24.0,
            showShadow: true,
             menuBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            drawerShadowsBackgroundColor: AppColors.hintTextColor,
            slideWidth: MediaQuery.of(context).size.width * 0.7,
          );
        },
      ),
    );
  }
}
