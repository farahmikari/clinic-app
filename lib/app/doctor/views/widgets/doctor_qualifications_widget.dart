import 'dart:async';

import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/widgets.dart';

class DoctorQualificationsWidget extends StatefulWidget {
  const DoctorQualificationsWidget({super.key, required this.qualifications});

  final List<String> qualifications;

  @override
  State<DoctorQualificationsWidget> createState() =>
      _DoctorQualificationsWidgetState();
}

class _DoctorQualificationsWidgetState
    extends State<DoctorQualificationsWidget> {
  final PageController _pageController = PageController(initialPage: 5000);
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 2), (_) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final realIndex = index % widget.qualifications.length;
          return Container(
            margin: EdgeInsets.only(
              top: AppDimensions.mm,
              left: AppDimensions.mm,
              right: AppDimensions.mm,
            ),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(AppDimensions.mbr),
              border: Border.all(
                color: AppColors.widgetBackgroundColor,
                width: 1.0.wp,
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(1.0.wp), //gtr
              padding: EdgeInsets.all(AppDimensions.mp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.widgetBackgroundColor,
                borderRadius: BorderRadius.circular(AppDimensions.sbr),
              ),
              child: Text(
                widget.qualifications[realIndex],
                style: TextStyle(
                  color: AppColors.mainTextColor,
                  fontSize: AppDimensions.sfs,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
    );
  }
}
