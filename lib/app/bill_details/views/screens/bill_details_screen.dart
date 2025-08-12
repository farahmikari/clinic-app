import 'package:clinic_app/app/bill_details/controllers/fetch_bill_details/fetch_bill_details_bloc.dart';
import 'package:clinic_app/app/bill_details/views/widgets/details_widget.dart';
import 'package:clinic_app/app/bill_details/views/widgets/service_widget.dart';
import 'package:clinic_app/app/bills/models/bill_model.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/filter_badge_widget.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillDetailsScreen extends StatelessWidget {
  const BillDetailsScreen({super.key, required this.bill});

  final BillModel bill;

  Color specifyStatusColor() {
    return bill.status == "Unpaid"
        ? AppColors.transparentGreen
        : AppColors.transparentYellow;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              FetchBillDetailsBloc()..add(FetchBillDetails(bill: bill)),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          actionsPadding: EdgeInsets.only(right: AppDimensions.mp),
          backgroundColor: AppColors.backgroundColor,
          surfaceTintColor: AppColors.backgroundColor,
          title: Text(
            "Details",
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontSize: AppDimensions.lfs,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            BadgeWidget(title: bill.status, color: specifyStatusColor()),
          ],
        ),
        body: SafeArea(
          child: BlocBuilder<FetchBillDetailsBloc, FetchBillDetailsState>(
            builder: (context, state) {
              if (state is FetchBillDetailsLoaded) {
                return ListView(
                  padding: EdgeInsets.only(
                    left: AppDimensions.mp,
                    right: AppDimensions.mp,
                    bottom: AppDimensions.mp,
                  ),
                  children: [
                    ServiceWidget(bill: bill),
                    SizedBox(height: AppDimensions.sp),
                    DetailsWidget(billInfo: state.billInfo),
                  ],
                );
              }
              return LoadingWidget();
            },
          ),
        ),
      ),
    );
  }
}
