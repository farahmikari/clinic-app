import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ImageLoadingWidget extends StatelessWidget {
  const ImageLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 42,
      child: LoadingAnimationWidget.hexagonDots(
        color: Theme.of(context).primaryColor,
        size: 30,
      ),
    );
  }
}
