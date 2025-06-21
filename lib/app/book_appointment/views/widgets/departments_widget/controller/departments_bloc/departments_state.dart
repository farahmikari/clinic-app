part of 'departments_bloc.dart';

sealed class DepartmentsState extends Equatable {
  const DepartmentsState({required this.currentDepartmentId});
  final int currentDepartmentId;

  @override
  List<Object> get props => [currentDepartmentId];
}

final class DepartmentsInitial extends DepartmentsState {
  const DepartmentsInitial() : super(currentDepartmentId: -1);
}

final class DepartmentsUpdated extends DepartmentsState {
  const DepartmentsUpdated({required super.currentDepartmentId});
}
