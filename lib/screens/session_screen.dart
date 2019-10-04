import 'dart:ui';
import 'package:devfest19/screens/detail_screen.dart';
import 'package:devfest19/blocs/session/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SessionScreen extends StatefulWidget {
  @override
  _SessionScreenState createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sessions"), elevation: 0.0),
      body: BlocProvider<SessionBloc>(
        builder: (context) {
          return SessionBloc(sessionRepository: FirebaseSessionRepository())
            ..dispatch(LoadingSession());
        },
        child: BlocBuilder<SessionBloc, SessionState>(
          builder: (context, state) {
            if (state is SessionLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is SessionNotLoaded) {
              return Center(
                child: Text("Error while fetching data"),
              );
            }
            if (state is SessionLoaded) {
              final sessions = state.sessions;
              return ListView.builder(
                  itemCount: sessions.length,
                  itemBuilder: (context, index) {
                    final session = sessions[index];
                    return SessionItem(
                      session: session,
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class SessionItem extends StatelessWidget {
  final Session session;

  SessionItem({@required this.session});

  @override
  Widget build(BuildContext context) {
    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    ScreenUtil.instance = ScreenUtil(width: deviceWidth, height: deviceHeight)
      ..init(context);

    return CupertinoButton(
        onPressed: () {
          Navigator.of(context)
              .push(CupertinoPageRoute(builder: (BuildContext context) {
            return DetailScreen(id: session.id);
          }));
        },
        child: Card(
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: session.imagepath,
                width: double.infinity,
                fit: BoxFit.cover,
                height: deviceHeight * 0.3,
              ),
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color(0xAAF2F2F2),
                    ),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: createLeadingColor(session.type),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                createLeadingIcon(session.type),
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                session.name,
                                softWrap: false,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .title
                                        .fontSize,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text('By ' + session.presenter,
                                  style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .subtitle
                                          .fontSize,
                                      color: Colors.black54))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.clock,
                                color: CupertinoColors.destructiveRed,
                              ),
                              Text(session.count.toString() + " mins",
                                  style: TextStyle(color: Colors.black54))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Color createLeadingColor(String type) {
    Color color;
    switch (type) {
      case 'admin':
        return color = Colors.red;
        break;
      case 'mobile':
        return color = Colors.green;
        break;
      case 'web':
        return color = Colors.blue;
        break;
      case 'cloud':
        return color = Colors.brown;
        break;
    }
    return color;
  }

  IconData createLeadingIcon(String type) {
    IconData iconData;
    switch (type) {
      case 'admin':
        return iconData = FontAwesomeIcons.solidBell;
        break;
      case 'mobile':
        return iconData = FontAwesomeIcons.mobileAlt;
        break;
      case 'web':
        return iconData = FontAwesomeIcons.html5;
        break;
      case 'cloud':
        return iconData = FontAwesomeIcons.cloud;
        break;
    }
    return iconData;
  }
}
