part of 'times_bloc.dart';

sealed class TimesState extends Equatable {
  const TimesState({
    required this.currentDoctorId,
    required this.currentTimeId,
    required this.previousTimeId,
    required this.currentDay,
    required this.previousDay,
    required this.areMorningTimesDroppedDown,
    required this.areAfternoonTimesDroppedDown,
    required this.isTimesWidgetActivated,
  });

  final int currentDoctorId;
  final int currentTimeId;
  final int previousTimeId;
  final String currentDay;
  final String previousDay;
  final bool areMorningTimesDroppedDown;
  final bool areAfternoonTimesDroppedDown;
  final bool isTimesWidgetActivated;

  @override
  List<Object> get props => [
    currentDoctorId,
    currentTimeId,
    previousTimeId,
    currentDay,
    previousDay,
    areMorningTimesDroppedDown,
    areAfternoonTimesDroppedDown,
    isTimesWidgetActivated,
  ];
}

final class TimesInitial extends TimesState {
  const TimesInitial()
    : super(
        currentDoctorId: -1,
        currentTimeId: -1,
        previousTimeId: -1,
        currentDay: "",
        previousDay: "",
        areMorningTimesDroppedDown: false,
        areAfternoonTimesDroppedDown: false,
        isTimesWidgetActivated: false,
      );
}

final class TimesUpdated extends TimesState {
  const TimesUpdated({
    required super.currentDoctorId,
    required super.previousTimeId,
    required super.currentTimeId,
    required super.previousDay,
    required super.currentDay,
    required super.areMorningTimesDroppedDown,
    required super.areAfternoonTimesDroppedDown,
    required super.isTimesWidgetActivated, 
  });
}
