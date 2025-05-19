import 'package:clinic_app/app/book%20appointment/models/day_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DefaultDaysWidgets extends StatelessWidget {
  const DefaultDaysWidgets({super.key, required this.days});

  final List<DayModel> days;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var dayName = DateFormat('EEE').format(days[index].date);
        var dayNumber = DateFormat('d').format(days[index].date);
        return Container(
          width: 16.5.wp,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.widgetBackgroundColor,
            borderRadius: BorderRadius.circular(AppDimensions.mbr),
            boxShadow: AppShadow.boxShadow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dayNumber,
                style: TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: AppDimensions.lfs,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                dayName,
                style: TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: AppDimensions.mfs,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: AppDimensions.sm);
      },
      itemCount: days.length,
    );
  }
}
