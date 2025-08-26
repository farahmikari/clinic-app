import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/times_widget/controllers/times_bloc/times_bloc.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
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
          color: Theme.of(context).accentBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
