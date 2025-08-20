part of 'profile_bloc.dart';

class ProfileState {}

final class ProfileBlocInitial extends ProfileState {}

final class ProfileBlocLoading extends ProfileState {}

final class ProfileBlocSuccess extends ProfileState {
  UserDataModel user;
  ProfileBlocSuccess({required this.user});
}

final class ProfileBlocFailure extends ProfileState {
  String? message;
  ProfileBlocFailure({required this.message});
}

final class ProfileBlocVisitor extends ProfileState {}
