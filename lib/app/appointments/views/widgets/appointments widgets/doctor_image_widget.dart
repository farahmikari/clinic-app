import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/widgets.dart';

class DoctorImageWidget extends StatelessWidget {
  const DoctorImageWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(
          top: AppDimensions.sp,
          left: AppDimensions.sp,
          right: AppDimensions.sp,
        ),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
        ),
        clipBehavior: Clip.hardEdge,
        child: Image(image: NetworkImage(image)),
      ),
    );
  }
}
