part of 'image_bloc.dart';

class ImageEvent {
  final bool isProfile;
  ImageEvent({this.isProfile = false});
}

class ImageInitielEvent extends ImageEvent {
  String? imageLoaded;
  ImageInitielEvent({this.imageLoaded});
}

class PickImageFromGalleryEvent extends ImageEvent {
  PickImageFromGalleryEvent({super.isProfile});
}

class PickImageFromCameraEvent extends ImageEvent {
  PickImageFromCameraEvent({super.isProfile});
}
