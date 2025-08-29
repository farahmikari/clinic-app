import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, EventTransformer;
import 'package:rxdart/rxdart.dart';

import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';

import '../../models/department_model.dart' show DepartmentModel;

part 'fetch_departments_event.dart';
part 'fetch_departments_state.dart';

class FetchDepartmentsBloc
    extends Bloc<FetchDepartmentsEvent, FetchDepartmentsState> {
  FetchDepartmentsBloc() : super(FetchDepartmentsLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    on<FetchDepartments>((event, emit) async {
      emit(FetchDepartmentsLoading());
      try {
        dynamic response = await api.get(
          EndPoints.departments,
          queryParameter: {ApiKey.keyword: event.searchWord},
        );
        List<DepartmentModel> departments =
            (response as List<dynamic>)
                .map((department) => DepartmentModel.fromJson(department))
                .toList();
        if (departments.isEmpty) {
          emit(FetchDepartmentsLoadedEmpty());
        } else {
          emit(FetchDepartmentsLoaded(departments));
        }
      } on ServerException catch (e) {
        emit(FetchDepartmentsFailed(e.errorModel.errorMessage));
      }
    }, transformer: switchMapTransformer());
  }
}
