import 'package:clinic_app/app/base_url/controllers/fetch_base_url/fetch_base_url_bloc.dart';
import 'package:clinic_app/app/base_url/views/widgets/base_url_widget.dart';
import 'package:clinic_app/app/onboarding/views/screens/splash_screen.dart';
import 'package:clinic_app/core/api/end_points.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class BaseUrlScreen extends StatelessWidget {
  const BaseUrlScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color specifyprimaryBackgroundColor(bool isValid) {
      return isValid ? AppColors.primaryColor : AppColors.hintTextColor;
    }

    return BlocProvider(
      create: (context) => FetchBaseUrlBloc(),
      child: Scaffold(
        backgroundColor: AppColors.primaryBackgroundColor,
        body: ListView(
          padding: EdgeInsets.all(AppDimensions.mp),
          children: [
            Image(image: AssetImage("assets/images/Pharmacist-amico.png")),
            Text(
              "Set Your Base URL",
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: AppDimensions.lfs,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.mp),
            Text(
              "Open your terminal and run the command ipconfig. Find the IPv4 Address in the output, then enter it in this text field in the following format:\n http://<IPv4 Address>:8000",
              style: TextStyle(
                color: AppColors.accentTextColor,
                fontSize: AppDimensions.sfs,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.mp),
            BaseUrlWidget(),
            SizedBox(height: AppDimensions.mp),
            BlocBuilder<FetchBaseUrlBloc, FetchBaseUrlState>(
              builder: (context, state) {
                return ButtonWidget(
                  title: "Confirm",
                  backgroundColor: specifyprimaryBackgroundColor(state.isValid),
                  titleColor: AppColors.accentBackgroundColor,
                  onTap: () {
                    if (state.isValid) {
                      EndPoints.setBaseUrl(state.baseUrl);
                    }
                    Get.to(SplashScreen());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
