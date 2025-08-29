import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoListWidget extends StatelessWidget {
  const InfoListWidget({super.key, required this.icon, required this.info});
  final String icon;
  final List<String> info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppDimensions.mp),
      decoration: BoxDecoration(
        color: Theme.of(context).accentBackgroundColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: AppDimensions.sis,
                height: AppDimensions.sis,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: AppDimensions.mp),
              Expanded(
                child: Text(
                  info[index],
                  style: TextStyle(
                    color: Theme.of(context).accentTextColor,
                    fontSize: AppDimensions.sfs,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppDimensions.mp);
        },
        itemCount: info.length,
      ),
    );
  }
}
