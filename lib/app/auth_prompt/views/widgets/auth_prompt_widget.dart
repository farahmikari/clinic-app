import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/core/constants/app_dimensions.dart';
import 'package:clinic_app/core/constants/app_shadow.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPromptWidget extends StatelessWidget {
  const AuthPromptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0.wp,
      width: 92.0.wp,
      padding: EdgeInsets.all(AppDimensions.mp),
      margin: EdgeInsets.symmetric(horizontal: AppDimensions.mp),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).transparentPrimaryColor,
        borderRadius: BorderRadius.circular(AppDimensions.mbr),
        boxShadow: AppShadow.boxShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image(image: AssetImage("assets/images/offers.png")),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      "Sign in now and get 50 free points!",
                      style: TextStyle(
                        color: Theme.of(context).foregroundColor,
                        fontSize: AppDimensions.mfs,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => LoginScreen(),
                          transition: Transition.zoom,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppDimensions.mp,
                          vertical: AppDimensions.sp,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).foregroundColor,
                          borderRadius: BorderRadius.circular(
                            AppDimensions.lbr,
                          ),
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: AppDimensions.sfs,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
