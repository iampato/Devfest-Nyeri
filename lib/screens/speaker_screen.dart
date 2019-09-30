import 'package:flutter/material.dart';

class SpeakerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Speakers"),
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(top: 2.5),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: ConstrainedBox(
                          constraints: BoxConstraints.expand(
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          child: Image.asset(
                            "assets/images/tile.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Patrick Waweru",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w600)),
                            Opacity(
                              opacity: 0.8,
                              child: Text(
                                "Software Engineer Andela Ke",
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Wrap(
                              spacing: 2.5,
                              children: <Widget>[
                                Chip(
                                  backgroundColor: Colors.green,
                                  label: Text("Android"),
                                ),
                                Chip(
                                  backgroundColor: Colors.pink,
                                  label: Text("Django"),
                                ),
                                Chip(
                                  backgroundColor: Colors.amber,
                                  label: Text("Firebase"),
                                ),
                                Chip(
                                  backgroundColor: Colors.amber,
                                  label: Text("C++"),
                                ),
                                Chip(
                                  backgroundColor: Colors.amber,
                                  label: Text("Firebase"),
                                ),
                                Chip(
                                  backgroundColor: Colors.amber,
                                  label: Text("C++"),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider()
                ],
              ),
            );
          },
        ));
  }
}
