import 'package:clinic_app/app/bottom_navigation_bar/views/screens/bottom_navigation_bar_screen.dart';
import 'package:clinic_app/app/user_drawer/controllers/bloc/logout_bloc/logout_bloc.dart';
import 'package:clinic_app/app/user_drawer/views/screen/menu_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/state_manager.dart';

class DrawerScreen extends GetView<MyDrawerController> {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder:
          (controller) => ZoomDrawer(
            controller: controller.zoomDrawerController,
            angle: 0.0,
            menuScreen: BlocProvider(
              create: (context) => LogoutBloc(),
              child: MenuScreen(),
            ),
            mainScreen: BottomNavigationBarScreen(),
            borderRadius: 24.0,
            showShadow: true,
            menuBackgroundColor: AppColors.backgroundColor,
            drawerShadowsBackgroundColor: AppColors.hintTextColor,
            slideWidth: MediaQuery.of(context).size.width * 0.7,
          ),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    // ignore: avoid_print
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}
