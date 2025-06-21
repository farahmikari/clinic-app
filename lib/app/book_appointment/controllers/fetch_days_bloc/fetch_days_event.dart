part of 'fetch_days_bloc.dart';

sealed class FetchDaysEvent {}

class FetchDefaultDays extends FetchDaysEvent {}

class FetchDays extends FetchDaysEvent {
  final int departmentId;
  FetchDays({required this.departmentId});
}
