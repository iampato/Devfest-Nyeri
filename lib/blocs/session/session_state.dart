import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'bloc.dart';

@immutable
abstract class SessionState extends Equatable {
  SessionState([List props = const <dynamic>[]]) : super(props);
}

//Loading session data 
class SessionLoading extends SessionState {

  @override
  String toString() => 'SessionsLoading';
}

//session data has been loaded
class SessionLoaded extends SessionState {
  final List<Session> sessions;
  SessionLoaded([this.sessions = const []]) : super([sessions]);

  @override
  String toString() => 'SessionsLoaded { sessions: $sessions }';
}

// session data has not been loaded
class SessionNotLoaded extends SessionState {
  @override
  String toString() => 'SessionsNotLoaded';
}

