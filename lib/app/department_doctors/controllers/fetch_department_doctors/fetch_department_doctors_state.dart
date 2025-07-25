part of 'fetch_department_doctors_bloc.dart';

sealed class FetchDepartmentDoctorsState {}

class FetchDepartmentDoctorsLoading extends FetchDepartmentDoctorsState {}

class FetchDepartmentDoctorsLoaded extends FetchDepartmentDoctorsState {
  final List<DepartmentDoctorModel> departmentDoctors;

  FetchDepartmentDoctorsLoaded({required this.departmentDoctors});
}

class FetchDepartmentDoctorsFailed extends FetchDepartmentDoctorsState {
  final String errorMessage;

  FetchDepartmentDoctorsFailed({required this.errorMessage});
}
