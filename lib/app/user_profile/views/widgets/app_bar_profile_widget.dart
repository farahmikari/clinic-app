import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/widgets/image_widget/views/widget/image_profile_widget.dart';
import 'package:flutter/material.dart';

class AppBarProfileWidget extends StatelessWidget {
  const AppBarProfileWidget({
    super.key,
    required this.width,
    required this.height,
    required this.fullName,
    this.image,
  });

  final double width;
  final double height;
  final String fullName;
  final dynamic image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor,
                Theme.of(context).scaffoldBackgroundColor,
              ],
              begin: Alignment.topLeft,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: height * 0.07),
              ImageProfileWidget(isProfile: true),
              SizedBox(height: (height * 0.3) / 2 - 80),
              Text(
                fullName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Montserat",
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
