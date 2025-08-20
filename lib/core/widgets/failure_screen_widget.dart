import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/percent_sized_extention.dart';
import 'package:clinic_app/core/extentions/responsive_text_extention.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class FailureScreenWidget extends StatelessWidget {
  const FailureScreenWidget({
    super.key,
    required this.pathImage,
    required this.errorMessage,
    required this.isVisitor,
  });

  final String pathImage;
  final String errorMessage;
  final bool isVisitor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(pathImage, width: 60.0.wp, height: 30.0.hp),
            SizedBox(height: 10.0.hp),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  errorMessage,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 14.0.sp,
                    color: AppColors.hintTextColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.1.hp),
            isVisitor
                ? MyButtonWidget(
                  text: "Login",
                  onPressed: () {
                    Get.offAll(LoginScreen());
                  },
                  color: AppColors.primaryColor,
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
