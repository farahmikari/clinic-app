import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/book_appointment_with_doctor_auth_decision_widget.dart';
import 'package:clinic_app/app/doctor/models/doctor_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:clinic_app/core/widgets/doctor_name_widget.dart';
import 'package:clinic_app/core/widgets/doctor_specialty_widget.dart';
import 'package:clinic_app/core/widgets/horizontal_info_with_title_widget.dart';
import 'package:clinic_app/core/widgets/info_list_widget.dart';
import 'package:clinic_app/core/widgets/info_with_icon_widget.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    String formatTime(String time) {
      return DateFormat(
        "h:mm a",
      ).format(DateFormat("HH:mm:ss", "en").parse(time));
    }

    String formatShift() {
      return "${formatTime(doctor.startTime)} - ${formatTime(doctor.endTime)}";
    }

    String specifyExperienceUnit() {
      return doctor.experience > 1 ? S.current.years_unit : S.current.year_unit;
    }

    String specifyTreatmentsUnit() {
      return doctor.treatments > 1
          ? S.current.treatments_unit
          : S.current.treatment_unit;
    }

    return SafeArea(
      child: ListView(
        padding: EdgeInsets.all(AppDimensions.mp),
        children: [
          Container(
            height: 30.0.hp,
            padding: EdgeInsets.only(
              top: AppDimensions.sp,
              left: AppDimensions.sp,
              right: AppDimensions.sp,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentBackgroundColor,
              borderRadius: BorderRadius.circular(AppDimensions.mbr),
              boxShadow: AppShadow.boxShadow,
            ),
            child: CachedNetworkImage(
              imageUrl: doctor.image,
              placeholder: (context, url) => LoadingWidget(),
              errorWidget: (context, url, error) => LoadingWidget(),
            ),
          ),
          SizedBox(height: AppDimensions.mp),
          Center(
            child: DoctorNameWidget(name: doctor.name, size: AppDimensions.lfs),
          ),
          SizedBox(height: AppDimensions.sp),
          Center(child: DoctorSpecialtyWidget(specialty: doctor.specialty)),
          SizedBox(height: AppDimensions.mp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InfoWithIconWidget(
                icon: AppIcons.time,
                info: formatShift(),
                infoSize: AppDimensions.sfs,
              ),
              InfoWithIconWidget(
                icon: AppIcons.rate,
                info: doctor.rate.toString(),
                infoSize: AppDimensions.sfs,
              ),
            ],
          ),
          SizedBox(height: AppDimensions.mp),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HorizontalInfoWithTitleWidget(
                title: S.current.experiences_title,
                info: "${doctor.experience} ${specifyExperienceUnit()}",
              ),
              HorizontalInfoWithTitleWidget(
                title: S.current.treatments_title,
                info: "${doctor.treatments} ${specifyTreatmentsUnit()}",
              ),
            ],
          ),
          SizedBox(height: AppDimensions.mp),
          SubtitleWidget(subtitle: S.current.about_doctor),
          SizedBox(height: AppDimensions.mp),
          Container(
            padding: EdgeInsets.all(AppDimensions.mp),
            decoration: BoxDecoration(
              color: Theme.of(context).accentBackgroundColor,
              borderRadius: BorderRadius.circular(AppDimensions.mbr),
              boxShadow: AppShadow.boxShadow,
            ),
            child: Text(
              doctor.bio,
              style: TextStyle(
                color: Theme.of(context).accentTextColor,
                fontSize: AppDimensions.sfs,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: AppDimensions.mp),
          SubtitleWidget(subtitle: S.current.qualifications),
          SizedBox(height: AppDimensions.mp),
          InfoListWidget(
            icon: AppIcons.qualification,
            info: doctor.qualifications,
          ),
          SizedBox(height: AppDimensions.mp),
          ButtonWidget(
            title: S.current.book_now,
            backgroundColor: Theme.of(context).primaryColor,
            titleColor: Theme.of(context).foregroundColor,
            onTap: () {
              Get.to(
                () => BookAppointmentWithDoctorScreenAuthDecisionWidget(
                  doctor: doctor,
                ),
                transition: Transition.zoom,
              );
            },
          ),
        ],
      ),
    );
  }
}
