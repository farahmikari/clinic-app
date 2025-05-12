part of 'confirm_bloc.dart';

sealed class ConfirmState {
  const ConfirmState();
}

final class ConfirmInitial extends ConfirmState {}

final class ConfirmLoading extends ConfirmState {}

final class ConfirmLoaded extends ConfirmState {}

final class ConfirmFailed extends ConfirmState {}
