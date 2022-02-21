import 'package:floor/floor.dart';

import 'base_model.dart';

@entity
class Chapter extends BaseModel{
  @primaryKey
  int? id;
  String? name;
  Chapter();
  Chapter.fromJson(Map<String, dynamic> json) : super.fromJson(json){
    id = json['id'];
    name = json['name'];
  }


  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}