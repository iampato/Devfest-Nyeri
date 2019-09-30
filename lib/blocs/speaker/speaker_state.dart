import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SpeakerState extends Equatable {
  SpeakerState([List props = const <dynamic>[]]) : super(props);
}

class InitialSpeakerState extends SpeakerState {}
