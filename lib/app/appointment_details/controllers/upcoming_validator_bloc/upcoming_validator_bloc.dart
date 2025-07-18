import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upcoming_validator_event.dart';
part 'upcoming_validator_state.dart';

class UpcomingValidatorBloc
    extends Bloc<UpcomingValidatorEvent, UpcomingValidatorState> {
  UpcomingValidatorBloc() : super(UpcomingValidatorInitial()) {
    DioConsumer api = DioConsumer(dio: Dio());

    late bool hasCancelAbilityFetched = false;
    late bool isCancelable;
    on<IsReservationEditingIsToggled>((event, emit) {
      emit(
        UpcomingValidatorUpdate(
          previousReservation: state.previousReservation,
          currentReservation: state.currentReservation,
          isReservationEditing: !state.isReservationEditing,
          isAbleToCancel: state.isAbleToCancel,
          isAbleToEdit: state.isAbleToEdit,
        ),
      );
    });

    on<CancelAbilityIsChecked>((event, emit) async {
      if (hasCancelAbilityFetched) {
        emit(
          UpcomingValidatorUpdate(
            previousReservation: state.previousReservation,
            currentReservation: state.currentReservation,
            isReservationEditing: state.isReservationEditing,
            isAbleToCancel: isCancelable,
            isAbleToEdit: state.isAbleToEdit,
          ),
        );
        return;
      }
      try {
        dynamic response = await api.get(
          EndPoints.canCancel(event.appointmentId),
        );
        isCancelable = response[ApiKey.canCancel];
        emit(
          UpcomingValidatorUpdate(
            previousReservation: state.previousReservation,
            currentReservation: state.currentReservation,
            isReservationEditing: state.isReservationEditing,
            isAbleToCancel: isCancelable,
            isAbleToEdit: state.isAbleToEdit,
          ),
        );
        hasCancelAbilityFetched = true;
      } catch (e) {
        emit(
          UpcomingValidatorUpdate(
            previousReservation: state.previousReservation,
            currentReservation: state.currentReservation,
            isReservationEditing: state.isReservationEditing,
            isAbleToCancel: false,
            isAbleToEdit: state.isAbleToEdit,
          ),
        );
      }
    });

    on<CurrentAndPreviousReservationAreSet>((event, emit) {
      emit(
        UpcomingValidatorUpdate(
          currentReservation: event.currentAndPreviousreservation,
          previousReservation: event.currentAndPreviousreservation,
          isReservationEditing: state.isReservationEditing,
          isAbleToCancel: state.isAbleToCancel,
          isAbleToEdit: state.isAbleToEdit,
        ),
      );
    });

    on<EditAbilityIsChecked>((event, emit) {
      ReservationModel currentReservation = state.currentReservation.copyWith(
        departmentId: event.departmentId,
        doctorId: event.doctorId,
        requestTypeId: event.requestTypeId,
        day: event.day,
        timeId: event.timeId,
        withMedicalReport: event.withMedicalReport,
      );
      late bool isAbleToEdit;
      if (currentReservation == state.previousReservation ||
          event.timeId == -1) {
        isAbleToEdit = false;
      } else {
        isAbleToEdit = true;
      }
      emit(
        UpcomingValidatorUpdate(
          currentReservation: currentReservation,
          previousReservation: state.previousReservation,
          isReservationEditing: state.isReservationEditing,
          isAbleToCancel: state.isAbleToCancel,
          isAbleToEdit: isAbleToEdit,
        ),
      );
    });
  }
}
