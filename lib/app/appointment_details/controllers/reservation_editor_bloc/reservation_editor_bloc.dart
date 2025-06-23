import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reservation_editor_event.dart';
part 'reservation_editor_state.dart';

class ReservationEditorBloc
    extends Bloc<ReservationEditorEvent, ReservationEditorState> {
  ReservationEditorBloc() : super(ReservationEditorInitial()) {
    on<IsEditingToggled>((event, emit) {
      emit(ReservationEditorUpdate(isEditing: !state.isEditing));
    });
  }
}
