import 'package:flutter/material.dart';

class Q {
  /// *** Constants ***

  static const bool isConnect = false;

  static const String hafsSmart = 'HafsSmart';
  static const String bazzi1 = 'Bazzi1';
  static const String doori = 'Doori';
  static const String hafs15 = 'Hafs15';
  static const String hafs17 = 'Hafs17';
  static const String qaloon = 'assets/fonts/uthmanic_qaloon1_ver10.ttf';
  static const String qumbul = 'assets/fonts/uthmanic_qumbul1_ver07.ttf';
  static const String shouba = 'assets/fonts/uthmanic_shouba1_ver08.ttf';
  static const String soosi = 'assets/fonts/uthmanic_soosi1_ver09.ttf';
  static const String warsh = 'assets/fonts/uthmanic_warsh1_ver10.ttf';
  static const String tn = 'assets/fonts/uthmantn1ver10_0.ttf';
  static const String tn1b = 'assets/fonts/uthmantn8b_ver10.ttf';
  static const String quranKarim = 'QuranKarim';

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
