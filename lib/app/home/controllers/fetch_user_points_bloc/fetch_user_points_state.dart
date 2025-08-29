part of 'fetch_user_points_bloc.dart';

sealed class FetchUserPointsState {}

final class FetchUserPointsLoading extends FetchUserPointsState {}

final class FetchUserPointsLoaded extends FetchUserPointsState {
  final UserPointsModel userPoints;

  FetchUserPointsLoaded({required this.userPoints});
}

final class FetchUserPointsFailed extends FetchUserPointsState {
  final String errorMessage;

  FetchUserPointsFailed({required this.errorMessage});
}
