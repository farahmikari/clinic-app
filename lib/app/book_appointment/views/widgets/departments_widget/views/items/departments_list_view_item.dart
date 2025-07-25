import 'package:clinic_app/app/book_appointment/models/department_model.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/views/items/department_item.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DepartmentsListViewItem extends StatelessWidget {
  const DepartmentsListViewItem({
    super.key,
    required this.departments,
    required this.currentDepartmentId,
  });
  final List<DepartmentModel> departments;
  final int currentDepartmentId;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.sp),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return DepartmentItem(
          department: departments[index],
          currentDepartmentItem: currentDepartmentId,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: AppDimensions.sp);
      },
      itemCount: departments.length,
    );
  }
}
