import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:devfest19/blocs/gallery/gallery_repository.dart';
import './bloc.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  StreamSubscription imagesSubscription;
  final FirebaseRepository galleryRepository;

  GalleryBloc({this.galleryRepository});
  @override
  GalleryState get initialState => GalleryLoading();

  @override
  Stream<GalleryState> mapEventToState(
    GalleryEvent event,
  ) async* {
    if (event is LoadingGallery) {
      yield* _mapLoadGalleryToState();
    } else if (event is GalleryUpdated) {
      yield* _mapGalleryUpdateToState(event);
    } else if (event is UploadGallery) {
      yield* _mapUploadImagesToState();
    } else if (event is UploadCamera) {
      yield* _mapTakeImagesToState();
    }
  }

  Stream<GalleryState> _mapLoadGalleryToState() async* {
    imagesSubscription?.cancel();
    imagesSubscription = galleryRepository.images().listen((images) {
      dispatch(
        GalleryUpdated(images),
      );
    });
  }

  Stream<GalleryState> _mapGalleryUpdateToState(GalleryUpdated event) async* {
    yield GalleryLoaded(event.images);
  }

  Stream<GalleryState> _mapUploadImagesToState() async* {
    yield UploadGalleryImages();
    imagesSubscription?.cancel();
    imagesSubscription = galleryRepository.images().listen((images) {
      dispatch(
        GalleryUpdated(images),
      );
    });
    
  }
  Stream<GalleryState> _mapTakeImagesToState() async* {
    yield UploadCameraImages();
    imagesSubscription?.cancel();
    imagesSubscription = galleryRepository.images().listen((images) {
      dispatch(
        GalleryUpdated(images),
      );
    });
  }

  @override
  void dispose() {
    imagesSubscription?.cancel();
    super.dispose();
  }
}
