import 'package:floor/floor.dart';

import 'base_model.dart';

@entity
class Reciter extends BaseModel{
  @primaryKey
  int? id;
  String? name;

  Reciter(this.id, this.name);

  Reciter.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
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