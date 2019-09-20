import 'package:devfest19/blocs/auth/bloc.dart';
import 'package:devfest19/blocs/theme/bloc.dart';
import 'package:devfest19/config.dart';
import 'package:devfest19/screens/mainscreen.dart';
import 'package:devfest19/screens/splashscreen.dart';
import 'package:devfest19/blocs/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devfest19/blocs/session/bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Config.preferences = await SharedPreferences.getInstance();
  BlocSupervisor.delegate = AuthBlocDelegate();
  print(Config.preferences.getBool(Config.darkModePreference).toString());
  final UserRepository userRepository = UserRepository();
  runApp(MultiBlocProvider(providers: [
    BlocProvider<AuthBloc>(
      builder: (context) =>
          AuthBloc(userRepository: userRepository)..dispatch(AppStarted()),
    ),
    BlocProvider<ThemeBloc>(
      builder: (context) => ThemeBloc(),
    )
  ], child: MyApp(userRepository: userRepository)));
}

class MyApp extends StatelessWidget {
  final UserRepository _userRepository;
  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc,ThemeState>(builder: (context, state) {
      return MaterialApp(
        title: "Devfest Nyeri",
        // if state.themeData yields null the opeartion after ?? themedata
        // will be light and the swatch color red
        theme: state.themeData ?? ThemeData(primarySwatch: Colors.red),
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is Unauthenticated) {
            return SplashScreen(userRepository: _userRepository);
          }
          if (state is Authenticated) {
            return MultiBlocProvider(providers: [
              BlocProvider<SessionBloc>(
                builder: (context) {
                  return SessionBloc(
                      sessionRepository: FirebaseTodosRepository())
                    ..dispatch(LoadingSession());
                },
              ),
            ], child: MainScreen());
          }
          return SplashScreen(userRepository: _userRepository);
        }),
      );
    });
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
