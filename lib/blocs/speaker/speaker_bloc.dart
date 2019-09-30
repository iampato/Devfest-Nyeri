import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class SpeakerBloc extends Bloc<SpeakerEvent, SpeakerState> {
  @override
  SpeakerState get initialState => InitialSpeakerState();

  @override
  Stream<SpeakerState> mapEventToState(
    SpeakerEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
