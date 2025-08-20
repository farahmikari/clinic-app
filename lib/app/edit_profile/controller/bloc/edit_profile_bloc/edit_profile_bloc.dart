import 'package:clinic_app/app/edit_profile/controller/bloc/edit_profile_bloc/edit_profile_event.dart';
import 'package:clinic_app/app/edit_profile/controller/services/edit_profile_service.dart';
import 'package:clinic_app/app/edit_profile/models/edit_profile_model.dart';
import 'package:clinic_app/app/login/models/form_model.dart';
import 'package:clinic_app/app/user_profile/models/user_data_model.dart';
import 'package:clinic_app/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileBaseState> {
  final UserDataModel user;
  EditProfileBloc(this.user)
    : super(
        EditProfileInitial(
          EditProfileState(
            firstName: FormModelItem(value: user.firstName),
            lastName: FormModelItem(value: user.lastName),
            phone: FormModelItem(value: user.phoneNumber),
            birthday: user.birthDate,
            gender: user.gender,
          ),
        ),
      ) {
    on<EditFirstNameFieldEvent>(_firstNameEvent);
    on<EditLastNameFieldEvent>(_lastNameEvent);
    on<EditGenderFieldEvent>(_genderEvent);
    on<EditBirthFieldEvent>(_birthEvent);
    on<EditPhoneFieldEvent>(_phoneEvent);
    on<EditButtonEvent>(_buttonEvent);
    on<EditSubmitEvent>(_onSubmit);
  }

  void _firstNameEvent(
    EditFirstNameFieldEvent event,
    Emitter<EditProfileBaseState> emit,
  ) {
    final currentState = state.data;
    String firstName = event.name.trim();
    String? error = Validators.validateRequired(firstName);

    emit(
      EditProfileInitial(
        currentState.copyWith(
          firstName: FormModelItem(value: firstName, error: error),
        ),
      ),
    );
  }

  void _lastNameEvent(
    EditLastNameFieldEvent event,
    Emitter<EditProfileBaseState> emit,
  ) {
    final currentState = state.data;
    String lastName = event.name.trim();
    String? error = Validators.validateRequired(lastName);

    emit(
      EditProfileInitial(
        currentState.copyWith(
          lastName: FormModelItem(value: lastName, error: error),
        ),
      ),
    );
  }

  void _phoneEvent(
    EditPhoneFieldEvent event,
    Emitter<EditProfileBaseState> emit,
  ) {
    final currentState = state.data;
    String phone = event.phone.trim();
    String? error = Validators.validatePhone(phone);

    emit(
      EditProfileInitial(
        currentState.copyWith(phone: FormModelItem(value: phone, error: error)),
      ),
    );
  }

  void _birthEvent(
    EditBirthFieldEvent event,
    Emitter<EditProfileBaseState> emit,
  ) {
    final currentState = state.data;
    String birth = event.birth.trim();
    emit(EditProfileInitial(currentState.copyWith(birthday: birth)));
  }

  void _genderEvent(
    EditGenderFieldEvent event,
    Emitter<EditProfileBaseState> emit,
  ) {
    final currentState = state.data;
    String gender = event.gender.trim();
    emit(EditProfileInitial(currentState.copyWith(gender: gender)));
  }

  void _buttonEvent(EditButtonEvent event, Emitter<EditProfileBaseState> emit) {
    final currentState = state.data;
    final isValid = [
      currentState.phone,
      currentState.firstName,
      currentState.lastName,
    ].every((field) => field.value.isNotEmpty && field.error == null);
    final isModified =
        currentState.phone.value.trim() != user.phoneNumber.trim() ||
        currentState.firstName.value.trim() != user.firstName.trim() ||
        currentState.lastName.value.trim() != user.lastName.trim() ||
        currentState.gender != user.gender ||
        currentState.birthday !=user.birthDate;

    emit(
      EditProfileInitial(
        currentState.copyWith(buttonEvent: isModified && isValid),
      ),
    );
  }

  Future<void> _onSubmit(
    EditSubmitEvent event,
    Emitter<EditProfileBaseState> emit,
  ) async {
    final currentState = state.data;
    emit(EditProfileLoading(currentState));
    try {
      Map<String, dynamic> response = await EditProfileService()
          .editProfileService(
            editModel:
                EditProfileModel(
                  firstName: currentState.firstName.value,
                  lastName: currentState.lastName.value,
                  gender: currentState.gender,
                  birthDate: currentState.birthday,
                  phoneNumber: currentState.phone.value,
                ).toJson(),
          );
      String? message = response["Done"];
      //Future.delayed(Duration(seconds: 2));
      emit(EditProfileSuccess(currentState,message: message));
    } on Exception catch (e) {
      emit(EditProfileFailed(currentState, message: e.toString()));
    }
  }
}
