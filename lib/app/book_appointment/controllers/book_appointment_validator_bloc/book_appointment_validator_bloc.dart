import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_appointment_validator_event.dart';
part 'book_appointment_validator_state.dart';

class BookAppointmentValidatorBloc
    extends Bloc<BookAppointmentValidatorEvent, BookAppointmentValidatorState> {
  BookAppointmentValidatorBloc() : super(BookAppointmentValidatorInitial()) {
    on<CheckConfirmAbility>((event, emit) {
      ReservationModel currentReservation = state.currentReservation.copyWith(
        offerId: event.offerId,
        departmentId: event.departmentId,
        doctorId: event.doctorId,
        requestTypeId: event.requestTypeId,
        date: event.day,
        slotId: event.timeId,
        withMedicalReport: event.withMedicalReport,
      );
      emit(
        BookAppointmentValidatorUpdate(
          currentReservation: currentReservation,
          isValid: _isValid(reservation: currentReservation),
        ),
      );
    });
  }
  bool _isValid({required ReservationModel reservation}) {
    return reservation.departmentId != -1 &&
        reservation.requestTypeId != -1 &&
        reservation.date.isNotEmpty &&
        reservation.doctorId != -1 &&
        reservation.slotId != -1;
  }
}
