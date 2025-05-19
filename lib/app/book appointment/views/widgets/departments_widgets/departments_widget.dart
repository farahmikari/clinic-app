import 'package:clinic_app/app/book%20appointment/controllers/afternoon%20times%20bloc/afternoon_times_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/picked%20appointment%20info%20bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/days%20bloc/days_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/department%20doctor%20bloc/department_doctor_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/morning%20times%20bloc/morning_times_bloc.dart';
import 'package:clinic_app/app/book%20appointment/models/clinic_department_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentsWidget extends StatefulWidget {
  const DepartmentsWidget({super.key, required this.departments});

  final List<ClinicDepartmentModel> departments;

  @override
  State<DepartmentsWidget> createState() => _DepartmentsWidgetState();
}

class _DepartmentsWidgetState extends State<DepartmentsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.sp),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var currentDepId = widget.departments[index].id;
        return InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.lbr),
          onTap: () {
            context.read<DaysBloc>().add(FetchDays(currentDepId));
            context.read<DepartmentDoctorBloc>().add(
              FetchDepartmentDoctors(departmentId: currentDepId),
            );
            context.read<MorningTimesBloc>().add(FetchDefaultMorningTimes());
            context.read<AfternoonTimesBloc>().add(
              FetchDefaultAfternoonTimes(),
            );
            context.read<PickedAppointmentInfoBloc>().add(
              DepartmentIdChanged(
                pickedDepartmentId: widget.departments[index].id,
              ),
            );
          },
          child: BlocSelector<
            PickedAppointmentInfoBloc,
            PickedAppointmentInfoState,
            int
          >(
            selector: (state) {
              return state.pickedDepartmentId;
            },
            builder: (context, state) {
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: AppDimensions.sm),
                padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
                decoration: BoxDecoration(
                  color:
                      state == currentDepId
                          ? AppColors.primaryColor
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(AppDimensions.lbr),
                ),
                child: Text(
                  widget.departments[index].name,
                  style: TextStyle(
                    color:
                        state == currentDepId
                            ? AppColors.widgetBackgroundColor
                            : AppColors.mainTextColor,
                    fontSize: AppDimensions.mfs,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: AppDimensions.sm);
      },
      itemCount: widget.departments.length,
    );
  }
}
