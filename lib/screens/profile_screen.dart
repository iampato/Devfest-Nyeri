import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:devfest19/blocs/auth/bloc.dart';
import 'package:devfest19/blocs/theme/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share/share.dart';
import 'package:devfest19/blocs/user_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserRepository userRepository;
  ThemeBloc themeBloc;

  @override
  void initState() {
    super.initState();
    themeBloc = ThemeBloc();
    userRepository = UserRepository();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: Text("My Profile"), elevation: 0.0),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: CircleAvatar(
                    radius: 45,
                    child: Icon(Icons.person),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FutureBuilder<FirebaseUser>(
                      future: userRepository.getUser(),
                      builder: (BuildContext context,
                          AsyncSnapshot<FirebaseUser> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Text(
                              snapshot.data.displayName,
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.0),
                            );
                          }
                        } else {
                          return Text(
                            "null",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0),
                          );
                        }
                        return Container();
                      },
                    ),
                    FutureBuilder<FirebaseUser>(
                      future: userRepository.getUser(),
                      builder: (BuildContext context,
                          AsyncSnapshot<FirebaseUser> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Text(snapshot.data.email);
                          }
                        } else {
                          return Text("null");
                        }
                        return Container();
                      },
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07),
              child: FlatButton(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Dark Mode"),
                    Icon(
                      themeBloc.darkMode
                          ? FontAwesomeIcons.moon
                          : Icons.wb_sunny,
                      size: 18,
                    ),
                  ],
                ),
                onPressed: () =>
                    themeBloc.dispatch(DarkModeEvent(!ThemeBloc().darkMode)),
              ),
            ),
            Divider(),
            FlatButton(
              onPressed: () {
                Share.share("Share this app.\nPlayStore - https://github.com/Iampato/Devfest-Nyeri/releases/download/1.0.1/app-armeabi-v7a-release.apk");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Share this app"),
                  Icon(
                    CupertinoIcons.share,
                  ),
                ],
              ),
            ),
            Divider(),
            FlatButton(
              onPressed: _launchURL("mailto:858wpwaweru@gmail.com"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Give feedback"),
                  Icon(
                    CupertinoIcons.mail,
                  ),
                ],
              ),
            ),
            Divider(),
            FlatButton(
              onPressed: _launchURL("https://github.com/Iampato/Devfest-Nyeri"),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Fork this project"),
                  Icon(
                    FontAwesomeIcons.github,
                  ),
                ],
              ),
            ),
            Divider(),
            FlatButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).dispatch(
                  LoggedOut(),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Logout here"),
                  Icon(
                    CupertinoIcons.clear,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
