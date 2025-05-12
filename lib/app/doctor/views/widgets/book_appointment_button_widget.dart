import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class BookAppointmentButtonWidget extends StatelessWidget {
  const BookAppointmentButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(1000),
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(1000),
        ),
        child: Text(
          "Book Appointment",
          style: TextStyle(
            color: AppColors.widgetBackgroundColor,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
