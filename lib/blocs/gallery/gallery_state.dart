import 'package:devfest19/blocs/gallery/gallery_provider.dart';
import 'package:devfest19/blocs/gallery/gallery_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GalleryState extends Equatable {
  GalleryState([List props = const <dynamic>[]]) : super(props);
}

class GalleryLoading extends GalleryState {
  @override
  String toString() => 'Gallery iamges Loading';
}

class GalleryLoaded extends GalleryState {
  final List<Gallery> images;

  GalleryLoaded([this.images = const []]) : super([images]);
  @override
  String toString() => 'GalleryLoaded { galleries:$images }';
}

class GallerynNotLoaded extends GalleryState {
  @override
  String toString() => 'GslleryNotLoaded';
}

class UploadGalleryImages extends GalleryState {
  final GalleryRepository _galleryRepository =
      GalleryRepository(source: ImageSource.gallery);

  UploadGalleryImages() {
    _galleryRepository.uploadToCloud();
  }
  @override
  String toString() => 'Gallery Images uploading';
}

class UploadCameraImages extends GalleryState {
  final GalleryRepository _galleryRepository =
      GalleryRepository(source: ImageSource.camera);

  UploadCameraImages() {
    _galleryRepository.uploadToCloud();
  }
  @override
  String toString() => 'Camera Images uploading';
}
