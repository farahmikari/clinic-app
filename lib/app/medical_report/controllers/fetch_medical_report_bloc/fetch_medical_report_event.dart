part of 'fetch_medical_report_bloc.dart';

sealed class FetchMedicalReportEvent {}

final class MedicalReportIsFetched extends FetchMedicalReportEvent {
  final int appointmentId;
  MedicalReportIsFetched({required this.appointmentId});
}
