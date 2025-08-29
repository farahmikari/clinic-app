import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
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
  final String? value;
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
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 11,
                color: AppColors.mainTextColor,
              ),
            ),

            Text(
              value==null?"---": "$value ${symbol ?? ""}",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.mainTextColor,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
