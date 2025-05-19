import 'package:clinic_app/app/book%20appointment/controllers/confirm%20bloc/confirm_bloc.dart';
import 'package:clinic_app/app/book%20appointment/controllers/picked%20appointment%20info%20bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/app/book%20appointment/models/book_appointment_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmButtonWidget extends StatelessWidget {
  const ConfirmButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.all(AppDimensions.mp),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppDimensions.lbr),
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
              padding: EdgeInsets.all(AppDimensions.mp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: state ? AppColors.primaryColor : AppColors.hintTextColor,
                borderRadius: BorderRadius.circular(AppDimensions.lbr),
                boxShadow: AppShadow.boxShadow,
              ),
              child: Text(
                "Confirm",
                style: TextStyle(
                  color:
                      state
                          ? AppColors.widgetBackgroundColor
                          : AppColors.widgetBackgroundColor,
                  fontSize: AppDimensions.lfs,
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
