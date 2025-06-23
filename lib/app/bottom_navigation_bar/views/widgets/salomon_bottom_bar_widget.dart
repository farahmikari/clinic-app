import 'package:clinic_app/app/bottom_navigation_bar/controllers/bottom%20navigation%20bar%20bloc/bottom_navigation_bar_bloc.dart';
import 'package:clinic_app/app/bottom_navigation_bar/models/item_model.dart';
import 'package:clinic_app/app/bottom_navigation_bar/models/json_data.dart';
import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalomonBottomBarWidget extends StatelessWidget {
  const SalomonBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color specifyIconColor({required int itemId, required int currentIndex}) {
      if (itemId == currentIndex) {
        return AppColors.primaryColor;
      } else {
        return AppColors.darkGreyColor;
      }
    }

    return BlocSelector<BottomNavigationBarBloc, BottomNavigationBarState, int>(
      selector: (state) {
        return state.currentIndex;
      },
      builder: (context, state) {
        return SalomonBottomBar(
          onTap: (index) {
            context.read<BottomNavigationBarBloc>().add(
              CurrentIndexChanged(index),
            );
          },
          currentIndex: state,
          items:
              items.map((item) {
                ItemModel currentItem = ItemModel.fromJson(item);
                return SalomonBottomBarItem(
                  title: Text(
                    currentItem.title,
                    style: TextStyle(
                      fontSize: AppDimensions.sfs,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: SvgPicture.asset(
                    currentItem.icon,
                    height: AppDimensions.mis,
                    width: AppDimensions.mis,
                    color: specifyIconColor(
                        itemId: currentItem.id,
                        currentIndex: state,
                    ),
                  ),
                );
              }).toList(),
          selectedItemColor: AppColors.primaryColor,
          backgroundColor: AppColors.widgetBackgroundColor,
        );
      },
    );
  }
}
