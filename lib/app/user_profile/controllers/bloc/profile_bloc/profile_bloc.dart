import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileBlocInitial()) {
    on<ProfileEvent>(_profileEvent);
  }

  Future<void> _profileEvent(event, emit) async {
    String? token = await SharedPreferencesService.getToken();
    if (token == null) {
      emit(ProfileBlocVisitor());
    }
    try {
      emit(ProfileBlocLoading());
      await Future.delayed(Duration(seconds: 5));
      emit(ProfileBlocSuccess());
    } on Exception catch (e) {
      emit(ProfileBlocFailure(message: e.toString()));
    }
  }
}
