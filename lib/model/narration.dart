import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/base_model.dart';

@Entity(tableName: 'Narration')
class Narration extends BaseModel{
  @primaryKey
  int? id;
  String? name;
  String? description;


  Narration.fromJson(Map<String, dynamic> json) : super.fromJson(json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
  }

  Narration();
  Narration.create(this.id,this.name,this.description);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}