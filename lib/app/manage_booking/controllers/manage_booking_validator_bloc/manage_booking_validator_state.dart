part of 'manage_booking_validator_bloc.dart';

sealed class ManageBookingValidatorState extends Equatable {
  const ManageBookingValidatorState({
    required this.previousReservation,
    required this.currentReservation,
    required this.isReservationEditing,
    required this.isAbleToCancel,
    required this.isAbleToEdit,
  });
  final NewReservationModel previousReservation;
  final NewReservationModel currentReservation;
  final bool isReservationEditing;
  final bool isAbleToCancel;
  final bool isAbleToEdit;

  @override
  List<Object> get props => [
    previousReservation,
    currentReservation,
    isReservationEditing,
    isAbleToCancel,
    isAbleToEdit,
  ];
}

final class ManageBookingValidatorInitial extends ManageBookingValidatorState {
  ManageBookingValidatorInitial()
    : super(
        previousReservation: NewReservationModel(
          offerId: -1,
          departmentId: -1,
          doctorId: -1,
          day: "",
          timeId: -1,
          requestTypeId: -1,
          withMedicalReport: false,
        ),
        currentReservation: NewReservationModel(
          offerId: -1,
          departmentId: -1,
          doctorId: -1,
          day: "",
          timeId: -1,
          requestTypeId: -1,
          withMedicalReport: false,
        ),
        isReservationEditing: false,
        isAbleToCancel: false,
        isAbleToEdit: false,
      );
}

final class ManageBookingValidatorUpdate extends ManageBookingValidatorState {
  const ManageBookingValidatorUpdate({
    required super.previousReservation,
    required super.currentReservation,
    required super.isReservationEditing,
    required super.isAbleToCancel,
    required super.isAbleToEdit,
  });
}
