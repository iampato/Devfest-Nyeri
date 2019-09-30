import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class SpeakerData extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final String occupation;
  final String workPlace;
  final List expertise;

  SpeakerData(this.id, this.name, this.imageUrl, this.occupation,
      this.workPlace, this.expertise);

  static SpeakerData fromSnapshot(DocumentSnapshot snap) {
    return SpeakerData(
      snap.documentID,
      snap.data['name'],
      snap.data['imageUrl'],
      snap.data['occupation'],
      snap.data['workplace'],
      snap.data['expertise'],
    );
  }
}
