import 'package:devfest19/blocs/theme/app_theme.dart';
import 'package:devfest19/config.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ThemeEvent extends Equatable {
  ThemeEvent([List props = const <dynamic>[]]) : super(props);
}

class ThemeChanged extends ThemeEvent {
  final appTheme theme;


  ThemeChanged({this.theme}) : super([theme]){
    if (appThemeData[this.theme] == appThemeData[appTheme.lightTheme]) {
      Config.preferences.setBool(Config.darkModePreference, false);
    } else if (appThemeData[this.theme] == appThemeData[appTheme.darkTheme]) {
      Config.preferences.setBool(Config.darkModePreference, true);
    }
  }
  
  @override
  String toString() => 'ThemeChangedEvent';
}
