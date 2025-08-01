import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/widgets.dart';

class DoctorImageWithFrameWidget extends StatelessWidget {
  const DoctorImageWithFrameWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(
        top: AppDimensions.sp,
        left: AppDimensions.sp,
        right: AppDimensions.sp,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.sbr),
      ),
      clipBehavior: Clip.hardEdge,
      child: Image(image: NetworkImage(image)),
    );
  }
}
