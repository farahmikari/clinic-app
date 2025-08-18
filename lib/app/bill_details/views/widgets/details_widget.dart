import 'package:clinic_app/app/bill_details/models/bill_info_model.dart';
import 'package:clinic_app/app/bill_details/views/widgets/detail_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.billDetails});

  final List<BillInfoModel> billDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(AppDimensions.mp),
        itemBuilder: (context, index) {
          return DetailWidget(
            title: billDetails[index].title,
            detail: billDetails[index].info,
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: AppDimensions.xlp);
        },
        itemCount: billDetails.length,
      ),
    );
  }
}
