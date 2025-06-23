import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';

part 'fetch_reservation_event.dart';
part 'fetch_reservation_state.dart';

class FetchReservationBloc
    extends Bloc<FetchReservationEvent, FetchReservationState> {
  FetchReservationBloc() : super(FetchReservationLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    late bool hasFetched = false;
    late ReservationModel reservation;

    on<FetchReservation>((event, emit) async {
      if (hasFetched) {
        emit(FetchReservationLoaded(reservation: reservation));
        return;
      }
      emit(FetchReservationLoading());
      try {
        dynamic response = await api.get(
          EndPoints.getReservation(event.appointmentId),
        );
        reservation = ReservationModel.fromJson(response);
        hasFetched = true;
        emit(FetchReservationLoaded(reservation: reservation));
      } catch (e) {
        emit(
          FetchReservationFailed(
            errorMessage:
                "Something Went Wrong When Trying To Fetch Reservation",
          ),
        );
      }
    });
  }
}
