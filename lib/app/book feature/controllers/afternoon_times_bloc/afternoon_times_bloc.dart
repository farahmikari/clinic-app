import 'dart:async';

import 'package:clinic_app/app/book%20feature/models/json_model.dart';
import 'package:clinic_app/app/book%20feature/models/time_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'afternoon_times_event.dart';
part 'afternoon_times_state.dart';

class AfternoonTimesBloc
    extends Bloc<AfternoonTimesEvent, AfternoonTimesState> {
  AfternoonTimesBloc() : super(FetchAfternoonTimesLoading()) {
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    on<FetchAfternoonTimes>(
      _fetchAfternoonTimes,
      transformer: switchMapTransformer(),
    );
    on<FetchDefaultAfternoonTimes>(
      _fetchDefaultAfternoonTimes,
      transformer: switchMapTransformer(),
    );
  }

  FutureOr<void> _fetchAfternoonTimes(event, emit) async {
    emit(FetchAfternoonTimesLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<TimeModel> afternoonTimes =
          (myAfternoonTimes[event.dayId] as List<dynamic>)
              .map((afternoonTime) => TimeModel.fromJson(afternoonTime))
              .toList();
      emit(FetchAfternoonTimesLoaded(afternoonTimes));
    } catch (e) {
      emit(
        FetchAfternoonTimesFailed(
          'Something Went Wrong When Trying To Fetch Times',
        ),
      );
    }
  }

  FutureOr<void> _fetchDefaultAfternoonTimes(event, emit) async {
    emit(FetchAfternoonTimesLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<TimeModel> afternoonTimes =
          (defaultAfternoonTimes as List<dynamic>)
              .map((afternoonTime) => TimeModel.fromJson(afternoonTime))
              .toList();
      emit(FetchAfternoonTimesInitial(afternoonTimes));
    } catch (e) {
      emit(
        FetchAfternoonTimesFailed(
          'Something Went Wrong When Trying To Fetch Times',
        ),
      );
    }
  }
}
