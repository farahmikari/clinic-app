import 'dart:async';
import 'package:clinic_app/app/home/models/json_model.dart';
import 'package:clinic_app/app/home/models/most_rated_doctor_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'most_rated_doctors_event.dart';
part 'most_rated_doctors_state.dart';

class MostRatedDoctorsBloc
    extends Bloc<MostRatedDoctorsEvent, MostRatedDoctorsState> {
  MostRatedDoctorsBloc() : super(MostRatedDoctorsLoading()) {
    on<MostRatedDoctorsEvent>(_fetchMostRatedDoctor);
  }

  FutureOr<void> _fetchMostRatedDoctor(event, emit) async {
    try {
      emit(MostRatedDoctorsLoading());
      await Future.delayed(const Duration(seconds: 5));
      final List<MostRatedDoctorModel> myMostRatedDoctors =
          mostRatedDoctors
              .map(
                (mostRatedDoctor) =>
                    MostRatedDoctorModel.fromJson(mostRatedDoctor),
              )
              .toList();
      emit(MostRatedDoctorsLoaded(mostRatedDoctors: myMostRatedDoctors));
    } catch (e) {
      emit(
        MostRatedDoctorsFailed(
          errorMessage:
              "Something Went Wrong When Trying To Fetch Most Rated Doctors",
        ),
      );
    }
  }
}
