import 'package:clinic_app/app/medical_report/models/medical_report_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_medical_report_event.dart';
part 'fetch_medical_report_state.dart';

class FetchMedicalReportBloc
    extends Bloc<FetchMedicalReportEvent, FetchMedicalReportState> {
  FetchMedicalReportBloc() : super(FetchMedicalReportInitial()) {
    DioConsumer api = DioConsumer(dio: Dio());
    on<MedicalReportIsFetched>((event, emit) async {
      emit(FetchMedicalReportLoading());
      try {
        final response = await api.get(
          EndPoints.medicalReportId(event.appointmentId),
        );
        MedicalReportModel medicalReport = response[ApiKey.medicalReportUrl];
        emit(FetchMedicalReportLoaded(medicalReport: medicalReport));
      } on ServerException catch (e) {
        emit(FetchMedicalReportFailed(errorMessage: e.errorModel.errorMessage));
      }
    });
  }
}
