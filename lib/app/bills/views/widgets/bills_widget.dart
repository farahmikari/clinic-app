import 'package:clinic_app/app/bills/models/bill_model.dart';
import 'package:clinic_app/app/bills/views/widgets/bill_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class BillsWidget extends StatelessWidget {
  const BillsWidget({super.key, required this.bills});

  final List<BillModel> bills;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppDimensions.mp),
      itemBuilder: (context, index) {
        return BillWidget(bill: bills[index]);
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: AppDimensions.sp);
      },
      itemCount: bills.length,
    );
  }
}
