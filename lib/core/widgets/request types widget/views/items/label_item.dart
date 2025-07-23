import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/request%20types%20widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LabelItem extends StatelessWidget {
  const LabelItem({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<RequestTypesBloc>().add(IsDroppedDownToggled());
      },
      child: Container(
        height: 8.0.hp,
        alignment: Alignment.center,
        margin: EdgeInsets.all(AppDimensions.mm),
        decoration: BoxDecoration(
          color: AppColors.widgetBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
        ),
        clipBehavior: Clip.hardEdge,
        child: ListTile(
          leading: SvgPicture.asset(
            AppIcons.medicalReport,
            width: AppDimensions.mis,
            height: AppDimensions.mis,
            color: AppColors.primaryColor,
          ),
          title: Text(
            label,
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Icons.arrow_drop_down_rounded,
            color: AppColors.primaryColor,
            size: AppDimensions.mis,
          ),
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
      ),
    );
  }
}
