import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    late List<String> filters;
    int counter = 1;

    on<FitlersAreSet>((event, emit) {
      filters = event.filters;
    });

    on<FilterIsChanged>((event, emit) {
      emit(
        UpdateFilterName(
          filterName: filters[counter],
          isFilterWidgetActivated: state.isFilterWidgetActivated,
        ),
      );
      counter = (counter + 1) % filters.length;
    });

    on<FilterIsReset>((event, emit) {
      emit(
        UpdateFilterName(
          filterName: filters[0],
          isFilterWidgetActivated: false,
        ),
      );
      counter = 1;
    });

    on<FilterWidgetIsActivated>((event, emit) {
      emit(
        UpdateFilterName(
          filterName: state.filterName,
          isFilterWidgetActivated: true,
        ),
      );
    });
  }
}
