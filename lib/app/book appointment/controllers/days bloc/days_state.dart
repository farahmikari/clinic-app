part of 'days_bloc.dart';

sealed class DaysState {}

class FetchDaysInitial extends DaysState {
  final List<DayModel> days;
  FetchDaysInitial(this.days);
}

class FetchDaysLoading extends DaysState {}

class FetchDaysLoaded extends DaysState {
  final List<DayModel> days;
  FetchDaysLoaded(this.days);
}

class FetchDaysFailed extends DaysState {
  final String errorMessage;
  FetchDaysFailed(this.errorMessage);
}
