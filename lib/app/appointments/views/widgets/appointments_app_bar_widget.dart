import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/appointments_bloc.dart';
import 'package:clinic_app/app/appointments/controllers/filter%20bloc/filter_bloc.dart';
import 'package:clinic_app/app/appointments/views/widgets/filter_button_widget.dart';
import 'package:clinic_app/app/appointments/views/widgets/search_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppointmentsAppBarWidget({super.key});

  @override
  Size get preferredSize => Size.fromHeight(17.0.hp);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AppointmentsBloc>()),
        BlocProvider.value(value: getIt<FilterBloc>()),
      ],
      child: AppBar(
        backgroundColor: AppColors.backgroundColor,
        surfaceTintColor: AppColors.backgroundColor,
        title: Text(
          "Appointments",
          style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.0.hp),
          child: Padding(
            padding: EdgeInsets.only(
              left: AppDimensions.mp,
              right: AppDimensions.mp,
              bottom: AppDimensions.mp,
            ),
            child: Row(
              children: [
                SearchWidget(),
                SizedBox(width: AppDimensions.sm),
                FilterButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
