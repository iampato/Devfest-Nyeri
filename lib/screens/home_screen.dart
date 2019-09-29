import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DevFest Nyeri"),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, bottom: 5),
              child: Image.asset("assets/images/banner.png"),
            ),
          ),
          Flexible(
            flex: 2,
            child: Text(
              "DevFest 2019 Nyeri",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              textScaleFactor: 2.0,
            ),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Chip(
                      avatar: Icon(FontAwesomeIcons.mobile),
                      label: Text("Mobile"),
                      backgroundColor: Colors.green,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Chip(
                      avatar: Icon(FontAwesomeIcons.html5),
                      label: Text("Web"),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Chip(
                      avatar: Icon(FontAwesomeIcons.cloud),
                      label: Text("A.I & Cloud"),
                      backgroundColor: Colors.brown,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Chip(
                      avatar: Icon(Icons.fastfood),
                      label: Text("Lots of food"),
                      backgroundColor: Colors.pink,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Chip(
                      avatar: Icon(Icons.people),
                      label: Text("Network"),
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
