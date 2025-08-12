part of 'fetch_medical_report_bloc.dart';

sealed class FetchMedicalReportState {}

final class FetchMedicalReportInitial extends FetchMedicalReportState {}

final class FetchMedicalReportLoading extends FetchMedicalReportState {}

final class FetchMedicalReportLoaded extends FetchMedicalReportState {
  final MedicalReportModel medicalReport;

  FetchMedicalReportLoaded({required this.medicalReport});
}

final class FetchMedicalReportFailed extends FetchMedicalReportState {
  final String errorMessage;

  FetchMedicalReportFailed({required this.errorMessage});
}
