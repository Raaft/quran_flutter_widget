import 'package:floor/floor.dart';

import 'base_model.dart';

@entity
class Part extends BaseModel{
  @primaryKey
  int? id;
  String? name;
  String? alias;
  @ColumnInfo(name: 'part_number')
  int? partNumber;

  Part();
  Part.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    id = json['id'];
    name = json['name'];
    alias = json['alias'];
    partNumber = json['part_number'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['alias'] = alias;
    data['part_number'] = partNumber;
    return data;
  }
}