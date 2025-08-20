import 'package:clinic_app/app/doctor/models/doctor_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc() : super(DoctorLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());

    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    on<FetchDoctor>((event, emit) async {
      emit(DoctorLoading());
      try {
        var response = await api.get(EndPoints.doctorProfile(event.id));
        DoctorModel doctor = DoctorModel.fromJson(response[ApiKey.data]);
        emit(DoctorLoaded(doctor: doctor));
        // emit(DoctorLoading());
        // await Future.delayed(Duration(seconds: 5));
        // DoctorModel doctor = DoctorModel.fromJson(
        //   doctors.firstWhere((doctor) => doctor["id"] == event.id),
        // );
        // emit(DoctorLoaded(doctor: doctor));
      } catch (e) {
        emit(DoctorLoading());
        // emit(
        //   DoctorFailed(
        //     errorMessage: "Something Went Wrong When Trying To Fetch Doctor",
        //   ),
        // );
      }
    }, transformer: switchMapTransformer());
  }
}
