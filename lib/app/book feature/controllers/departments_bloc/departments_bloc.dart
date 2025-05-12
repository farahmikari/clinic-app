import 'dart:async';

import 'package:clinic_app/app/book%20feature/models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, EventTransformer;
import 'package:rxdart/rxdart.dart';

import '../../models/clinic_department_model.dart' show ClinicDepartmentModel;

part 'departments_event.dart';
part 'departments_state.dart';

class DepartmentsBloc extends Bloc<DepartmentsEvent, DepartmentsState> {
  DepartmentsBloc() : super(FetchDepartmentsLoading()) {
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    on<FetchDepartments>(
      _fetchDepartments,
      transformer: switchMapTransformer(),
    );
  }

  FutureOr<void> _fetchDepartments(event, emit) async {
    emit(FetchDepartmentsLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<ClinicDepartmentModel> departments =
          myDepartments
              .map((department) => ClinicDepartmentModel.fromJson(department))
              .toList();
      emit(FetchDepartmentsLoaded(departments));
    } catch (e) {
      emit(
        FetchDepartmentsFailed(
          'Something Went Wrong When Trying To Fetch Departments',
        ),
      );
    }
  }
}
