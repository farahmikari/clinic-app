part of 'department_doctor_bloc.dart';

sealed class DepartmentDoctorEvent {}

class FetchDepartmentDoctors extends DepartmentDoctorEvent {
  final int departmentId;

  FetchDepartmentDoctors({required this.departmentId});
}
