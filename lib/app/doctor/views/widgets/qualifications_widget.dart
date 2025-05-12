import 'dart:async';

import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/widgets.dart';

class QualificationsWidget extends StatefulWidget {
  final List<String> qualifications;
  const QualificationsWidget({super.key, required this.qualifications});

  @override
  State<QualificationsWidget> createState() => _QualificationsWidgetState();
}

class _QualificationsWidgetState extends State<QualificationsWidget> {
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
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final realIndex = index % widget.qualifications.length;
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4.0.wp),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(20.0.sp),
            border: Border.all(
              color: AppColors.widgetBackgroundColor,
              width: 1.0.wp,
            ),
          ),
          child: Container(
            margin: EdgeInsets.all(1.0.wp),
            padding: EdgeInsets.all(4.0.wp),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.widgetBackgroundColor,
              borderRadius: BorderRadius.circular(15.0.sp),
            ),
            child: Text(
              widget.qualifications[realIndex],
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: 10.0.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}
