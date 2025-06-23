import 'package:clinic_app/app/book_appointment/models/time_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
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
            "department_id": event.departmentId,
            "date": event.day,
            "shift": event.shift,
          },
        );
        times =
            (response["slots"] as List<dynamic>)
                .map((time) => TimeModel.fromJson(time))
                .toList();
        doctorId = (response["doctor_id"]);
        previousDayId = event.day;
        hasTimesFetched = true;
        emit(FetchTimesLoaded(dayTimes: times, doctorId: doctorId));
      } catch (e) {
        emit(
          FetchTimesFailed("Something Went Wrong When Trying To Fetch Times"),
        );
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
      } catch (e) {
        emit(
          FetchTimesFailed(
            "Something Went Wrong When Trying To Fetch Default Times",
          ),
        );
      }
    });

    on<ShowTimesLoading>((event, emit) async {
      emit(FetchTimesLoading());
    });

    on<ShowTimesError>((event, emit) async {
      emit(FetchTimesFailed("Something Went Wrong When Trying To Fetch Times"));
    });
  }
}
