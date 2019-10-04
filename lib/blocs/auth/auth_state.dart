import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {
  AuthState([List props = const <dynamic>[]]) : super(props);
}

//Authenticated state
class Authenticated extends AuthState {

  @override
  String toString() => 'Authenticated ';
}

class Unauthenticated extends AuthState {

  @override
  String toString() => 'Unauthenticated';
}

