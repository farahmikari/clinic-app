import 'package:clinic_app/app/home/views/widgets/app_bar_widgets/action_button_widget.dart';
import 'package:clinic_app/app/languages/views/screens/languages_screen.dart';
import 'package:clinic_app/app/notifications/views/screens/notification_screen.dart';
import 'package:clinic_app/app/user_drawer/controllers/bloc/drawer_bloc/drawer_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/search_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as getx;

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(35.0.wp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      toolbarHeight: 20.0.wp,
      leadingWidth: 14.0.wp,
      surfaceTintColor: AppColors.primaryBackgroundColor,
      actionsPadding: EdgeInsetsDirectional.only(end: AppDimensions.mp),
      title: Text(
        S.current.home,
        style: TextStyle(
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        ActionButtonWidget(
          icon: AppIcons.notifications,
          onTap: () {
            getx.Get.to(
              () => NotificationScreen(),
              transition: getx.Transition.zoom,
            );
          },
        ),
        SizedBox(width: AppDimensions.mp),
        ActionButtonWidget(
          icon: AppIcons.settings,
          onTap: () {
            getx.Get.to(
              () => LanguagesScreen(),
              transition: getx.Transition.zoom,
            );
          },
        ),
      ],
      leading: Align(
        alignment: AlignmentDirectional.centerEnd,
        child: ActionButtonWidget(
          icon: AppIcons.menu,
          onTap: () {
            context.read<DrawerBloc>().add(ToggleDrawerEvent());
          },
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(15.0.wp),
        child: Padding(
          padding: EdgeInsetsDirectional.only(
            bottom: AppDimensions.mp,
            start: AppDimensions.mp,
            end: AppDimensions.mp,
          ),
          child: SearchWidget(),
        ),
      ),
    );
  }
}
