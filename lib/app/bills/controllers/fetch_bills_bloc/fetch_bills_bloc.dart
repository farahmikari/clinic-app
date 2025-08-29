import 'package:clinic_app/app/bills/models/bill_model.dart';
import 'package:clinic_app/core/api/dio_consumer.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'fetch_bills_event.dart';
part 'fetch_bills_state.dart';

class FetchBillsBloc extends Bloc<FetchBillsEvent, FetchBillsState> {
  FetchBillsBloc() : super(FetchBillsLoading()) {
    DioConsumer api = DioConsumer(dio: Dio());
    EventTransformer<FetchData> switchMapTransformer<FetchData>() {
      return (events, mapper) => events.switchMap(mapper);
    }

    late List<BillModel> paidBills;
    late List<BillModel> unpaidBills;
    late List<BillModel> allBills;

    on<FetchBills>((event, emit) async {
      emit(FetchBillsLoading());
      try {
        final paidBillsResponse = await api.get(
          EndPoints.bills,
          queryParameter: {
            ApiKey.status: ApiKey.paid,
            ApiKey.keyword: event.searchWord,
          },
        );
        final unpaidBillsResponse = await api.get(
          EndPoints.bills,
          queryParameter: {
            ApiKey.status: ApiKey.unpaid,
            ApiKey.keyword: event.searchWord,
          },
        );
        paidBills =
            (paidBillsResponse as List<dynamic>)
                .map((paidBill) => BillModel.fromJson(paidBill))
                .toList();
        unpaidBills =
            (unpaidBillsResponse as List<dynamic>)
                .map((unpaidBills) => BillModel.fromJson(unpaidBills))
                .toList();
        allBills = [...unpaidBills, ...paidBills];
        if (event.filterIndex == 1) {
          if (unpaidBills.isEmpty) {
            emit(FetchBillsLoadedEmpty());
          } else {
            emit(FetchBillsLoaded(bills: unpaidBills));
          }
        } else if (event.filterIndex == 2) {
          if (paidBills.isEmpty) {
            emit(FetchBillsLoadedEmpty());
          } else {
            emit(FetchBillsLoaded(bills: paidBills));
          }
        } else {
          if (allBills.isEmpty) {
            emit(FetchBillsLoadedEmpty());
          } else {
            emit(FetchBillsLoaded(bills: allBills));
          }
        }
      } on ServerException catch (e) {
        emit(FetchBillsFailed(errorMessage: e.errorModel.errorMessage));
      }
    }, transformer: switchMapTransformer());

    on<DisplayAllBills>((event, emit) async {
      if (allBills.isEmpty) {
        emit(FetchBillsLoadedEmpty());
      } else {
        emit(FetchBillsLoaded(bills: allBills));
      }
    });

    on<DisplayUnpaidBills>((event, emit) async {
      if (unpaidBills.isEmpty) {
        emit(FetchBillsLoadedEmpty());
      } else {
        emit(FetchBillsLoaded(bills: unpaidBills));
      }
    });

    on<DisplayPaidBills>((event, emit) async {
      if (paidBills.isEmpty) {
        emit(FetchBillsLoadedEmpty());
      } else {
        emit(FetchBillsLoaded(bills: paidBills));
      }
    });
  }
}
