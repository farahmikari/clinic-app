import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'days_event.dart';
part 'days_state.dart';

class DaysBloc extends Bloc<DaysEvent, DaysState> {
  DaysBloc() : super(DaysInitial()) {
    on<CurrentDayIdIsChanged>((event, emit) {
      emit(
        DaysUpdated(
          currentDepartmentId: state.currentDepartmentId,
          currentDay: event.currentDay,
          previousDay: state.previousDay,
          previousTimeId: state.previousTimeId,
          isDaysWidgetActivated: state.isDaysWidgetActivated,
        ),
      );
    });

    on<CurrentDepartmentIdAndCurrentAndPreviousDayAndPreviousTimeIdAreSet>((
      event,
      emit,
    ) {
      emit(
        DaysUpdated(
          currentDepartmentId: event.currentDepartmentId,
          currentDay: event.currentAndPreviousDay,
          previousDay: event.currentAndPreviousDay,
          previousTimeId: event.previousTimeId,
          isDaysWidgetActivated: state.isDaysWidgetActivated,
        ),
      );
    });

    on<CurrentDepartmentIdIsSetAndCurrentDayIdIsReset>((event, emit) {
      emit(
        DaysUpdated(
          currentDepartmentId: event.currentDepartmentId,
          currentDay: "",
          previousDay: "",
          previousTimeId: -1,
          isDaysWidgetActivated: true,
        ),
      );
    });

    on<IsDaysWidgetActivatedIsToggled>((event, emit) {
      emit(
        DaysUpdated(
          currentDepartmentId: state.currentDepartmentId,
          currentDay: state.previousDay,
          previousDay: state.previousDay,
          previousTimeId: state.previousTimeId,
          isDaysWidgetActivated: !state.isDaysWidgetActivated,
        ),
      );
    });
  }
}
