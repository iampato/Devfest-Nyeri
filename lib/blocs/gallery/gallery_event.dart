import 'package:devfest19/blocs/gallery/gallery_provider.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class GalleryEvent extends Equatable{
  GalleryEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadingGallery extends GalleryEvent {
  @override
  String toString() => 'LoadGallery';
}

class GalleryUpdated extends GalleryEvent {
  final List<Gallery> images;
  GalleryUpdated(this.images);

  @override
  String toString() => 'GalleryUpdated';
}
class UploadGallery extends GalleryEvent {
  @override
  String toString() => 'LoadGallery';
}
class UploadCamera extends GalleryEvent {
  @override
  String toString() => 'LoadGallery';
}