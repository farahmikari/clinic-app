part of 'book_appointment_validator_bloc.dart';

sealed class BookAppointmentValidatorState {
  BookAppointmentValidatorState({
    required this.currentReservation,
    required this.isValid,
  });
  final ReservationModel currentReservation;
  final bool isValid;
}

final class BookAppointmentValidatorInitial
    extends BookAppointmentValidatorState {
  BookAppointmentValidatorInitial()
    : super(
        currentReservation: ReservationModel(
          departmentId: -1,
          requestTypeId: -1,
          day: "",
          doctorId: -1,
          timeId: -1,
          withMedicalReport: false,
        ),
        isValid: false,
      );
}

final class BookAppointmentValidatorUpdate
    extends BookAppointmentValidatorState {
  BookAppointmentValidatorUpdate({
    required super.currentReservation,
    required super.isValid,
  });
}
