import 'package:clinic_app/app/book_appointment/controllers/fetch_departments_bloc/fetch_departments_bloc.dart';
import 'package:clinic_app/app/departments/views/widgets/departments_widget.dart';
import 'package:clinic_app/app/departments/views/widgets/shimmer_departments_widget.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/widgets/app_bar_with_search_widget.dart';
import 'package:clinic_app/core/widgets/empty_list_widget.dart';
import 'package:clinic_app/core/widgets/search_widget/controllers/search_bloc/search_bloc.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DepartmentsScreen extends StatelessWidget {
  const DepartmentsScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    String searchWord = context.read<SearchBloc>().state.searchWord;
    context.read<FetchDepartmentsBloc>().add(
      FetchDepartments(searchWord: searchWord),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchDepartmentsBloc()..add(FetchDepartments()),
        ),
        BlocProvider(create: (context) => SearchBloc()),
      ],
      child: BlocListener<SearchBloc, SearchState>(
        listener: (context, state) {
          context.read<FetchDepartmentsBloc>().add(
            FetchDepartments(searchWord: state.searchWord),
          );
        },
        child: Scaffold(
          appBar: AppBarWithSearchWidget(title: S.current.departments),
          body: Builder(
            builder: (context) {
              return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                color: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).accentBackgroundColor,
                child: BlocBuilder<FetchDepartmentsBloc, FetchDepartmentsState>(
                  builder: (context, state) {
                    if (state is FetchDepartmentsLoaded) {
                      return DepartmentsWidget(departments: state.departments);
                    }
                    if (state is FetchDepartmentsLoadedEmpty) {
                      return EmptyListWidget(
                        image: "assets/images/empty_departments.png",
                        title: S.current.departments_empty_title,
                        subtitle: S.current.departments_empty_subtitle,
                      );
                    }
                    return ShimmerDepartmentsWidget();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
