import 'package:clinic_app/app/appointment%20details/views/widgets/advices%20widgets/advice_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';

class AdvicesWidget extends StatelessWidget {
  const AdvicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppDimensions.mm),
      padding: EdgeInsets.all(AppDimensions.mp),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return AdviceWidget(
            title:
                "Eat a Balanced Diet Include fruits, vegetables, whole grains, and lean proteins. Limit sugar, salt, and processed foods.",
          );
        },
        itemCount: 5,
      ),
    );
  }
}
