part of 'departments_bloc.dart';

sealed class DepartmentsEvent extends Equatable {
  const DepartmentsEvent({required this.departmentId});
  final int departmentId;

  @override
  List<Object> get props => [departmentId];
}

final class DepartmentIdChanged extends DepartmentsEvent {
  const DepartmentIdChanged({required super.departmentId});
}
