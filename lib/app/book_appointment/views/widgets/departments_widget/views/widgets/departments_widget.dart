import 'package:clinic_app/app/book_appointment/models/department_model.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/controller/departments_bloc/departments_bloc.dart';
import 'package:clinic_app/app/book_appointment/views/widgets/departments_widget/views/items/departments_list_view_item.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentsWidget extends StatelessWidget {
  const DepartmentsWidget({super.key, required this.departments});
  final List<DepartmentModel> departments;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0.hp,
      decoration: BoxDecoration(
        color: Theme.of(context).accentBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.lbr),
        boxShadow: AppShadow.boxShadow,
      ),
      clipBehavior: Clip.hardEdge,
      child: BlocBuilder<DepartmentsBloc, DepartmentsState>(
        builder: (context, state) {
          return DepartmentsListViewItem(
            departments: departments,
            currentDepartmentId: state.currentDepartmentId,
          );
        },
      ),
    );
  }
}
