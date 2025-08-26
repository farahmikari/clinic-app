import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_shimmer_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/core/widgets/skelton.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VitalSignalsLoadingWidget extends StatelessWidget {
  const VitalSignalsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.vital_signs,
          style: TextStyle(
            color: Theme.of(context).primaryTextColor,
            fontSize: AppDimensions.lfs,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Shimmer.fromColors(
        baseColor: Theme.of(context).shimmerBaseColor,
        highlightColor: Theme.of(context).shimmerHighlightColor,
        enabled: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(4.0.wp),
            child: Column(
              spacing: 1.0.hp,
              children: [
                Skelton(
                  height: 30.0.hp,
                  width: 90.0.wp,
                  border: AppDimensions.mbr,
                ),
                GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 2.0.wp,
                  crossAxisSpacing: 1.0.hp,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(
                    6,
                    (index) => Skelton(
                      height: 20.0.hp,
                      width: 45.0.wp,
                      border: AppDimensions.mbr,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
