import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/widgets.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.0.wp, vertical: 1.0.wp),
          decoration: BoxDecoration(
            color: const Color.fromARGB(133, 23, 184, 165),
            borderRadius: BorderRadius.circular(15.0.sp),
          ),
          child: Text(
            "Approved",
            style: TextStyle(
              color: AppColors.widgetBackgroundColor,
              fontSize: 10.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
