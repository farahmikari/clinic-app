part of 'upcoming_validator_bloc.dart';

sealed class UpcomingValidatorState extends Equatable {
  const UpcomingValidatorState({
    required this.previousReservation,
    required this.currentReservation,
    required this.isReservationEditing,
    required this.isAbleToCancel,
    required this.isAbleToEdit,
  });
  final bool isReservationEditing;
  final bool isAbleToCancel;
  final bool isAbleToEdit;
  final ReservationModel previousReservation;
  final ReservationModel currentReservation;

  @override
  List<Object> get props => [
    previousReservation,
    currentReservation,
    isReservationEditing,
    isAbleToCancel,
    isAbleToEdit,
  ];
}

class UpcomingValidatorInitial extends UpcomingValidatorState {
  UpcomingValidatorInitial()
    : super(
        previousReservation: ReservationModel(
          departmentId: -1,
          doctorId: -1,
          requestTypeId: -1,
          day: "",
          timeId: -1,
          withMedicalReport: false,
        ),
        currentReservation: ReservationModel(
          departmentId: -1,
          doctorId: -1,
          requestTypeId: -1,
          day: "",
          timeId: -1,
          withMedicalReport: false,
        ),
        isReservationEditing: false,
        isAbleToCancel: false,
        isAbleToEdit: false,
      );
}

class UpcomingValidatorUpdate extends UpcomingValidatorState {
  const UpcomingValidatorUpdate({
    required super.previousReservation,
    required super.currentReservation,
    required super.isReservationEditing,
    required super.isAbleToCancel,
    required super.isAbleToEdit,
  });
}
