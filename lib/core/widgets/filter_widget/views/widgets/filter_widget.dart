import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/filter_widget/controllers/filter_bloc/filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.filter,
    required this.whiteFilterName,
    required this.greenFilterName,
    required this.yelloFilterName,
    required this.isActivated,
  });

  final String filter;
  final String whiteFilterName;
  final String greenFilterName;
  final String yelloFilterName;
  final bool isActivated;

  Color specifyFilterBackgroundColor() {
    if (filter == greenFilterName) {
      return AppColors.transparentGreen;
    } else if (filter == yelloFilterName) {
      return AppColors.transparentYellow;
    } else {
      return AppColors.widgetBackgroundColor;
    }
  }

  Color specifyFilterColor() {
    if (!isActivated) {
      return AppColors.hintTextColor;
    } else if (filter == whiteFilterName) {
      return AppColors.mainTextColor;
    } else {
      return AppColors.widgetBackgroundColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isActivated) {
          context.read<FilterBloc>().add(FilterIsChanged());
        }
      },
      borderRadius: BorderRadius.circular(AppDimensions.sbr),
      child: Container(
        height: 15.0.wp,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: specifyFilterBackgroundColor(),
          borderRadius: BorderRadius.circular(AppDimensions.sbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Text(
          filter,
          style: TextStyle(
            color: specifyFilterColor(),
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
