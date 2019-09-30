import 'package:devfest19/blocs/speaker/speaker_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

@immutable
abstract class SpeakerEvent extends Equatable {
  SpeakerEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadingSpeaker extends SpeakerEvent {
  @override
  String toString() => 'LoadSpeaker';
}

class SpeakerUpdated extends SpeakerEvent {
  final List<Speaker> speakers;
  SpeakerUpdated(this.speakers);

  @override
  String toString() => 'SpeakersUpdated';
}

