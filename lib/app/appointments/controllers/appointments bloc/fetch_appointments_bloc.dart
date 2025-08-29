import 'package:clinic_app/app/appointments/models/appointment_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'fetch_appointments_event.dart';
part 'fetch_appointments_state.dart';

class FetchAppointmentsBloc
    extends Bloc<FetchAppointmentsEvent, FetchAppointmentsState> {
  FetchAppointmentsBloc() : super(FetchAppointmentsLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    List<AppointmentModel> pendingAppointments = [];
    List<AppointmentModel> completedAppointments = [];
    List<AppointmentModel> allAppointments = [];

    on<FetchAppointments>((event, emit) async {
      emit(FetchAppointmentsLoading());
      try {
        dynamic pendingAppointmentsResponse = await api.get(
          EndPoints.patientAppointments,
          queryParameter: {
            ApiKey.status: ApiKey.pending,
            ApiKey.keyword: event.searchWord,
          },
        );
        pendingAppointments =
            (pendingAppointmentsResponse[ApiKey.data] as List<dynamic>)
                .map((appointment) => AppointmentModel.fromJson(appointment))
                .toList();
        dynamic completedAppointmentsResponse = await api.get(
          EndPoints.patientAppointments,
          queryParameter: {
            ApiKey.status: ApiKey.completed,
            ApiKey.keyword: event.searchWord,
          },
        );
        completedAppointments =
            (completedAppointmentsResponse[ApiKey.data] as List<dynamic>)
                .map((appointment) => AppointmentModel.fromJson(appointment))
                .toList();
        allAppointments = [...pendingAppointments, ...completedAppointments];
        if (event.filterIndex == 1) {
          if (pendingAppointments.isEmpty) {
            emit(FetchAppointmentsLoadeEmpty());
          } else {
            emit(FetchAppointmentsLoaded(appointments: pendingAppointments));
          }
        } else if (event.filterIndex == 2) {
          if (completedAppointments.isEmpty) {
            emit(FetchAppointmentsLoadeEmpty());
          } else {
            emit(FetchAppointmentsLoaded(appointments: completedAppointments));
          }
        } else {
          if (allAppointments.isEmpty) {
            emit(FetchAppointmentsLoadeEmpty());
          } else {
            emit(FetchAppointmentsLoaded(appointments: allAppointments));
          }
        }
      } on ServerException catch (e) {
        emit(FetchAppointmentsFailed(errorMessage: e.errorModel.errorMessage));
      }
    }, transformer: switchMapTransformer());

    on<DisplayAllAppointments>((event, emit) async {
      if (allAppointments.isEmpty) {
        emit(FetchAppointmentsLoadeEmpty());
      } else {
        emit(FetchAppointmentsLoaded(appointments: allAppointments));
      }
    });

    on<DisplayPendingAppointments>((event, emit) async {
      if (pendingAppointments.isEmpty) {
        emit(FetchAppointmentsLoadeEmpty());
      } else {
        emit(FetchAppointmentsLoaded(appointments: pendingAppointments));
      }
    });

    on<DisplayCompletedAppointments>((event, emit) async {
      if (completedAppointments.isEmpty) {
        emit(FetchAppointmentsLoadeEmpty());
      } else {
        emit(FetchAppointmentsLoaded(appointments: completedAppointments));
      }
    });
  }
}
