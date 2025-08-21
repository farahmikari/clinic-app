import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/fetch_appointments_bloc.dart';
import 'package:clinic_app/app/appointments/views/widgets/appointments_widgets/appointments_widget.dart';
import 'package:clinic_app/app/appointments/views/widgets/appointments_widgets/shimmer_appointments_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/widgets/app_bar_with_filter_and_search_widget.dart';
import 'package:clinic_app/core/widgets/filter_widget/controllers/filter_bloc/filter_bloc.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  Future<void> _onRefresh(BuildContext context) async {
    context.read<FetchAppointmentsBloc>().add(FetchAppointments());
    context.read<FilterBloc>().add(FilterIsReset());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => FetchAppointmentsBloc()..add(FetchAppointments()),
        ),
        BlocProvider(create: (context) => FilterBloc()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<FetchAppointmentsBloc, FetchAppointmentsState>(
            listener: (context, state) {
              if (state is FetchAppointmentsLoaded) {
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
                context.read<FetchAppointmentsBloc>().add(
                  DisplayPendingAppointments(),
                );
              } else if (state.filterIndex == 2) {
                context.read<FetchAppointmentsBloc>().add(
                  DisplayCompletedAppointments(),
                );
              } else {
                context.read<FetchAppointmentsBloc>().add(
                  DisplayAllAppointments(),
                );
              }
            },
          ),
        ],
        child: Scaffold(
          appBar: AppBarWithFilterAndSearchWidget(
            appBarTitle: S.current.appointments,
            filterNames: [
              S.current.all,
              S.current.pending,
              S.current.completed,
            ],
          ),
          body: Builder(
            builder: (context) {
              return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                color: AppColors.primaryColor,
                backgroundColor: Theme.of(context).cardColor,
                child:
                    BlocBuilder<FetchAppointmentsBloc, FetchAppointmentsState>(
                      builder: (context, state) {
                        if (state is FetchAppointmentsLoaded) {
                          return AppointmentsWidget(
                            appointments: state.appointments,
                          );
                        }
                        return ShimmerAppointmentsWidget();
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
