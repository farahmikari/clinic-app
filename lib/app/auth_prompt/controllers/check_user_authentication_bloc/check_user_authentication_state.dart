part of 'check_user_authentication_bloc.dart';

sealed class CheckUserAuthenticationState {}

final class CheckUserAuthenticationLoading
    extends CheckUserAuthenticationState {}

final class UserAuthenticated extends CheckUserAuthenticationState {}

final class UserUnAuthenticated extends CheckUserAuthenticationState {}
