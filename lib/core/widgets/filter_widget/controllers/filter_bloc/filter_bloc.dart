import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterIsChanged>((event, emit) {
      int newFilterIndex = (state.filterIndex + 1) % 3;
      emit(
        FilterUpdate(
          filterIndex: newFilterIndex,
          isFilterWidgetActivated: state.isFilterWidgetActivated,
        ),
      );
    });

    on<FilterIsReset>((event, emit) {
      emit(FilterUpdate(filterIndex: 0, isFilterWidgetActivated: false));
    });

    on<FilterWidgetIsActivated>((event, emit) {
      emit(
        FilterUpdate(
          filterIndex: state.filterIndex,
          isFilterWidgetActivated: true,
        ),
      );
    });
  }
}
