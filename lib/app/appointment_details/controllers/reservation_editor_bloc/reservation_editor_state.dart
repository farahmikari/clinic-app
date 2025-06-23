part of 'reservation_editor_bloc.dart';

sealed class ReservationEditorState extends Equatable {
  const ReservationEditorState({required this.isEditing});
  final bool isEditing;
  @override
  List<Object> get props => [isEditing];
}

class ReservationEditorInitial extends ReservationEditorState {
  const ReservationEditorInitial() : super(isEditing: false);
}

class ReservationEditorUpdate extends ReservationEditorState {
  const ReservationEditorUpdate({required super.isEditing});
}
