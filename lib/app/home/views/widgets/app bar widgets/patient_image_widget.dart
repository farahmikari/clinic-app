import 'package:clinic_app/app/user_drawer/views/screen/drawer_screen.dart';
import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/errors/constants/app_shadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class PatientImageWidget extends GetView<MyDrawerController> {
  const PatientImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toggleDrawer();
      },
      child: Container(
        margin: EdgeInsets.all(AppDimensions.mm),
        decoration: BoxDecoration(
          color: AppColors.widgetBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
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
