import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/narration.dart';

import 'base_model.dart';

@Entity(tableName: 'Book', foreignKeys: [
  ForeignKey(
      childColumns: ['narration_id'], parentColumns: ['id'], entity: Narration)
])
class Book extends BaseModel {
  @primaryKey
  int? id;
  String? name;
  @ColumnInfo(name: 'narration_id')
  int? narrationId;
  Book();
  Book.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    id = json['id'];
    name = json['name'];
    narrationId = json['narration_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['narration_id'] = narrationId;
    return data;
  }
}
