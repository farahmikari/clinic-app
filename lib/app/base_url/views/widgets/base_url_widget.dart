import 'package:clinic_app/app/base_url/controllers/fetch_base_url/fetch_base_url_bloc.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_icons.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
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
        color: Theme.of(context).accentBackgroundColor,
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
            colorFilter: ColorFilter.mode(
              Theme.of(context).accentTextColor,
              BlendMode.srcIn,
            ),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                context.read<FetchBaseUrlBloc>().add(
                  BaseUrlIsFetched(baseUrl: value),
                );
              },
              style: TextStyle(
                color: Theme.of(context).primaryTextColor,
                fontSize: AppDimensions.mfs,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: "Base URL",
                hintStyle: TextStyle(
                  color: Theme.of(context).hintTextColor,
                  fontSize: AppDimensions.mfs,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.all(0.0),
              ),
              cursorColor: Theme.of(context).primaryTextColor,
              autocorrect: false,
            ),
          ),
        ],
      ),
    );
  }
}
