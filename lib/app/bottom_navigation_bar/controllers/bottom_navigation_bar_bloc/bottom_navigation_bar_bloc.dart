import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial()) {
    on<CurrentIndexChanged>((event, emit) {
      emit(
        BottomNavigationBarUpdate(
          currentIndex: event.currentIndex,
          isHomeBlocsInitialized:
              event.currentIndex == 0 || state.isHomeBlocsInitialized,
          isAppointmentsBlocsInitialized:
              event.currentIndex == 1 || state.isAppointmentsBlocsInitialized,
          isDepartmentsBlocsInitialized:
              event.currentIndex == 2 || state.isDepartmentsBlocsInitialized,
          isBillsBlocsInitialized:
              event.currentIndex == 3 || state.isBillsBlocsInitialized,
        ),
      );
    });
  }
}
