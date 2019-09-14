import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:devfest19/blocs/user_repository.dart';
import 'package:flutter/foundation.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  UserRepository _userRepository;

  LoginBloc({
    @required UserRepository userRepository,
  })  : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  LoginState get initialState => LoginState.intial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event,) async* {
    if( event is LoginWithGooglePressed){
      yield* _mapLoginWithGooglePressedToState();
    }
  }

  Stream<LoginState> _mapLoginWithGooglePressedToState() async* {
    yield LoginState.loading();
    try {
      await _userRepository.signInWithGoogle();
      yield LoginState.success();
    } catch (_) {
      yield LoginState.failure();
    }
  }
}
