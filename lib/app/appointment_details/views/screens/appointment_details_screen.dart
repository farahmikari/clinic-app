import 'package:clinic_app/app/appointment_details/views/widgets/app_bar_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/completed_appointment_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/upcoming_appointment_widget.dart';
import 'package:clinic_app/app/appointments/models/appointment_model.dart';

import 'package:flutter/material.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    Widget specifyBodyWidget() {
      switch (appointment.status) {
        case "Pending":
          return UpcomingAppointmentWidget(appointment: appointment);
        default:
          return CompletedAppointmentWidget(appointment: appointment);
      }
    }

    return Scaffold(
      //backgroundColor: AppColors.backgroundColor,
      appBar: AppBarWidget(status: appointment.status),
      body: SafeArea(child: specifyBodyWidget()),
    );
  }
}
