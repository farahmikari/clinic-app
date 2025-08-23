import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/signup/views/screens/email_screen.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPromptScreen extends StatelessWidget {
  const AuthPromptScreen({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(AppDimensions.mp),
          children: [
            Image(image: AssetImage("assets/images/curiosity search-bro.png")),
            SizedBox(height: AppDimensions.mp),
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryTextColor,
                fontSize: AppDimensions.lfs,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.mp),
            Text(
              subtitle,
              style: TextStyle(
                color: AppColors.accentTextColor,
                fontSize: AppDimensions.mfs,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.mp),
            ButtonWidget(
              title: "Sign in",
              backgroundColor: AppColors.primaryColor,
              titleColor: AppColors.accentBackgroundColor,
              onTap: () {
                Get.offAll(() => LoginScreen());
              },
            ),
            SizedBox(height: AppDimensions.mp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: AppDimensions.sp,
              children: [
                Expanded(child: Divider(height: AppDimensions.xlp)),
                Text(
                  "OR",
                  style: TextStyle(
                    color: AppColors.accentColor,
                    fontSize: AppDimensions.sfs,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(child: Divider(height: AppDimensions.xlp)),
              ],
            ),
            SizedBox(height: AppDimensions.mp),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: AppDimensions.sp,
              children: [
                Text(
                  "Don't have an account",
                  style: TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: AppDimensions.sfs,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.offAll(() => EmailScreen());
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: AppDimensions.sfs,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
