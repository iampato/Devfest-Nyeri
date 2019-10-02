import 'dart:async';
import 'package:devfest19/config.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

@immutable
abstract class ThemeEvent {
  Future<ThemeState> applyAsync({ThemeState currentState, ThemeBloc bloc});
}

class DarkModeEvent extends ThemeEvent {
  final bool darkOn;
  DarkModeEvent(this.darkOn);
  @override
  String toString() => 'DarkModeEvent';

  @override
  Future<ThemeState> applyAsync(
      {ThemeState currentState, ThemeBloc bloc}) async {
    try {
      bloc.darkMode = darkOn;
      Config.preferences.setBool(Config.darkModePreference,darkOn);
      return InThemeState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return new ErrorThemeState(_?.toString());
    }
  }
}

class LoadThemeEvent extends ThemeEvent {
  @override
  String toString() => 'LoadThemeEvent';

  @override
  Future<ThemeState> applyAsync(
      {ThemeState currentState,ThemeBloc bloc}) async {
    try {
      await Future.delayed(new Duration(seconds: 2));

      return new InThemeState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return new ErrorThemeState(_?.toString());
    }
  }
}
