import 'package:clinic_app/app/book_appointment/models/department_model.dart';
import 'package:clinic_app/app/department_doctors/views/screens/department_doctors_screen.dart';
import 'package:clinic_app/app/departments/views/widgets/department_name_widget.dart';
import 'package:clinic_app/app/departments/views/widgets/shift_doctors_count_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DepartmentWidget extends StatelessWidget {
  const DepartmentWidget({super.key, required this.department});
  final DepartmentModel department;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DepartmentDoctorsScreen(department: department),
          transition: Transition.zoom,
        );
      },
      child: Container(
        padding: EdgeInsets.all(AppDimensions.mp),
        decoration: BoxDecoration(
          color: Theme.of(context).accentBackgroundColor,
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: AppDimensions.sp,
                  children: [
                    ShiftDoctorsCountWidget(
                      color: Theme.of(context).primaryColor,
                      shift: S.current.morning_doctors_count(
                        department.morningDoctorsCount,
                      ),
                    ),
                    ShiftDoctorsCountWidget(
                      color: Theme.of(context).accentColor,
                      shift: S.current.afternoon_doctors_count(
                        department.afternoonDoctorsCount,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: DepartmentNameWidget(name: department.name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
