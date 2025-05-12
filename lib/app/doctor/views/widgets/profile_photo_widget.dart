import 'package:clinic_app/app_colors.dart';
import 'package:clinic_app/core/extentions/extention.dart';
import 'package:flutter/widgets.dart';

class ProfilePhotoWidget extends StatelessWidget {
  final String image;
  const ProfilePhotoWidget({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0.wp),
      decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(300),
          bottomRight: Radius.circular(300),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Align(
        alignment: Alignment.center,
        child: Image(image: NetworkImage(image)),
      ),
    );
  }
}
