part of 'vital_signals_bloc.dart';

class VitalSignalsState {}

final class VitalSignalsInitial extends VitalSignalsState {}

final class VitalSignalsVisitor extends VitalSignalsState {}

final class VitalSignalsLoading extends VitalSignalsState {}

final class VitalSignalsSuccess extends VitalSignalsState {
  //VitalSignalsModel vitalSignals;
  //VitalSignalsSuccess({required this.vitalSignals});
}

final class VitalSignalsFailure extends VitalSignalsState {
  String message;
  VitalSignalsFailure({required this.message});
}
