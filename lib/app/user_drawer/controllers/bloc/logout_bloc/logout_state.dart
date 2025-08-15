part of 'logout_bloc.dart';

sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}

final class LogoutVisitor extends LogoutState {}

final class LogoutLoading extends LogoutState {}

final class LogoutSuccess extends LogoutState {}

final class LogoutFailure extends LogoutState {
  String message;
  LogoutFailure({required this.message});
}
