part of 'fetch_departments_bloc.dart';

sealed class FetchDepartmentsState {}

class FetchDepartmentsLoading extends FetchDepartmentsState {}

class FetchDepartmentsLoaded extends FetchDepartmentsState {
  final List<DepartmentModel> departments;
  FetchDepartmentsLoaded(this.departments);
}

class FetchDepartmentsLoadedEmpty extends FetchDepartmentsState {}

class FetchDepartmentsFailed extends FetchDepartmentsState {
  final String errorMessage;

  FetchDepartmentsFailed(this.errorMessage);
}
