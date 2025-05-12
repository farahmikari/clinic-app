import 'package:clinic_app/app/book%20feature/models/day_model.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DefaultDaysWidgets extends StatelessWidget {
  final List<DayModel> days;
  const DefaultDaysWidgets({super.key, required this.days});

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> boxShadow = [
      const BoxShadow(
        color: Color(0x1A000000),
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ];
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
            borderRadius: BorderRadius.circular(15.0.sp),
            boxShadow: boxShadow,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dayNumber,
                style: TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                dayName,
                style: TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: 12.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 2.0.wp);
      },
      itemCount: days.length,
    );
  }
}
