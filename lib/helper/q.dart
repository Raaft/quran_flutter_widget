import 'package:flutter/material.dart';

class Q extends Object {
  /***** Constants *****/

  static const bool IS_CONNECTED = false;

  static const String VERSION_NAME = "";
  static const String APP_NAME = "Quran Widget";

  static double deviceWidth = 0.0;
  static double deviceHeight = 0.0;

  static const Locale SELECTED_LOCALE = LOCALE_AR;
  static const LOCALE_AR = Locale('ar', 'EG');
  static const LOCALE_EN = Locale('en', 'US');


  static var supportedLanguages = [
    LOCALE_AR,
    LOCALE_EN,
  ];

  static const String LANGUAGE_SETTING_KEY = "language";

  static const String LANGUAGE_SETTING_ENGLISH_VALUE = "en";
  static const String LANGUAGE_SETTING_ARABIC_VALUE = "en";
}
