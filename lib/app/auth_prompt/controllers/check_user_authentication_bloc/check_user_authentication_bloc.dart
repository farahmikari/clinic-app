import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_user_authentication_event.dart';
part 'check_user_authentication_state.dart';

class CheckUserAuthenticationBloc
    extends Bloc<CheckUserAuthenticationEvent, CheckUserAuthenticationState> {
  CheckUserAuthenticationBloc() : super(CheckUserAuthenticationLoading()) {
    on<UserAuthenticationIsChecked>((event, emit) async {
      final token = await SharedPreferencesService.getToken();
      if (token != null) {
        emit(UserAuthenticated());
      } else {
        emit(UserUnAuthenticated());
      }
    });
  }
}
