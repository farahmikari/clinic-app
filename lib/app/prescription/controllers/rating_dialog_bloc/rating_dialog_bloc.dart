import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rating_dialog_event.dart';
part 'rating_dialog_state.dart';

class RatingDialogBloc extends Bloc<RatingDialogEvent, RatingDialogState> {
  RatingDialogBloc() : super(RatingDialogInitial()) {
    DioConsumer api = DioConsumer(dio: Dio());
    on<RatingDialogIsDisplayed>((event, emit) async {
      await Future.delayed(Duration(seconds: 5));
      emit(
        RatingDialogVisible(
          appointmentId: event.appointmentId,
          rating: state.rating,
        ),
      );
      try {
        await api.put(
          EndPoints.prescriptionId(event.appointmentId),
          data: {ApiKey.isPrescriptionViewed: true},
        );
      } catch (e) {
        //
      }
    });

    on<RatingDialogIsUpdated>((event, emit) {
      emit(
        RatingDialogUpdate(
          appointmentId: state.appointmentId,
          rating: event.rating,
        ),
      );
    });

    on<RatingIsSubmited>((event, emit) async {
      try {
        await api.post(
          EndPoints.rate,
          data: {
            ApiKey.appointmentId: state.appointmentId,
            ApiKey.rating: state.rating,
          },
        );
      } catch (e) {
        //
      }
    });
  }
}
