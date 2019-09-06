import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Session{
  final String name;
  final String presenter;
  final Color leadingBgColor;
  final IconData leadingIcon;
  final String imagePath;
  final int count;
  final String description;

  Session({
    this.name,
    this.presenter,
    this.leadingBgColor,
    this.leadingIcon,
    this.imagePath,
    this.count,
    this.description
  });
}

List<Session> sessionData = [
  Session(
    name: "Devfest Keynote",
    presenter: "Grace Kahinga",
    leadingBgColor: Colors.red,
    leadingIcon: FontAwesomeIcons.solidBell,
    imagePath: "assets/images/card5.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Kotlin everywhere",
    presenter: "Job Getabu",
    leadingBgColor: Colors.green,
    leadingIcon: FontAwesomeIcons.mobileAlt,
    imagePath: "assets/images/banner_dark.png",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Flutter the cross platform SDK",
    presenter: "Clare Wanjiru",
    leadingBgColor: Colors.green,
    leadingIcon: FontAwesomeIcons.mobileAlt,
    imagePath: "assets/images/bg.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Material Design for mobile",
    presenter: "Brian Okinyi",
    leadingBgColor: Colors.green,
    leadingIcon: FontAwesomeIcons.mobileAlt,
    imagePath: "assets/images/bg1.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "A web without javascript",
    presenter: "Patrick Waweru",
    leadingBgColor: Colors.blue,
    leadingIcon: FontAwesomeIcons.html5,
    imagePath: "assets/images/card2.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Chrome for developers",
    presenter: "Sawe Peter",
    leadingBgColor: Colors.blue,
    leadingIcon: FontAwesomeIcons.html5,
    imagePath: "assets/images/card2.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Dart for backend",
    presenter: "Raj Karun",
    leadingBgColor: Colors.blue,
    leadingIcon: FontAwesomeIcons.html5,
    imagePath: "assets/images/card2.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Intro to Firebase Ml",
    presenter: "Samuel Kamwana",
    leadingBgColor: Colors.brown,
    leadingIcon: FontAwesomeIcons.cloud,
    imagePath: "assets/images/card5.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Cloud Functions",
    presenter: "Ridge Kimani",
    leadingBgColor: Colors.brown,
    leadingIcon: FontAwesomeIcons.cloud,
    imagePath: "assets/images/card3.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Intro to Google App Engine",
    presenter: "Joy Kendi",
    leadingBgColor: Colors.brown,
    leadingIcon: FontAwesomeIcons.solidBell,
    imagePath: "assets/images/card4.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Building Tech Communities",
    presenter: "Grace Kahinga",
    leadingBgColor: Colors.red,
    leadingIcon: FontAwesomeIcons.solidBell,
    imagePath: "assets/images/tile.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Intro to Android Jetpacks",
    presenter: "Valentine Rutto",
    leadingBgColor: Colors.green,
    leadingIcon: FontAwesomeIcons.mobileAlt,
    imagePath: "assets/images/banner_dark.png",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Deploying tensorflow models",
    presenter: "Frances Njambi",
    leadingBgColor: Colors.brown,
    leadingIcon: FontAwesomeIcons.cloud,
    imagePath: "assets/images/card2.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
  Session(
    name: "Vote of Thanks",
    presenter: "Grace Kahinga",
    leadingBgColor: Colors.red,
    leadingIcon: FontAwesomeIcons.solidBell,
    imagePath: "assets/images/tile.jpg",
    count: 140,
    description:'''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.''' +
                '''DevFests are community-led, developer events hosted by GDG chapters around the globe focused on community building & learning about Google’s technologies. Each DevFest is inspired by and uniquely tailored to the needs of the developer community and region that hosts it.'''
  ),
];