import 'package:clinic_app/app/book_appointment/models/time_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/widgets/times_widget/controllers/times_bloc/times_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TimeItem extends StatelessWidget {
  const TimeItem({
    super.key,
    required this.time,
    required this.currentDoctorId,
    required this.currentTimeId,
    required this.previousTimeId,
    required this.currentDay,
    required this.previousDay,
    required this.isTimesWidgetActivated,
  });

  final TimeModel time;
  final int currentDoctorId;
  final int currentTimeId;
  final int previousTimeId;
  final String currentDay;
  final String previousDay;
  final bool isTimesWidgetActivated;

  @override
  Widget build(BuildContext context) {
    Color specifyBackgroundColor() {
      if (time.id == previousTimeId && currentDay == previousDay) {
        return AppColors.transparentYellow;
      } else if (time.id == currentTimeId) {
        return AppColors.primaryColor;
      } else {
        return Theme.of(context).cardColor;
      }
    }

    Color specifyTitleColor() {
      if (time.id == previousTimeId && currentDay == previousDay ||
          time.id == currentTimeId) {
        return AppColors.widgetBackgroundColor;
      } else if (time.isAvailable && isTimesWidgetActivated) {
        return Theme.of(context).textTheme.titleLarge!.color!;
      } else {
        return Theme.of(context).hintColor;
      }
    }

    String formatDateToTime(String time) {
      return DateFormat("h:mma").format(DateFormat("HH:mm:ss").parse(time));
    }

    return InkWell(
      onTap: () {
        if ((time.id == previousTimeId && currentDay == previousDay) ||
            (time.isAvailable && isTimesWidgetActivated)) {
          context.read<TimesBloc>().add(
            CurrentTimeAndDoctorIdsAreChanged(
              currentDoctorId: currentDoctorId,
              currentTimeId: time.id,
            ),
          );
        }
      },
      borderRadius: BorderRadius.circular(AppDimensions.mbr),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: specifyBackgroundColor(),
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Text(
          formatDateToTime(time.time),
          style: TextStyle(
            color: specifyTitleColor(),
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
