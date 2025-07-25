import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc
    extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial()) {
    on<CurrentIndexChanged>((event, emit) {
      List<bool> isDataFetched = state.isDataFetched;
      emit(
        UpdateBottomNavigationBar(
          currentIndex: event.currentIndex,
          isDataFetched: isDataFetched,
        ),
      );
    });
  }
}
