import 'dart:io';
import 'package:clinic_app/core/widgets/image_widget/controller/service/image_picker_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagePickerService pickimage;
  ImageBloc({required this.pickimage}) : super(ImageInitial()) {
    on<PickImageFromGalleryEvent>(_onPickImageFromGallery);
    on<PickImageFromCameraEvent>(_onPickImageFromCamera);

  }
  Future<void> _onPickImageFromGallery(event, emit) async {
    try {
      emit(ImageLoading());
      final File? image = await pickimage.pickImageFromGallery();
      if (image != null) {
        emit(ImageSuccess(image: image));
      }
      else{
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
        emit(ImageSuccess(image: image));
      }
      else{
        emit(ImageFailure(message: "no image taked"));
      }
    } catch (e) {
      emit(ImageFailure(message: "error in loading image"));
    }
  }  
}
