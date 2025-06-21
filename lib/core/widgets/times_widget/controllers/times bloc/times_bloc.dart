import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'times_event.dart';
part 'times_state.dart';

class TimesBloc extends Bloc<TimesEvent, TimesState> {
  TimesBloc() : super(TimesInitial()) {
    on<CurrentTimeAndDoctorIdsAreChanged>((event, emit) {
      emit(
        TimesUpdated(
          currentDoctorId: event.currentDoctorId,
          currentTimeId: event.currentTimeId,
          previousTimeId: state.previousTimeId,
          currentDay: state.currentDay,
          previousDay: state.previousDay,
          areMorningTimesDroppedDown: state.areMorningTimesDroppedDown,
          areAfternoonTimesDroppedDown: state.areAfternoonTimesDroppedDown,
          isTimesWidgetActivated: state.isTimesWidgetActivated,
        ),
      );
    });

    on<CurrentAndPreviousDayAndCurrentAndPreviousTimeIdsAreSet>((event, emit) {
      emit(
        TimesUpdated(
          currentDoctorId: state.currentDoctorId,
          currentTimeId: event.currentTimeId,
          previousTimeId: event.previousTimeId,
          currentDay: event.currentDay,
          previousDay: event.previousDay,
          areMorningTimesDroppedDown: state.areMorningTimesDroppedDown,
          areAfternoonTimesDroppedDown: state.areAfternoonTimesDroppedDown,
          isTimesWidgetActivated: state.isTimesWidgetActivated,
        ),
      );
    });

    on<AreMorningTimesDroppedDownIsToggled>((event, emit) {
      emit(
        TimesUpdated(
          currentDoctorId: state.currentDoctorId,
          currentTimeId: state.currentTimeId,
          previousTimeId: state.previousTimeId,
          currentDay: state.currentDay,
          previousDay: state.previousDay,
          areMorningTimesDroppedDown: !state.areMorningTimesDroppedDown,
          areAfternoonTimesDroppedDown: state.areAfternoonTimesDroppedDown,
          isTimesWidgetActivated: state.isTimesWidgetActivated,
        ),
      );
    });

    on<AreAfternoonTimesDroppedDownIsToggled>((event, emit) {
      emit(
        TimesUpdated(
          currentDoctorId: state.currentDoctorId,
          currentTimeId: state.currentTimeId,
          previousTimeId: state.previousTimeId,
          currentDay: state.currentDay,
          previousDay: state.previousDay,
          areMorningTimesDroppedDown: state.areMorningTimesDroppedDown,
          areAfternoonTimesDroppedDown: !state.areAfternoonTimesDroppedDown,
          isTimesWidgetActivated: state.isTimesWidgetActivated,
        ),
      );
    });

    on<TimesWidgetIsReset>((event, emit) {
      emit(
        TimesUpdated(
          currentDoctorId: -1,
          previousTimeId: -1,
          currentTimeId: -1,
          previousDay: "",
          currentDay: "",
          areMorningTimesDroppedDown: false,
          areAfternoonTimesDroppedDown: false,
          isTimesWidgetActivated: state.isTimesWidgetActivated,
        ),
      );
    });

    on<IsTimesWidgetActivatedIsToggled>((event, emit) {
      emit(
        TimesUpdated(
          currentDoctorId: state.currentDoctorId,
          previousTimeId: state.previousTimeId,
          currentTimeId: state.previousTimeId,
          previousDay: state.previousDay,
          currentDay: state.currentDay,
          areMorningTimesDroppedDown: state.areMorningTimesDroppedDown,
          areAfternoonTimesDroppedDown: state.areAfternoonTimesDroppedDown,
          isTimesWidgetActivated: !state.isTimesWidgetActivated,
        ),
      );
    });
  }
}
