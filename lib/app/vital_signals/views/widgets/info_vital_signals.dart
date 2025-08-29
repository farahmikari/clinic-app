import 'package:clinic_app/app/vital_signals/model/vital_signals_model.dart';
import 'package:clinic_app/app/vital_signals/views/widgets/container_with_icon_and_texts_widget.dart';
import 'package:clinic_app/app/vital_signals/views/widgets/heart_rate_widget.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class InfoVitalSignals extends StatelessWidget {
  const InfoVitalSignals({super.key,required this.model});
  final VitalSignalsModel model;

 
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4.0.wp),
          child: Column(
            spacing: 1.0.hp,
            children: [
              HeartRateWidget(heartRate: model.heartRate),
              GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 2.0.wp,
                crossAxisSpacing: 1.0.hp,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ContainerWithIconAndTextsWidget(
                    title: S.current.blood_group,
                    value: model.bloodGroup,
                    icon: "assets/images/blood-type-a.png",
                    color: Theme.of(context).lightRedColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: S.current.temprature,
                    value: model.temprature,
                    icon: "assets/images/temprature.png",
                    color: Theme.of(context).lightOrangeColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: S.current.weight,
                    value: model.weight,
                    symbol: "Kg",
                    icon: "assets/images/weight-loss.png",
                    color: Theme.of(context).lightGreenColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: S.current.height,
                    value: model.height,
                    symbol: "m",
                    icon: "assets/images/height.png",
                    color: Theme.of(context).lightYelloColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: S.current.blood_pressure,
                    value: model.pressure,
                    symbol: "mmHg",
                    icon: "assets/images/blood-pressure-gauge.png",
                    color: Theme.of(context).lightBlueColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: S.current.blood_sugar,
                    value: model.bloodSugar,
                    symbol: "mg/dl",
                    icon: "assets/images/diabetes-test.png",
                    color: Theme.of(context).lightFColor,
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
