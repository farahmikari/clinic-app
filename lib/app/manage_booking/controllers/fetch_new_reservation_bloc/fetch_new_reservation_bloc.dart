import 'package:clinic_app/app/manage_booking/models/json_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/app/book_appointment/models/new_reservation_model.dart';
import 'package:equatable/equatable.dart';

part 'fetch_new_reservation_event.dart';
part 'fetch_new_reservation_state.dart';

class FetchNewReservationBloc
    extends Bloc<FetchNewReservationEvent, FetchNewReservationState> {
  FetchNewReservationBloc() : super(FetchNewReservationLoading()) {
    on<NewReservationIsFetched>((event, emit) async {
      await Future.delayed(Duration(seconds: 4));
      try {
        final NewReservationModel reservation = NewReservationModel.fromJson(
          myPendingAppointmentsReservations[event.appointmentId]
              as Map<String, dynamic>,
        );
        emit(FetchNewReservationLoaded(reservation: reservation));
      } catch (e) {
        emit(FetchNewReservationFailed(errorMessage: e.toString()));
      }
    });
  }
}
