import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/filter_widget/controllers/filter_bloc/filter_bloc.dart';
import 'package:clinic_app/core/widgets/filter_widget/views/widgets/filter_widget.dart';
import 'package:clinic_app/core/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarWithFilterAndSearchWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithFilterAndSearchWidget({
    super.key,
    required this.appBarTitle,
    required this.filterNames,
  });
  final String appBarTitle;
  final List<String> filterNames;

  @override
  Size get preferredSize => Size.fromHeight(35.0.wp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      toolbarHeight: 20.0.wp,
      title: Text(
        appBarTitle,
        style: TextStyle(
          fontSize: AppDimensions.lfs,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(15.0.wp),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: AppDimensions.mp,
            left: AppDimensions.mp,
            right: AppDimensions.mp,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: AppDimensions.sm,
            children: [
              Expanded(flex: 3, child: SearchWidget()),
              Expanded(
                flex: 1,
                child: BlocBuilder<FilterBloc, FilterState>(
                  builder: (context, state) {
                    return FilterWidget(
                      filterIndex: state.filterIndex,
                      filterNames: filterNames,
                      isActivated: state.isFilterWidgetActivated,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
