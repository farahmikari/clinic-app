part of 'departments_bloc.dart';

sealed class DepartmentsState {
  const DepartmentsState();
}

//final class DepartmentsInitial extends DepartmentsState {}

class FetchDepartmentsLoading extends DepartmentsState {}

class FetchDepartmentsLoaded extends DepartmentsState {
  final List<ClinicDepartmentModel> departments;
  FetchDepartmentsLoaded(this.departments);
}

class FetchDepartmentsFailed extends DepartmentsState {
  final String errorMessage;

  FetchDepartmentsFailed(this.errorMessage);
}
