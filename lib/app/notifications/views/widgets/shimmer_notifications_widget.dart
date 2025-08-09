import 'package:clinic_app/app/notifications/views/widgets/shimmer_notification_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNotificationsWidget extends StatelessWidget {
  const ShimmerNotificationsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: ListView.separated(
        padding: EdgeInsets.all(AppDimensions.mp),
        itemBuilder: (context, index) {
          return ShimmerNotificationWidget();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppDimensions.sp);
        },
        itemCount: 10,
      ),
    );
  }
}
