import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.icon, required this.onPressed});
  final IconData icon;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0.wp,
      width: 10.0.wp,
      margin: EdgeInsets.only(right: 4.0.wp),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(8.0.sp),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.hintTextColor, size: 20.0.sp),
      ),
    );
  }
}
