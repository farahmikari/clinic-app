part of 'doctor_bloc.dart';

sealed class DoctorState {}

final class DoctorLoading extends DoctorState {}

final class DoctorLoaded extends DoctorState {
  final DoctorModel doctor;

  DoctorLoaded({required this.doctor});
}

final class DoctorFailed extends DoctorState {
  final String errorMessage;

  DoctorFailed({required this.errorMessage});
}
