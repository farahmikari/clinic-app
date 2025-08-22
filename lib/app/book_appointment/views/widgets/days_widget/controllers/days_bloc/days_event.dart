part of 'days_bloc.dart';

sealed class DaysEvent {}

class CurrentDayIdIsChanged extends DaysEvent {
  final String currentDay;
  CurrentDayIdIsChanged({required this.currentDay});
}

class CurrentDepartmentIdAndCurrentAndPreviousDayAndPreviousTimeIdAreSet
    extends DaysEvent {
  final int currentDepartmentId;
  final String currentAndPreviousDay;
  final int previousTimeId;

  CurrentDepartmentIdAndCurrentAndPreviousDayAndPreviousTimeIdAreSet({
    required this.currentDepartmentId,
    required this.currentAndPreviousDay,
    required this.previousTimeId,
  });
}

class CurrentDepartmentIdIsSetAndCurrentDayIdIsReset extends DaysEvent {
  final int currentDepartmentId;

  CurrentDepartmentIdIsSetAndCurrentDayIdIsReset({
    required this.currentDepartmentId,
  });
}

class IsDaysWidgetActivatedIsToggled extends DaysEvent {}
