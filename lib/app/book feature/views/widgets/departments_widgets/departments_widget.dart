import 'package:clinic_app/app/book%20feature/controllers/afternoon_times_bloc/afternoon_times_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/days_bloc/days_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/department_doctor_bloc/department_doctor_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/morning_times_bloc/morning_times_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/picked_appointment_info_bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20feature/models/clinic_department_model.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentsWidget extends StatefulWidget {
  final List<ClinicDepartmentModel> departments;
  const DepartmentsWidget({super.key, required this.departments});

  @override
  State<DepartmentsWidget> createState() => _DepartmentsWidgetState();
}

class _DepartmentsWidgetState extends State<DepartmentsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 2.0.wp),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        var currentDepId = widget.departments[index].id;
        return InkWell(
          borderRadius: BorderRadius.circular(100),
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
                margin: EdgeInsets.symmetric(vertical: 2.0.wp),
                padding: EdgeInsets.symmetric(horizontal: 4.0.wp),
                decoration: BoxDecoration(
                  color:
                      state == currentDepId
                          ? AppColors.primaryColor
                          : Colors.transparent,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  widget.departments[index].name,
                  style: TextStyle(
                    color:
                        state == currentDepId
                            ? AppColors.widgetBackgroundColor
                            : AppColors.mainTextColor,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 2.0.wp);
      },
      itemCount: widget.departments.length,
    );
  }
}
