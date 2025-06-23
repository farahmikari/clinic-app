import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class BookAppointmentButtonWidget extends StatelessWidget {
  const BookAppointmentButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.all(AppDimensions.mp),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.lbr),
          onTap: () {},
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(AppDimensions.lbr),
            ),
            child: Text(
              "Book Appointment",
              style: TextStyle(
                color: AppColors.widgetBackgroundColor,
                fontSize: AppDimensions.lfs,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
