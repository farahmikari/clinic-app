import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> boxShadow = [
      const BoxShadow(
        color: Color(0x1A000000),
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ];
    return Container(
      height: 12.0.hp,
      margin: EdgeInsets.all(4.0.wp),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.darkBlueColor, AppColors.lightBlueColor],
        ),
        borderRadius: BorderRadius.circular(15.0.sp),
        boxShadow: boxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0.sp),
        child: Stack(
          children: [
            Positioned(
              right: -35,
              bottom: -35,
              child: SizedBox(
                height: 30.0.wp,
                width: 30.0.wp,
                child: Image.asset("assets/images/health_care.png"),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: Text(
                  "Discover Your Wellbeing",
                  style: TextStyle(
                    color: AppColors.widgetBackgroundColor,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Your path to better health starts here !",
                  style: TextStyle(
                    color: AppColors.widgetBackgroundColor,
                    fontSize: 10.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
