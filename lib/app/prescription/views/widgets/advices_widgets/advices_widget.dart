import 'package:clinic_app/app/prescription/models/advice_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdvicesWidget extends StatelessWidget {
  const AdvicesWidget({super.key, required this.advices});
  final List<AdviceModel> advices;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.mp),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.advice,
                width: AppDimensions.sis,
                height: AppDimensions.sis,
                color: AppColors.primaryColor,
              ),
              SizedBox(width: AppDimensions.mp),
              Expanded(
                child: Text(
                  advices[index].advice,
                  style: TextStyle(
                    color: AppColors.darkGreyColor,
                    fontSize: AppDimensions.sfs,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppDimensions.mp);
        },
        itemCount: advices.length,
      ),
    );
  }
}
