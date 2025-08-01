part of 'most_rated_doctors_bloc.dart';

sealed class MostRatedDoctorsState {}

final class MostRatedDoctorsLoading extends MostRatedDoctorsState {}

final class MostRatedDoctorsLoaded extends MostRatedDoctorsState {
  final List<MostRatedDoctorModel> mostRatedDoctors;

  MostRatedDoctorsLoaded({required this.mostRatedDoctors});
}

final class MostRatedDoctorsFailed extends MostRatedDoctorsState {
  final String errorMessage;

  MostRatedDoctorsFailed({required this.errorMessage});
}
