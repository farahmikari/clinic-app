import 'package:flutter/material.dart';

class ImageUser extends StatelessWidget {
  const ImageUser({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
      radius: 65,
      foregroundImage:
          Image.network(image, fit: BoxFit.cover).image,
    );
  }
}