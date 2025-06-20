import 'package:clinic_app/app/appointment%20details/views/widgets/advices%20widgets/advices_widget.dart';
import 'package:clinic_app/app/appointment%20details/views/widgets/app_bar_widget.dart';
import 'package:clinic_app/app/appointment%20details/views/widgets/lab%20tests%20or%20surgeries%20widgets/lab_tests_or_surgeries_widget.dart';
import 'package:clinic_app/app/appointment%20details/views/widgets/medications%20widgets/medications_widget.dart';
import 'package:clinic_app/app/appointment%20details/views/widgets/summary%20widgets/summary_widget.dart';
import 'package:clinic_app/app/book%20appointment/controllers/days%20bloc/days_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/picked%20appointment%20info%20bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/widgets/subtitle_widget.dart';
import 'package:clinic_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  const AppointmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<PickedAppointmentInfoBloc>()),
        BlocProvider.value(value: getIt<DaysBloc>()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBarWidget(),
        body: SafeArea(
          child: ListView(
            children: [
              //-----------------Summary---------------------------------------------------------------------------------------------------------------------------------------------
              SummaryWidget(),
              //-----------Medications Subtitle--------------------------------------------------------------------------------------------------------------------------------------
              SubtitleWidget(subtitle: "Medications"),
              // //---------------Medications-------------------------------------------------------------------------------------------------------------------------------------------
              MedicationsWidget(),
              // //------------Lab Tests Subtitle---------------------------------------------------------------------------------------------------------------------------------------
              SubtitleWidget(subtitle: "Lab Tests"),
              // //----------------Lab Tests--------------------------------------------------------------------------------------------------------------------------------------------
              LabTestsOrSurgeriesWidget(icon: AppIcons.microscope),
              // //------------Surgeries Subtitle---------------------------------------------------------------------------------------------------------------------------------------
              SubtitleWidget(subtitle: "Surgeries"),
              // //----------------Surgeries--------------------------------------------------------------------------------------------------------------------------------------------
              LabTestsOrSurgeriesWidget(icon: AppIcons.surgeries),
              // //-------------Advices Subtitle----------------------------------------------------------------------------------------------------------------------------------------
              SubtitleWidget(subtitle: "Advices"),
              // //-----------------Advices---------------------------------------------------------------------------------------------------------------------------------------------
              AdvicesWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
