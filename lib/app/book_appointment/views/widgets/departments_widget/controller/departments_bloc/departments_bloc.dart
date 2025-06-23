import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'departments_event.dart';
part 'departments_state.dart';

class DepartmentsBloc extends Bloc<DepartmentsEvent, DepartmentsState> {
  DepartmentsBloc() : super(DepartmentsInitial()) {
    on<DepartmentIdChanged>((event, emit) {
      emit(DepartmentsUpdated(currentDepartmentId: event.departmentId));
    });
  }
}
