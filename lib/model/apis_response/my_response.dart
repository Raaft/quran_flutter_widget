import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/book.dart';
import 'package:quran_widget_flutter/model/chapter.dart';
import 'package:quran_widget_flutter/model/glyph.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/page.dart';
import 'package:quran_widget_flutter/model/part.dart';
import 'package:quran_widget_flutter/model/recitation.dart';
import 'package:quran_widget_flutter/model/recitation_verses.dart';
import 'package:quran_widget_flutter/model/reciter.dart';
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
  Verse: (Map<String, dynamic> data) => Verse.fromJson(data)
};

class MyResponse<T extends BaseModel> extends Object {
  static const tag = 'MyResponse';

  int? _code = -1;
  dynamic _data;
  String? _error = '';
  int _type = Apis.list;

  MyResponse.fromJson(Map<String, dynamic> json, int type) {
    // print("$TAG: ${json.toString()}");
    _type = type;
    _code = json['code'];
    if (json.containsKey('data')) {
      _checkType(json['data']);
    } else if (json.containsKey('error')) {
      _error = json['error'];
    }
  }

  MyResponse.init(int? code, dynamic data, String? error) {
    code = code;
    _data = data;
    _error = error;
  }

  _checkType(json) {
    print('$tag-T_Type: $T');

    if (json != null) {
      switch (_type) {
        case Apis.single:
          _parseSingle(json);
          break;
        case Apis.list:
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
    _data = (json as List).map((item) => factories[T]!(json)).toList();
  }

  int? get code => _code;

  String? get error => _error;

  get data => _data;

  int get type => _type;
}
