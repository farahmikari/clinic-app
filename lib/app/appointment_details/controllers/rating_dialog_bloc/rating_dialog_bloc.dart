import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_dialog_event.dart';
part 'rating_dialog_state.dart';

class RatingDialogBloc extends Bloc<RatingDialogEvent, RatingDialogState> {
  RatingDialogBloc() : super(RatingDialogInitial()) {
    on<RatingDialogIsDisplayed>((event, emit) async {
      await Future.delayed(Duration(seconds: 5));
      emit(
        RatingDialogVisible(
          appointmentId: event.appointmentId,
          rating: state.rating,
        ),
      );
      log(
        "{appointment_id:${event.appointmentId},is_prescription_viewed:true}",
      );
    });

    on<RatingDialogIsUpdated>((event, emit) {
      emit(
        RatingDialogUpdate(
          appointmentId: state.appointmentId,
          rating: event.rating,
        ),
      );
    });

    on<RatingIsSubmited>((event, emit) {
      log("{appointment_id:${state.appointmentId},rating:${state.rating}}");
    });
  }
}
