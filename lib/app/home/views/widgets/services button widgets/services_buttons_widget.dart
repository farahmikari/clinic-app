import 'package:clinic_app/app/book_appointment/views/widgets/book_appointment_auth_decision_widget.dart';
import 'package:clinic_app/app/home/views/widgets/services%20button%20widgets/service_button_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesButtonsWidget extends StatelessWidget {
  const ServicesButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimensions.sm,
        mainAxisSpacing: AppDimensions.sm,
        mainAxisExtent: 45.0.wp,
      ),
      children: [
        ServiceButtonWidget(
          icon: AppIcons.calendar,
          title: "Book Now",
          subtitle: "Find The Best Doctors In Syria",
          backgroundColor: AppColors.primaryColor,
          iconColor: AppColors.widgetBackgroundColor,
          titleColor: AppColors.widgetBackgroundColor,
          subTitleColor: AppColors.widgetBackgroundColor,
          onPressed: () {
            Get.to(
              () => BookAppointmentAuthDecisionWidget(),
              transition: Transition.zoom,
            );
          },
        ),
        ServiceButtonWidget(
          icon: AppIcons.prescriptions,
          title: "Prescriptions",
          subtitle: "Your Medications, Treatment & drugs",
          backgroundColor: AppColors.widgetBackgroundColor,
          iconColor: AppColors.primaryColor,
          titleColor: AppColors.mainTextColor,
          subTitleColor: AppColors.hintTextColor,
          onPressed: () {},
        ),
        ServiceButtonWidget(
          icon: AppIcons.microscope,
          title: "Lab Tests",
          subtitle: "Lab Reports Radiology Microbiology",
          backgroundColor: AppColors.widgetBackgroundColor,
          iconColor: AppColors.primaryColor,
          titleColor: AppColors.mainTextColor,
          subTitleColor: AppColors.hintTextColor,
          onPressed: () {},
        ),
        ServiceButtonWidget(
          icon: AppIcons.marketplace,
          title: "Marketplace",
          subtitle: "Medicine\nCosmetics & More",
          backgroundColor: AppColors.widgetBackgroundColor,
          iconColor: AppColors.primaryColor,
          titleColor: AppColors.mainTextColor,
          subTitleColor: AppColors.hintTextColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
