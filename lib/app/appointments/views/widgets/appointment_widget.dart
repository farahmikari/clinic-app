import 'package:clinic_app/app/appointments/views/widgets/doctor_image_widget.dart';
import 'package:clinic_app/app/appointments/views/widgets/doctor_name_widget.dart';
import 'package:clinic_app/app/appointments/views/widgets/main_reservation_info_widget.dart';
import 'package:clinic_app/app/appointments/views/widgets/secondary_reservation_info_widget.dart';
import 'package:clinic_app/app/appointments/views/widgets/status_widget.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<BoxShadow> boxShadow = [
      const BoxShadow(
        color: Color(0x1A000000),
        spreadRadius: 2,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ];
    return Container(
      height: 26.0.hp,
      padding: EdgeInsets.all(4.0.wp),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(15.0.sp),
        boxShadow: boxShadow,
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
                      StatusWidget(),
                      DoctorNameWidget(),
                      MainReservationInfoWidget(
                        icon: Icons.local_hospital_rounded,
                        title: "Cardiology",
                      ),
                      MainReservationInfoWidget(
                        icon: Icons.calendar_month,
                        title: "5 May,2025",
                      ),
                      MainReservationInfoWidget(
                        icon: Icons.access_time_filled_sharp,
                        title: "11:30 am",
                      ),
                    ],
                  ),
                ),
                DoctorImageWidget(),
              ],
            ),
          ),
          SizedBox(height: 4.0.wp),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                SecondaryReservationInfoWidget(
                  title: "Without Report",
                  icon: Icons.description_outlined,
                ),
                SizedBox(width: 4.0.wp),
                SecondaryReservationInfoWidget(
                  title: "Follow-Up",
                  icon: Icons.health_and_safety_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
