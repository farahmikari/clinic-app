import 'package:clinic_app/app/department_doctors/models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/app/department_doctors/models/department_doctor_model.dart';

part 'fetch_department_doctors_event.dart';
part 'fetch_department_doctors_state.dart';

class FetchDepartmentDoctorsBloc
    extends Bloc<FetchDepartmentDoctorsEvent, FetchDepartmentDoctorsState> {
  FetchDepartmentDoctorsBloc() : super(FetchDepartmentDoctorsLoading()) {
    late List<DepartmentDoctorModel> morningDepartmentDoctors;
    late List<DepartmentDoctorModel> afternoonDepartmentDoctors;
    late List<DepartmentDoctorModel> allDepartmentDoctors;

    on<FetchDepartmentDoctors>((event, emit) async {
      emit(FetchDepartmentDoctorsLoading());
      await Future.delayed(Duration(seconds: 4));
      try {
        morningDepartmentDoctors =
            (myMorningDepartmentsDoctors[event.departmentId] as List<dynamic>)
                .map(
                  (morningDepartmentDoctor) =>
                      DepartmentDoctorModel.fromJson(morningDepartmentDoctor),
                )
                .toList();
        afternoonDepartmentDoctors =
            (myAfternoonDepartmentsDoctors[event.departmentId] as List<dynamic>)
                .map(
                  (afternoonDepartmentDoctor) =>
                      DepartmentDoctorModel.fromJson(afternoonDepartmentDoctor),
                )
                .toList();
        allDepartmentDoctors = [
          ...morningDepartmentDoctors,
          ...afternoonDepartmentDoctors,
        ];
        emit(
          FetchDepartmentDoctorsLoaded(departmentDoctors: allDepartmentDoctors),
        );
      } catch (e) {
        emit(FetchDepartmentDoctorsFailed(errorMessage: ''));
      }
    });

    on<DisplayMorningDepartmentDoctors>((event, emit) async {
      emit(
        FetchDepartmentDoctorsLoaded(
          departmentDoctors: morningDepartmentDoctors,
        ),
      );
    });

    on<DisplayAfternoonDepartmentDoctors>((event, emit) async {
      emit(
        FetchDepartmentDoctorsLoaded(
          departmentDoctors: afternoonDepartmentDoctors,
        ),
      );
    });

    on<DisplayAllDepartmentDoctors>((event, emit) async {
      emit(
        FetchDepartmentDoctorsLoaded(departmentDoctors: allDepartmentDoctors),
      );
    });
  }
}
