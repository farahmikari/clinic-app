part of 'image_bloc.dart';

abstract class ImageEvent {}
class PickImageFromGalleryEvent extends ImageEvent{}
class PickImageFromCameraEvent extends ImageEvent{}
