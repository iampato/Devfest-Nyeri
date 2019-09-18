import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final String id;
  final String name;
  final String speaker;
  final String imagePath;
  final String location;
  final DateTime startTime;
  final int count;
  final String description;
  final String type;

  SessionEntity(
    this.id,
    this.name,
    this.speaker,
    this.imagePath,
    this.location,
    this.startTime,
    this.count,
    this.description,
    this.type
  );
 
  static SessionEntity fromSnapshot(DocumentSnapshot snap) {
    return SessionEntity(
      snap.documentID,
      snap.data['name'],
      snap.data['speaker'],
      snap.data['image'],
      snap.data['location'],
      snap.data['startTime'],
      snap.data['count'],
      snap.data['description'],
      snap.data['type']
    );
  }
   
  @override
  String toString() {
    return 'SessionEntity {name: $name, speaker: $speaker, Location: $location, Count: $count}';
  }
}