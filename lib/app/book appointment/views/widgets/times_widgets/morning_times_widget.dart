import 'package:clinic_app/app/book%20appointment/controllers/department%20doctor%20bloc/department_doctor_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/picked%20appointment%20info%20bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20appointment/models/time_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MorningTimesWidget extends StatelessWidget {
  const MorningTimesWidget({super.key, required this.times});

  final List<TimeModel> times;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      PickedAppointmentInfoBloc,
      PickedAppointmentInfoState,
      int
    >(
      selector: (state) {
        return state.morningTimesLength;
      },
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.all(AppDimensions.mp),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: AppDimensions.sm,
            mainAxisSpacing: AppDimensions.sm,
            mainAxisExtent: 6.0.hp,
          ),
          itemBuilder: (context, index) {
            var currentTimeId = times[index].id;
            var isAvailable = times[index].isAvailable;
            if (index == state - 1) {
              return InkWell(
                borderRadius: BorderRadius.circular(AppDimensions.mbr),
                onTap: () {
                  context.read<PickedAppointmentInfoBloc>().add(
                    MorningTimesLengthChanged(morningTimesLength: times.length),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.widgetBackgroundColor,
                    borderRadius: BorderRadius.circular(AppDimensions.mbr),
                    boxShadow: AppShadow.boxShadow,
                  ),
                  child: BlocSelector<
                    PickedAppointmentInfoBloc,
                    PickedAppointmentInfoState,
                    int
                  >(
                    selector: (state) {
                      return state.morningTimesLength;
                    },
                    builder: (context, state) {
                      return Text(
                        state == 6 ? "More" : "Less",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: AppDimensions.mfs,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ),
              );
            }
            return InkWell(
              borderRadius: BorderRadius.circular(AppDimensions.mbr),
              onTap: () {
                if (isAvailable) {
                  DepartmentDoctorState myState =
                      context.read<DepartmentDoctorBloc>().state;
                  if (myState is DepartmentDoctorLoaded) {
                    context.read<PickedAppointmentInfoBloc>().add(
                      TimeIdChanged(
                        pickedTimeId: times[index].id,
                        pickedDoctorId: myState.morningShiftDoctor.id,
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
                      borderRadius: BorderRadius.circular(AppDimensions.mbr),
                      boxShadow: AppShadow.boxShadow,
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
                        fontSize: AppDimensions.mfs,
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
