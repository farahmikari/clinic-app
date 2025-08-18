import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/request_types_widget/controllers/request%20types%20bloc/request_types_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class LabelItem extends StatelessWidget {
  const LabelItem({
    super.key,
    required this.label,
    required this.isRequestTypesWidgetActived,
  });

  final String label;
  final bool isRequestTypesWidgetActived;

  @override
  Widget build(BuildContext context) {
    Color specifyLabelColor() {
      return isRequestTypesWidgetActived
          ? AppColors.mainTextColor
          : AppColors.hintTextColor;
    }

    return GestureDetector(
      onTap: () {
        context.read<RequestTypesBloc>().add(IsDroppedDownToggled());
      },
      child: Container(
        height: 16.0.wp,
        width: 92.0.wp,
        padding: EdgeInsets.all(AppDimensions.mp),
        decoration: BoxDecoration(
          color: AppColors.widgetBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: AppDimensions.sp,
          children: [
            SvgPicture.asset(
              AppIcons.requestType,
              height: AppDimensions.lis,
              width: AppDimensions.lis,
              color: AppColors.primaryColor,
            ),
            Text(
              label,
              style: TextStyle(
                color: specifyLabelColor(),
                fontSize: AppDimensions.mfs,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: SvgPicture.asset(
                  AppIcons.arrowDown,
                  height: AppDimensions.sis,
                  width: AppDimensions.sis,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
