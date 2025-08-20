import 'package:clinic_app/app/book_appointment/models/day_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/widgets/days_widget/controllers/days_bloc/days_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DayItem extends StatelessWidget {
  const DayItem({
    super.key,
    required this.day,
    required this.currentDay,
    required this.previousDay,
    required this.isDaysWidgetActivated,
  });

  final DayModel day;
  final String currentDay;
  final String previousDay;
  final bool isDaysWidgetActivated;

  @override
  Widget build(BuildContext context) {
    Color specifyBackgroundColor() {
      if (day.day == previousDay) {
        return AppColors.transparentYellow;
      } else if (day.day == currentDay) {
        return AppColors.primaryColor;
      } else {
        return Theme.of(context).cardColor;
      }
    }

    Color specifyTitleColor() {
      if (day.day == previousDay || day.day == currentDay) {
        return AppColors.widgetBackgroundColor;
      } else if (day.isAvailable && isDaysWidgetActivated) {
        return Theme.of(context).textTheme.titleLarge!.color!;
      } else {
        return Theme.of(context).hintColor;
      }
    }

    String formatDateToDayName() {
      return DateFormat('EEE').format(DateTime.parse(day.day));
    }

    String formatDateToDayNumber() {
      return DateFormat('d').format(DateTime.parse(day.day));
    }

    return InkWell(
      onTap: () {
        if (isDaysWidgetActivated && day.isAvailable ||
            day.day == previousDay) {
          context.read<DaysBloc>().add(
            CurrentDayIdIsChanged(currentDay: day.day),
          );
        }
      },
      borderRadius: BorderRadius.circular(AppDimensions.mbr),
      child: Container(
        decoration: BoxDecoration(
          color: specifyBackgroundColor(),
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatDateToDayNumber(),
              style: TextStyle(
                color: specifyTitleColor(),
                fontSize: AppDimensions.lfs,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              formatDateToDayName(),
              style: TextStyle(
                color: specifyTitleColor(),
                fontSize: AppDimensions.mfs,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
