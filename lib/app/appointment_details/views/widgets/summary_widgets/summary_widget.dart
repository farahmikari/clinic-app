import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/doctor_department_widget.dart';
import 'package:clinic_app/core/widgets/doctor_image_with_frame_widget.dart';
import 'package:clinic_app/core/widgets/doctor_name_widget.dart';
import 'package:clinic_app/core/widgets/info_with_icon_widget.dart';
import 'package:clinic_app/core/widgets/info_with_icon_and_frame_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key, required this.appointment});
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

    return Container(
      height: 50.0.hp,
      padding: EdgeInsets.all(AppDimensions.sp),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Column(
        children: [
          //----------------------Doctor Image------------------------------------------------------------------------------------------------------------------------
          Expanded(
            child: DoctorImageWithFrameWidget(image: appointment.doctorImage),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppDimensions.sp),
              child: Column(
                children: [
                  //-------------------Doctor Name-------------------------------------------------------------------------------------------------------------------------
                  DoctorNameWidget(
                    name: appointment.doctorName,
                    size: AppDimensions.lfs,
                  ),
                  SizedBox(height: AppDimensions.mp),
                  //--------------------Department-------------------------------------------------------------------------------------------------------------------------
                  DoctorDepartmentWidget(department: appointment.department),
                  SizedBox(height: AppDimensions.mp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //-----------Appointment Date-----------------------------------------------------------------------------------------------------------------------
                      InfoWithIconWidget(
                        icon: AppIcons.calendar,
                        info: formatAppointmentDate(),
                        infoSize: AppDimensions.sfs,
                      ),
                      //-----------Appointment Time-----------------------------------------------------------------------------------------------------------------------
                      InfoWithIconWidget(
                        icon: AppIcons.time,
                        info: formatAppointmentTime(),
                        infoSize: AppDimensions.sfs,
                      ),
                    ],
                  ),
                  SizedBox(height: AppDimensions.mp),
                  Expanded(
                    child: Row(
                      children: [
                        //------------Request Type--------------------------------------------------------------------------------------------------------------------------
                        InfoWithIconAndFrameWidget(
                          title: specifyWithOrWithoutReport(),
                          icon: AppIcons.medicalReport,
                        ),
                        SizedBox(width: AppDimensions.mp),
                        //-----With or Without Medical Report----------------------------------------------------------------------------------------------------------------
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
          ),
        ],
      ),
    );
  }
}
