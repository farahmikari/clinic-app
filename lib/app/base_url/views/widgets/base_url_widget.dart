import 'package:clinic_app/app/base_url/controllers/fetch_base_url/fetch_base_url_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class BaseUrlWidget extends StatelessWidget {
  const BaseUrlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0.wp,
      padding: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
      decoration: BoxDecoration(
        color: AppColors.widgetBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.lbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: AppDimensions.mp,
        children: [
          SvgPicture.asset(
            AppIcons.url,
            height: AppDimensions.sis,
            width: AppDimensions.mis,
            color: AppColors.darkGreyColor,
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                context.read<FetchBaseUrlBloc>().add(
                  BaseUrlIsFetched(baseUrl: value),
                );
              },
              style: TextStyle(
                color: AppColors.mainTextColor,
                fontSize: AppDimensions.mfs,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Base URL",
                hintStyle: TextStyle(
                  color: AppColors.hintTextColor,
                  fontSize: AppDimensions.mfs,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(0.0),
              ),
              cursorColor: AppColors.mainTextColor,
              autocorrect: false,
            ),
          ),
        ],
      ),
    );
  }
}
