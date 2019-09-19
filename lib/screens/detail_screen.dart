import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  DetailScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SessionBloc>(
      builder: (context) {
        return SessionBloc(sessionRepository: FirebaseTodosRepository())
          ..dispatch(LoadingSession());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Devfest Keynote"),
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            ListView(
              children: <Widget>[
                Image.asset(
                  "assets/images/tile.jpg",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: CupertinoColors.destructiveRed,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            FontAwesomeIcons.solidBell,
                            color: CupertinoColors.white,
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
                              "Devfest Keynote",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text("By Grace Kahinga",
                              style: TextStyle(color: Colors.black54)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Icon(CupertinoIcons.group_solid,
                              color: CupertinoColors.black),
                          Text(230.toString())
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
                          Text("Freedom Hall")
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Icon(CupertinoIcons.time_solid),
                          Text("12th Nov 8:00 pm")
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                      '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                          '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Leave a comment",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          enabled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: RaisedButton(
                          color: Colors.red,
                          child: Text("Submit"),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.white, //Color(0xAAF2F2F2)
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
            )
          ],
        ),
      ),
    );
  }
}
