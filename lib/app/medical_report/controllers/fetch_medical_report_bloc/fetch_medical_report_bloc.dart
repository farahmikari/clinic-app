import 'package:clinic_app/app/medical_report/models/json_model.dart';
import 'package:clinic_app/app/medical_report/models/medical_report_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_medical_report_event.dart';
part 'fetch_medical_report_state.dart';

class FetchMedicalReportBloc
    extends Bloc<FetchMedicalReportEvent, FetchMedicalReportState> {
  FetchMedicalReportBloc() : super(FetchMedicalReportInitial()) {
    on<FetchMedicalReportEvent>((event, emit) async {
      emit(FetchMedicalReportLoading());
      await Future.delayed(Duration(seconds: 4));
      try {
        MedicalReportModel medicalReport = MedicalReportModel.fromJson(
          appointmentMedicalReport,
        );
        emit(FetchMedicalReportLoaded(medicalReport: medicalReport));
      } catch (e) {
        emit(FetchMedicalReportFailed(errorMessage: e.toString()));
      }
    });
  }
}
