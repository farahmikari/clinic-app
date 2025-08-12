part of 'fetch_prescription_bloc.dart';

sealed class FetchPrescriptionEvent {}

class FetchPrescription extends FetchPrescriptionEvent {
  final int appointmentId;
  FetchPrescription({required this.appointmentId});
}
