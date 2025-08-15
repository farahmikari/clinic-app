abstract class EditProfileEvent {}

class EditFirstNameFieldEvent extends EditProfileEvent {
  final String name;

  EditFirstNameFieldEvent({required this.name});
}

class EditLastNameFieldEvent extends EditProfileEvent {
  final String name;

  EditLastNameFieldEvent({required this.name});
}

class EditGenderFieldEvent extends EditProfileEvent {
  final String gender;

  EditGenderFieldEvent({required this.gender});
}

class EditPhoneFieldEvent extends EditProfileEvent {
  final String phone;

  EditPhoneFieldEvent({required this.phone});
}

class EditBirthFieldEvent extends EditProfileEvent {
  final String birth;

  EditBirthFieldEvent({required this.birth});
}
class EditButtonEvent extends EditProfileEvent {}

class EditSubmitEvent extends EditProfileEvent {}
