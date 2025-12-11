import 'package:clinic_app/app/book_appointment/models/department_model.dart';
import 'package:clinic_app/app/department_doctors/controllers/fetch_department_doctors/fetch_department_doctors_bloc.dart';
import 'package:clinic_app/app/department_doctors/views/widgets/department_doctors_widget.dart';
import 'package:clinic_app/app/department_doctors/views/widgets/shimmer_department_doctors.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/widgets/app_bar_with_filter_and_search_widget.dart';
import 'package:clinic_app/core/widgets/empty_list_widget.dart';
import 'package:clinic_app/core/widgets/filter_widget/controllers/filter_bloc/filter_bloc.dart';
import 'package:clinic_app/core/widgets/search_widget/controllers/search_bloc/search_bloc.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentDoctorsScreen extends StatelessWidget {
  const DepartmentDoctorsScreen({super.key, required this.department});
  final DepartmentModel department;

  Future<void> _onRefresh(BuildContext context) async {
    String searchWord = context.read<SearchBloc>().state.searchWord;
    int filterIndex = context.read<FilterBloc>().state.filterIndex;
    context.read<FetchDepartmentDoctorsBloc>().add(
      FetchDepartmentDoctors(
        departmentId: department.id,
        searchWord: searchWord,
        filterIndex: filterIndex,
      ),
    );
    //context.read<FilterBloc>().add(FilterIsReset());
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
        BlocProvider(create: (context) => SearchBloc()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FetchDepartmentDoctorsBloc, FetchDepartmentDoctorsState>(
            listener: (context, state) {
              if (state is FetchDepartmentDoctorsLoading) {
                context.read<FilterBloc>().add(FilterWidgetIsDeactivated());
              } else {
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
          BlocListener<SearchBloc, SearchState>(
            listener: (context, state) {
              int filterIndex = context.read<FilterBloc>().state.filterIndex;
              context.read<FetchDepartmentDoctorsBloc>().add(
                FetchDepartmentDoctors(
                  departmentId: department.id,
                  searchWord: state.searchWord,
                  filterIndex: filterIndex,
                ),
              );
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
                  color: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).accentBackgroundColor,
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
                      if (state is FetchDepartmentDoctorsLoadedEmpty) {
                        return EmptyListWidget(
                          image: "assets/images/empty_doctors.png",
                          title: S.current.department_doctors_empty_title,
                          subtitle: S.current.department_doctors_empty_subtitle,
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
