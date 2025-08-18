import 'package:clinic_app/app/bill_details/models/bill_info_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_bill_details_event.dart';
part 'fetch_bill_details_state.dart';

class FetchBillDetailsBloc
    extends Bloc<FetchBillDetailsEvent, FetchBillDetailsState> {
  FetchBillDetailsBloc() : super(FetchBillDetailsLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    on<FetchBillDetails>((event, emit) async {
      emit(FetchBillDetailsLoading());
      try {
        final response = await api.get(EndPoints.billId(event.billId));
        List<BillInfoModel> billDetails =
            (response as Map<String, dynamic>).entries
                .map(
                  (entry) => BillInfoModel(title: entry.key, info: entry.value),
                )
                .toList();
        emit(FetchBillDetailsLoaded(billDetails: billDetails));
      } on ServerException catch (e) {
        emit(FetchBillDetailsFailed(errorMessage: e.errorModel.errorMessage));
      }
    });
  }
}
