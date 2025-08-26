import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';

class VerticalInfoWithTitleWidget extends StatelessWidget {
  const VerticalInfoWithTitleWidget({
    super.key,
    required this.title,
    required this.info,
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.titleSize,
    required this.infoSize,
  });

  final String title;
  final String info;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double titleSize;
  final double infoSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).accentTextColor,
            fontSize: titleSize,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          info,
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: infoSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
