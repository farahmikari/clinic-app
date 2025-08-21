import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/widgets/skelton.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class VitalSignalsLoadingWidget extends StatelessWidget {
  const VitalSignalsLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          S.current.vital_signs,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Shimmer.fromColors(
        baseColor: Theme.of(context).shadowColor,
        highlightColor: AppColors.shimmerHighlightColor,
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
