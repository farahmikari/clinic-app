import 'package:clinic_app/app/book_appointment/models/department_model.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/controller/departments_bloc/departments_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentItem extends StatelessWidget {
  const DepartmentItem({
    super.key,
    required this.department,
    required this.currentDepartmentItem,
  });
  final DepartmentModel department;
  final int currentDepartmentItem;

  @override
  Widget build(BuildContext context) {
    Color specifyBackgroundColor() {
      if (currentDepartmentItem == department.id) {
        return AppColors.primaryColor;
      } else {
        return AppColors.widgetBackgroundColor;
      }
    }

    Color specifyTitleColor() {
      if (currentDepartmentItem == department.id) {
        return AppColors.widgetBackgroundColor;
      } else {
        return AppColors.mainTextColor;
      }
    }

    return InkWell(
      borderRadius: BorderRadius.circular(AppDimensions.lbr),
      onTap: () {
        context.read<DepartmentsBloc>().add(
          DepartmentIdChanged(departmentId: department.id),
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: AppDimensions.sm),
        padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
        decoration: BoxDecoration(
          color: specifyBackgroundColor(),
          borderRadius: BorderRadius.circular(AppDimensions.lbr),
        ),
        child: Text(
          department.name,
          style: TextStyle(
            color: specifyTitleColor(),
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
