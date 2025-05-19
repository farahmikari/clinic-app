import 'package:clinic_app/app/doctor/controllers/doctor%20bloc/doctor_bloc.dart';
import 'package:clinic_app/app/doctor/models/doctor_model.dart';
import 'package:clinic_app/app/doctor/views/widgets/doctor_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DoctorSection extends StatelessWidget {
  const DoctorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorBloc, DoctorState>(
      builder: (context, state) {
        switch (state) {
          //-------------------------|Loading State|-------------------------------------------------------------------------------------------------------------------------------------------
          case DoctorLoading():
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: AppColors.primaryColor,
                size: 8.0.hp,
              ),
            );
          //--------------------------|Loaded State|-------------------------------------------------------------------------------------------------------------------------------------------
          case DoctorLoaded():
            DoctorModel doctor = state.doctor;
            return DoctorWidget(doctor: doctor);
          //-------------------------|Failure State|------------------------------------------------------------------------------------------------------------------------------------------------
          case DoctorFailed():
            return Center(child: Text(state.errorMessage));
        }
      },
    );
  }
}
