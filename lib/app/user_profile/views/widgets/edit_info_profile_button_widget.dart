import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
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
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width * 0.4,
          height: height * 0.05,
          decoration: BoxDecoration(
            color: Theme.of(context).transparentPrimaryColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.edit,
                  color: Theme.of(context).foregroundColor,
                  size: 18,
                ),
                SizedBox(width: 4),
                Text(
                  text,
                  style: TextStyle(
                    color: Theme.of(context).foregroundColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
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
