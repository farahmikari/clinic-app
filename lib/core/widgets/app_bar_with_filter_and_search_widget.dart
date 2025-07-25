import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/filter_widget/controllers/filter_bloc/filter_bloc.dart';
import 'package:clinic_app/core/widgets/filter_widget/views/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWithFilterAndSearchWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarWithFilterAndSearchWidget({
    super.key,
    required this.whiteFilterName,
    required this.greenFilterName,
    required this.yelloFilterName,
    required this.appBarTitle,
    required this.searchHintText,
  });
  final String appBarTitle;
  final String searchHintText;
  final String whiteFilterName;
  final String greenFilterName;
  final String yelloFilterName;

  @override
  Size get preferredSize => Size.fromHeight(35.0.wp);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      toolbarHeight: 20.0.wp,
      title: Text(
        appBarTitle,
        style: TextStyle(
          color: AppColors.mainTextColor,
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
              Expanded(
                flex: 3,
                child: Container(
                  height: 15.0.wp,
                  padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
                  decoration: BoxDecoration(
                    color: AppColors.widgetBackgroundColor,
                    borderRadius: BorderRadius.circular(AppDimensions.lbr),
                    boxShadow: AppShadow.boxShadow,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: AppDimensions.mp,
                    children: [
                      SvgPicture.asset(
                        AppIcons.search,
                        height: AppDimensions.sis,
                        width: AppDimensions.mis,
                        color: AppColors.darkGreyColor,
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(
                            color: AppColors.mainTextColor,
                            fontSize: AppDimensions.mfs,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: searchHintText,
                            hintStyle: TextStyle(
                              color: AppColors.hintTextColor,
                              fontSize: AppDimensions.mfs,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(0.0),
                          ),
                          cursorColor: AppColors.mainTextColor,
                          autocorrect: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: BlocBuilder<FilterBloc, FilterState>(
                  builder: (context, state) {
                    return FilterWidget(
                      filter: state.filterName,
                      whiteFilterName: whiteFilterName,
                      greenFilterName: greenFilterName,
                      yelloFilterName: yelloFilterName,
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
