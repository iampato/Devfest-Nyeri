import 'dart:async';
import 'package:devfest19/blocs/session/session_model.dart';
import 'session_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SessionRepository {

  Stream<List<Session>> sessions();

}
class FirebaseTodosRepository implements SessionRepository {
  final sessionCollection = Firestore.instance.collection('sessions');

  @override
  Stream<List<Session>> sessions() {
    return sessionCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Session.fromEntity(SessionEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}