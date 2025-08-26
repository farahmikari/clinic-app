import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:clinic_app/app/prescription/controllers/rating_dialog_bloc/rating_dialog_bloc.dart';
import 'package:clinic_app/core/widgets/loading_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
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
      backgroundColor: Theme.of(context).accentBackgroundColor,
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
              color: Theme.of(context).primaryBackgroundColor,
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.hardEdge,
            child: CachedNetworkImage(
              imageUrl: doctorImage,
              placeholder: (context, url) => LoadingWidget(),
              errorWidget: (context, url, error) => LoadingWidget(),
            ),
          ),
          Text(
            "${S.current.need_opinion} $doctorName ${S.current.need_rating}",
            style: TextStyle(
              color: Theme.of(context).primaryTextColor,
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
          unratedColor: Theme.of(context).hintTextColor,
          itemBuilder:
              (context, _) => SvgPicture.asset(
                AppIcons.rate,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).accentColor,
                  BlendMode.srcIn,
                ),
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
          title: S.current.share_rating,
          backgroundColor: Theme.of(context).primaryColor,
          titleColor: Theme.of(context).foregroundColor,
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
            S.current.no_thanks,
            style: TextStyle(
              color: Theme.of(context).accentTextColor,
              fontSize: AppDimensions.mfs,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
