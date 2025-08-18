import 'package:clinic_app/app/book_appointment/controllers/fetch_departments_bloc/fetch_departments_bloc.dart';
import 'package:clinic_app/app/departments/views/widgets/departments_widget.dart';
import 'package:clinic_app/app/departments/views/widgets/shimmer_departments_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/widgets/app_bar_with_search_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentsScreen extends StatelessWidget {
  const DepartmentsScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<FetchDepartmentsBloc>().add(FetchDepartments());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchDepartmentsBloc()..add(FetchDepartments()),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBarWithSearchWidget(title: S.current.departments),
        body: Builder(
          builder: (context) {
            return RefreshIndicator(
              onRefresh: () => _onRefresh(context),
              color: AppColors.primaryColor,
              backgroundColor: AppColors.widgetBackgroundColor,
              child: BlocBuilder<FetchDepartmentsBloc, FetchDepartmentsState>(
                builder: (context, state) {
                  if (state is FetchDepartmentsLoaded) {
                    return DepartmentsWidget(departments: state.departments);
                  }
                  return ShimmerDepartmentsWidget();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
