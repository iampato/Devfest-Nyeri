import 'package:devfest19/blocs/auth/bloc.dart';
import 'package:devfest19/blocs/gallery/bloc.dart';
import 'package:devfest19/blocs/gallery/gallery_repository.dart';
import 'package:devfest19/blocs/theme/bloc.dart';
import 'package:devfest19/config.dart';
import 'package:devfest19/main_screen.dart';
import 'package:devfest19/screens/splash_screen.dart';
import 'package:devfest19/blocs/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  Config.preferences = await SharedPreferences.getInstance();
  BlocSupervisor.delegate = AuthBlocDelegate();
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

class MyApp extends StatefulWidget {
  final UserRepository _userRepository;
  MyApp({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeBloc themeBloc;

  @override
  void initState() {
    super.initState();
    themeBloc = ThemeBloc();
    themeBloc.darkMode =
        Config.preferences.getBool(Config.darkModePreference) ?? false;
  }

  @override
  void dispose() {
    themeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return MaterialApp(
        title: "DevFest Nyeri",
        theme: ThemeData(
          fontFamily: "GoogleSans",
          brightness: themeBloc.darkMode ? Brightness.dark : Brightness.light,
          primarySwatch: Colors.red,
          primaryColor: themeBloc.darkMode ? Colors.black : Colors.red,
          buttonTheme: Theme.of(context).buttonTheme.copyWith(
              colorScheme: themeBloc.darkMode
                  ? ColorScheme.dark()
                  : ColorScheme.light()),
        ),
        home: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is Unauthenticated) {
            return SplashScreen(userRepository: widget._userRepository);
          }
          if (state is Authenticated) {
            return BlocProvider<GalleryBloc>(
                builder: (context) {
                  return GalleryBloc(
                      galleryRepository: FirebaseGalleryRepository())
                    ..dispatch(LoadingGallery());
                },
                child: MainScreen());
          }
          return Container();
        }),
      );
    });
  }
}

