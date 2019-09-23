import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:devfest19/blocs/session/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  DetailScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    Session session;
    return Scaffold(
      appBar: AppBar(
        title: Text(session.name),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ListView(
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
                          CupertinoIcons.group_solid,
                        ),
                        Text(session.count.toString())
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
                        Text(session.startTime.hour.toString() +
                            ':' +
                            session.startTime.minute.toString())
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
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xAAF2F2F2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      splashColor: Colors.black,
                      child: Text(
                        "Not Attending 😒",
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      onPressed: () {},
                    ),
                    FlatButton(
                      splashColor: Colors.black,
                      child: Text(
                        "Attending 😎",
                        style: TextStyle(color: Colors.green, fontSize: 18),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
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
