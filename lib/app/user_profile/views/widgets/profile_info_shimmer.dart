import 'package:clinic_app/app/user_profile/views/widgets/skelton.dart';
import 'package:flutter/widgets.dart';

class ProfileInfoShimmer extends StatelessWidget {
  const ProfileInfoShimmer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder:
          (context, index) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Skelton(
                    height: height * 0.08,
                    width: width * 0.15,
                    border: 80,
                  ),
                  SizedBox(width: width * 0.03),
                  Skelton(height: height * 0.08, width: width * 0.7, border: 5),
                ],
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
    );
  }
}
