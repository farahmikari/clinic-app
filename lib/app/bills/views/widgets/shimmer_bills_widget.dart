import 'package:clinic_app/app/bills/views/widgets/shimmer_bill_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/widgets.dart';

class ShimmerBillsWidget extends StatelessWidget {
  const ShimmerBillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(AppDimensions.mp),
      itemBuilder: (context, index) {
        return ShimmerBillWidget();
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: AppDimensions.sp);
      },
      itemCount: 10,
    );
  }
}
