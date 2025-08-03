import 'package:clinic_app/app/home/views/widgets/app_bar_widgets/action_button_widget.dart';
import 'package:clinic_app/app/user_drawer/views/screen/drawer_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeAppBarWidget extends GetView<MyDrawerController>
    implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(35.0.wp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 20.0.wp,
      leadingWidth: 14.0.wp,
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      actionsPadding: EdgeInsets.only(right: AppDimensions.mp),
      title: Text(
        "Home",
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [ActionButtonWidget(icon: AppIcons.notifications, onTap: () {})],
      leading: Align(
        alignment: Alignment.centerRight,
        child: ActionButtonWidget(
          icon: AppIcons.menu,
          onTap: () {
            controller.toggleDrawer();
          },
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(15.0.wp),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: AppDimensions.mp,
            left: AppDimensions.mp,
            right: AppDimensions.mp,
          ),
          child: SearchWidget(),
        ),
      ),
    );
  }
}
