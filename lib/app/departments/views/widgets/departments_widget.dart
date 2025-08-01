import 'package:clinic_app/app/book_appointment/models/department_model.dart';
import 'package:clinic_app/app/departments/views/widgets/department_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/widgets.dart';

class DepartmentsWidget extends StatelessWidget {
  const DepartmentsWidget({super.key, required this.departments});
  final List<DepartmentModel> departments;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(AppDimensions.mp),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppDimensions.sm,
        mainAxisSpacing: AppDimensions.sm,
        mainAxisExtent: 20.0.hp,
      ),
      itemBuilder: (context, index) {
        return DepartmentWidget(department: departments[index]);
      },
      itemCount: departments.length,
    );
  }
}
