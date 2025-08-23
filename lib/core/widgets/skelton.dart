import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/widgets.dart';

class Skelton extends StatelessWidget {
  const Skelton({
    super.key,
    required this.height,
    required this.width,
    required this.border,
  });
  final double height, width, border;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.accentTextColor,
        borderRadius: BorderRadius.circular(border),
      ),
    );
  }
}
