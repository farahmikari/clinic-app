part of 'send_cancel_or_edit_reservation_bloc.dart';

sealed class SendCancelOrEditReservationState {}

class SendCancelOrEditReservationInitial
    extends SendCancelOrEditReservationState {}

class SendCancelOrEditReservationLoading
    extends SendCancelOrEditReservationState {}

class SendCancelOrEditReservationLoaded
    extends SendCancelOrEditReservationState {}

class SendCancelOrEditReservationFailed
    extends SendCancelOrEditReservationState {
  final String errorMessage;

  SendCancelOrEditReservationFailed({required this.errorMessage});
}
