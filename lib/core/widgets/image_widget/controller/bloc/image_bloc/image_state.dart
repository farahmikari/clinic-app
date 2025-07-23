part of 'image_bloc.dart';

class ImageState {}

final class ImageInitial extends ImageState {}

final class ImageLoading extends ImageState {}

final class ImageSuccess extends ImageState {
  final File image;

  ImageSuccess({required this.image});
}

final class ImageFailure extends ImageState {
 final String message;

  ImageFailure({required this.message});

}
