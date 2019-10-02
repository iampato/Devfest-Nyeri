import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ThemeState extends Equatable {
  ThemeState([Iterable props]) : super(props);

  /// Copy object for use in action
  ThemeState getStateCopy();
}

/// UnInitialized
class UnThemeState extends ThemeState {
  @override
  String toString() => 'UnThemeState';

  @override
  ThemeState getStateCopy() {
    return UnThemeState();
  }
}

/// Initialized
class InThemeState extends ThemeState {
  @override
  String toString() => 'InThemeState';

  @override
  ThemeState getStateCopy() {
    return InThemeState();
  }
}

class ErrorThemeState extends ThemeState {
  final String errorMessage;

  ErrorThemeState(this.errorMessage);
  
  @override
  String toString() => 'ErrorThemeState';

  @override
  ThemeState getStateCopy() {
    return ErrorThemeState(this.errorMessage);
  }
}
