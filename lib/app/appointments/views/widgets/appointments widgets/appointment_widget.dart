import 'package:clinic_app/app/appointment%20details/views/screens/appointment_details_screen.dart';

import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/app/appointments/views/widgets/appointments%20widgets/doctor_image_widget.dart'
    show DoctorImageWidget;
import 'package:clinic_app/app/appointments/views/widgets/appointments%20widgets/doctor_name_widget.dart';
import 'package:clinic_app/app/appointments/views/widgets/appointments%20widgets/main_reservation_info_widget.dart';
import 'package:clinic_app/app/appointments/views/widgets/appointments%20widgets/status_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/secondary_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({super.key, required this.appointment});

  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    String specifyWithOrWithoutReport({required bool withMedicalReport}) {
      return withMedicalReport ? "With Report" : "Without Report";
    }

    String formatAppointmentDate({required DateTime appointmentDate}) {
      return DateFormat('d MMMM, yyyy').format(appointment.date);
    }

    return InkWell(
      onTap: () {
        Get.to(() => AppointmentDetailsScreen());
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
                        StatusWidget(status: appointment.status),
                        //----------------|Doctor Name|-----------------------------------------------------------------------------------------------------------------------------------------------
                        DoctorNameWidget(name: appointment.doctorName),
                        //-----------------|Department|-----------------------------------------------------------------------------------------------------------------------------------------------
                        MainReservationInfoWidget(
                          icon: AppIcons.department,
                          title: appointment.department,
                        ),
                        //--------------|Appointment Date|--------------------------------------------------------------------------------------------------------------------------------------------
                        MainReservationInfoWidget(
                          icon: AppIcons.calendar,
                          title: formatAppointmentDate(
                            appointmentDate: appointment.date,
                          ),
                        ),
                        //--------------|Appointment Time|--------------------------------------------------------------------------------------------------------------------------------------------
                        MainReservationInfoWidget(
                          icon: AppIcons.time,
                          title: appointment.time,
                        ),
                      ],
                    ),
                  ),
                  //----------------------|Doctor Image|----------------------------------------------------------------------------------------------------------------------------------------------
                  DoctorImageWidget(image: appointment.doctorImage),
                ],
              ),
            ),
            SizedBox(height: AppDimensions.mm),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  //----------------------|Request Type|----------------------------------------------------------------------------------------------------------------------------------------------
                  SecondaryInfoWidget(
                    title: specifyWithOrWithoutReport(
                      withMedicalReport: appointment.withMedicalReport,
                    ),
                    icon: AppIcons.medicalReport,
                  ),
                  SizedBox(width: AppDimensions.mm),
                  //--------------|With or Without Medical Report|------------------------------------------------------------------------------------------------------------------------------------
                  SecondaryInfoWidget(
                    title: appointment.requestType,
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
