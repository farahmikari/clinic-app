import 'package:clinic_app/app/book_appointment/views/widgets/book_appointment_auth_decision_widget.dart';
import 'package:clinic_app/app/home/views/widgets/services%20button%20widgets/service_button_widget.dart';
import 'package:clinic_app/app/offers/views/screens/offers_screen.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
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
          backgroundColor: Theme.of(context).primaryColor,
          iconColor: Theme.of(context).foregroundColor,
          titleColor: Theme.of(context).foregroundColor,
          subTitleColor: Theme.of(context).foregroundColor,
          onPressed: () {
            Get.to(
              () => BookAppointmentAuthDecisionWidget(),
              transition: Transition.zoom,
            );
          },
        ),
        ServiceButtonWidget(
          icon: AppIcons.offers,
          title: S.current.offers,
          subtitle: S.current.offers_subtitle,
          backgroundColor: Theme.of(context).accentBackgroundColor,
          iconColor: Theme.of(context).primaryColor,
          titleColor: Theme.of(context).primaryTextColor,
          subTitleColor: Theme.of(context).accentTextColor,
          onPressed: () {
            Get.to(() => OffersScreen(), transition: Transition.zoom);
          },
        ),
      ],
    );
  }
}
