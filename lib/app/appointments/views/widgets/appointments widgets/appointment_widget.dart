import 'package:clinic_app/app/appointment_details/views/screens/appointment_details_screen.dart';
import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/doctor_image_with_frame_widget.dart';
import 'package:clinic_app/core/widgets/doctor_name_widget.dart';
import 'package:clinic_app/core/widgets/filter_badge_widget.dart';
import 'package:clinic_app/core/widgets/info_with_icon_widget.dart';
import 'package:clinic_app/core/widgets/info_with_icon_and_frame_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({super.key, required this.appointment});

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    String specifyWithOrWithoutReport() {
      return appointment.withMedicalReport ? "With Report" : "Without Report";
    }

    String formatAppointmentDate() {
      return DateFormat('d MMMM, yyyy').format(appointment.dateTime);
    }

    String formatAppointmentTime() {
      return DateFormat('hh:mm a').format(appointment.dateTime);
    }

    String specifyRequestType() {
      return appointment.requestTypeId == 1 ? "Check-Up" : "Follow-Up";
    }

    Color specifyStatusColor() {
      return appointment.status == "Pending"
          ? AppColors.transparentGreen
          : AppColors.transparentYellow;
    }

    return InkWell(
      onTap: () {
        Get.to(() => AppointmentDetailsScreen(appointment: appointment));
      },
      borderRadius: BorderRadius.circular(AppDimensions.mbr),
      child: Container(
        height: 28.0.hp,
        padding: EdgeInsets.all(AppDimensions.mp),
        decoration: BoxDecoration(
          color: AppColors.widgetBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        //-----------|Appointment Status|---------------------------------------------------------------------------------------------------------------------------------------------
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: FilterBadgeWidget(
                              badge: appointment.status,
                              color: specifyStatusColor(),
                            ),
                          ),
                        ),
                        //----------------|Doctor Name|-----------------------------------------------------------------------------------------------------------------------------------------------
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: DoctorNameWidget(
                              name: appointment.doctorName,
                              size: AppDimensions.lfs,
                            ),
                          ),
                        ),
                        //-----------------|Department|-----------------------------------------------------------------------------------------------------------------------------------------------
                        Expanded(
                          child: InfoWithIconWidget(
                            icon: AppIcons.departmentOutlined,
                            info: appointment.department,
                            infoSize: AppDimensions.sfs,
                          ),
                        ),
                        //--------------|Appointment Date|--------------------------------------------------------------------------------------------------------------------------------------------
                        Expanded(
                          child: InfoWithIconWidget(
                            icon: AppIcons.calendar,
                            info: formatAppointmentDate(),
                            infoSize: AppDimensions.sfs,
                          ),
                        ),
                        //--------------|Appointment Time|--------------------------------------------------------------------------------------------------------------------------------------------
                        Expanded(
                          child: InfoWithIconWidget(
                            icon: AppIcons.time,
                            info: formatAppointmentTime(),
                            infoSize: AppDimensions.sfs,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: AppDimensions.mp),
                  //----------------------|Doctor Image|----------------------------------------------------------------------------------------------------------------------------------------------
                  Expanded(
                    flex: 2,
                    child: DoctorImageWithFrameWidget(
                      image: appointment.doctorImage,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.mp),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  //----------------------|Request Type|----------------------------------------------------------------------------------------------------------------------------------------------
                  InfoWithIconAndFrameWidget(
                    title: specifyWithOrWithoutReport(),
                    icon: AppIcons.medicalReport,
                  ),
                  SizedBox(width: AppDimensions.mp),
                  //--------------|With or Without Medical Report|------------------------------------------------------------------------------------------------------------------------------------
                  InfoWithIconAndFrameWidget(
                    title: specifyRequestType(),
                    icon: AppIcons.requestType,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
