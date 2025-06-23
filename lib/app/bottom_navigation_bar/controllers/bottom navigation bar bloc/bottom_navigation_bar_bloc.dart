import 'package:clinic_app/app/appointments/controllers/appointments%20bloc/appointments_bloc.dart';
import 'package:clinic_app/app/home/controllers/most%20rated%20doctors%20bloc/most_rated_doctors_bloc.dart';
import 'package:clinic_app/service_locator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial()) {
    final MostRatedDoctorsBloc mostRatedDoctorsBloc =
        getIt<MostRatedDoctorsBloc>();
    final AppointmentsBloc appointmentsBloc = getIt<AppointmentsBloc>();

    on<CurrentIndexChanged>((event, emit) {
      List<bool> isDataFetched = state.isDataFetched;
      if (!isDataFetched[event.currentIndex]) {
        if (event.currentIndex == 0) {
          mostRatedDoctorsBloc.add(FetchMostRatedDoctors());
        } else if (event.currentIndex == 1) {
          appointmentsBloc.add(FetchAppointments());
        }
        isDataFetched[event.currentIndex] = true;
      }
      emit(
        UpdateBottomNavigationBar(
          currentIndex: event.currentIndex,
          isDataFetched: isDataFetched,
        ),
      );
    });
  }
}
