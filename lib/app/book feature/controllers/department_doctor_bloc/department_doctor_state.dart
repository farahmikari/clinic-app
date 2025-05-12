part of 'department_doctor_bloc.dart';

sealed class DepartmentDoctorState {}

final class DepartmentDoctorLoading extends DepartmentDoctorState {}

final class DepartmentDoctorLoaded extends DepartmentDoctorState {
  final DepartmentDoctorModel morningShiftDoctor;
  final DepartmentDoctorModel afternoonShiftDoctor;

  DepartmentDoctorLoaded({
    required this.afternoonShiftDoctor,
    required this.morningShiftDoctor,
  });
}

final class DepartmentDoctorFailed extends DepartmentDoctorState {}
