import 'dart:async';

import 'package:clinic_app/app/book%20feature/models/json_model.dart';
import 'package:clinic_app/app/book%20feature/models/time_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'morning_times_event.dart';
part 'morning_times_state.dart';

class MorningTimesBloc extends Bloc<MorningTimesEvent, MorningTimesState> {
  MorningTimesBloc() : super(FetchMorningTimesLoading()) {
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    on<FetchMorningTimes>(
      _fetchMorningTimes,
      transformer: switchMapTransformer(),
    );
    on<FetchDefaultMorningTimes>(
      _fetchDefaultMorningTimes,
      transformer: switchMapTransformer(),
    );
  }

  FutureOr<void> _fetchMorningTimes(event, emit) async {
    emit(FetchMorningTimesLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<TimeModel> morningTimes =
          (myMorningTimes[event.dayId] as List<dynamic>)
              .map((morningTime) => TimeModel.fromJson(morningTime))
              .toList();
      emit(FetchMorningTimesLoaded(morningTimes));
    } catch (e) {
      emit(
        FetchMorningTimesFailed(
          'Something Went Wrong When Trying To Fetch Times',
        ),
      );
    }
  }

  FutureOr<void> _fetchDefaultMorningTimes(event, emit) async {
    emit(FetchMorningTimesLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<TimeModel> morningTimes =
          (defaultMorningTimes as List<dynamic>)
              .map((morningTime) => TimeModel.fromJson(morningTime))
              .toList();
      emit(FetchMorningTimesInitial(morningTimes));
    } catch (e) {
      emit(
        FetchMorningTimesFailed(
          'Something Went Wrong When Trying To Fetch Times',
        ),
      );
    }
  }
}
