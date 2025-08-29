import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/app/department_doctors/models/department_doctor_model.dart';
import 'package:rxdart/rxdart.dart';

part 'fetch_department_doctors_event.dart';
part 'fetch_department_doctors_state.dart';

class FetchDepartmentDoctorsBloc
    extends Bloc<FetchDepartmentDoctorsEvent, FetchDepartmentDoctorsState> {
  FetchDepartmentDoctorsBloc() : super(FetchDepartmentDoctorsLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    late List<DepartmentDoctorModel> morningDepartmentDoctors;
    late List<DepartmentDoctorModel> afternoonDepartmentDoctors;
    late List<DepartmentDoctorModel> allDepartmentDoctors;

    on<FetchDepartmentDoctors>((event, emit) async {
      emit(FetchDepartmentDoctorsLoading());
      try {
        final morningDepartmentDoctorsResponse = await api.get(
          EndPoints.doctorDepartmentId(event.departmentId),
          queryParameter: {
            ApiKey.status: ApiKey.morning,
            ApiKey.keyword: event.searchWord,
          },
        );
        final afternoonDepartmentDoctorsResponse = await api.get(
          EndPoints.doctorDepartmentId(event.departmentId),
          queryParameter: {
            ApiKey.status: ApiKey.afternoon,
            ApiKey.keyword: event.searchWord,
          },
        );
        morningDepartmentDoctors =
            (morningDepartmentDoctorsResponse as List<dynamic>)
                .map(
                  (morningDepartmentDoctor) =>
                      DepartmentDoctorModel.fromJson(morningDepartmentDoctor),
                )
                .toList();
        afternoonDepartmentDoctors =
            (afternoonDepartmentDoctorsResponse as List<dynamic>)
                .map(
                  (afternoonDepartmentDoctor) =>
                      DepartmentDoctorModel.fromJson(afternoonDepartmentDoctor),
                )
                .toList();
        allDepartmentDoctors = [
          ...morningDepartmentDoctors,
          ...afternoonDepartmentDoctors,
        ];
        if (event.filterIndex == 1) {
          if (morningDepartmentDoctors.isEmpty) {
            emit(FetchDepartmentDoctorsLoadedEmpty());
          } else {
            emit(
              FetchDepartmentDoctorsLoaded(
                departmentDoctors: morningDepartmentDoctors,
              ),
            );
          }
        } else if (event.filterIndex == 2) {
          if (afternoonDepartmentDoctors.isEmpty) {
            emit(FetchDepartmentDoctorsLoadedEmpty());
          } else {
            emit(
              FetchDepartmentDoctorsLoaded(
                departmentDoctors: afternoonDepartmentDoctors,
              ),
            );
          }
        } else {
          if (allDepartmentDoctors.isEmpty) {
            emit(FetchDepartmentDoctorsLoadedEmpty());
          } else {
            emit(
              FetchDepartmentDoctorsLoaded(
                departmentDoctors: allDepartmentDoctors,
              ),
            );
          }
        }
      } on ServerException catch (e) {
        emit(
          FetchDepartmentDoctorsFailed(errorMessage: e.errorModel.errorMessage),
        );
      }
    }, transformer: switchMapTransformer());

    on<DisplayMorningDepartmentDoctors>((event, emit) async {
      if (allDepartmentDoctors.isEmpty) {
        emit(FetchDepartmentDoctorsLoadedEmpty());
      } else {
        emit(
          FetchDepartmentDoctorsLoaded(
            departmentDoctors: morningDepartmentDoctors,
          ),
        );
      }
    });

    on<DisplayAfternoonDepartmentDoctors>((event, emit) async {
      if (allDepartmentDoctors.isEmpty) {
        emit(FetchDepartmentDoctorsLoadedEmpty());
      } else {
        emit(
          FetchDepartmentDoctorsLoaded(
            departmentDoctors: afternoonDepartmentDoctors,
          ),
        );
      }
    });

    on<DisplayAllDepartmentDoctors>((event, emit) async {
      if (allDepartmentDoctors.isEmpty) {
        emit(FetchDepartmentDoctorsLoadedEmpty());
      } else {
        emit(
          FetchDepartmentDoctorsLoaded(departmentDoctors: allDepartmentDoctors),
        );
      }
    });
  }
}
