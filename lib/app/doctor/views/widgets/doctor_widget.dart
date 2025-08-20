import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic_app/app/book_appointment_with_doctor/views/widgets/book_appointment_with_doctor_auth_decision_widget.dart';
import 'package:clinic_app/app/doctor/models/doctor_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:clinic_app/core/widgets/doctor_name_widget.dart';
import 'package:clinic_app/core/widgets/doctor_specialty_widget.dart';
import 'package:clinic_app/core/widgets/horizontal_info_with_title_widget.dart';
import 'package:clinic_app/core/widgets/info_list_widget.dart';
import 'package:clinic_app/core/widgets/info_with_icon_widget.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({super.key, required this.doctor});

  final DoctorModel doctor;

  String formatTime(String time) {
    return DateFormat("h:mm a").format(DateFormat("HH:mm:ss").parse(time));
  }

  String formatShift() {
    return "${formatTime(doctor.startTime)} - ${formatTime(doctor.endTime)}";
  }

  @override
  Widget build(BuildContext context) {
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
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(AppDimensions.mbr),
              boxShadow: AppShadow.boxShadow,
            ),
            child: CachedNetworkImage(
              imageUrl: doctor.image,
              placeholder: (context, url) => LoadingWidget(),
              errorWidget: (context, url, error) => Icon(Icons.error),
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
                title: "Experience",
                info: "${doctor.experience} Years",
              ),
              HorizontalInfoWithTitleWidget(
                title: "Treatments",
                info: "${doctor.treatments} Patients",
              ),
            ],
          ),
          SizedBox(height: AppDimensions.mp),
          SubtitleWidget(subtitle: "About"),
          SizedBox(height: AppDimensions.mp),
          Container(
            padding: EdgeInsets.all(AppDimensions.mp),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(AppDimensions.mbr),
              boxShadow: AppShadow.boxShadow,
            ),
            child: Text(
              doctor.bio,
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: AppDimensions.sfs,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: AppDimensions.mp),
          SubtitleWidget(subtitle: "Qualifications"),
          SizedBox(height: AppDimensions.mp),
          InfoListWidget(
            icon: AppIcons.qualification,
            info: doctor.qualifications,
          ),
          SizedBox(height: AppDimensions.mp),
          ButtonWidget(
            title: "Book Now",
            backgroundColor: AppColors.primaryColor,
            titleColor: AppColors.widgetBackgroundColor,
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
