import 'dart:async';
import 'package:clinic_app/app/book%20appointment/models/day_model.dart';
import 'package:clinic_app/app/book%20appointment/models/json_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'days_event.dart';
part 'days_state.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {
  DaysBloc() : super(FetchDaysLoading()) {
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    on<FetchDays>(_fetchDays, transformer: switchMapTransformer());

    on<FetchDefaultDays>(
      _fetchDefaultDays,
      transformer: switchMapTransformer(),
    );
  }

  FutureOr<void> _fetchDefaultDays(event, emit) async {
    emit(FetchDaysLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<DayModel> days =
          (defaultDays as List<dynamic>)
              .map((day) => DayModel.fromJson(day))
              .toList();
      emit(FetchDaysInitial(days));
    } catch (e) {
      emit(FetchDaysFailed('Something Went Wrong When Trying To Fetch Days'));
    }
  }

  FutureOr<void> _fetchDays(event, emit) async {
    emit(FetchDaysLoading());

    await Future.delayed(const Duration(seconds: 2));
    try {
      List<DayModel> days =
          (myDays[event.departmentId] as List<dynamic>)
              .map((day) => DayModel.fromJson(day))
              .toList();
      emit(FetchDaysLoaded(days));
    } catch (e) {
      emit(FetchDaysFailed('Something Went Wrong When Trying To Fetch Days'));
    }
  }
}
