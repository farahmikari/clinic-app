part of 'fetch_days_bloc.dart';

sealed class FetchDaysState {}

class FetchDaysLoading extends FetchDaysState {}

class FetchDaysLoaded extends FetchDaysState {
  final List<DayModel> days;
  FetchDaysLoaded(this.days);
}

class FetchDaysFailed extends FetchDaysState {
  final String errorMessage;
  FetchDaysFailed(this.errorMessage);
}
