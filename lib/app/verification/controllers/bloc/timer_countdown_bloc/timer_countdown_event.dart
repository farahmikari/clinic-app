part of 'timer_countdown_bloc.dart';

abstract class TimerCountdownEvent {}

class StartTimer extends TimerCountdownEvent {
  final int seconds;

  StartTimer({this.seconds=30});
}
class Tick extends TimerCountdownEvent{}
