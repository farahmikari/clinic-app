import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/widgets/image_widget/controller/bloc/image_bloc/image_bloc.dart';
import 'package:clinic_app/core/widgets/image_widget/views/widget/image_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarProfileWidget extends StatelessWidget {
  const AppBarProfileWidget({
    super.key,
    required this.width,
    required this.height, required this.fullName,
  });

  final double width;
  final double height;
  final String fullName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height * 0.4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, Theme.of(context).scaffoldBackgroundColor],
              begin: Alignment.topLeft,
            ),
          ),
        ),
        Positioned(
          top: (height * 0.3) / 2 - 50,
          left: (width / 2) - 80,
          child: BlocListener<ImageBloc, ImageState>(
            listener: (context, state) {},
            child: Column(
              children: [
                ImageProfileWidget(),
                SizedBox(height:(height * 0.3) / 2 - 80 ,),
                Text(
                  fullName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserat",
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
