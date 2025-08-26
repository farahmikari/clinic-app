import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class DoctorImageWithFrameWidget extends StatelessWidget {
  const DoctorImageWithFrameWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(
        top: AppDimensions.sp,
        left: AppDimensions.sp,
        right: AppDimensions.sp,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.sbr),
      ),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => LoadingWidget(),
        errorWidget: (context, url, error) => LoadingWidget(),
      ),
    );
  }
}
