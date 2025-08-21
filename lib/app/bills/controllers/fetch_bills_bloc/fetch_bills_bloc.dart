import 'dart:developer';

import 'package:clinic_app/app/bills/models/bill_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_bills_event.dart';
part 'fetch_bills_state.dart';

class FetchBillsBloc extends Bloc<FetchBillsEvent, FetchBillsState> {
  FetchBillsBloc() : super(FetchBillsLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    late List<BillModel> paidBills;
    late List<BillModel> unpaidBills;
    late List<BillModel> allBills;

    on<FetchBills>((event, emit) async {
      emit(FetchBillsLoading());
      try {
        final paidBillsResponse = await api.get(
          EndPoints.bills,
          queryParameter: {ApiKey.status: ApiKey.paid},
        );
        final unpaidBillsResponse = await api.get(
          EndPoints.bills,
          queryParameter: {ApiKey.status: ApiKey.unpaid},
        );
        paidBills =
            (paidBillsResponse[ApiKey.data] as List<dynamic>)
                .map((paidBill) => BillModel.fromJson(paidBill))
                .toList();
        unpaidBills =
            (unpaidBillsResponse[ApiKey.data] as List<dynamic>)
                .map((unpaidBills) => BillModel.fromJson(unpaidBills))
                .toList();
        allBills = [...unpaidBills, ...paidBills];
        emit(FetchBillsLoaded(bills: allBills));
      } on ServerException catch (e) {
        emit(FetchBillsFailed(errorMessage: e.errorModel.errorMessage));
        log(e.errorModel.errorMessage.toString());
      }
    });

    on<DisplayAllBills>((event, emit) async {
      emit(FetchBillsLoaded(bills: allBills));
    });

    on<DisplayUnpaidBills>((event, emit) async {
      emit(FetchBillsLoaded(bills: unpaidBills));
    });

    on<DisplayPaidBills>((event, emit) async {
      emit(FetchBillsLoaded(bills: paidBills));
    });
  }
}
