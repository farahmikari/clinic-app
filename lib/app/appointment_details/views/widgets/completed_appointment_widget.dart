import 'package:clinic_app/app/appointment_details/controllers/completed_appointment_details_bloc/fetch_completed_appointment_details_bloc.dart';
import 'package:clinic_app/app/appointment_details/models/completed_appointment_models/completed_appointment_model.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/advices_widgets/advices_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/lab_tests_widgets/lab_tests_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/medications_widgets/medications_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/summary_widgets/summary_widget.dart';
import 'package:clinic_app/app/appointment_details/views/widgets/surgeries_widgets/surgeries_widget.dart';
import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CompletedAppointmentWidget extends StatelessWidget {
  const CompletedAppointmentWidget({super.key, required this.appointment});
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              getIt<FetchCompletedAppointmentDetailsBloc>()..add(
                FetchCompletedAppointmentDetails(appointmentId: appointment.id),
              ),
      child: BlocBuilder<
        FetchCompletedAppointmentDetailsBloc,
        FetchCompletedAppointmentDetailsState
      >(
        builder: (context, state) {
          switch (state) {
            case FetchCompletedAppointmentDetailsLoading():
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColors.primaryColor,
                  size: 8.0.hp,
                ),
              );
            case FetchCompletedAppointmentDetailsLoaded():
              CompletedAppointmentModel completedAppointment =
                  state.completedAppointment;
              return ListView(
                children: [
                  SummaryWidget(appointment: appointment),
                  //-----------Medications Subtitle--------------------------------------------------------------------------------------------------------------------------------------
                  SubtitleWidget(subtitle: "Medications"),
                  //---------------Medications-------------------------------------------------------------------------------------------------------------------------------------------
                  MedicationsWidget(
                    medications: completedAppointment.medications,
                  ),
                  //------------Lab Tests Subtitle---------------------------------------------------------------------------------------------------------------------------------------
                  SubtitleWidget(subtitle: "Lab Tests"),
                  //----------------Lab Tests--------------------------------------------------------------------------------------------------------------------------------------------
                  LabTestsWidget(labTests: completedAppointment.labTests),
                  //------------Surgeries Subtitle---------------------------------------------------------------------------------------------------------------------------------------
                  SubtitleWidget(subtitle: "Surgeries"),
                  //----------------Surgeries--------------------------------------------------------------------------------------------------------------------------------------------
                  SurgeriesWidget(surgeries: completedAppointment.surgeries),
                  //-------------Advices Subtitle----------------------------------------------------------------------------------------------------------------------------------------
                  SubtitleWidget(subtitle: "Advices"),
                  //-----------------Advices---------------------------------------------------------------------------------------------------------------------------------------------
                  AdvicesWidget(advices: completedAppointment.advices),
                ],
              );
            case FetchCompletedAppointmentDetailsFailed():
              return Center(child: Text(state.errorMessage));
          }
        },
      ),
    );
  }
}
