import 'package:meta/meta.dart';
import 'session_data.dart';

@immutable
class Session {
  final String id;
  final String name;
  final String speaker;
  final String imagepath;
  final String location;
  final DateTime startTime;
  final int count;
  final String description;
  final String type;

  Session(
      {this.id,
      this.name = "",
      this.count = 0,
      this.imagepath,
      this.speaker,
      this.location,
      this.startTime,
      this.description,
      this.type});

  SessionEntity toEntity() {
    return SessionEntity(
        id, name, speaker, imagepath, location, startTime, count, description,type);
  }

  static Session fromEntity(SessionEntity entity) {
    return Session(
        id: entity.id,
        name: entity.name,
        speaker: entity.speaker,
        imagepath: entity.imagePath,
        location: entity.location,
        startTime: entity.startTime,
        description: entity.description,
        type: entity.type);
  }
}
