import 'package:clinic_app/app/book_appointment/views/widgets/book_appointment_auth_decision_widget.dart';
import 'package:clinic_app/app/home/views/widgets/services%20button%20widgets/service_button_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/generated/l10n.dart';
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
          title: S.current.book_now,
          subtitle: S.current.book_now_subtitle,
          backgroundColor: AppColors.primaryColor,
          iconColor: AppColors.accentBackgroundColor,
          titleColor: AppColors.accentBackgroundColor,
          subTitleColor: AppColors.accentBackgroundColor,
          onPressed: () {
            Get.to(
              () => BookAppointmentAuthDecisionWidget(),
              transition: Transition.zoom,
            );
          },
        ),
        ServiceButtonWidget(
          icon: AppIcons.prescriptions,
          title: S.current.prescriptions,
          subtitle: S.current.prescriptions_subtitle,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
          iconColor: AppColors.primaryColor,
          titleColor: Theme.of(context).textTheme.titleLarge!.color!,
          subTitleColor: Theme.of(context).hintColor,
          onPressed: () {},
        ),
        ServiceButtonWidget(
          icon: AppIcons.microscope,
          title: S.current.lab_tests,
          subtitle: S.current.lab_tests_subtitle,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
          iconColor: AppColors.primaryColor,
          titleColor: Theme.of(context).textTheme.titleLarge!.color!,
          subTitleColor: Theme.of(context).hintColor,
          onPressed: () {},
        ),
        ServiceButtonWidget(
          icon: AppIcons.marketplace,
          title: S.current.medical_reports,
          subtitle: S.current.medical_reports_subtitle,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor!,
          iconColor: AppColors.primaryColor,
          titleColor: Theme.of(context).textTheme.titleLarge!.color!,
          subTitleColor: Theme.of(context).hintColor,
          onPressed: () {},
        ),
      ],
    );
  }
}
