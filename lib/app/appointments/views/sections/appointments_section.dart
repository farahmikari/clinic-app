import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/appointments_bloc.dart';
import 'package:clinic_app/app/appointments/views/widgets/appointments%20widgets/appointments_widget.dart';
import 'package:clinic_app/app/appointments/views/widgets/appointments%20widgets/shimmer_appointments_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsSection extends StatelessWidget {
  const AppointmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsBloc, AppointmentsState>(
      builder: (context, state) {
        if (state is AppointmentsLoaded) {
          return AppointmentsWidget(appointments: state.appointments);
        }
        return ShimmerAppointmentsWidget();
      },
    );
  }
}
