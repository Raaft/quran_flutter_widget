import 'package:flutter/material.dart';

class Q extends Object {
  /// *** Constants ***

  static const bool isConnect = false;

  static const String versionName = '';
  static const String appName = 'Quran Widget';

  static double deviceWidth = 0.0;
  static double deviceHeight = 0.0;

  static const Locale selectedLocale = localeAR;
  static const localeAR = Locale('ar', 'EG');
  static const localeEN = Locale('en', 'US');

  static var supportedLanguages = [
    localeAR,
    localeEN,
  ];

  static const String languageSettingKey = 'language';

  static const String languageSettingEnglishValue = 'en';
  static const String languageSettingArabicValue = 'en';
}
