import 'package:clinic_app/app/medical_report/controllers/fetch_medical_report_bloc/fetch_medical_report_bloc.dart';
import 'package:clinic_app/app/medical_report/views/screens/medical_report_screen.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:clinic_app/core/widgets/custom_warning_dialog_widget.dart';
import 'package:clinic_app/core/widgets/reservation_summary_widget.dart';
import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/app/prescription/controllers/fetch_prescription_bloc/fetch_prescription_bloc.dart';
import 'package:clinic_app/app/prescription/controllers/rating_dialog_bloc/rating_dialog_bloc.dart';
import 'package:clinic_app/app/prescription/models/completed_appointment_model.dart';
import 'package:clinic_app/app/prescription/views/widgets/advices_widgets/advices_widget.dart';
import 'package:clinic_app/app/prescription/views/widgets/lab_tests_widgets/lab_tests_widget.dart';
import 'package:clinic_app/app/prescription/views/widgets/medications_widgets/medications_widget.dart';
import 'package:clinic_app/app/prescription/views/widgets/rating_dialog_widget.dart';
import 'package:clinic_app/app/prescription/views/widgets/surgeries_widgets/surgeries_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/app_bar_with_badge_widget.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key, required this.appointment});
  final AppointmentModel appointment;

  void _triggerRatingDialog({
    required BuildContext context,
    required FetchPrescriptionState state,
  }) {
    if (state is FetchPrescriptionLoaded &&
        !state.prescription.isPrescriptionViewed) {
      context.read<RatingDialogBloc>().add(
        RatingDialogIsDisplayed(appointmentId: appointment.id),
      );
    }
  }

  void _displayRatingDialog({
    required BuildContext context,
    required RatingDialogState state,
  }) {
    if (state is RatingDialogVisible) {
      showDialog(
        context: context,
        builder:
            (_) => BlocProvider.value(
              value: context.read<RatingDialogBloc>(),
              child: RatingDialogWidget(
                doctorImage: appointment.doctorImage,
                doctorName: appointment.doctorName,
              ),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarWithBadgeWidget(
        title: "Prescription",
        badgeTitle: "Completed",
        badgeColor: AppColors.transparentYellow,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RatingDialogBloc()),
          BlocProvider(create: (context) => FetchMedicalReportBloc()),
          BlocProvider(
            create:
                (context) =>
                    FetchPrescriptionBloc()
                      ..add(FetchPrescription(appointmentId: appointment.id)),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<FetchPrescriptionBloc, FetchPrescriptionState>(
              listenWhen:
                  (previous, current) => current is FetchPrescriptionLoaded,
              listener: (context, state) {
                _triggerRatingDialog(context: context, state: state);
              },
            ),
            BlocListener<RatingDialogBloc, RatingDialogState>(
              listenWhen: (previous, current) => current is RatingDialogVisible,
              listener: (context, state) {
                _displayRatingDialog(context: context, state: state);
              },
            ),
            BlocListener<FetchMedicalReportBloc, FetchMedicalReportState>(
              listener: (context, state) {
                if (state is FetchMedicalReportLoaded) {
                  Get.to(
                    () =>
                        MedicalReportScreen(medicalReport: state.medicalReport),
                  );
                }
                if (state is FetchMedicalReportFailed) {
                  showDialog(
                    context: context,
                    builder:
                        (context) => CustomWarningDialogWidget(
                          warning: state.errorMessage,
                          onOk: () {
                            Get.back();
                          },
                        ),
                  );
                }
              },
            ),
          ],
          child: BlocBuilder<FetchPrescriptionBloc, FetchPrescriptionState>(
            builder: (context, state) {
              if (state is FetchPrescriptionLoaded) {
                PrescriptionModel prescription = state.prescription;
                return ListView(
                  padding: EdgeInsets.symmetric(vertical: AppDimensions.mp),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimensions.mp,
                      ),
                      child: ReservationSummaryWidget(appointment: appointment),
                    ),
                    SizedBox(height: AppDimensions.mp),
                    if (prescription.medications.isNotEmpty) ...[
                      //-----------Medications Subtitle--------------------------------------------------------------------------------------------------------------------------------------
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.mp,
                        ),
                        child: SubtitleWidget(subtitle: "Medications"),
                      ),
                      SizedBox(height: AppDimensions.mp),
                      //---------------Medications-------------------------------------------------------------------------------------------------------------------------------------------
                      MedicationsWidget(medications: prescription.medications),
                      SizedBox(height: AppDimensions.mp),
                    ],
                    if (prescription.labTests.isNotEmpty) ...[
                      //------------Lab Tests Subtitle---------------------------------------------------------------------------------------------------------------------------------------
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.mp,
                        ),
                        child: SubtitleWidget(subtitle: "Lab Tests"),
                      ),
                      SizedBox(height: AppDimensions.mp),
                      //----------------Lab Tests--------------------------------------------------------------------------------------------------------------------------------------------
                      LabTestsWidget(labTests: prescription.labTests),
                      SizedBox(height: AppDimensions.mp),
                    ],
                    if (prescription.surgeries.isNotEmpty) ...[
                      //------------Surgeries Subtitle---------------------------------------------------------------------------------------------------------------------------------------
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.mp,
                        ),
                        child: SubtitleWidget(subtitle: "Surgeries"),
                      ),
                      SizedBox(height: AppDimensions.mp),
                      //----------------Surgeries--------------------------------------------------------------------------------------------------------------------------------------------
                      SurgeriesWidget(surgeries: prescription.surgeries),
                      SizedBox(height: AppDimensions.mp),
                    ],
                    if (prescription.advices.isNotEmpty) ...[
                      //-------------Advices Subtitle----------------------------------------------------------------------------------------------------------------------------------------
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.mp,
                        ),
                        child: SubtitleWidget(subtitle: "Advices"),
                      ),
                      SizedBox(height: AppDimensions.mp),
                      //-----------------Advices---------------------------------------------------------------------------------------------------------------------------------------------
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.mp,
                        ),
                        child: AdvicesWidget(advices: prescription.advices),
                      ),
                      SizedBox(height: AppDimensions.mp),
                    ],
                    if (appointment.withMedicalReport) ...[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.mp,
                        ),
                        child: BlocBuilder<
                          FetchMedicalReportBloc,
                          FetchMedicalReportState
                        >(
                          builder: (context, state) {
                            if (state is FetchMedicalReportLoading) {
                              return LoadingWidget();
                            }
                            return ButtonWidget(
                              title: "Medical Report",
                              backgroundColor: AppColors.primaryColor,
                              titleColor: AppColors.widgetBackgroundColor,
                              onTap: () {
                                context.read<FetchMedicalReportBloc>().add(
                                  MedicalReportIsFetched(
                                    appointmentId: appointment.id,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ],
                );
              } else {
                return LoadingWidget();
              }
            },
          ),
        ),
      ),
    );
  }
}
