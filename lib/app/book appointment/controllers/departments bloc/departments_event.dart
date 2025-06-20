part of 'departments_bloc.dart';

sealed class DepartmentsEvent {
  const DepartmentsEvent();
}

class FetchDepartments extends DepartmentsEvent {
  FetchDepartments();
}
