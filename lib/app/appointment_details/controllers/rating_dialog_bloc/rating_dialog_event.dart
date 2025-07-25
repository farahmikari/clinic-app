part of 'rating_dialog_bloc.dart';

sealed class RatingDialogEvent {}

final class RatingDialogIsDisplayed extends RatingDialogEvent {
  final int appointmentId;
  RatingDialogIsDisplayed({required this.appointmentId});
}

final class RatingIsSubmited extends RatingDialogEvent {}

final class RatingDialogIsUpdated extends RatingDialogEvent {
  final num rating;

  RatingDialogIsUpdated({required this.rating});
}
