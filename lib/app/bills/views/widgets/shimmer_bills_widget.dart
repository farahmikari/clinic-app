import 'package:clinic_app/app/bills/views/widgets/shimmer_bill_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBillsWidget extends StatelessWidget {
  const ShimmerBillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).shadowColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListView.separated(
        padding: EdgeInsets.all(AppDimensions.mp),
        itemBuilder: (context, index) {
          return ShimmerBillWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppDimensions.sp);
        },
        itemCount: 10,
      ),
    );
  }
}
