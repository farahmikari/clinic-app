import 'dart:async';
import 'package:clinic_app/app/doctor/models/doctor_model.dart';
import 'package:clinic_app/app/doctor/models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  DoctorBloc() : super(DoctorLoading()) {
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    on<FetchDoctor>(_fetchDoctor, transformer: switchMapTransformer());
  }

  FutureOr<void> _fetchDoctor(event, emit) async {
    try {
      emit(DoctorLoading());
      await Future.delayed(Duration(seconds: 5));
      DoctorModel doctor = DoctorModel.fromJson(
        doctors.firstWhere((doctor) => doctor["id"] == event.id),
      );
      emit(DoctorLoaded(doctor: doctor));
    } catch (e) {
      emit(
        DoctorFailed(
          errorMessage: "Something Went Wrong When Trying To Fetch Doctor",
        ),
      );
    }
  }
}
