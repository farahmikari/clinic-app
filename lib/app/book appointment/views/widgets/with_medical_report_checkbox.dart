import 'package:clinic_app/app/book%20appointment/controllers/picked%20appointment%20info%20bloc/picked_appointment_info_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WithMedicalReportCheckbox extends StatelessWidget {
  const WithMedicalReportCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      PickedAppointmentInfoBloc,
      PickedAppointmentInfoState,
      bool
    >(
      selector: (state) {
        return state.withMedicalReport;
      },
      builder: (context, state) {
        return CheckboxListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
          value: state,
          onChanged: (value) {
            context.read<PickedAppointmentInfoBloc>().add(
              WithMedicalReportToggled(withMedicalReport: value!),
            );
          },
          title: Text(
            "Do you need a medical report?",
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
          ),
          activeColor: AppColors.primaryColor,
        );
      },
    );
  }
}
