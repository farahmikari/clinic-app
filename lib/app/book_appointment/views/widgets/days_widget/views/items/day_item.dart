import 'package:clinic_app/app/book_appointment/models/day_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/days_widget/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
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
    Color specifyprimaryBackgroundColor() {
      if (day.day == previousDay) {
        return Theme.of(context).transparentAccentColor;
      } else if (day.day == currentDay) {
        return Theme.of(context).primaryColor;
      } else {
        return Theme.of(context).accentBackgroundColor;
      }
    }

    Color specifyTitleColor() {
      if (day.day == previousDay || day.day == currentDay) {
        return Theme.of(context).foregroundColor;
      } else if (day.isAvailable && isDaysWidgetActivated) {
        return Theme.of(context).primaryTextColor;
      } else {
        return Theme.of(context).hintTextColor;
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
          color: specifyprimaryBackgroundColor(),
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
