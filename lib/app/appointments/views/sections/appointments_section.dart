import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/appointments_bloc.dart';
import 'package:clinic_app/app/appointments/views/widgets/appointments%20widgets/appointments_widget.dart';

import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppointmentsSection extends StatelessWidget {
  const AppointmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentsBloc, AppointmentsState>(
      builder: (context, state) {
        switch (state) {
          //---------------------!! Loading State !!---------------------------------------------------------------------------------------------------------------------------------
          case AppointmentsLoading():
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.primaryColor,
                size: 8.0.hp,
              ),
            );
          //----------------------!! Loaded State !!---------------------------------------------------------------------------------------------------------------------------------
          case AppointmentsLoaded():
            return AppointmentsWidget(appointments: state.appointments);
          //----------------------!! Failure State !!--------------------------------------------------------------------------------------------------------------------------------
          case AppointmentsFailed():
            return Center(child: Text(state.errorMessage));
        }
      },
    );
  }
}
