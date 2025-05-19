import 'package:clinic_app/app/book%20appointment/controllers/afternoon%20times%20bloc/afternoon_times_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/morning%20times%20bloc/morning_times_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/picked%20appointment%20info%20bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20appointment/models/day_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarWidget extends StatelessWidget {
  const TableCalendarWidget({
    super.key,
    required this.dayModels,
    required this.myDays,
  });

  final List<DayModel> dayModels;
  final List<DateTime> myDays;

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return BlocSelector<
      PickedAppointmentInfoBloc,
      PickedAppointmentInfoState,
      int
    >(
      selector: (state) {
        return state.pickedDayId;
      },
      builder: (context, state) {
        return TableCalendar(
          focusedDay:
              state == -1
                  ? today
                  : dayModels
                      .firstWhere((dayModel) => state == dayModel.id)
                      .date,
          firstDay: DateTime.utc(2025, 1, 1),
          lastDay: DateTime.utc(2025, 12, 31),
          selectedDayPredicate: (day) {
            bool isFromMyDays = dayModels.any(
              (dayModel) => state == dayModel.id && dayModel.isAvailable,
            );
            if (isFromMyDays) {
              DateTime selectedDay =
                  dayModels.firstWhere((dayModel) => state == dayModel.id).date;
              return isSameDay(day, selectedDay);
            }
            return false;
          },
          onDaySelected: (selectedDay, focusedDay) {
            bool isFromMyDays = myDays.any(
              (date) => isSameDay(date, selectedDay),
            );
            if (isFromMyDays) {
              DayModel day = dayModels.firstWhere(
                (day) => isSameDay(selectedDay, day.date),
              );
              if (day.isAvailable) {
                context.read<PickedAppointmentInfoBloc>().add(
                  DayIdChanged(pickedDayId: day.id),
                );
                context.read<MorningTimesBloc>().add(FetchMorningTimes(day.id));
                context.read<AfternoonTimesBloc>().add(
                  FetchAfternoonTimes(day.id),
                );
              }
            }
          },
          availableCalendarFormats: {CalendarFormat.month: 'Month'},
          headerStyle: HeaderStyle(
            titleCentered: true,
            titleTextStyle: TextStyle(
              color: AppColors.mainTextColor,
              fontWeight: FontWeight.bold,
              fontSize: AppDimensions.mfs,
            ),
            leftChevronIcon: Container(
              height: 10.0.wp,
              width: 10.0.wp,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadiusDirectional.circular(
                  AppDimensions.sbr,
                ),
              ),
              child: Icon(
                Icons.keyboard_arrow_left_rounded,
                size: AppDimensions.sis,
                color: AppColors.mainTextColor,
              ),
            ),
            rightChevronIcon: Container(
              height: 10.0.wp,
              width: 10.0.wp,
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadiusDirectional.circular(
                  AppDimensions.sbr,
                ),
              ),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                size: AppDimensions.sis,
                color: AppColors.mainTextColor,
              ),
            ),
          ),
          rowHeight: 5.0.hp,
          daysOfWeekHeight: 6.0.hp,
          calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
            outsideDaysVisible: false,
            todayDecoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor, width: 0.5.wp),
            ),
            todayTextStyle: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: AppDimensions.sfs,
            ),
          ),
          weekendDays: [DateTime.friday, DateTime.saturday],
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: AppDimensions.sfs,
            ),
            weekendStyle: TextStyle(
              color: AppColors.hintTextColor,
              fontWeight: FontWeight.bold,
              fontSize: AppDimensions.sfs,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              bool isFromMyDays = myDays.any((date) => isSameDay(date, day));
              if (isFromMyDays) {
                bool isAvailable =
                    dayModels
                        .firstWhere((date) => isSameDay(day, date.date))
                        .isAvailable;
                if (isAvailable) {
                  return Container(
                    margin: const EdgeInsets.all(6.0), //gtr
                    decoration: const BoxDecoration(
                      color: AppColors.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        color: AppColors.mainTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimensions.sfs,
                      ),
                    ),
                  );
                } else {
                  return Container(
                    margin: const EdgeInsets.all(6.0), //gtr
                    decoration: const BoxDecoration(
                      color: AppColors.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        color: AppColors.hintTextColor,
                        fontWeight: FontWeight.bold,
                        fontSize: AppDimensions.sfs,
                      ),
                    ),
                  );
                }
              } else {
                return Center(
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: AppColors.mainTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: AppDimensions.sfs,
                    ),
                  ),
                );
              }
            },
            selectedBuilder: (context, day, focusedDay) {
              return Container(
                margin: EdgeInsets.all(6.0), //gtr
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  '${day.day}',
                  style: TextStyle(
                    color: AppColors.widgetBackgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: AppDimensions.sfs,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
