import 'package:clinic_app/app/book%20feature/controllers/confirm_bloc/confirm_bloc.dart';
import 'package:clinic_app/app/book%20feature/controllers/picked_appointment_info_bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20feature/models/book_appointment_model.dart';
import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmButtonWidget extends StatelessWidget {
  const ConfirmButtonWidget({super.key});

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
      bool
    >(
      selector: (state) {
        return state.confirm;
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(4.0.wp),
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: () {
              var myState = context.read<PickedAppointmentInfoBloc>().state;
              if (state) {
                CustomizedAppointmentModel customizedAppointment =
                    CustomizedAppointmentModel(
                      departmentId: myState.pickedDepartmentId,
                      doctorId: myState.pickedDoctorId,
                      requestTypeId: myState.pickedRequestTypeId,
                      dayId: myState.pickedDayId,
                      timeId: myState.pickedTimeId,
                      withMedicalReport: myState.withMedicalReport,
                    );
                context.read<ConfirmBloc>().add(
                  PickedAppointmentInfoConfirmed(
                    customizedAppointment: customizedAppointment,
                  ),
                );
              }
            },
            child: Container(
              padding: EdgeInsets.all(4.0.wp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: state ? AppColors.primaryColor : AppColors.hintTextColor,
                borderRadius: BorderRadius.circular(100),
                boxShadow: boxShadow,
              ),
              child: Text(
                "Confirm",
                style: TextStyle(
                  color:
                      state
                          ? AppColors.widgetBackgroundColor
                          : AppColors.widgetBackgroundColor,
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
