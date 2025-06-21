import 'dart:developer';

import 'package:clinic_app/app/book_appointment/models/time_model.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/times_widget/views/items/drop_down_button_item.dart';
import 'package:clinic_app/core/widgets/times_widget/views/items/time_item.dart';
import 'package:flutter/material.dart';

class TimesGridViewItem extends StatelessWidget {
  const TimesGridViewItem({
    super.key,
    required this.times,
    required this.currentDoctorId,
    required this.currentTimeId,
    required this.previousTimeId,
    required this.currentDay,
    required this.previousDay,
    required this.dropDownButtonTitle,
    required this.itemCount,
    required this.shift,
    required this.isTimesWidgetActivated,
  });

  final List<TimeModel> times;
  final int currentDoctorId;
  final int currentTimeId;
  final int previousTimeId;
  final String currentDay;
  final String previousDay;
  final String dropDownButtonTitle;
  final int itemCount;
  final String shift;
  final bool isTimesWidgetActivated;

  @override
  Widget build(BuildContext context) {
    log("$shift Rebuild");
    return GridView.builder(
      padding: EdgeInsets.all(AppDimensions.mp),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: AppDimensions.sm,
        mainAxisSpacing: AppDimensions.sm,
        mainAxisExtent: 6.0.hp,
      ),
      itemBuilder: (context, index) {
        switch (index == itemCount) {
          case true:
            return DropDownButtonItem(title: dropDownButtonTitle, shift: shift);
          case false:
            return TimeItem(
              time: times[index],
              currentDoctorId: currentDoctorId,
              currentTimeId: currentTimeId,
              previousTimeId: previousTimeId,
              currentDay: currentDay,
              previousDay: previousDay,
              isTimesWidgetActivated: isTimesWidgetActivated,
            );
        }
      },
      itemCount: itemCount + 1,
    );
  }
}
