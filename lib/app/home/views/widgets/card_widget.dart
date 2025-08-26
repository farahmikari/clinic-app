import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).darkBlueColor,
            Theme.of(context).lightBlueColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          PositionedDirectional(
            end: -10.0.wp,
            bottom: -10.0.wp,
            child: SizedBox(
              height: 30.0.wp,
              width: 30.0.wp,
              child: Image.asset("assets/images/health_care.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.all(AppDimensions.mm),
            child: ListTile(
              title: Text(
                S.current.card_title,
                style: TextStyle(
                  color: Theme.of(context).foregroundColor,
                  fontSize: AppDimensions.lfs,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                S.current.card_subtitle,
                style: TextStyle(
                  color: Theme.of(context).foregroundColor,
                  fontSize: AppDimensions.sfs,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
