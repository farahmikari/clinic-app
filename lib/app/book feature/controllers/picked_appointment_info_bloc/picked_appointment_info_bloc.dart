import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'picked_appointment_info_event.dart';
part 'picked_appointment_info_state.dart';

class PickedAppointmentInfoBloc
    extends Bloc<PickedAppointmentInfoEvent, PickedAppointmentInfoState> {
  PickedAppointmentInfoBloc() : super(PickedAppointmentInfoInitial()) {
    on<DepartmentIdChanged>(_changeDepartmentId);

    on<RequestTypesDrawToggled>(_toggleRequestTypesDraw);

    on<RequestTypeIdChanged>(_changeRequestTypeId);

    on<DayIdChanged>(_changeDayId);

    on<TimeIdChanged>(_changeTimeId);

    on<MorningTimesLengthChanged>(_changeMorningTimesLength);

    on<AfternoonTimesLengthChanged>(_changeAfternoonTimesLength);

    on<WithMedicalReportToggled>(_toggleWithMedicalReport);
  }

  FutureOr<void> _toggleWithMedicalReport(event, emit) {
    emit(
      UpdatePickedValues(
        pickedDepartmentId: state.pickedDepartmentId,
        pickedDoctorId: state.pickedDoctorId,
        pickedDayId: state.pickedDayId,
        pickedTimeId: state.pickedTimeId,
        pickedRequestTypeId: state.pickedRequestTypeId,
        morningTimesLength: state.morningTimesLength,
        afternoonTimesLength: state.afternoonTimesLength,
        drawRequestTypes: false,
        withMedicalReport: event.withMedicalReport,
        confirm: state.confirm,
      ),
    );
  }

  FutureOr<void> _changeAfternoonTimesLength(event, emit) {
    if (state.afternoonTimesLength == 6) {
      emit(
        UpdatePickedValues(
          pickedDepartmentId: state.pickedDepartmentId,
          pickedDoctorId: state.pickedDoctorId,
          pickedRequestTypeId: state.pickedRequestTypeId,
          drawRequestTypes: false,
          pickedDayId: state.pickedDayId,
          pickedTimeId: state.pickedTimeId,
          morningTimesLength: state.morningTimesLength,
          afternoonTimesLength: event.afternoonTimesLength,
          withMedicalReport: state.withMedicalReport,
          confirm: state.confirm,
        ),
      );
    } else {
      emit(
        UpdatePickedValues(
          pickedDepartmentId: state.pickedDepartmentId,
          pickedDoctorId: state.pickedDoctorId,
          pickedRequestTypeId: state.pickedRequestTypeId,
          drawRequestTypes: false,
          pickedDayId: state.pickedDayId,
          pickedTimeId: state.pickedTimeId,
          morningTimesLength: state.morningTimesLength,
          afternoonTimesLength: 6,
          withMedicalReport: state.withMedicalReport,
          confirm: state.confirm,
        ),
      );
    }
  }

  FutureOr<void> _changeMorningTimesLength(event, emit) {
    if (state.morningTimesLength == 6) {
      emit(
        UpdatePickedValues(
          pickedDepartmentId: state.pickedDepartmentId,
          pickedDoctorId: state.pickedDoctorId,
          pickedRequestTypeId: state.pickedRequestTypeId,
          drawRequestTypes: false,
          pickedDayId: state.pickedDayId,
          pickedTimeId: state.pickedTimeId,
          morningTimesLength: event.morningTimesLength,
          afternoonTimesLength: state.afternoonTimesLength,
          withMedicalReport: state.withMedicalReport,
          confirm: state.confirm,
        ),
      );
    } else {
      emit(
        UpdatePickedValues(
          pickedDepartmentId: state.pickedDepartmentId,
          pickedDoctorId: state.pickedDoctorId,
          pickedRequestTypeId: state.pickedRequestTypeId,
          drawRequestTypes: false,
          pickedDayId: state.pickedDayId,
          pickedTimeId: state.pickedTimeId,
          morningTimesLength: 6,
          afternoonTimesLength: state.afternoonTimesLength,
          withMedicalReport: state.withMedicalReport,
          confirm: state.confirm,
        ),
      );
    }
  }

  FutureOr<void> _changeTimeId(event, emit) {
    emit(
      UpdatePickedValues(
        pickedDepartmentId: state.pickedDepartmentId,
        pickedDoctorId: event.pickedDoctorId,
        pickedRequestTypeId: state.pickedRequestTypeId,
        drawRequestTypes: false,
        pickedDayId: state.pickedDayId,
        pickedTimeId: event.pickedTimeId,
        morningTimesLength: state.morningTimesLength,
        afternoonTimesLength: state.afternoonTimesLength,
        withMedicalReport: state.withMedicalReport,
        confirm: true,
      ),
    );
  }

  FutureOr<void> _changeDayId(event, emit) {
    emit(
      UpdatePickedValues(
        pickedDepartmentId: state.pickedDepartmentId,
        pickedDoctorId: -1,
        pickedRequestTypeId: state.pickedRequestTypeId,
        drawRequestTypes: false,
        pickedDayId: event.pickedDayId,
        pickedTimeId: -1,
        morningTimesLength: 6,
        afternoonTimesLength: 6,
        withMedicalReport: state.withMedicalReport,
        confirm: false,
      ),
    );
  }

  FutureOr<void> _changeRequestTypeId(event, emit) {
    emit(
      UpdatePickedValues(
        pickedDepartmentId: state.pickedDepartmentId,
        pickedDoctorId: state.pickedDoctorId,
        pickedRequestTypeId: event.pickedRequestTypeId,
        drawRequestTypes: false,
        pickedDayId: state.pickedDayId,
        pickedTimeId: state.pickedTimeId,
        morningTimesLength: state.morningTimesLength,
        afternoonTimesLength: state.afternoonTimesLength,
        withMedicalReport: state.withMedicalReport,
        confirm: state.confirm,
      ),
    );
  }

  FutureOr<void> _toggleRequestTypesDraw(event, emit) {
    emit(
      UpdatePickedValues(
        pickedDepartmentId: state.pickedDepartmentId,
        pickedDoctorId: state.pickedDoctorId,
        pickedRequestTypeId: state.pickedRequestTypeId,
        drawRequestTypes: !state.drawRequestTypes,
        pickedDayId: state.pickedDayId,
        pickedTimeId: state.pickedTimeId,
        morningTimesLength: state.morningTimesLength,
        afternoonTimesLength: state.afternoonTimesLength,
        withMedicalReport: state.withMedicalReport,
        confirm: state.confirm,
      ),
    );
  }

  FutureOr<void> _changeDepartmentId(event, emit) {
    emit(
      UpdatePickedValues(
        pickedDepartmentId: event.pickedDepartmentId,
        pickedDoctorId: -1,
        pickedRequestTypeId: -1,
        drawRequestTypes: false,
        pickedDayId: -1,
        pickedTimeId: -1,
        morningTimesLength: 6,
        afternoonTimesLength: 6,
        withMedicalReport: false,
        confirm: false,
      ),
    );
  }
}
