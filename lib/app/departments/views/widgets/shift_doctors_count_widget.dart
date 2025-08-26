import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';

class ShiftDoctorsCountWidget extends StatelessWidget {
  const ShiftDoctorsCountWidget({
    super.key,
    required this.color,
    required this.shift,
    required this.count,
  });
  final Color color;
  final String shift;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: AppDimensions.sp,
      children: [
        Container(
          height: 5.0.wp,
          width: 5.0.wp,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        Text(
          count.toString(),
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          shift,
          style: TextStyle(
            color: Theme.of(context).accentTextColor,
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
