import 'package:clinic_app/app/vital_signals/controllers/services/vital_service.dart';
import 'package:clinic_app/app/vital_signals/model/vital_signals_model.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
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
    dynamic vitalSignal;
    if (token == null) {
      emit((VitalSignalsVisitor()));
      
    } else {
      emit(VitalSignalsLoading());
      try {
        vitalSignal = await VitalService().vitalSignalsService();
        if (vitalSignal != null) {
        emit(VitalSignalsSuccess(vitalSignals: VitalSignalsModel.formJson(vitalSignal)));
          }
      } on ServerException catch (e) {
        emit(VitalSignalsFailure(message:e.errorModel.errorMessage ));
      }
    }
  }
}
