part of 'fetch_times_bloc.dart';

sealed class FetchTimesEvent {}

class FetchDefaultTimes extends FetchTimesEvent {
  final String shift;

  FetchDefaultTimes({required this.shift});
}

class FetchTimes extends FetchTimesEvent {
  final int departmentId;
  final String day;
  final String shift;
  FetchTimes({
    required this.departmentId,
    required this.day,
    required this.shift,
  });
}
