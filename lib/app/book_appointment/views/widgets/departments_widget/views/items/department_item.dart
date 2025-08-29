import 'package:clinic_app/app/book_appointment/models/department_model.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/controller/departments_bloc/departments_bloc.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
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
    Color specifyprimaryBackgroundColor() {
      if (currentDepartmentItem == department.id) {
        return Theme.of(context).primaryColor;
      } else {
        return Theme.of(context).accentBackgroundColor;
      }
    }

    Color specifyTitleColor() {
      if (currentDepartmentItem == department.id) {
        return Theme.of(context).foregroundColor;
      } else {
        return Theme.of(context).primaryTextColor;
      }
    }

    return GestureDetector(
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
          color: specifyprimaryBackgroundColor(),
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
