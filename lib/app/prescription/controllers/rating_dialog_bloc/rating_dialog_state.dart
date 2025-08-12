part of 'rating_dialog_bloc.dart';

sealed class RatingDialogState {
  RatingDialogState({required this.rating, required this.appointmentId});
  final int appointmentId;
  final num rating;
}

final class RatingDialogInitial extends RatingDialogState {
  RatingDialogInitial() : super(rating: 3, appointmentId: -1);
}

final class RatingDialogVisible extends RatingDialogState {
  RatingDialogVisible({required super.rating, required super.appointmentId});
}

final class RatingDialogUpdate extends RatingDialogState {
  RatingDialogUpdate({required super.rating, required super.appointmentId});
}
