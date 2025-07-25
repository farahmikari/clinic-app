import 'dart:developer';

import 'package:clinic_app/app/bills/models/bill_model.dart';
import 'package:clinic_app/app/bills/models/json_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_bills_event.dart';
part 'fetch_bills_state.dart';

class FetchBillsBloc extends Bloc<FetchBillsEvent, FetchBillsState> {
  FetchBillsBloc() : super(FetchBillsLoading()) {
    late List<BillModel> paidBills;
    late List<BillModel> unpaidBills;
    late List<BillModel> allBills;

    on<FetchBills>((event, emit) async {
      emit(FetchBillsLoading());
      log("lancer");
      await Future.delayed(Duration(seconds: 10));
      try {
        paidBills =
            myPaidBills
                .map((paidBill) => BillModel.fromJson(paidBill))
                .toList();
        unpaidBills =
            myUnpaidBills
                .map((unpaidBills) => BillModel.fromJson(unpaidBills))
                .toList();
        allBills = [...unpaidBills, ...paidBills];
        emit(FetchBillsLoaded(bills: allBills));
      } catch (e) {
        log(e.toString());
        emit(FetchBillsFailed(errorMessage: e.toString()));
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
