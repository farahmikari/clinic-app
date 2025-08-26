import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';

class ContainerWithIconAndTextsWidget extends StatelessWidget {
  const ContainerWithIconAndTextsWidget({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.symbol,
  });
  final String title;
  final String value;
  final String icon;
  final Color color;
  final String? symbol;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0.hp,
      width: 45.0.wp,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.0.wp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(icon, height: 12.0.hp, width: 12.0.wp),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryTextColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),

            Text(
              "$value ${symbol ?? ""}",
              style: TextStyle(
                color: Theme.of(context).primaryTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
