part of 'fetch_day_doctors_bloc.dart';

sealed class FetchDayDoctorsState {}

final class FetchDayDoctorsLoading extends FetchDayDoctorsState {}

final class FetchDayDoctorsLoaded extends FetchDayDoctorsState {
  final DayDoctorsModel dayDoctors;

  FetchDayDoctorsLoaded({required this.dayDoctors});
}

final class FetchDayDoctorsFailed extends FetchDayDoctorsState {
  final String errorMessage;

  FetchDayDoctorsFailed({required this.errorMessage});
}
