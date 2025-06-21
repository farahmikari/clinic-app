part of 'fetch_times_bloc.dart';

sealed class FetchTimesState {}

class FetchTimesLoading extends FetchTimesState {}

class FetchTimesLoaded extends FetchTimesState {
  final List<TimeModel> dayTimes;
  final int doctorId;
  FetchTimesLoaded({required this.dayTimes, required this.doctorId});
}

class FetchTimesFailed extends FetchTimesState {
  final String errorMessage;
  FetchTimesFailed(this.errorMessage);
}
