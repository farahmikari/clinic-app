import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/core/widgets/image_widget/controller/bloc/image_bloc/image_bloc.dart';
import 'package:clinic_app/core/constants/app_colors.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/core/widgets/image_widget/views/widget/image_loading_widget.dart';
import 'package:clinic_app/core/widgets/image_widget/views/widget/image_selected_widget.dart';
import 'package:clinic_app/core/widgets/image_widget/views/widget/image_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({super.key, required this.isProfile});
  final bool isProfile;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            color: Theme.of(context).appBarTheme.backgroundColor,
            borderRadius: BorderRadius.circular(80),
            border: Border.all(color: AppColors.primaryColor),
          ),
          child: BlocBuilder<ImageBloc, ImageState>(
            builder: (context, state) {
              if (state is ImageInitialState && state.imageLoaded != null) {
                return ImageUser(image: state.imageLoaded!);
              } else if (state is ImageLoading) {
                return ImageLoadingWidget();
              } else if (state is ImageSuccess) {
                return ImageSelected(image: state.image);
              } else if (state is ImageFailure) {
                showSnackBar(
                  context,
                  title: "Failed",
                  message: "Failed loading image",
                  contentType: ContentType.failure,
                );
              }
              return Icon(
                Icons.person,
                color: AppColors.primaryColor,
                size: 120,
              );
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
            Center(
              child: Divider(
                color: AppColors.hintTextColor,
                thickness: 0.5,
                height: 0.5,
              ),
            ),
            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(color: AppColors.hintTextColor),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              title: Text("Camera"),
              onTap: () {
                context.read<ImageBloc>().add(
                  PickImageFromCameraEvent(isProfile: isProfile),
                );
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(color: AppColors.hintTextColor),
                ),
                child: Icon(
                  Icons.image_outlined,
                  color: AppColors.primaryColor,
                ),
              ),
              title: Text("Gallery"),
              onTap: () {
                context.read<ImageBloc>().add(
                  PickImageFromGalleryEvent(isProfile: isProfile),
                );
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}


