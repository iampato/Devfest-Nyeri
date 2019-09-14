import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const <dynamic>[]]) : super(props);
}
class LoginWithGooglePressed extends LoginEvent {
  @override
  String toString() => 'Login With Google Pressed';
}
