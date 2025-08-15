import 'package:clinic_app/app/bill_details/models/bill_info_model.dart';
import 'package:clinic_app/app/bill_details/views/widgets/detail_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.billInfo});

  final List<BillInfoModel> billInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(AppDimensions.mp),
        itemBuilder: (context, index) {
          return DetailWidget(
            title: billInfo[index].title,
            detail: billInfo[index].info,
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: AppDimensions.xlp);
        },
        itemCount: billInfo.length,
      ),
    );
  }
}
