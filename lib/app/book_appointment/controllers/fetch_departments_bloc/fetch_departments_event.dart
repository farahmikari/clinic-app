part of 'fetch_departments_bloc.dart';

sealed class FetchDepartmentsEvent {
  const FetchDepartmentsEvent();
}

class FetchDepartments extends FetchDepartmentsEvent {
  final String? searchWord;

  FetchDepartments({this.searchWord});
}
