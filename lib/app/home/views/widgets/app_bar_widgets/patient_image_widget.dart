import 'package:clinic_app/app/user_drawer/controllers/bloc/drawer_bloc/drawer_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class PatientImageWidget extends StatelessWidget {
  const PatientImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<DrawerBloc>().add(ToggleDrawerEvent());
      },
      child: Container(
        margin: EdgeInsets.all(AppDimensions.mm),
        decoration: BoxDecoration(
          color: AppColors.widgetBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.sbr),
          boxShadow: AppShadow.boxShadow,
        ),
        clipBehavior: Clip.hardEdge,
        child: const Image(
          image: AssetImage("assets/images/patient.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
