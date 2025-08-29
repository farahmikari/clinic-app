import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic_app/app/doctor/views/screens/doctor_profile_screen.dart';
import 'package:clinic_app/app/home/models/most_rated_doctor_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/core/widgets/doctor_name_widget.dart';
import 'package:clinic_app/core/widgets/info_with_icon_widget.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MostRatedDoctorWidget extends StatelessWidget {
  const MostRatedDoctorWidget({super.key, required this.mostRatedDoctor});

  final MostRatedDoctorModel mostRatedDoctor;

  @override
  Widget build(BuildContext context) {
    // String specifyTreatmentsUnit() {
    //   if (Get.locale!.languageCode == 'ar') {
    //     if (mostRatedDoctor.treatments > 2 && mostRatedDoctor.treatments < 11) {
    //       return S.current.treatments_unit;
    //     } else {
    //       return S.current.treatment_unit;
    //     }
    //   } else {
    //     if (mostRatedDoctor.treatments > 1) {
    //       return S.current.treatments_title;
    //     } else {
    //       return S.current.treatment_unit;
    //     }
    //   }
    // }

    return GestureDetector(
      onTap: () {
        Get.to(
          () => DoctorProfileScreen(id: mostRatedDoctor.id),
          transition: Transition.zoom,
        );
      },
      child: SizedBox(
        height: 62.0.wp,
        width: 45.0.wp,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppDimensions.sp,
          children: [
            Container(
              height: 45.0.wp,
              width: 45.0.wp,
              padding: EdgeInsets.only(top: AppDimensions.mp),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Theme.of(context).accentBackgroundColor,
                borderRadius: BorderRadius.circular(AppDimensions.mbr),
                boxShadow: AppShadow.boxShadow,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CachedNetworkImage(
                      imageUrl: mostRatedDoctor.image,
                      placeholder: (context, url) => LoadingWidget(),
                      errorWidget: (context, url, error) => LoadingWidget(),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.mp,
                        vertical: AppDimensions.sp,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadiusDirectional.only(
                          topEnd: Radius.circular(AppDimensions.mbr),
                        ),
                      ),
                      child: Text(
                        mostRatedDoctor.specialty,
                        style: TextStyle(
                          color: Theme.of(context).foregroundColor,
                          fontSize: AppDimensions.sfs,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DoctorNameWidget(
              name: mostRatedDoctor.name,
              size: AppDimensions.mfs,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InfoWithIconWidget(
                  icon: AppIcons.rate,
                  info: mostRatedDoctor.rate.toString(),
                  infoSize: AppDimensions.mfs,
                ),
                Text(
                  S.current.treatments_count(mostRatedDoctor.treatments),
                  // "(${mostRatedDoctor.treatments} ${specifyTreatmentsUnit()})",
                  style: TextStyle(
                    color: Theme.of(context).hintTextColor,
                    fontSize: AppDimensions.sfs,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
