import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:flutter/material.dart';

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
        color: Theme.of(context).shimmerBaseColor,
        borderRadius: BorderRadius.circular(border),
      ),
    );
  }
}
