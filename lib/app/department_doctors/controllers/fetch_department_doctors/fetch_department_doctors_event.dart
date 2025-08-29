part of 'fetch_department_doctors_bloc.dart';

sealed class FetchDepartmentDoctorsEvent {}

class FetchDepartmentDoctors extends FetchDepartmentDoctorsEvent {
  final int departmentId;
  final String? searchWord;
  final int? filterIndex;

  FetchDepartmentDoctors({
    required this.departmentId,
    this.searchWord,
    this.filterIndex,
  });
}

class DisplayMorningDepartmentDoctors extends FetchDepartmentDoctorsEvent {}

class DisplayAfternoonDepartmentDoctors extends FetchDepartmentDoctorsEvent {}

class DisplayAllDepartmentDoctors extends FetchDepartmentDoctorsEvent {}
