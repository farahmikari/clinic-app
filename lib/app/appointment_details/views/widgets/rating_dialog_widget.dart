import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:clinic_app/app/appointment_details/controllers/rating_dialog_bloc/rating_dialog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RatingDialogWidget extends StatelessWidget {
  const RatingDialogWidget({
    super.key,
    required this.doctorImage,
    required this.doctorName,
  });
  final String doctorImage;
  final String doctorName;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.backgroundColor,
      titlePadding: EdgeInsets.all(AppDimensions.mp),
      contentPadding: EdgeInsets.all(AppDimensions.mp),
      actionsPadding: EdgeInsets.all(AppDimensions.mp),
      actionsOverflowAlignment: OverflowBarAlignment.center,
      actionsAlignment: MainAxisAlignment.center,
      title: Column(
        spacing: AppDimensions.mp,
        children: [
          Container(
            height: 30.0.wp,
            width: 30.0.wp,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(top: AppDimensions.sp),
            decoration: BoxDecoration(
              color: AppColors.transparentYellow,
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.hardEdge,
            child: Image(image: NetworkImage(doctorImage)),
          ),
          Text(
            "How was your visit with Dr.$doctorName? You can leave a quick rating if you’d like.",
            style: TextStyle(
              color: AppColors.mainTextColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Container(
        height: 8.0.wp,
        alignment: Alignment.center,
        child: RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: AppDimensions.mis,
          itemPadding: EdgeInsets.symmetric(horizontal: AppDimensions.sp),
          unratedColor: AppColors.hintTextColor,
          itemBuilder:
              (context, _) => SvgPicture.asset(
                AppIcons.rate,
                color: AppColors.transparentYellow,
              ),
          onRatingUpdate: (rating) {
            context.read<RatingDialogBloc>().add(
              RatingDialogIsUpdated(rating: rating),
            );
          },
        ),
      ),
      actions: [
        ButtonWidget(
          title: "Submit",
          backgroundColor: AppColors.primaryColor,
          titleColor: AppColors.widgetBackgroundColor,
          onTap: () {
            context.read<RatingDialogBloc>().add(RatingIsSubmited());
            Get.back();
          },
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          child: Text(
            "No, Thanks!",
            style: TextStyle(
              color: AppColors.darkGreyColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
