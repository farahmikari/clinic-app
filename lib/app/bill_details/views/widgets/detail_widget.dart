import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  const DetailWidget({super.key, required this.title, required this.detail});
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: AppDimensions.sfs,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          detail,
          style: TextStyle(
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
