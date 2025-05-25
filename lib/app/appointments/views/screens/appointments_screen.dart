import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/appointments_bloc.dart';
import 'package:clinic_app/app/appointments/controllers/filter%20bloc/filter_bloc.dart';
import 'package:clinic_app/app/appointments/views/sections/appointments_section.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<FilterBloc>().add(FilterChangedToAll());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<AppointmentsBloc>()),
        BlocProvider.value(value: getIt<FilterBloc>()),
      ],
      child: Builder(
        builder: (context) {
          return RefreshIndicator(
            onRefresh: () => _onRefresh(context),
            color: AppColors.primaryColor,
            backgroundColor: AppColors.widgetBackgroundColor,
            child: SafeArea(child: AppointmentsSection()),
          );
        },
      ),
    );
  }
}
