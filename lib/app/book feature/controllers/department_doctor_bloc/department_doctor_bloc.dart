import 'dart:async';

import 'package:clinic_app/app/book%20feature/models/department_doctor_model.dart';
import 'package:clinic_app/app/book%20feature/models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'department_doctor_event.dart';
part 'department_doctor_state.dart';

class DepartmentDoctorBloc
    extends Bloc<DepartmentDoctorEvent, DepartmentDoctorState> {
  DepartmentDoctorBloc() : super(DepartmentDoctorLoading()) {
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    on<FetchDepartmentDoctors>(
      _fetchDepartmentDoctors,
      transformer: switchMapTransformer(),
    );
  }

  FutureOr<void> _fetchDepartmentDoctors(event, emit) async {
    try {
      emit(DepartmentDoctorLoading());
      await Future.delayed(Duration(seconds: 2));

      DepartmentDoctorModel morningShiftDoctor = DepartmentDoctorModel.fromJson(
        myDoctors[event.departmentId]!["morning_shift_doctor"]
            as Map<String, dynamic>,
      );
      DepartmentDoctorModel afternoonShiftDoctor =
          DepartmentDoctorModel.fromJson(
            myDoctors[event.departmentId]!["afternoon_shift_doctor"]
                as Map<String, dynamic>,
          );
      emit(
        DepartmentDoctorLoaded(
          afternoonShiftDoctor: afternoonShiftDoctor,
          morningShiftDoctor: morningShiftDoctor,
        ),
      );
    } catch (e) {
      emit(DepartmentDoctorFailed());
    }
  }
}
