import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:devfest19/blocs/speaker/speaker_repository.dart';
import 'package:flutter/foundation.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class SpeakerBloc extends Bloc<SpeakerEvent, SpeakerState> {
  StreamSubscription _speakersSubscription;
  final SpeakerRepository _speakerRepository;

  SpeakerBloc({@required SpeakerRepository speakerRepository})
      : assert(speakerRepository != null),
        _speakerRepository = speakerRepository;

  @override
  SpeakerState get initialState => SpeakerLoading();

  @override
  Stream<SpeakerState> mapEventToState(
    SpeakerEvent event,
  ) async* {
    if (event is LoadingSpeaker) {
      yield* _mapLoadSpeakerToState();
    } else if (event is SpeakerUpdated) {
      yield* _mapSpeakersUpdateToState(event);
    }
  }

  Stream<SpeakerState> _mapLoadSpeakerToState() async* {
    _speakersSubscription?.cancel();
    _speakersSubscription = _speakerRepository.speakers().listen((speaker) {
      dispatch(
        SpeakerUpdated(speaker),
      );
    });
  }

  Stream<SpeakerState> _mapSpeakersUpdateToState(SpeakerUpdated event) async* {
    yield SpeakerLoaded(event.speakers);
  }
}
