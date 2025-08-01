import 'package:clinic_app/app/user_profile/views/widgets/skelton.dart';
import 'package:flutter/widgets.dart';

class EditButtonShimmer extends StatelessWidget {
  const EditButtonShimmer({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Skelton(height: height * 0.05, width: width * 0.3, border: 12),
        ),
        Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Skelton(height: height * 0.05, width: width * 0.3, border: 12),
        ),
      ],
    );
  }
}
