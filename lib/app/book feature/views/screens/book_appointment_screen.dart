import 'package:clinic_app/app/book%20feature/controllers/afternoon_times_bloc/afternoon_times_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/confirm_bloc/confirm_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/department_doctor_bloc/department_doctor_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/departments_bloc/departments_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/morning_times_bloc/morning_times_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/picked_appointment_info_bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/confirm_button_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/days_widgets/days_shimmer_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/days_widgets/days_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/days_widgets/default_days_widgets.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/departments_widgets/departments_shimmer_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/departments_widgets/departments_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/request_type_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/select_date_and_time_subtitle_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/shift_subtitle_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/times_widgets/afternoon_times_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/times_widgets/default_times_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/times_widgets/morning_times_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/times_widgets/times_shimmer_widget.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/with_medical_report_checkbox.dart';
import 'package:clinic_app/app/doctor/controllers/doctor_bloc/doctor_bloc.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
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
              fontSize: 16.0.sp,
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
            return ListView(
              padding: EdgeInsets.only(top: 2.0.wp),
              children: [
                //--------------------------------Departments-------------------------------------------------------------
                Container(
                  height: 8.0.hp,
                  margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
                  decoration: BoxDecoration(
                    color: AppColors.widgetBackgroundColor,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: boxShadow,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: BlocBuilder<DepartmentsBloc, DepartmentsState>(
                      builder: (context, state) {
                        switch (state) {
                          case FetchDepartmentsLoading():
                            return const DepartmentsShimmerWidget();
                          case FetchDepartmentsLoaded():
                            return DepartmentsWidget(
                              departments: state.departments,
                            );
                          case FetchDepartmentsFailed():
                            return Center(child: Text(state.errorMessage));
                        }
                      },
                    ),
                  ),
                ),
                //----------------------------RequestTypes-------------------------------------------------------------
                const RequestTypeWidget(),
                //---------------------Select Date & Time Subtitle-------------------------------------------------------------
                SelectDateAndTimeSubtitleWidget(),
                //--------------------------------Days-------------------------------------------------------------
                Container(
                  height: 10.0.hp,
                  margin: EdgeInsets.all(4.0.wp),
                  child: BlocBuilder<DaysBloc, DaysState>(
                    builder: (context, state) {
                      switch (state) {
                        case FetchDaysInitial():
                          return DefaultDaysWidgets(days: state.days);
                        case FetchDaysLoading():
                          return const DaysShimmerWidget();
                        case FetchDaysLoaded():
                          return DaysWidget(days: state.days);
                        case FetchDaysFailed():
                          return Text(state.errorMessage);
                      }
                    },
                  ),
                ),
                //------------------------------Morning Subtitle------------------------------------------------------------
                ShiftSubtitleWidget(title: "Morning"),
                //--------------------------------Morning Times-------------------------------------------------------------
                BlocBuilder<MorningTimesBloc, MorningTimesState>(
                  builder: (context, state) {
                    switch (state) {
                      case FetchMorningTimesInitial():
                        return DefaultTimesWidget(times: state.morningTimes);
                      case FetchMorningTimesLoading():
                        return const TimesShimmerWidget();
                      case FetchMorningTimesLoaded():
                        return MorningTimesWidget(times: state.morningTimes);
                      case FetchMorningTimesFailed():
                        return Center(child: Text(state.errorMessage));
                    }
                  },
                ),
                //-------------------------------Afternoon Subtitle------------------------------------------------------------
                ShiftSubtitleWidget(title: "Afternoon"),
                //--------------------------------Afternoon Times------------------------------------------------------------
                BlocBuilder<AfternoonTimesBloc, AfternoonTimesState>(
                  builder: (context, state) {
                    switch (state) {
                      case FetchAfternoonTimesInitial():
                        return DefaultTimesWidget(times: state.afternoonTimes);
                      case FetchAfternoonTimesLoading():
                        return const TimesShimmerWidget();
                      case FetchAfternoonTimesLoaded():
                        return AfternoonTimesWidget(
                          times: state.afternoonTimes,
                        );
                      case FetchAfternoonTimesFailed():
                        return Center(child: Text(state.errorMessage));
                    }
                  },
                ),
                //----------------------------Medical Report Checkbox---------------------------------------------------------
                WithMedicalReportCheckbox(),
                //---------------------------------Confirm Button-------------------------------------------------------------
                BlocConsumer<ConfirmBloc, ConfirmState>(
                  listener: (context, state) {
                    if (state is ConfirmLoaded) {
                      Get.back();
                    }
                  },
                  builder: (context, state) {
                    switch (state) {
                      case ConfirmInitial():
                        return ConfirmButtonWidget();
                      case ConfirmLoading():
                        return Center(
                          child: LoadingAnimationWidget.staggeredDotsWave(
                            color: AppColors.primaryColor,
                            size: 8.0.hp,
                          ),
                        );
                      case ConfirmLoaded():
                        return SizedBox();
                      case ConfirmFailed():
                        return ConfirmButtonWidget();
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
