import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clinic_app/app/book_appointment/models/reservation_model.dart';
import 'package:equatable/equatable.dart';

part 'manage_booking_validator_event.dart';
part 'manage_booking_validator_state.dart';

class ManageBookingValidatorBloc
    extends Bloc<ManageBookingValidatorEvent, ManageBookingValidatorState> {
  ManageBookingValidatorBloc() : super(ManageBookingValidatorInitial()) {
    DioConsumer api = DioConsumer(dio: Dio());

    late bool hasCancelAbilityFetched = false;
    late bool isCancelable;

    on<IsReservationEditingIsToggled>((event, emit) {
      emit(
        ManageBookingValidatorUpdate(
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
          ManageBookingValidatorUpdate(
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
          ManageBookingValidatorUpdate(
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
          ManageBookingValidatorUpdate(
            previousReservation: state.previousReservation,
            currentReservation: state.currentReservation,
            isReservationEditing: state.isReservationEditing,
            isAbleToCancel: false,
            isAbleToEdit: state.isAbleToEdit,
          ),
        );
      }
    });

    on<EditAbilityIsChecked>((event, emit) {
      ReservationModel currentReservation = state.currentReservation.copyWith(
        requestTypeId: event.requestTypeId,
        day: event.day,
        timeId: event.timeId,
        withMedicalReport: event.withMedicalReport,
      );
      late bool isAbleToEdit;
      if (currentReservation == state.previousReservation) {
        isAbleToEdit = false;
      } else {
        isAbleToEdit = true;
      }
      emit(
        ManageBookingValidatorUpdate(
          previousReservation: state.previousReservation,
          currentReservation: currentReservation,
          isReservationEditing: state.isReservationEditing,
          isAbleToCancel: state.isAbleToCancel,
          isAbleToEdit: isAbleToEdit,
        ),
      );
    });

    on<CurrentAndPreviousReservationAreSet>((event, emit) {
      emit(
        ManageBookingValidatorUpdate(
          currentReservation: event.currentAndPreviousReservation,
          previousReservation: event.currentAndPreviousReservation,
          isReservationEditing: state.isReservationEditing,
          isAbleToCancel: state.isAbleToCancel,
          isAbleToEdit: state.isAbleToEdit,
        ),
      );
    });
  }
}
