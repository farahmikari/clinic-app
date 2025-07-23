import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/app/book_appointment/models/day_model.dart';
import 'package:rxdart/rxdart.dart';

part 'fetch_days_event.dart';
part 'fetch_days_state.dart';

class FetchDaysBloc extends Bloc<FetchDaysEvent, FetchDaysState> {
  FetchDaysBloc() : super(FetchDaysLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    late bool hasDefaultDaysFetched = false;
    late bool hasDaysFetched = false;
    late int previousDepartmentId;
    late List<DayModel> defaultDays;
    late List<DayModel> days;

    on<FetchDays>((event, emit) async {
      if (hasDaysFetched && previousDepartmentId == event.departmentId) {
        emit(FetchDaysLoaded(days));
        return;
      }
      emit(FetchDaysLoading());
      try {
        dynamic response = await api.get(
          EndPoints.departmentId(event.departmentId),
        );
        days =
            (response as List<dynamic>)
                .map((day) => DayModel.fromJson(day))
                .toList();
        previousDepartmentId = event.departmentId;
        hasDaysFetched = true;
        emit(FetchDaysLoaded(days));
      } on ServerException catch (e) {
        emit(FetchDaysFailed(e.errorModel.errorMessage));
      }
    }, transformer: switchMapTransformer());

    on<FetchDefaultDays>((event, emit) async {
      if (hasDefaultDaysFetched) {
        emit(FetchDaysLoaded(defaultDays));
        return;
      }
      emit(FetchDaysLoading());
      try {
        dynamic response = await api.get(EndPoints.defaultDays);
        defaultDays =
            (response as List<dynamic>)
                .map((day) => DayModel.fromJson(day))
                .toList();
        hasDefaultDaysFetched = true;
        emit(FetchDaysLoaded(defaultDays));
      } on ServerException catch (e) {
        emit(FetchDaysFailed(e.errorModel.errorMessage));
      }
    });
  }
}
