import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:devfest19/blocs/session/bloc.dart';
import 'package:intl/intl.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  DetailScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SessionBloc>(
        builder: (context) =>
            SessionBloc(sessionRepository: FirebaseSessionRepository())..dispatch(LoadingSession()),
        child:
            BlocBuilder<SessionBloc, SessionState>(builder: (context, state) {
          final session = (state as SessionLoaded)
              .sessions
              .firstWhere((session) => session.id == id, orElse: () => null);

          return Scaffold(
            appBar: AppBar(
              title: Text(session.name),
            ),
            body: ListView(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: session.imagepath,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  //height: 250,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: createLeadingColor(session.type),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            createLeadingIcon(session.type),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text(
                              session.name,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Opacity(opacity: 0.7, child: Text(session.presenter)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.clock,
                          ),
                          Text(session.count.toString() + " mins")
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(CupertinoIcons.location_solid),
                          Text(session.location)
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(CupertinoIcons.time_solid),
                          Text(DateFormat("yyyy-MM-dd hh:mm").format(session.startTime))
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(session.description),
                )
              ],
            ),
          );
        }));
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
