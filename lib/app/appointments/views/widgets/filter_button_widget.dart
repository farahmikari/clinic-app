import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/appointments_bloc.dart';
import 'package:clinic_app/app/appointments/controllers/filter%20bloc/filter_bloc.dart';
import 'package:clinic_app/core/errors/constants/app_dimensions.dart';
import 'package:clinic_app/core/errors/constants/app_shadow.dart'
    show AppShadow;
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/errors/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Color specifyFilterButtonBackgroundColor(String filterName) {
      switch (filterName) {
        case "Pending":
          return AppColors.transparentGreen;
        case "Completed":
          return AppColors.transparentYellow;
        default:
          return AppColors.widgetBackgroundColor;
      }
    }

    Color specifyFilterNameColor(String filterName) {
      switch (filterName) {
        case "All":
          return AppColors.mainTextColor;
        default:
          return AppColors.widgetBackgroundColor;
      }
    }

    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        final appointmentState = context.watch<AppointmentsBloc>().state;
        return InkWell(
          onTap: () {
            if (appointmentState is AppointmentsLoaded) {
              context.read<FilterBloc>().add(FilterChanged());
            }
          },
          borderRadius: BorderRadius.circular(AppDimensions.mbr),
          child: Container(
            height: 7.0.hp,
            width: 22.0.wp,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: specifyFilterButtonBackgroundColor(state.filterName),
              borderRadius: BorderRadius.circular(AppDimensions.mbr),
              boxShadow: AppShadow.boxShadow,
            ),
            child: Text(
              state.filterName,
              style: TextStyle(
                color: specifyFilterNameColor(state.filterName),
                fontSize: AppDimensions.sfs,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
