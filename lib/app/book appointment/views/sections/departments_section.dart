import 'package:clinic_app/app/book%20appointment/controllers/departments%20bloc/departments_bloc.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/departments_widgets/departments_shimmer_widget.dart';
import 'package:clinic_app/app/book%20appointment/views/widgets/departments_widgets/departments_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentsSection extends StatelessWidget {
  const DepartmentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.0.hp,
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.mm),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.lbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimensions.lbr),
        child: BlocBuilder<DepartmentsBloc, DepartmentsState>(
          builder: (context, state) {
            switch (state) {
              //------------!! Loading State !!------------------------------------------------------------------------------------------------------------------------------------
              case FetchDepartmentsLoading():
                return const DepartmentsShimmerWidget();
              //------------!! Loaded State !!-------------------------------------------------------------------------------------------------------------------------------------
              case FetchDepartmentsLoaded():
                return DepartmentsWidget(departments: state.departments);
              //------------!! Failure State !!------------------------------------------------------------------------------------------------------------------------------------
              case FetchDepartmentsFailed():
                return Center(child: Text(state.errorMessage));
            }
          },
        ),
      ),
    );
  }
}
