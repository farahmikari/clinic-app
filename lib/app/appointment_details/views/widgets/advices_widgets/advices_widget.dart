import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/advice_model.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/advices_widgets/advice_widget.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_shadow.dart';
import 'package:flutter/material.dart';

class AdvicesWidget extends StatelessWidget {
  const AdvicesWidget({super.key, required this.advices});
  final List<AdviceModel> advices;

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
          return AdviceWidget(title: advices[index].advice);
        },
        itemCount: advices.length,
      ),
    );
  }
}
