import 'package:clinic_app/app/appointment_details/views/widgets/main_info_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/summary_widgets/department_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/summary_widgets/doctor_image_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/summary_widgets/doctor_name_widget.dart';
import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/errors/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/secondary_info_widget.dart';
import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_icons.dart';
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
      margin: EdgeInsets.all(AppDimensions.mm),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Column(
        children: [
          Expanded(
            //----------------------Doctor Image------------------------------------------------------------------------------------------------------------------------
            child: DoctorImageWidget(image: appointment.doctorImage),
          ),
          Expanded(
            child: Column(
              children: [
                //-------------------Doctor Name-------------------------------------------------------------------------------------------------------------------------
                DoctorNameWidget(name: appointment.doctorName),
                //--------------------Department-------------------------------------------------------------------------------------------------------------------------
                DepartmentWidget(department: appointment.department),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    //-----------Appointment Date-----------------------------------------------------------------------------------------------------------------------
                    MainInfoWidget(
                      title: formatAppointmentDate(),
                      icon: AppIcons.calendar,
                    ),
                    //-----------Appointment Time-----------------------------------------------------------------------------------------------------------------------
                    MainInfoWidget(
                      title: formatAppointmentTime(),
                      icon: AppIcons.time,
                    ),
                  ],
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.all(AppDimensions.mp),
                    child: Row(
                      children: [
                        //------------Request Type--------------------------------------------------------------------------------------------------------------------------
                        SecondaryInfoWidget(
                          title: specifyWithOrWithoutReport(),
                          icon: AppIcons.medicalReport,
                        ),
                        SizedBox(width: AppDimensions.mm),
                        //-----With or Without Medical Report----------------------------------------------------------------------------------------------------------------
                        SecondaryInfoWidget(
                          title: specifyRequestType(),
                          icon: AppIcons.requestType,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
