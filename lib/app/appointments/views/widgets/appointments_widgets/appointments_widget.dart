import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/app/appointments/views/widgets/appointments_widgets/appointment_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class AppointmentsWidget extends StatelessWidget {
  const AppointmentsWidget({super.key, required this.appointments});

  final List<AppointmentModel> appointments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppDimensions.mp),
      itemBuilder: (context, index) {
        return AppointmentWidget(appointment: appointments[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: AppDimensions.sp);
      },
      itemCount: appointments.length,
    );
  }
}
