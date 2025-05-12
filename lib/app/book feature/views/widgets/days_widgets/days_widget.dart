import 'package:clinic_app/app/book%20feature/controllers/afternoon_times_bloc/afternoon_times_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/morning_times_bloc/morning_times_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/picked_appointment_info_bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20feature/models/day_model.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DaysWidget extends StatelessWidget {
  final List<DayModel> days;
  const DaysWidget({super.key, required this.days});

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
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var currentDayId = days[index].id;
        var isAvailable = days[index].isAvailable;
        var dayName = DateFormat('EEE').format(days[index].date);
        var dayNumber = DateFormat('d').format(days[index].date);
        return InkWell(
          borderRadius: BorderRadius.circular(15.0.sp),
          onTap: () {
            if (isAvailable) {
              context.read<MorningTimesBloc>().add(
                FetchMorningTimes(days[index].id),
              );
              context.read<AfternoonTimesBloc>().add(
                FetchAfternoonTimes(days[index].id),
              );
              context.read<PickedAppointmentInfoBloc>().add(
                DayIdChanged(pickedDayId: days[index].id),
              );
            }
          },
          child: BlocSelector<
            PickedAppointmentInfoBloc,
            PickedAppointmentInfoState,
            int
          >(
            selector: (state) {
              return state.pickedDayId;
            },
            builder: (context, state) {
              return Container(
                width: 16.5.wp,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      state == currentDayId
                          ? AppColors.primaryColor
                          : AppColors.widgetBackgroundColor,
                  borderRadius: BorderRadius.circular(15.0.sp),
                  boxShadow: boxShadow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dayNumber,
                      style: TextStyle(
                        color:
                            state == currentDayId
                                ? AppColors.widgetBackgroundColor
                                : isAvailable
                                ? AppColors.mainTextColor
                                : AppColors.hintTextColor,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      dayName,
                      style: TextStyle(
                        color:
                            state == currentDayId
                                ? AppColors.widgetBackgroundColor
                                : isAvailable
                                ? AppColors.mainTextColor
                                : AppColors.hintTextColor,
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 2.0.wp);
      },
      itemCount: 5,
    );
  }
}
