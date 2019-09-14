import 'dart:ui';
import 'package:devfest19/blocs/auth/bloc.dart';
import 'package:devfest19/blocs/login/bloc.dart';
import 'package:devfest19/blocs/user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreen extends StatelessWidget {
  final UserRepository _userRepository;

  SplashScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: BlocProvider<LoginBloc>(
          builder: (context) => LoginBloc(userRepository: _userRepository),
          child: ScreenContent(userRepository: _userRepository)),
    );
  }
}

class ScreenContent extends StatefulWidget {
  final UserRepository _userRepository;

  ScreenContent({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  _ScreenContentState createState() => _ScreenContentState();
}

class _ScreenContentState extends State<ScreenContent>
    with SingleTickerProviderStateMixin {
  UserRepository get _userRepository => widget._userRepository;
  AnimationController _controller;

  Animation<Offset> _banner;
  Animation<Offset> _welcomeText;
  Animation<Offset> _googleButton;
  Animation<Offset> _versionText;

  Animation<double> _bannerOpacity;
  Animation<double> _welcomeTextOpacity;
  Animation<double> _googleButtonOpacity;
  Animation<double> _versionTextOpacity;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..addListener(() {
            setState(() {});
          })
          ..forward();
    _banner = Tween<Offset>(begin: Offset(0, 100), end: Offset.zero)
        .chain(
            CurveTween(curve: Interval(0.3, 0.7, curve: Curves.easeOutCubic)))
        .animate(_controller);
    _welcomeText = Tween<Offset>(begin: Offset(0, 100), end: Offset.zero)
        .chain(
            CurveTween(curve: Interval(0.4, 0.8, curve: Curves.easeOutCubic)))
        .animate(_controller);
    _googleButton = Tween<Offset>(begin: Offset(0, 100), end: Offset.zero)
        .chain(
            CurveTween(curve: Interval(0.5, 0.9, curve: Curves.easeOutCubic)))
        .animate(_controller);
    _versionText = Tween<Offset>(begin: Offset(0, 100), end: Offset.zero)
        .chain(
            CurveTween(curve: Interval(0.6, 1.0, curve: Curves.easeOutCubic)))
        .animate(_controller);

    _bannerOpacity =
        CurvedAnimation(parent: _controller, curve: Interval(0.2, 0.7));
    _welcomeTextOpacity =
        CurvedAnimation(parent: _controller, curve: Interval(0.3, 0.8));
    _googleButtonOpacity =
        CurvedAnimation(parent: _controller, curve: Interval(0.4, 0.9));
    _versionTextOpacity =
        CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0));
  }

  @override
  void dispose() {
    
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(listener: (context, state) {
      if (state.isFailure) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Login Failure'), Icon(Icons.error)],
              ),
              backgroundColor: Colors.orange,
            ),
          );
      }
      if (state.isLoading) {
        Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logging In...'),
                    CircularProgressIndicator(),
                  ],
                ),
                backgroundColor: Colors.green),
          );
      }
      if (state.isSuccess) {
        BlocProvider.of<AuthBloc>(context).dispatch(LoggedIn());
      }
    }, child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/splash.jpg"))),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Color(0xAAF2F2F2),
              ),
              child: Column(
                children: <Widget>[
                  Opacity(
                    opacity: _bannerOpacity.value,
                    child: Transform.translate(
                      offset: _banner.value,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 170, bottom: 5),
                        child: Image.asset("assets/images/banner.png"),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: _welcomeTextOpacity.value,
                    child: Transform.translate(
                      offset: _welcomeText.value,
                      child: Text(
                        "Hi there and welcome to Devfest 2019 Nyeri",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 40,
                            fontFamily: "GoogleSans",
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Opacity(
                    opacity: _googleButtonOpacity.value,
                    child: Transform.translate(
                      offset: _googleButton.value,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: RaisedButton.icon(
                          label: Text('Sign in with Google',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          color: Colors.red,
                          icon: Icon(FontAwesomeIcons.google,
                              color: Colors.white),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0)),
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).dispatch(
                              LoginWithGooglePressed(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: _versionTextOpacity.value,
                    child: Transform.translate(
                        offset: _versionText.value,
                        child: Text("version 1.0.1",
                            style: TextStyle(fontSize: 11))),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      );
    }));
  }
}
