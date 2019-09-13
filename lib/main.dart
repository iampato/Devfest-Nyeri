import 'package:devfest19/blocs/auth/bloc.dart';
import 'package:devfest19/screens/mainscreen.dart';
import 'package:devfest19/screens/splashscreen.dart';
import 'package:devfest19/blocs/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

void main() {
  BlocSupervisor.delegate = AuthBlocDelegate();
  final UserRepository userRepository = UserRepository();
  runApp(BlocProvider<AuthBloc>(
      builder: (context) =>
          AuthBloc(userRepository: userRepository)..dispatch(AppStarted()),
      child: MyApp(userRepository: userRepository)));
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;
  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Devfest Nyeri",
      theme: ThemeData(primarySwatch: Colors.red),
      home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        if (state is Unauthenticated) {
          return SplashScreen(userRepository: _userRepository);
        }
        if (state is Authenticated) {
          return MainScreen();
        }
        return null;
      }),
    );
  }
}

/*@override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Devfest Nyeri',
      theme: CupertinoThemeData(primaryColor: CupertinoColors.destructiveRed),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
  */
