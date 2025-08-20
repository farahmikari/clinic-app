import 'package:clinic_app/app/vital_signals/views/widgets/container_with_icon_and_texts_widget.dart';
import 'package:clinic_app/app/vital_signals/views/widgets/heart_rate_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:flutter/material.dart';

class InfoVitalSignals extends StatelessWidget {
  const InfoVitalSignals({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Vital Signals",
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
                  children:[
                    ContainerWithIconAndTextsWidget(
                    title: "Blood Group",
                    value: "+A",
                    icon: "assets/images/blood-type-a.png",
                    color: AppColors.lightRedColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: "Temprature",
                    value: "36",
                    icon: "assets/images/temprature.png",
                    color: AppColors.lightOrangColor,
                  ),
                   ContainerWithIconAndTextsWidget(
                    title: "Weight",
                    value: "50",
                    symbol: "Kg",
                    icon: "assets/images/weight-loss.png",
                    color: AppColors.lightGreenColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: "Height",
                    value: "155",
                    symbol: "m",
                    icon: "assets/images/height.png",
                    color: AppColors.lightYellowColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: "Blood Pressure",
                    value: "120/80",
                    symbol: "mmHg",
                    icon: "assets/images/blood-pressure-gauge.png",
                    color: AppColors.lightBlueColor,
                  ),
                  ContainerWithIconAndTextsWidget(
                    title: "Blood Sugar",
                    value: "55",
                    symbol: "mg/dl",
                    icon: "assets/images/diabetes-test.png",
                    color: AppColors.lightFColor,
                  ),
                  ]
                  )
            ],
          ),
        ),
      ),
    );
  }
}
