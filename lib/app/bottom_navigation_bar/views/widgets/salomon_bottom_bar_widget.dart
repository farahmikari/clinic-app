import 'package:clinic_app/app/bottom_navigation_bar/controllers/bottom_navigation_bar_bloc/bottom_navigation_bar_bloc.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
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
          ? Theme.of(context).primaryColor
          : Theme.of(context).accentTextColor;
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
              color: Theme.of(context).primaryColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: SvgPicture.asset(
            AppIcons.home,
            height: AppDimensions.mis,
            width: AppDimensions.mis,
            colorFilter: ColorFilter.mode(
              specifyIconColor(itemId: 0),
              BlendMode.srcIn,
            ),
          ),
        ),
        SalomonBottomBarItem(
          title: Text(
            S.current.appointments,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: SvgPicture.asset(
            AppIcons.appointments,
            height: AppDimensions.mis,
            width: AppDimensions.mis,
            colorFilter: ColorFilter.mode(
              specifyIconColor(itemId: 1),
              BlendMode.srcIn,
            ),
          ),
        ),
        SalomonBottomBarItem(
          title: Text(
            S.current.departments,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: SvgPicture.asset(
            AppIcons.department,
            height: AppDimensions.mis,
            width: AppDimensions.mis,
            colorFilter: ColorFilter.mode(
              specifyIconColor(itemId: 2),
              BlendMode.srcIn,
            ),
          ),
        ),
        SalomonBottomBarItem(
          title: Text(
            S.current.bills,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: AppDimensions.sfs,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: SvgPicture.asset(
            AppIcons.bills,
            height: AppDimensions.mis,
            width: AppDimensions.mis,
            colorFilter: ColorFilter.mode(
              specifyIconColor(itemId: 3),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
      selectedItemColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryBackgroundColor,
    );
  }
}
