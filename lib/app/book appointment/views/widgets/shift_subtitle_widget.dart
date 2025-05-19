import 'package:clinic_app/app/book%20appointment/controllers/department%20doctor%20bloc/department_doctor_bloc.dart';
import 'package:clinic_app/app/doctor/views/screens/doctor_profile_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ShiftSubtitleWidget extends StatelessWidget {
  const ShiftSubtitleWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
      title: Text(
        title,
        style: TextStyle(
          color: AppColors.mainTextColor,
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: BlocBuilder<DepartmentDoctorBloc, DepartmentDoctorState>(
        builder: (context, state) {
          switch (state) {
            case DepartmentDoctorLoading():
              return SizedBox();
            case DepartmentDoctorLoaded():
              return TextButton(
                onPressed: () {
                  if (title == "Morning") {
                    Get.to(
                      () =>
                          DoctorProfileScreen(id: state.morningShiftDoctor.id),
                    );
                  } else {
                    Get.to(
                      () => DoctorProfileScreen(
                        id: state.afternoonShiftDoctor.id,
                      ),
                    );
                  }
                },
                child: Text(
                  "Doctor Profile",
                  style: const TextStyle(color: AppColors.primaryColor),
                ),
              );
            case DepartmentDoctorFailed():
              return SizedBox();
          }
        },
      ),
    );
  }
}
