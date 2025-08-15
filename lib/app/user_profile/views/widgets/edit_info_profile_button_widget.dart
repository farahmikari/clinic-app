import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class EditInfoProfileButtonWidget extends StatelessWidget {
  const EditInfoProfileButtonWidget({
    super.key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
  });

  final double width;
  final double height;
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width * 0.03),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width * 0.4,
          height: height * 0.05,
          decoration: BoxDecoration(
            color: const Color(0x4617B8A5),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primaryColor, width: 2),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.edit, color: AppColors.primaryColor, size: 18),
                SizedBox(width: 4),
                Text(
                  text,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Montserat",
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
