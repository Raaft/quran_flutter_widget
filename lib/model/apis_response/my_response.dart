import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/book.dart';
import 'package:quran_widget_flutter/model/chapter.dart';
import 'package:quran_widget_flutter/model/explanation_model.dart';
import 'package:quran_widget_flutter/model/glyph.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/page.dart';
import 'package:quran_widget_flutter/model/part.dart';
import 'package:quran_widget_flutter/model/recitation.dart';
import 'package:quran_widget_flutter/model/recitation_verses.dart';
import 'package:quran_widget_flutter/model/reciter.dart';
import 'package:quran_widget_flutter/model/tajweed_model.dart';
import 'package:quran_widget_flutter/model/translation_model.dart';
import 'package:quran_widget_flutter/model/verse.dart';
import 'package:quran_widget_flutter/network_helper/apis.dart';

final factories = <Type, Function>{
  Narration: (Map<String, dynamic> data) => Narration.fromJson(data),
  Book: (Map<String, dynamic> data) => Book.fromJson(data),
  Chapter: (Map<String, dynamic> data) => Chapter.fromJson(data),
  Glyph: (Map<String, dynamic> data) => Glyph.fromJson(data),
  Page: (Map<String, dynamic> data) => Page.fromJson(data),
  Part: (Map<String, dynamic> data) => Part.fromJson(data),
  Recitation: (Map<String, dynamic> data) => Recitation.fromJson(data),
  RecitationVerses: (Map<String, dynamic> data) =>
      RecitationVerses.fromJson(data),
  Reciter: (Map<String, dynamic> data) => Reciter.fromJson(data),
  Verse: (Map<String, dynamic> data) => Verse.fromJson(data),
  TajweedModel: (Map<String, dynamic> data) => TajweedModel.fromJson(data),
  ExplanationModel: (Map<String, dynamic> data) => ExplanationModel.fromJson(data),
  TranslationModel: (Map<String, dynamic> data) => TranslationModel.fromJson(data)

};

class MyResponse<T extends BaseModel> extends Object {
  static const tag = 'MyResponse';

  int? _code = Apis.codeSUCCESS;
  dynamic _data;
  String? _error = '';
  int _type = Apis.list;

  MyResponse.fromJson(dynamic json, int type, {int? code}) {
    // print("$TAG: ${json.toString()}");
    _type = type;
    _code = code ?? Apis.codeSUCCESS;
    _checkType(json);
    /*if (json.containsKey('data')) {
      
    } else if (json.containsKey('error')) {
      _error = json['error'];
    }*/
  }

  MyResponse.init(int? code, dynamic data, String? error) {
    _code = code;
    _data = data;
    _error = error;
  }

  _checkType(json) {
    print('$tag-T_Type: $T');

    if (json != null) {
      switch (_type) {
        case Apis.single:
          print('$tag-T_Type: $T single');
          _parseSingle(json);
          break;
        case Apis.list:
          print('$tag-T_Type: $T list');
          _parseList(json);
          break;
      }
    } else {
      _data = null;
    }
  }

  _parseSingle(json) {
    _data = factories[T]!(json);
  }

  _parseList(json) {
    _data = (json as List).map<T>((item) => factories[T]!(item)).toList();

    print('$tag-T_Type: $T $_data');
  }

  int? get code => _code;

  String? get error => _error;

  get data => _data;

  int get type => _type;
}
