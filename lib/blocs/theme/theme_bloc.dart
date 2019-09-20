import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:devfest19/blocs/theme/app_theme.dart';
import 'package:devfest19/config.dart';
import './bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState(
      themeData: Config.preferences.getBool(Config.darkModePreference)
          ? appThemeData[appTheme.darkTheme]
          : appThemeData[appTheme.lightTheme]);

  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ThemeChanged) {
       yield ThemeState(themeData: appThemeData[event.theme]);
     
    /*  if (Config.preferences.getBool(Config.darkModePreference) == true) {
        yield ThemeState(themeData: appThemeData[appTheme.lightTheme]);
      } else if (Config.preferences.getBool(Config.darkModePreference) ==
          false) {
        yield ThemeState(themeData: appThemeData[appTheme.darkTheme]);
      }*/
    }
  }
}
