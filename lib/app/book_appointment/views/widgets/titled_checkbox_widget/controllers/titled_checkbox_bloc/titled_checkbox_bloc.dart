import 'package:flutter_bloc/flutter_bloc.dart';

part 'titled_checkbox_event.dart';
part 'titled_checkbox_state.dart';

class TitledCheckboxBloc
    extends Bloc<TitledCheckboxEvent, TitledCheckboxState> {
  TitledCheckboxBloc() : super(TitledCheckboxInitial()) {
    on<IsCurrentCheckedIsToggled>((event, emit) {
      emit(
        TitledCheckboxUpdated(
          isPreviousChecked: state.isPreviousChecked,
          isCurrentChecked: !state.isCurrentChecked,
          isTitledCheckboxWidgetActived: state.isTitledCheckboxWidgetActived,
        ),
      );
    });

    on<IsTitledCheckboxWidgetActivatedIsToggled>((event, emit) {
      emit(
        TitledCheckboxUpdated(
          isPreviousChecked: state.isPreviousChecked,
          isCurrentChecked: state.isPreviousChecked,
          isTitledCheckboxWidgetActived: !state.isTitledCheckboxWidgetActived,
        ),
      );
    });

    on<CurrentAndPreviousCheckAreSet>((event, emit) {
      emit(
        TitledCheckboxUpdated(
          isPreviousChecked: event.currentAndPreviousCheck,
          isCurrentChecked: event.currentAndPreviousCheck,
          isTitledCheckboxWidgetActived: state.isTitledCheckboxWidgetActived,
        ),
      );
    });

    on<TitledCheckboxWidgetIsReset>((event, emit) {
      emit(
        TitledCheckboxUpdated(
          isPreviousChecked: false,
          isCurrentChecked: false,
          isTitledCheckboxWidgetActived: false,
        ),
      );
    });
  }
}
