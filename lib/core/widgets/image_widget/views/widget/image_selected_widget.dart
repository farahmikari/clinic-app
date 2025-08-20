import 'dart:io';

import 'package:flutter/material.dart';

class ImageSelected extends StatelessWidget {
  const ImageSelected({super.key, required this.image});
  final File image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey.shade200,
      radius: 65,
      foregroundImage: Image.file(image, fit: BoxFit.cover).image,
    );
  }
}