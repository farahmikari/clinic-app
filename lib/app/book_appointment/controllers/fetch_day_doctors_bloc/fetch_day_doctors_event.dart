part of 'fetch_day_doctors_bloc.dart';

sealed class FetchDayDoctorsEvent {}

class FetchDayDoctors extends FetchDayDoctorsEvent {
  final String day;

  FetchDayDoctors({required this.day});
}
