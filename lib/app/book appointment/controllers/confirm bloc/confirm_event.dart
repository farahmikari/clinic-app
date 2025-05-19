part of 'confirm_bloc.dart';

sealed class ConfirmEvent {
  const ConfirmEvent();
}

class PickedAppointmentInfoConfirmed extends ConfirmEvent {
  final CustomizedAppointmentModel customizedAppointment;

  PickedAppointmentInfoConfirmed({required this.customizedAppointment});
}
