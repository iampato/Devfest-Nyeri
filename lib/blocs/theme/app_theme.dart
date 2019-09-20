import 'package:flutter/material.dart';

enum appTheme { lightTheme, darkTheme }

final appThemeData = {
  appTheme.lightTheme: ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.red,
    
  ),
  appTheme.darkTheme : ThemeData(
    brightness: Brightness.dark,
    primarySwatch:Colors.red,
    primaryColor: Colors.redAccent
  )
};
