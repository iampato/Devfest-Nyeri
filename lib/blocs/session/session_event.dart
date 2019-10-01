import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

@immutable
abstract class SessionEvent extends Equatable {
  SessionEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadingSession extends SessionEvent {
  @override
  String toString() => 'LoadSession';
}

class SessionUpdated extends SessionEvent {
  final List<Session> sessions;
  SessionUpdated(this.sessions);

  @override
  String toString() => 'SessionsUpdated';
}

