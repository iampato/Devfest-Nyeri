import 'package:devfest19/blocs/speaker/speaker_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SpeakerState extends Equatable {
  SpeakerState([List props = const <dynamic>[]]) : super(props);
}
 
class SpeakerLoading extends SpeakerState {

  @override
  String toString() => 'SpeakersLoading';
}

class SpeakerLoaded extends SpeakerState {
  final List<Speaker> speakers;
  SpeakerLoaded([this.speakers = const []]) : super([speakers]);

  @override
  String toString() => 'SpeakersLoaded { Speakers: $speakers }';
}


class SpeakerNotLoaded extends SpeakerState {
  @override
  String toString() => 'SpeakersNotLoaded';
}
