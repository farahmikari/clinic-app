import 'package:clinic_app/app/bills/models/bill_model.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/vertical_info_with_title_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({super.key, required this.bill});

  final BillModel bill;

  String formatAppointmentDateTimeToDate() {
    return DateFormat(
      'd MMMM y',
    ).format(DateTime.parse(bill.appointmentDateTime));
  }

  String formatAppointmentDateTimeToTime() {
    return DateFormat(
      'h:mm a',
    ).format(DateTime.parse(bill.appointmentDateTime));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 38.0.hp,
          padding: EdgeInsets.all(AppDimensions.mp),
          margin: EdgeInsets.only(top: AppDimensions.lm),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(AppDimensions.mbr),
            boxShadow: AppShadow.boxShadow,
          ),
          child: Column(
            children: [
              Expanded(
                child: VerticalInfoWithTitleWidget(
                  title: S.current.total_amount,
                  info: "${bill.totalPrice} ${bill.currency}",
                  titleSize: AppDimensions.sfs,
                  infoSize: AppDimensions.xlfs,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: VerticalInfoWithTitleWidget(
                              title: S.current.doctor,
                              info: bill.doctorName,
                              titleSize: AppDimensions.sfs,
                              infoSize: AppDimensions.mfs,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ),
                          Expanded(
                            child: VerticalInfoWithTitleWidget(
                              title: S.current.department,
                              info: bill.department,
                              titleSize: AppDimensions.sfs,
                              infoSize: AppDimensions.mfs,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: VerticalInfoWithTitleWidget(
                              title: S.current.appointment_date,
                              info: formatAppointmentDateTimeToDate(),
                              titleSize: AppDimensions.sfs,
                              infoSize: AppDimensions.mfs,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ),
                          Expanded(
                            child: VerticalInfoWithTitleWidget(
                              title: S.current.appointment_time,
                              info: formatAppointmentDateTimeToTime(),
                              titleSize: AppDimensions.sfs,
                              infoSize: AppDimensions.mfs,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 14.0.hp,
            child: Image(image: AssetImage("assets/images/bill.png")),
          ),
        ),
      ],
    );
  }
}
