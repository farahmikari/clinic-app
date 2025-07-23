import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/core/widgets/image_widget/controller/bloc/image_bloc/image_bloc.dart';
import 'package:clinic_app/consts.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(80),
            border: Border.all(color: kPrimaryColor),
          ),
          child: BlocBuilder<ImageBloc, ImageState>(
            builder: (context, state) {
              if (state is ImageLoading) {
                return SizedBox(
                  width: 50,
                  height: 42,
                  child: LoadingAnimationWidget.hexagonDots(
                    color: kPrimaryColor,
                    size: 30,
                  ),
                );
              } else if (state is ImageSuccess) {
                return CircleAvatar(
                  backgroundColor: Colors.grey.shade200,
                  radius: 65,
                  foregroundImage:
                      Image.file(state.image, fit: BoxFit.cover).image,
                );
              } else if (state is ImageFailure) {
                showSnackBar(
                  context,
                  title: "Failed",
                  message: "Failed loading image",
                  contentType: ContentType.failure,
                );
              }
              return Icon(Icons.person, color: kPrimaryColor, size: 120);
            },
          ),
        ),
        Positioned(
          top: 120,
          right: 20,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              onPressed: () {
                chooseTypeImage(context);
              },
              icon: Icon(Icons.edit, size: 20),
              color: Colors.grey.shade200,
            ),
          ),
        ),
      ],
    );
  }

  void chooseTypeImage(BuildContext context) {
     showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(
                    color: AppColors.hintTextColor,
                  ),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: kPrimaryColor,
                ),
              ),
              title: Text("Camera"),
              onTap: () {
                context.read<ImageBloc>().add(
                  PickImageFromCameraEvent(),
                );
              },
            ),
            ListTile(
              leading: Container(
                 width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(
                    color: AppColors.hintTextColor,
                  ),
                ),
                child: Icon(
                  Icons.image_outlined,
                  color: kPrimaryColor,
                ),
              ),
              title: Text("Gallery"),
              onTap: () {
                context.read<ImageBloc>().add(
                  PickImageFromGalleryEvent(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
