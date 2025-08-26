import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/signup/views/screens/email_screen.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
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
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(AppDimensions.mp),
          children: [
            Image(image: AssetImage("assets/images/curiosity search-bro.png")),
            SizedBox(height: AppDimensions.mp),
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryTextColor,
                fontSize: AppDimensions.lfs,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.mp),
            Text(
              subtitle,
              style: TextStyle(
                color: Theme.of(context).accentTextColor,
                fontSize: AppDimensions.mfs,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppDimensions.mp),
            ButtonWidget(
              title: "Sign in",
              backgroundColor: Theme.of(context).primaryColor,
              titleColor: Theme.of(context).foregroundColor,
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
                Expanded(
                  child: Divider(
                    height: AppDimensions.xlp,
                    color: Theme.of(context).hintTextColor,
                  ),
                ),
                Text(
                  "OR",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: AppDimensions.sfs,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: Divider(
                    height: AppDimensions.xlp,
                    color: Theme.of(context).hintTextColor,
                  ),
                ),
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
                    color: Theme.of(context).primaryTextColor,
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
                      color: Theme.of(context).primaryColor,
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
