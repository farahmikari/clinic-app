import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_background_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_colors_extension.dart';
import 'package:clinic_app/core/extentions/colors_extensions/theme_text_colors_extension.dart';
import 'package:clinic_app/core/widgets/image_widget/controller/bloc/image_bloc/image_bloc.dart';
import 'package:clinic_app/core/utils/snack_bar_util.dart';
import 'package:clinic_app/core/widgets/image_widget/views/widget/image_loading_widget.dart';
import 'package:clinic_app/core/widgets/image_widget/views/widget/image_selected_widget.dart';
import 'package:clinic_app/core/widgets/image_widget/views/widget/image_user_widget.dart';
import 'package:clinic_app/generated/l10n.dart';
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
            color: Theme.of(context).accentBackgroundColor,
            borderRadius: BorderRadius.circular(80),
            border: Border.all(color: Theme.of(context).primaryColor),
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
                  title: S.current.failed,
                  message: S.current.failed_loading_image,
                  contentType: ContentType.failure,
                );
              }
              return Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
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
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              onPressed: () {
                chooseTypeImage(context);
              },
              icon: Icon(Icons.edit, size: 20),
              color: Theme.of(context).foregroundColor,
            ),
          ),
        ),
      ],
    );
  }

  void chooseTypeImage(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).accentBackgroundColor,
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
                  border: Border.all(color: Theme.of(context).borderColor),
                ),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              title: Text(
                S.current.camera,
                style: TextStyle(
                  color: Theme.of(context).primaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
                  border: Border.all(color: Theme.of(context).borderColor),
                ),
                child: Icon(
                  Icons.image_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              title: Text(
                S.current.gallery,
                style: TextStyle(
                  color: Theme.of(context).primaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
