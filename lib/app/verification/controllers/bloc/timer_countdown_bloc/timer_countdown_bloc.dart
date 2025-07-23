import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'timer_countdown_event.dart';
part 'timer_countdown_state.dart';

class TimerCountdownBloc
    extends Bloc<TimerCountdownEvent, TimerCountdownState> {
  Timer? _timer;
  TimerCountdownBloc() : super(TimerCountdownState.initial()) {
    on<StartTimer>(_onStartTimer);
    on<Tick>(_onTick);
  }
  void _onStartTimer(
    StartTimer event,
    Emitter<TimerCountdownState> emit,
  ) async {
    _timer?.cancel();
    emit(TimerCountdownState(second: event.seconds, isRunning: true));
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (isClosed) return;
      add(Tick());
    });
  }

  void _onTick(Tick event, Emitter<TimerCountdownState> emit) {
    final newSecond = state.second - 1;
    if (emit.isDone) return;
    emit(
      TimerCountdownState(
        second: newSecond < 0 ? 0 : newSecond,
        isRunning: newSecond > 0,
      ),
    );
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
