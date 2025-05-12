import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/widgets.dart';

class DoctorImageWidget extends StatelessWidget {
  const DoctorImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(top: 2.0.wp, left: 2.0.wp, right: 2.0.wp),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(15.0.sp),
        ),
        clipBehavior: Clip.hardEdge,
        child: Image(
          image: NetworkImage(
            "https://pngimg.com/uploads/doctor/small/doctor_PNG16006.png",
          ),
        ),
      ),
    );
  }
}
