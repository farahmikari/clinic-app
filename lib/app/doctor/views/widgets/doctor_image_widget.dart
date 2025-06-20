import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/widgets.dart';

class DoctorImageWidget extends StatelessWidget {
  const DoctorImageWidget({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.only(top: AppDimensions.mp),
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimensions.lbr),
            bottomRight: Radius.circular(AppDimensions.lbr),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Image(image: NetworkImage(image)),
      ),
    );
  }
}
