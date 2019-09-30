import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SpeakerEvent extends Equatable {
  SpeakerEvent([List props = const <dynamic>[]]) : super(props);
}
