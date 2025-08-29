import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyButtonWidget extends StatelessWidget {
  const MyButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.isLoading = false,
    this.width = double.infinity,
  });
  final Color? color;
  final String text;
  final double width;
  final bool isLoading;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: width,
        height: 40,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(microseconds: 300),
            child:
                isLoading
                    ? SizedBox(
                      width: 50,
                      height: 42,
                      child: LoadingAnimationWidget.hexagonDots(
                        color: Theme.of(context).primaryColor,
                        size: 30,
                      ),
                    )
                    : Text(
                      text,
                      style: TextStyle(
                        color: Theme.of(context).foregroundColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
