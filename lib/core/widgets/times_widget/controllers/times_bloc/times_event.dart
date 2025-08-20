part of 'times_bloc.dart';

sealed class TimesEvent {}

// class CurrentTimeIdIsChanged extends TimesEvent {
//   final int currentTimeId;

//   CurrentTimeIdIsChanged({required this.currentTimeId});
// }

class CurrentTimeAndDoctorIdsAreChanged extends TimesEvent {
  final int currentTimeId;
  final int currentDoctorId;

  CurrentTimeAndDoctorIdsAreChanged({
    required this.currentTimeId,
    required this.currentDoctorId,
  });
}

class CurrentAndPreviousDayAndCurrentAndPreviousTimeIdsAreSet
    extends TimesEvent {
  final String currentDay;
  final String previousDay;
  final int currentTimeId;
  final int previousTimeId;

  CurrentAndPreviousDayAndCurrentAndPreviousTimeIdsAreSet({
    required this.currentDay,
    required this.previousDay,
    required this.currentTimeId,
    required this.previousTimeId,
  });
}

class CurrentTimeAndDoctorIdsAreReset extends TimesEvent {}

class AreMorningTimesDroppedDownIsToggled extends TimesEvent {}

class AreAfternoonTimesDroppedDownIsToggled extends TimesEvent {}

class IsTimesWidgetActivatedIsToggled extends TimesEvent {}
