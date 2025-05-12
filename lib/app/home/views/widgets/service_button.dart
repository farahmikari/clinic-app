import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/material.dart';

class ServiceButton extends StatelessWidget {
  const ServiceButton({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
    required this.backgroundColor,
    required this.iconColor,
    required this.titleColor,
    required this.subTitleColor,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final Color backgroundColor;
  final Color iconColor;
  final Color titleColor;
  final Color subTitleColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(15.0.sp),
      child: Container(
        padding: EdgeInsets.all(4.0.wp),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15.0.sp),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Icon(icon, color: iconColor, size: 30.0.sp),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: ListTile(
                contentPadding: const EdgeInsets.all(0),
                title: Text(
                  title,
                  style: TextStyle(
                    color: titleColor,
                    fontSize: 12.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  subtitle,
                  style: TextStyle(
                    color: subTitleColor,
                    fontSize: 10.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
