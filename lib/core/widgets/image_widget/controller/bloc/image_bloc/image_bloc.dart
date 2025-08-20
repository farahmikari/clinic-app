import 'dart:io';
import 'package:clinic_app/core/widgets/image_widget/controller/services/image_picker_service.dart';
import 'package:clinic_app/core/widgets/image_widget/controller/services/change_image_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagePickerService pickimage;
  ImageBloc({required this.pickimage}) : super(ImageInitialState()) {
    on<PickImageFromGalleryEvent>(_onPickImageFromGallery);
    on<PickImageFromCameraEvent>(_onPickImageFromCamera);
    on<ImageInitielEvent>(_onImageLoaded);
  }

  void _onImageLoaded(ImageInitielEvent event, emit) {
    if (event.imageLoaded != null) {
      emit(ImageInitialState(imageLoaded: event.imageLoaded));
    }
  }

  Future<void> _onPickImageFromGallery(event, emit) async {
    try {
      emit(ImageLoading());
      final File? image = await pickimage.pickImageFromGallery();

      if (image != null) {
        event.isProfile
            ? await ChangeImageService().imageChanged(image: image)
            : null;
        emit(ImageSuccess(image: image));
      } else {
        emit(ImageFailure(message: "no image selected"));
      }
    } catch (e) {
      emit(ImageFailure(message: "error in loading image"));
    }
  }

  Future<void> _onPickImageFromCamera(event, emit) async {
    try {
      emit(ImageLoading());
      final File? image = await pickimage.pickImageFromCamera();
      if (image != null) {
        event.isProfile
            ? await ChangeImageService().imageChanged(image: image)
            : null;
        emit(ImageSuccess(image: image));
      } else {
        emit(ImageFailure(message: "no image taked"));
      }
    } catch (e) {
      emit(ImageFailure(message: "error in loading image"));
    }
  }
}
