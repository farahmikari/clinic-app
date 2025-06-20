import 'dart:async';
import 'package:clinic_app/app/book%20appointment/models/book_appointment_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'confirm_event.dart';
part 'confirm_state.dart';

class ConfirmBloc extends Bloc<ConfirmEvent, ConfirmState> {
  ConfirmBloc() : super(ConfirmInitial()) {
    on<PickedAppointmentInfoConfirmed>(_confirmPickedAppointmentInfo);
  }

  FutureOr<void> _confirmPickedAppointmentInfo(event, emit) async {
    try {
      emit(ConfirmLoading());
      await Future.delayed(Duration(seconds: 10));
      //print(event.customizedAppointment.toJson());
      emit(ConfirmLoaded());
    } catch (e) {
      emit(ConfirmFailed());
    }
  }
}
