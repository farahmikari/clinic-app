part of 'fetch_days_bloc.dart';

sealed class FetchDaysState {}

class FetchDepartmentDaysLoading extends FetchDaysState {}

class FetchDepartmentDaysLoaded extends FetchDaysState {
  final List<DayModel> days;
  FetchDepartmentDaysLoaded(this.days);
}

class FetchDepartmentDaysFailed extends FetchDaysState {
  final String errorMessage;
  FetchDepartmentDaysFailed(this.errorMessage);
}
