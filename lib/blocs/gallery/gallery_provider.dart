import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// data object
class GalleryData extends Equatable {
  final String id;
  final String imagepath;

  GalleryData(this.id, this.imagepath);


  static GalleryData fromSnapshot(DocumentSnapshot snap) {
    return GalleryData(
      snap.documentID,
      snap.data['images'],
    );
  }
  @override
  String toString() {
    return 'GalleryData {imagepath: $imagepath, }';
  }
}

// model
@immutable
class Gallery {
  final String id;
  final String imagepath;

  Gallery({
    this.id,
    this.imagepath
  });

  GalleryData toData() {
    return GalleryData(id, imagepath);
  }

  static Gallery fromData(GalleryData data) {
    return Gallery(
        id: data.id,
        imagepath: data.imagepath,
     );
  }
}
