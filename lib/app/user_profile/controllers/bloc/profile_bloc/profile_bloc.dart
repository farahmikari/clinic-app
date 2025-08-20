import 'package:clinic_app/app/user_profile/controllers/services/information_user_service.dart';
import 'package:clinic_app/app/user_profile/models/user_data_model.dart';
import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileBlocInitial()) {
    on <ProfileEvent>(_profileEvent);
  }

  Future<void> _profileEvent(event, emit) async {
    String? token = await SharedPreferencesService.getToken();
    if (token == null) {
      emit(ProfileBlocVisitor());
    } else {
      emit(ProfileBlocLoading());
      try {
        UserDataModel? user = await InformationUserService().showInfoUser();
        if (user != null) {
          emit(ProfileBlocSuccess(user: user));
        }
        else{
          emit(ProfileBlocFailure(message: "can't load info user"));
        }
      } on Exception catch (e) {
        emit(ProfileBlocFailure(message: e.toString()));
      }
    }
  }
}
