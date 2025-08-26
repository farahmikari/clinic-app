import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
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

  @override
  Widget build(BuildContext context) {
    Color specifyFilterprimaryBackgroundColor() {
      if (filterIndex == 1) {
        return Theme.of(context).transparentPrimaryColor;
      } else if (filterIndex == 2) {
        return Theme.of(context).transparentAccentColor;
      } else {
        return Theme.of(context).accentBackgroundColor;
      }
    }

    Color specifyFilterColor() {
      if (!isActivated) {
        return Theme.of(context).hintTextColor;
      } else if (filterIndex == 0) {
        return Theme.of(context).primaryTextColor;
      } else {
        return Theme.of(context).foregroundColor;
      }
    }

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
