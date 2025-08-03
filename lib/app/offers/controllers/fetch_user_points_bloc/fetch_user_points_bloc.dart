import 'package:clinic_app/app/offers/controllers/fetch_offers_bloc/fetch_offers_bloc.dart';
import 'package:clinic_app/app/offers/models/json_model.dart';
import 'package:clinic_app/app/offers/models/user_points_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_user_points_event.dart';
part 'fetch_user_points_state.dart';

class FetchUserPointsBloc
    extends Bloc<FetchUserPointsEvent, FetchUserPointsState> {
  FetchUserPointsBloc() : super(FetchUserPointsLoading()) {
    on<FetchUserPoints>((event, emit) async {
      await Future.delayed(Duration(seconds: 2));
      try {
        UserPointsModel userPoints = UserPointsModel.fromJson(myUserPoints);
        emit(FetchUserPointsLoaded(userPoints: userPoints));
      } catch (e) {
        FetchOffersFailed(errorMessage: e.toString());
      }
    });
  }
}
