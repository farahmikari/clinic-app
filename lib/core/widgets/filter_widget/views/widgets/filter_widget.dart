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
    required this.filterIndex,
    required this.filterNames,
    required this.isActivated,
  });
  final int filterIndex;
  final List<String> filterNames;
  final bool isActivated;

  Color specifyFilterprimaryBackgroundColor() {
    if (filterIndex == 1) {
      return AppColors.transparentPrimaryColor;
    } else if (filterIndex == 2) {
      return AppColors.transparentAccentColor;
    } else {
      return AppColors.accentBackgroundColor;
    }
  }

  Color specifyFilterColor() {
    if (!isActivated) {
      return AppColors.hintTextColor;
    } else if (filterIndex == 0) {
      return AppColors.primaryTextColor;
    } else {
      return AppColors.accentBackgroundColor;
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
          color: specifyFilterprimaryBackgroundColor(),
          borderRadius: BorderRadius.circular(AppDimensions.sbr),
          boxShadow: AppShadow.boxShadow,
        ),
        child: Text(
          filterNames[filterIndex],
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
