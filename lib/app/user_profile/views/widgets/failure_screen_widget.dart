import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/extentions/responsive_text_extention.dart';
import 'package:flutter/material.dart';

class FailureScreenWidget extends StatelessWidget {
  const FailureScreenWidget({
    super.key,
    required this.height,
    required this.width, 
    required this.pathImage, 
    required this.errorMessage,
  });

  final double height;
  final double width;
  final String pathImage;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: AppColors.primaryColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.05),
            Image.asset(
              pathImage,
              width: width / 2,
              height: height / 2,
            ),
            SizedBox(height: height * 0.05),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  errorMessage,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize:23.0.sp ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
