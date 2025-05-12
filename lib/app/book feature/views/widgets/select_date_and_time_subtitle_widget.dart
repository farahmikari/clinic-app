import 'package:clinic_app/app/book%20feature/controllers/afternoon_times_bloc/afternoon_times_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/morning_times_bloc/morning_times_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/picked_appointment_info_bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20feature/models/day_model.dart';
import 'package:clinic_app/app/book%20feature/views/widgets/table_calendar_widget.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectDateAndTimeSubtitleWidget extends StatelessWidget {
  const SelectDateAndTimeSubtitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 4.0.wp),
      title: Text(
        "Select Date & Time",
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: 14.0.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: BlocBuilder<DaysBloc, DaysState>(
        builder: (context, state) {
          if (state is FetchDaysLoaded) {
            List<DayModel> dayModels = state.days;
            List<DateTime> myDays = dayModels.map((day) => day.date).toList();
            return TextButton(
              onPressed: () {
                PickedAppointmentInfoBloc pickedAppointmentInfoBloc =
                    context.read<PickedAppointmentInfoBloc>();
                MorningTimesBloc morningTimesBloc =
                    context.read<MorningTimesBloc>();
                AfternoonTimesBloc afternoonTimesBloc =
                    context.read<AfternoonTimesBloc>();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider.value(value: pickedAppointmentInfoBloc),
                        BlocProvider.value(value: morningTimesBloc),
                        BlocProvider.value(value: afternoonTimesBloc),
                      ],
                      child: AlertDialog(
                        backgroundColor: AppColors.widgetBackgroundColor,
                        contentPadding: EdgeInsets.all(4.0.wp),
                        content: SizedBox(
                          height: 50.0.hp,
                          width: 80.0.wp,
                          child: TableCalendarWidget(
                            dayModels: dayModels,
                            myDays: myDays,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text(
                'Open Calendar',
                style: TextStyle(color: AppColors.primaryColor),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
