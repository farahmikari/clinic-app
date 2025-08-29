import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(AppDimensions.mp),
      children: [
        Image.asset(image),
        SizedBox(height: AppDimensions.mp),
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: AppDimensions.mp),
        Text(
          subtitle,
          style: TextStyle(
            color: Theme.of(context).accentTextColor,
            fontSize: AppDimensions.mfs,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
