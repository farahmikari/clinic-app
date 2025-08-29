import 'package:clinic_app/app/prescription/views/widgets/main_info_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:flutter/material.dart';

class SurgeryWidget extends StatelessWidget {
  const SurgeryWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.0.wp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).accentBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: MainInfoWidget(title: title, icon: AppIcons.surgeries),
    );
  }
}
