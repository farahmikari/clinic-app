import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/errors/constants/app_shadow.dart';
import 'package:clinic_app/core/widgets/times_widget/controllers/times%20bloc/times_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownButtonItem extends StatelessWidget {
  const DropDownButtonItem({
    super.key,
    required this.title,
    required this.shift,
  });

  final String title;
  final String shift;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (shift == "Morning") {
          context.read<TimesBloc>().add(AreMorningTimesDroppedDownIsToggled());
        } else {
          context.read<TimesBloc>().add(
            AreAfternoonTimesDroppedDownIsToggled(),
          );
        }
      },
      borderRadius: BorderRadius.circular(AppDimensions.mbr),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.widgetBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
