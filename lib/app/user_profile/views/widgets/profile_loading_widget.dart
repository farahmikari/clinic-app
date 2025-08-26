import 'package:clinic_app/app/user_profile/views/widgets/edit_button_shimmer.dart';
import 'package:clinic_app/app/user_profile/views/widgets/profile_info_shimmer.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:clinic_app/core/widgets/skelton.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileLoadingWidget extends StatelessWidget {
  const ProfileLoadingWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Theme.of(context).shimmerBaseColor,
        highlightColor: Theme.of(context).shimmerHighlightColor,
        enabled: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.05),
            Skelton(
              height: height * 0.3 / 2,
              width: height * 0.3 / 2,
              border: 80,
            ),
            SizedBox(height: height * 0.05),
            EditButtonShimmer(width: width, height: height),
            SizedBox(
              height: height * 0.6,
              child: ProfileInfoShimmer(height: height, width: width),
            ),
          ],
        ),
      ),
    );
  }
}
