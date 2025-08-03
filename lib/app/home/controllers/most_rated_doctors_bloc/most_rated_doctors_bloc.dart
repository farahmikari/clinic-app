import 'package:clinic_app/app/home/models/most_rated_doctor_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'most_rated_doctors_event.dart';
part 'most_rated_doctors_state.dart';

class MostRatedDoctorsBloc
    extends Bloc<MostRatedDoctorsEvent, MostRatedDoctorsState> {
  MostRatedDoctorsBloc() : super(MostRatedDoctorsLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    on<MostRatedDoctorsEvent>((event, emit) async {
      emit(MostRatedDoctorsLoading());
      try {
        var response = await api.get(EndPoints.top5);
        final List<MostRatedDoctorModel> mostRatedDoctors =
            (response[ApiKey.data] as List<dynamic>)
                .map(
                  (mostRatedDoctor) =>
                      MostRatedDoctorModel.fromJson(mostRatedDoctor),
                )
                .toList();
        emit(MostRatedDoctorsLoaded(mostRatedDoctors: mostRatedDoctors));
        // await Future.delayed(const Duration(seconds: 5));
        // final List<MostRatedDoctorModel> myMostRatedDoctors =
        //     mostRatedDoctors
        //         .map(
        //           (mostRatedDoctor) =>
        //               MostRatedDoctorModel.fromJson(mostRatedDoctor),
        //         )
        //         .toList();
        // emit(MostRatedDoctorsLoaded(mostRatedDoctors: myMostRatedDoctors));
      } catch (e) {
        emit(MostRatedDoctorsLoading());
        // emit(
        //   MostRatedDoctorsFailed(
        //     errorMessage:
        //         "Something Went Wrong When Trying To Fetch Most Rated Doctors",
        //   ),
        // );
      }
    });
  }
}
