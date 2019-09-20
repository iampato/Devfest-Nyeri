import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config {

  static SharedPreferences preferences;
  static const String darkModePreference = "darkModePref";

  double getDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getTextScaleFactor(BuildContext context) {
    return getDeviceHeight(context) / getDeviceWidth(context);
  }
}
