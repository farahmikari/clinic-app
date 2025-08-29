import 'package:clinic_app/app/home/models/user_points_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_user_points_event.dart';
part 'fetch_user_points_state.dart';

class FetchUserPointsBloc
    extends Bloc<FetchUserPointsEvent, FetchUserPointsState> {
  FetchUserPointsBloc() : super(FetchUserPointsLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    on<FetchUserPoints>((event, emit) async {
      emit(FetchUserPointsLoading());
      try {
        final response = await api.get(EndPoints.points);
        UserPointsModel userPoints = UserPointsModel.fromJson(response);
        emit(FetchUserPointsLoaded(userPoints: userPoints));
      } on ServerException catch (e) {
        emit(FetchUserPointsFailed(errorMessage: e.errorModel.errorMessage));
      }
    });
  }
}
