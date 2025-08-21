import 'package:clinic_app/app/book_appointment/models/department_model.dart';
import 'package:clinic_app/app/department_doctors/controllers/fetch_department_doctors/fetch_department_doctors_bloc.dart';
import 'package:clinic_app/app/department_doctors/views/widgets/department_doctors_widget.dart';
import 'package:clinic_app/app/department_doctors/views/widgets/shimmer_department_doctors.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/widgets/app_bar_with_filter_and_search_widget.dart';
import 'package:clinic_app/core/widgets/filter_widget/controllers/filter_bloc/filter_bloc.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentDoctorsScreen extends StatelessWidget {
  const DepartmentDoctorsScreen({super.key, required this.department});
  final DepartmentModel department;

  Future<void> _onRefresh(BuildContext context) async {
    context.read<FetchDepartmentDoctorsBloc>().add(
      FetchDepartmentDoctors(departmentId: department.id),
    );
    context.read<FilterBloc>().add(FilterIsReset());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FetchDepartmentDoctorsBloc()
                    ..add(FetchDepartmentDoctors(departmentId: department.id)),
        ),
        BlocProvider(create: (context) => FilterBloc()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FetchDepartmentDoctorsBloc, FetchDepartmentDoctorsState>(
            listener: (context, state) {
              if (state is FetchDepartmentDoctorsLoaded) {
                context.read<FilterBloc>().add(FilterWidgetIsActivated());
              }
            },
          ),
          BlocListener<FilterBloc, FilterState>(
            listenWhen: (previous, current) {
              return current.isFilterWidgetActivated == true;
            },
            listener: (context, state) {
              if (state.filterIndex == 1) {
                context.read<FetchDepartmentDoctorsBloc>().add(
                  DisplayMorningDepartmentDoctors(),
                );
              } else if (state.filterIndex == 2) {
                context.read<FetchDepartmentDoctorsBloc>().add(
                  DisplayAfternoonDepartmentDoctors(),
                );
              } else {
                context.read<FetchDepartmentDoctorsBloc>().add(
                  DisplayAllDepartmentDoctors(),
                );
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBarWithFilterAndSearchWidget(
            appBarTitle: department.name,
            filterNames: [
              S.current.all,
              S.current.morning,
              S.current.afternoon,
            ],
          ),
          body: SafeArea(
            child: Builder(
              builder: (context) {
                return RefreshIndicator(
                  onRefresh: () => _onRefresh(context),
                  color: AppColors.primaryColor,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: BlocBuilder<
                    FetchDepartmentDoctorsBloc,
                    FetchDepartmentDoctorsState
                  >(
                    builder: (context, state) {
                      if (state is FetchDepartmentDoctorsLoaded) {
                        return DepartmentDoctorsWidget(
                          departmentDoctors: state.departmentDoctors,
                        );
                      }
                      return ShimmerDepartmentDoctors();
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
