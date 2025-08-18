import 'package:clinic_app/app/bottom_navigation_bar/controllers/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalomonBottomBarWidget extends StatelessWidget {
  const SalomonBottomBarWidget({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    Color specifyIconColor({required int itemId}) {
      return itemId == currentIndex
          ? AppColors.primaryColor
          : AppColors.darkGreyColor;
    }

    return SalomonBottomBar(
      onTap: (index) {
        context.read<BottomNavigationBarBloc>().add(CurrentIndexChanged(index));
      },
      currentIndex: currentIndex,
      items: [
        SalomonBottomBarItem(
          title: Text(
            S.current.home,
            style: TextStyle(
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: SvgPicture.asset(
            AppIcons.home,
            height: AppDimensions.mis,
            width: AppDimensions.mis,
            color: specifyIconColor(itemId: 0),
          ),
        ),
        SalomonBottomBarItem(
          title: Text(
            S.current.appointments,
            style: TextStyle(
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: SvgPicture.asset(
            AppIcons.appointments,
            height: AppDimensions.mis,
            width: AppDimensions.mis,
            color: specifyIconColor(itemId: 1),
          ),
        ),
        SalomonBottomBarItem(
          title: Text(
            S.current.departments,
            style: TextStyle(
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: SvgPicture.asset(
            AppIcons.department,
            height: AppDimensions.mis,
            width: AppDimensions.mis,
            color: specifyIconColor(itemId: 2),
          ),
        ),
        SalomonBottomBarItem(
          title: Text(
            S.current.bills,
            style: TextStyle(
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: SvgPicture.asset(
            AppIcons.bills,
            height: AppDimensions.mis,
            width: AppDimensions.mis,
            color: specifyIconColor(itemId: 3),
          ),
        ),
      ],
      selectedItemColor: AppColors.primaryColor,
      backgroundColor: AppColors.backgroundColor,
    );
  }
}
