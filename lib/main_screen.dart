import 'dart:ui';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:devfest19/blocs/theme/bloc.dart';
import 'package:devfest19/screens/screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex;

  List<Widget> _children = [
    HomeScreen(),
    SessionScreen(),
    SpeakerScreen(),
    GalleryScreen(),
    ProfileScreen()
  ];
  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = BlocProvider.of<ThemeBloc>(context);
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        backgroundColor: theme.darkMode ? Colors.black : Colors.white,
        hasNotch: true,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.home,
                color: theme.darkMode ? Colors.white : Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.access_time,
                color: theme.darkMode ? Colors.white : Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.red,
              ),
              title: Text("Sessions")),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.volume_up,
                color: theme.darkMode ? Colors.white : Colors.black,
              ),
              activeIcon: Icon(
                Icons.volume_up,
                color: Colors.red,
              ),
              title: Text("Speakers")),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.photo_camera,
                color: theme.darkMode ? Colors.white : Colors.black,
              ),
              activeIcon: Icon(
                Icons.photo_camera,
                color: Colors.red,
              ),
              title: Text("Gallery")),
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.person,
                color: theme.darkMode ? Colors.white : Colors.black,
              ),
              activeIcon: Icon(
                Icons.person,
                color: Colors.red,
              ),
              title: Text("Profile"))
        ],
      ),
    );
  }
}

