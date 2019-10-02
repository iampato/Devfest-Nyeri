import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static final ThemeBloc _themeBlocSingeleton = ThemeBloc._internal();
  factory ThemeBloc(){
    return _themeBlocSingeleton;
  }
  ThemeBloc._internal();

  bool darkMode = false;

  @override
  ThemeState get initialState => new UnThemeState();

   @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    try {
      yield UnThemeState();
      yield await event.applyAsync(currentState: currentState, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield currentState;
    }
  }
}
