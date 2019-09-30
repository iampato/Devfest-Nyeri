import 'package:devfest19/blocs/speaker/speaker_data.dart';

class Speaker {
  final String id;
  final String name;
  final String imageUrl;
  final String occupation;
  final String workPlace;
  final List expertise;

  Speaker(
      {this.id,
      this.name,
      this.imageUrl,
      this.occupation,
      this.workPlace,
      this.expertise});

  SpeakerData toData() {
    return SpeakerData(id, name, imageUrl, occupation, workPlace, expertise);
  }

  static Speaker fromData(SpeakerData data) {
    return Speaker(
        id: data.id,
        name: data.name,
        imageUrl: data.imageUrl,
        occupation: data.occupation,
        workPlace: data.workPlace,
        expertise: data.expertise);
  }
}
