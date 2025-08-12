part of 'fetch_prescription_bloc.dart';

sealed class FetchPrescriptionState {}

final class FetchPrescriptionLoading extends FetchPrescriptionState {}

final class FetchPrescriptionLoaded extends FetchPrescriptionState {
  final PrescriptionModel prescription;
  FetchPrescriptionLoaded({required this.prescription});
}

final class FetchPrescriptionFailed extends FetchPrescriptionState {
  final String errorMessage;
  FetchPrescriptionFailed({required this.errorMessage});
}
