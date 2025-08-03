import 'package:clinic_app/app/book_appointment/models/day_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/days_widget/views/items/day_item.dart';
import 'package:flutter/material.dart';

class DaysGridViewItem extends StatelessWidget {
  const DaysGridViewItem({
    super.key,
    required this.days,
    required this.currentDay,
    required this.previousDay,
    required this.isDaysWidgetActivated,
  });

  final List<DayModel> days;
  final String currentDay;
  final String previousDay;
  final bool isDaysWidgetActivated;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: AppDimensions.sm,
        mainAxisSpacing: AppDimensions.sm,
        mainAxisExtent: 20.0.wp,
      ),
      itemBuilder: (context, index) {
        return DayItem(
          day: days[index],
          currentDay: currentDay,
          previousDay: previousDay,
          isDaysWidgetActivated: isDaysWidgetActivated,
        );
      },
      itemCount: days.length,
    );
  }
}
