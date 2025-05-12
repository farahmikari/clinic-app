part of 'morning_times_bloc.dart';

sealed class MorningTimesState {
  const MorningTimesState();
}

class FetchMorningTimesInitial extends MorningTimesState {
  final List<TimeModel> morningTimes;
  FetchMorningTimesInitial(this.morningTimes);
}

class FetchMorningTimesLoading extends MorningTimesState {}

class FetchMorningTimesLoaded extends MorningTimesState {
  final List<TimeModel> morningTimes;
  FetchMorningTimesLoaded(this.morningTimes);
}

class FetchMorningTimesFailed extends MorningTimesState {
  final String errorMessage;
  FetchMorningTimesFailed(this.errorMessage);
}
