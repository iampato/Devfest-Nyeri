import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  final String id;
  final String name;
  final int count;
  final String presenter;
  final String imagePath;
  final String location;
  final DateTime startTime;
  final String description;
  final String type;

  SessionEntity(
    this.id,
    this.name,
    this.count,
    this.presenter,
    this.imagePath,
    this.location,
    this.startTime,
    this.description,
    this.type
  );
 
  static SessionEntity fromSnapshot(DocumentSnapshot snap) {
    return SessionEntity(
      snap.documentID,
      snap.data['name'],
      snap.data['count'],
      snap.data['presenter'],
      snap.data['image'],
      snap.data['location'],
      snap.data['startTime'].toDate(),
      snap.data['description'],
      snap.data['type']
    );
  }
   
  @override
  String toString() {
    return 'SessionEntity {name: $name, presenter: $presenter, Location: $location, Count: $count}';
  }
}