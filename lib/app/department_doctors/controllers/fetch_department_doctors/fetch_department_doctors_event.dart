part of 'fetch_department_doctors_bloc.dart';

sealed class FetchDepartmentDoctorsEvent {}

class FetchDepartmentDoctors extends FetchDepartmentDoctorsEvent {
  final int departmentId;

  FetchDepartmentDoctors({required this.departmentId});
}

class DisplayMorningDepartmentDoctors extends FetchDepartmentDoctorsEvent {}

class DisplayAfternoonDepartmentDoctors extends FetchDepartmentDoctorsEvent {}

class DisplayAllDepartmentDoctors extends FetchDepartmentDoctorsEvent {}
