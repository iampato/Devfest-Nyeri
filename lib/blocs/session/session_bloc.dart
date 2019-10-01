import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  StreamSubscription _sessionsSubscription;
  final SessionRepository _sessionRepository;

  SessionBloc({@required SessionRepository sessionRepository})
      : assert(sessionRepository != null),
        _sessionRepository = sessionRepository;

  @override
  SessionState get initialState => SessionLoading();

  @override
  Stream<SessionState> mapEventToState(
    SessionEvent event,
  ) async* {
    if(event is LoadingSession){
      yield* _mapLoadSessionToState();
    }
    else if( event is SessionUpdated ){
      yield* _mapSessionsUpdateToState(event);
    }
  }
  Stream<SessionState> _mapLoadSessionToState() async*{
    _sessionsSubscription?.cancel();
    _sessionsSubscription = _sessionRepository.sessions().listen(
      (session){
        dispatch(
          SessionUpdated(session),
        );
      }
    );
  }
  Stream<SessionState> _mapSessionsUpdateToState(SessionUpdated event) async* {
    yield SessionLoaded(event.sessions);
  }
  @override
  void dispose() {
    _sessionsSubscription?.cancel();
    super.dispose();
  }
}
