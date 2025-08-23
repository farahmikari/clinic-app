import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
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
        color: AppColors.primaryBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.sbr),
        image: DecorationImage(
          image: AssetImage("assets/images/watermark3.png"),
          fit: BoxFit.cover,
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => LoadingWidget(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
