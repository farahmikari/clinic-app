import 'package:clinic_app/app/login/views/screens/login_screen.dart';
import 'package:clinic_app/app/login/views/widgets/button_widget.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/percent_sized_extension.dart';
import 'package:clinic_app/core/extentions/dimensions_extensions/responsive_text_extension.dart';
import 'package:clinic_app/generated/l10n.dart';
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
      appBar: AppBar(),
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
                  style: TextStyle(
                    color: Theme.of(context).accentTextColor,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: 0.1.hp),
            isVisitor
                ? MyButtonWidget(
                  text: S.current.login,
                  onPressed: () {
                    Get.offAll(LoginScreen());
                  },
                  color: Theme.of(context).primaryColor,
                )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
