import 'package:meta/meta.dart';
import 'session_data.dart';

@immutable
class Session {
  final String id;
  final String name;
  final int count;
  final String presenter;
  final String imagepath;
  final String location;
  final DateTime startTime;
  final String description;
  final String type;

  Session(
      {this.id,
      this.name = '',
      this.count = 0,
      this.presenter = '',	
      this.imagepath,
      this.location,
      this.startTime,
      this.description,
      this.type});

  SessionEntity toEntity() {
    return SessionEntity(
        id, name,count, presenter, imagepath, location, startTime, description,type);
  }

  static Session fromEntity(SessionEntity entity) {
    return Session(
        id: entity.id,
        name: entity.name,
	count: entity.count,
        presenter: entity.presenter,
        imagepath: entity.imagePath,
        location: entity.location,
        startTime: entity.startTime,
        description: entity.description,
        type: entity.type);
  }
}
