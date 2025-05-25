import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/appointments_bloc.dart';
import 'package:clinic_app/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial("All")) {
    AppointmentsBloc appointments = getIt<AppointmentsBloc>();
    final List<String> filters = ["All", "Upcoming", "Completed"];
    int counter = 1;

    on<FilterChanged>((event, emit) {
      if (filters[counter] == "Upcoming") {
        appointments.add(DisplayUpcomingAppointments());
      } else if (filters[counter] == "Completed") {
        appointments.add(DisplayCompletedAppointments());
      } else {
        appointments.add(DisplayAllAppointments());
      }
      emit(UpdateFilterName(filters[counter]));
      counter = (counter + 1) % filters.length;
    });

    on<FilterChangedToAll>((event, emit) {
      appointments.add(FetchAppointments());
      emit(UpdateFilterName(filters[0]));
      counter = 1;
    });
  }
}
