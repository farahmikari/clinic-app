import 'package:clinic_app/core/services/shared_preferences/shared_pereference_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'vital_signals_event.dart';
part 'vital_signals_state.dart';

class VitalSignalsBloc extends Bloc<VitalSignalsEvent, VitalSignalsState> {
  VitalSignalsBloc() : super(VitalSignalsInitial()) {
    on<VitalSignalsEvent>(_vitalSignalEvent);
  }

  Future<void> _vitalSignalEvent(event, emit) async {
    String? token = await SharedPreferencesService.getToken();
    //VitalSignalsModel? vitalSignal;
    if (token == null) {
      emit((VitalSignalsVisitor()));
    } else {
      emit(VitalSignalsLoading());
      try {
        //VitalSignalsModel? vitalSignal = await InformationUserService().showInfoUser();
        //if (vitalSignal != null) {
        await Future.delayed(Duration(seconds: 2));
        emit(VitalSignalsSuccess());
        //  }
        // else{
        //   emit(VitalSignalsFailure(message: "can't load info user"));
        // }
      } on Exception catch (e) {
        emit(VitalSignalsFailure(message: e.toString()));
      }
    }
  }
}
