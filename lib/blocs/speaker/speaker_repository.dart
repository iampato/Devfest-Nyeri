import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devfest19/blocs/speaker/speaker_data.dart';
import 'package:devfest19/blocs/speaker/speaker_model.dart';

abstract class SpeakerRepository {
  Stream<List<Speaker>> speakers();
}

class FirebaseSpeakerRepository implements SpeakerRepository {
  final speakerCollection = Firestore.instance.collection('speakers');

  @override
  Stream<List<Speaker>> speakers() {
    return speakerCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Speaker.fromData(SpeakerData.fromSnapshot(doc)))
          .toList();
    });
  }
}
