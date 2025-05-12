part of 'afternoon_times_bloc.dart';

sealed class AfternoonTimesEvent {}

class FetchDefaultAfternoonTimes extends AfternoonTimesEvent {}

class FetchAfternoonTimes extends AfternoonTimesEvent {
  final int dayId;
  FetchAfternoonTimes(
    this.dayId,
  );
}
