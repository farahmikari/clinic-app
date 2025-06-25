import 'package:clinic_app/app/book_appointment/models/time_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'fetch_times_event.dart';
part 'fetch_times_state.dart';

class FetchTimesBloc extends Bloc<FetchTimesEvent, FetchTimesState> {
  FetchTimesBloc() : super(FetchTimesLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    late bool hasDefaultTimesFetched = false;
    late bool hasTimesFetched = false;
    late List<TimeModel> defaultTimes;
    late int doctorId;
    late List<TimeModel> times;
    late String previousDayId = "";
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    on<FetchTimes>((event, emit) async {
      if (hasTimesFetched && previousDayId == event.day) {
        emit(FetchTimesLoaded(dayTimes: times, doctorId: doctorId));
        return;
      }
      emit(FetchTimesLoading());
      try {
        dynamic response = await api.get(
          EndPoints.availableSlotsByShift,
          data: {
            ApiKey.departmentId: event.departmentId,
            ApiKey.date: event.day,
            ApiKey.shift: event.shift,
          },
        );
        times =
            (response[ApiKey.slots] as List<dynamic>)
                .map((time) => TimeModel.fromJson(time))
                .toList();
        doctorId = (response[ApiKey.doctorId]);
        previousDayId = event.day;
        hasTimesFetched = true;
        emit(FetchTimesLoaded(dayTimes: times, doctorId: doctorId));
      } on ServerException catch (e) {
        emit(FetchTimesFailed(e.errorModel.errorMessage));
      }
    }, transformer: switchMapTransformer());

    on<FetchDefaultTimes>((event, emit) async {
      if (hasDefaultTimesFetched) {
        emit(FetchTimesLoaded(dayTimes: defaultTimes, doctorId: -1));
        return;
      }
      emit(FetchTimesLoading());
      try {
        late int startId;
        late int endId;
        if (event.shift == "morning") {
          startId = 1;
          endId = 8;
        } else {
          startId = 9;
          endId = 16;
        }
        dynamic response = await api.get(
          EndPoints.defaultTimes,
          queryParameter: {ApiKey.startId: startId, ApiKey.endId: endId},
        );
        defaultTimes =
            (response as List<dynamic>)
                .map((time) => TimeModel.fromJson(time))
                .toList();
        hasDefaultTimesFetched = true;
        emit(FetchTimesLoaded(dayTimes: defaultTimes, doctorId: -1));
      } on ServerException catch (e) {
        emit(FetchTimesFailed(e.errorModel.errorMessage));
      }
    });
  }
}
