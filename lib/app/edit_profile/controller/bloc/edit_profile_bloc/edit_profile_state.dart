part of 'edit_profile_bloc.dart';

class EditProfileState {
  final FormModelItem firstName;
  final FormModelItem lastName;
  final FormModelItem phone;
  final String birthday;
  final String gender;
  final bool buttonEvent;
  final GlobalKey<FormState>? formKey;

  EditProfileState({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.birthday,
    required this.gender,
    this.buttonEvent = false,
    this.formKey,
  });

  EditProfileState copyWith({
    FormModelItem? firstName,
    FormModelItem? lastName,
    FormModelItem? phone,
    String? birthday,
    String? gender,
    bool? buttonEvent,
  }) {
    return EditProfileState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      buttonEvent: buttonEvent ?? this.buttonEvent,
      formKey: formKey,
    );
  }
}

abstract class EditProfileBaseState {
  final EditProfileState data;
  EditProfileBaseState({required this.data});
}

final class EditProfileInitial extends EditProfileBaseState {
  EditProfileInitial(EditProfileState data) : super(data: data);
}

final class EditProfileLoading extends EditProfileBaseState {
  EditProfileLoading(EditProfileState data) : super(data: data);
}

final class EditProfileSuccess extends EditProfileBaseState {
  String? message;
  EditProfileSuccess(EditProfileState data,{this.message}) : super(data: data);
}

final class EditProfileFailed extends EditProfileBaseState {
  final String message;
  EditProfileFailed(EditProfileState data, {required this.message})
    : super(data: data);
}
