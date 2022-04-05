import 'package:quran_widget_flutter/model/base_model.dart';

class TranslationModel extends BaseModel{
  int? id;
  String? name;
  String? author;
  String? language;

  TranslationModel({this.id, this.name, this.author, this.language});

  TranslationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    author = json['author'];
    language = json['language'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['author'] = author;
    data['language'] = language;
    return data;
  }
}
