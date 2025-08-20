import 'package:clinic_app/app/user_drawer/controllers/service/logout_service.dart';
import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutUserEvent>(_logoutEvent);
    on<LogoutVisitorEvent>(_logoutVisitor);
  }
  Future<void> _logoutVisitor(LogoutVisitorEvent event, emit) async {
    final token = await SharedPreferencesService.getToken();
    if (token == null || token.isEmpty) {
      emit(LogoutVisitor());
    }
  }

  Future<void> _logoutEvent(LogoutUserEvent event, emit) async {
    emit(LogoutLoading());
    try {
      await LogoutService().logout();
      await SharedPreferencesService.clearToken();
      emit(LogoutSuccess());
    } on Exception catch (e) {
      emit(LogoutFailure(message: e.toString()));
    }
  }
}
