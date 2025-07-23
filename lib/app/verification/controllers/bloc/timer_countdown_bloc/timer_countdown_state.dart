part of 'timer_countdown_bloc.dart';

class TimerCountdownState {
  final int second;
  final bool isRunning;

  TimerCountdownState({required this.second, required this.isRunning});
  factory TimerCountdownState.initial() =>
      TimerCountdownState(second: 0, isRunning: false);
}
