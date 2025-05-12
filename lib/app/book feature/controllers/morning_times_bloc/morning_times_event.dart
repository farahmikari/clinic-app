part of 'morning_times_bloc.dart';

sealed class MorningTimesEvent {}

class FetchDefaultMorningTimes extends MorningTimesEvent {}

class FetchMorningTimes extends MorningTimesEvent {
  final int dayId;
  FetchMorningTimes(
    this.dayId,
  );
}
