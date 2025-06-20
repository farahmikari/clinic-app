part of 'days_bloc.dart';

sealed class DaysEvent {
  const DaysEvent();
}

class FetchDefaultDays extends DaysEvent {}

class FetchDays extends DaysEvent {
  final int departmentId;
  FetchDays(this.departmentId);
}
