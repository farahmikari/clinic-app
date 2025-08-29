import 'package:clinic_app/app/vital_signals/model/vital_signals_model.dart';
import 'package:clinic_app/app/vital_signals/views/widgets/container_with_icon_and_texts_widget.dart';
import 'package:clinic_app/app/vital_signals/views/widgets/heart_rate_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class InfoVitalSignals extends StatelessWidget {
  const InfoVitalSignals({super.key,required this.model});
  final VitalSignalsModel model;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.0.wp),
          child: Column(
            spacing: 1.0.hp,
            children: [
              HeartRateWidget(heartRate: "100"),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2.0.wp,
                crossAxisSpacing: 1.0.hp,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ContainerWithIconAndTextsWidget(
                    title: S.current.blood_group,
                    value: "+A",
                    icon: "assets/images/blood-type-a.png",
                    color: AppColors.lightRedColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: S.current.temprature,
                    value: "36",
                    icon: "assets/images/temprature.png",
                    color: AppColors.lightOrangColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: S.current.weight,
                    value: "50",
                    symbol: "Kg",
                    icon: "assets/images/weight-loss.png",
                    color: AppColors.lightGreenColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: S.current.height,
                    value: "155",
                    symbol: "m",
                    icon: "assets/images/height.png",
                    color: AppColors.lightYellowColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: S.current.blood_pressure,
                    value: "120/80",
                    symbol: "mmHg",
                    icon: "assets/images/blood-pressure-gauge.png",
                    color: AppColors.lightBlueColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: S.current.blood_sugar,
                    value: "55",
                    symbol: "mg/dl",
                    icon: "assets/images/diabetes-test.png",
                    color: AppColors.lightFColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
