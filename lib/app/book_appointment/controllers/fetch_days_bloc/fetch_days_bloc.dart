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
  FetchDaysBloc() : super(FetchDepartmentDaysLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    late bool hasDefaultDaysFetched = false;
    late List<DayModel> defaultDays;

    on<FetchDepartmentDays>((event, emit) async {
      emit(FetchDepartmentDaysLoading());
      try {
        dynamic response = await api.get(
          EndPoints.departmentId(event.departmentId),
        );
        List<DayModel> days =
            (response as List<dynamic>)
                .map((day) => DayModel.fromJson(day))
                .toList();
        emit(FetchDepartmentDaysLoaded(days));
      } on ServerException catch (e) {
        emit(FetchDepartmentDaysFailed(e.errorModel.errorMessage));
      }
    }, transformer: switchMapTransformer());

    on<FetchOfferDays>((event, emit) async {
      emit(FetchDepartmentDaysLoading());
      try {
        dynamic response = await api.get(EndPoints.offerId(event.offerId));
        List<DayModel> days =
            (response as List<dynamic>)
                .map((day) => DayModel.fromJson(day))
                .toList();
        emit(FetchDepartmentDaysLoaded(days));
      } on ServerException catch (e) {
        emit(FetchDepartmentDaysFailed(e.errorModel.errorMessage));
      }
    }, transformer: switchMapTransformer());

    on<FetchDefaultDays>((event, emit) async {
      if (hasDefaultDaysFetched) {
        emit(FetchDepartmentDaysLoaded(defaultDays));
        return;
      }
      emit(FetchDepartmentDaysLoading());
      try {
        dynamic response = await api.get(EndPoints.defaultDays);
        defaultDays =
            (response as List<dynamic>)
                .map((day) => DayModel.fromJson(day))
                .toList();
        hasDefaultDaysFetched = true;
        emit(FetchDepartmentDaysLoaded(defaultDays));
      } on ServerException catch (e) {
        emit(FetchDepartmentDaysFailed(e.errorModel.errorMessage));
      }
    });
  }
}
