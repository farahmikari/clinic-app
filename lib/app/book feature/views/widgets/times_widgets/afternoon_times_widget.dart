import 'package:clinic_app/app/book%20feature/controllers/department_doctor_bloc/department_doctor_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/picked_appointment_info_bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20feature/models/time_model.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AfternoonTimesWidget extends StatelessWidget {
  final List<TimeModel> times;
  const AfternoonTimesWidget({super.key, required this.times});
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
    return BlocSelector<
      PickedAppointmentInfoBloc,
      PickedAppointmentInfoState,
      int
    >(
      selector: (state) {
        return state.afternoonTimesLength;
      },
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.all(4.0.wp),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2.0.wp,
            mainAxisSpacing: 2.0.wp,
            mainAxisExtent: 6.0.hp,
          ),
          itemBuilder: (context, index) {
            var currentTimeId = times[index].id;
            var isAvailable = times[index].isAvailable;
            if (index == state - 1) {
              return InkWell(
                borderRadius: BorderRadius.circular(15.0.sp),
                onTap: () {
                  context.read<PickedAppointmentInfoBloc>().add(
                    AfternoonTimesLengthChanged(
                      afternoonTimesLength: times.length,
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.widgetBackgroundColor,
                    borderRadius: BorderRadius.circular(15.0.sp),
                    boxShadow: boxShadow,
                  ),
                  child: BlocSelector<
                    PickedAppointmentInfoBloc,
                    PickedAppointmentInfoState,
                    int
                  >(
                    selector: (state) {
                      return state.afternoonTimesLength;
                    },
                    builder: (context, state) {
                      return Text(
                        state == 6 ? "More" : "Less",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return InkWell(
              borderRadius: BorderRadius.circular(15.0.sp),
              onTap: () {
                if (isAvailable) {
                  DepartmentDoctorState myState =
                      context.read<DepartmentDoctorBloc>().state;
                  if (myState is DepartmentDoctorLoaded) {
                    context.read<PickedAppointmentInfoBloc>().add(
                      TimeIdChanged(
                        pickedTimeId: times[index].id,
                        pickedDoctorId: myState.afternoonShiftDoctor.id,
                      ),
                    );
                  }
                }
              },
              child: BlocSelector<
                PickedAppointmentInfoBloc,
                PickedAppointmentInfoState,
                int
              >(
                selector: (state) {
                  return state.pickedTimeId;
                },
                builder: (context, state) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          state == currentTimeId
                              ? AppColors.primaryColor
                              : AppColors.widgetBackgroundColor,
                      borderRadius: BorderRadius.circular(15.0.sp),
                      boxShadow: boxShadow,
                    ),
                    child: Text(
                      times[index].name,
                      style: TextStyle(
                        color:
                            state == currentTimeId
                                ? AppColors.widgetBackgroundColor
                                : isAvailable
                                ? AppColors.mainTextColor
                                : AppColors.hintTextColor,
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
            );
          },
          itemCount: state,
        );
      },
    );
  }
}
