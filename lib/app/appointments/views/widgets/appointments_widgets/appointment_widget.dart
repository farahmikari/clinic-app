import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/app/manage_booking/views/screens/manage_booking_screen.dart';
import 'package:clinic_app/app/prescription/views/screens/prescription_screen.dart';
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

    return GestureDetector(
      onTap: () {
        if (appointment.status == "Completed") {
          Get.to(
            () => PrescriptionScreen(appointment: appointment),
            transition: Transition.zoom,
          );
        } else {
          Get.to(
            () => ManageBookingScreen(appointment: appointment),
            transition: Transition.zoom,
          );
        }
      },
      child: Container(
        height: 54.0.wp,
        width: 92.0.wp,
        padding: EdgeInsets.all(AppDimensions.mp),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppDimensions.mp,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppDimensions.mp,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //-----------|Appointment Status|---------------------------------------------------------------------------------------------------------------------------------------------
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: BadgeWidget(
                              title: appointment.status,
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
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppDimensions.mp,
                children: [
                  //----------------------|Request Type|----------------------------------------------------------------------------------------------------------------------------------------------
                  InfoWithIconAndFrameWidget(
                    title: specifyWithOrWithoutReport(),
                    icon: AppIcons.medicalReport,
                  ),
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
