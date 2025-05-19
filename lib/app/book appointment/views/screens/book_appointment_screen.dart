import 'package:clinic_app/app/book%20appointment/controllers/afternoon%20times%20bloc/afternoon_times_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/confirm%20bloc/confirm_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/days%20bloc/days_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/department%20doctor%20bloc/department_doctor_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/departments%20bloc/departments_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/morning%20times%20bloc/morning_times_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/picked%20appointment%20info%20bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20appointment/views/sections/afternoon_times_section.dart';
import 'package:clinic_app/app/book%20appointment/views/sections/confirm_button_section.dart';
import 'package:clinic_app/app/book%20appointment/views/sections/days_section.dart';
import 'package:clinic_app/app/book%20appointment/views/sections/departments_section.dart';
import 'package:clinic_app/app/book%20appointment/views/sections/morning_times_section.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/request_type_widget.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/select_date_and_time_subtitle_widget.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/shift_subtitle_widget.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/with_medical_report_checkbox.dart';
import 'package:clinic_app/app/doctor/controllers/doctor%20bloc/doctor_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<DepartmentsBloc>()),
        BlocProvider(create: (context) => getIt<DaysBloc>()),
        BlocProvider(create: (context) => getIt<MorningTimesBloc>()),
        BlocProvider(create: (context) => getIt<AfternoonTimesBloc>()),
        BlocProvider(create: (context) => getIt<PickedAppointmentInfoBloc>()),
        BlocProvider(create: (context) => getIt<DepartmentDoctorBloc>()),
        BlocProvider(create: (context) => getIt<DoctorBloc>()),
        BlocProvider(create: (context) => getIt<ConfirmBloc>()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: AppColors.backgroundColor,
          title: Text(
            "Book Appointment",
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontSize: AppDimensions.lfs,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Builder(
          builder: (context) {
            context.read<DepartmentsBloc>().add(FetchDepartments());
            context.read<DaysBloc>().add(FetchDefaultDays());
            context.read<MorningTimesBloc>().add(FetchDefaultMorningTimes());
            context.read<AfternoonTimesBloc>().add(
              FetchDefaultAfternoonTimes(),
            );
            return SafeArea(
              child: ListView(
                padding: EdgeInsets.only(top: AppDimensions.sp),
                children: [
                  //----------------|Departments|----------------------------------------------------------------------------------------------------------------------------------
                  DepartmentsSection(),
                  //---------------|RequestTypes|----------------------------------------------------------------------------------------------------------------------------------
                  const RequestTypeWidget(),
                  //--------|Select Date & Time Subtitle|--------------------------------------------------------------------------------------------------------------------------
                  SelectDateAndTimeSubtitleWidget(),
                  //-------------------|Days|--------------------------------------------------------------------------------------------------------------------------------------
                  DaysSection(),
                  //-------------|Morning Subtitle|--------------------------------------------------------------------------------------------------------------------------------
                  ShiftSubtitleWidget(title: "Morning"),
                  //---------------|Morning Times|---------------------------------------------------------------------------------------------------------------------------------
                  MorningTimesSection(),
                  //------------|Afternoon Subtitle|-------------------------------------------------------------------------------------------------------------------------------
                  ShiftSubtitleWidget(title: "Afternoon"),
                  //--------------|Afternoon Times|--------------------------------------------------------------------------------------------------------------------------------
                  AfternoonTimesSection(),
                  //----------|Medical Report Checkbox|----------------------------------------------------------------------------------------------------------------------------
                  WithMedicalReportCheckbox(),
                  //---------------|Confirm Button|--------------------------------------------------------------------------------------------------------------------------------
                  ConfirmButtonSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
