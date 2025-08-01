import 'package:clinic_app/app/bill_details/models/bill_details_model.dart';
import 'package:clinic_app/app/bill_details/models/bill_info_model.dart';
import 'package:clinic_app/app/bill_details/models/json_model.dart';
import 'package:clinic_app/app/bills/models/bill_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

part 'fetch_bill_details_event.dart';
part 'fetch_bill_details_state.dart';

class FetchBillDetailsBloc
    extends Bloc<FetchBillDetailsEvent, FetchBillDetailsState> {
  FetchBillDetailsBloc() : super(FetchBillDetailsLoading()) {
    String formatPaymentDateTimeToDate(String paymentDateTime) {
      if (paymentDateTime == "Not Paid Yet") {
        return "----";
      }
      return DateFormat('d MMMM y').format(DateTime.parse(paymentDateTime));
    }

    String formatPaymentDateTimeToTime(String paymentDateTime) {
      if (paymentDateTime == "Not Paid Yet") {
        return "----";
      }
      return DateFormat('h:mm a').format(DateTime.parse(paymentDateTime));
    }

    on<FetchBillDetails>((event, emit) async {
      emit(FetchBillDetailsLoading());
      await Future.delayed(Duration(seconds: 4));
      try {
        BillDetailsModel billDetails = BillDetailsModel.fromJson(
          myBillsDetails[event.bill.id] as Map<String, dynamic>,
        );
        List<BillInfoModel> billInfo = [
          BillInfoModel(title: "Id", info: "# ${event.bill.id}"),
          BillInfoModel(title: "Status", info: event.bill.status),
          BillInfoModel(
            title: "Payment Date",
            info: formatPaymentDateTimeToDate(billDetails.paymentDateTime),
          ),
          BillInfoModel(
            title: "Payment Time",
            info: formatPaymentDateTimeToTime(billDetails.paymentDateTime),
          ),
          BillInfoModel(
            title: "Payment Method",
            info: billDetails.paymentMethod,
          ),
          BillInfoModel(
            title: "Check-Up Price",
            info: "${billDetails.checkUpPrice} ${event.bill.currency}",
          ),
          BillInfoModel(
            title: "Medical Report Price",
            info: "${billDetails.medicalReportPrice} ${event.bill.currency}",
          ),
          BillInfoModel(
            title: "Total Price",
            info: "${event.bill.totalPrice} ${event.bill.currency}",
          ),
        ];
        emit(FetchBillDetailsLoaded(billInfo: billInfo));
      } catch (e) {
        emit(FetchBillDetailsFailed(errorMessage: ""));
      }
    });
  }
}
