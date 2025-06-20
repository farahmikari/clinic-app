part of 'afternoon_times_bloc.dart';

sealed class AfternoonTimesState {
  const AfternoonTimesState();
}

class FetchAfternoonTimesInitial extends AfternoonTimesState {
  final List<TimeModel> afternoonTimes;
  FetchAfternoonTimesInitial(this.afternoonTimes);
}

class FetchAfternoonTimesLoading extends AfternoonTimesState {}

class FetchAfternoonTimesLoaded extends AfternoonTimesState {
  final List<TimeModel> afternoonTimes;
  FetchAfternoonTimesLoaded(this.afternoonTimes);
}

class FetchAfternoonTimesFailed extends AfternoonTimesState {
  final String errorMessage;
  FetchAfternoonTimesFailed(this.errorMessage);
}
