import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/reciter.dart';

import 'base_model.dart';

@Entity(tableName: 'Recitation',foreignKeys: [
  ForeignKey(childColumns: ['narration_id'], parentColumns: ['id'], entity: Narration),
  ForeignKey(childColumns: ['reciter_id'], parentColumns: ['id'], entity: Reciter)
])
class Recitation extends BaseModel{
  @primaryKey
  int? id;
  @ColumnInfo(name: 'narration_id')
  int? narrationId;
  @ColumnInfo(name: 'reciter_id')
  int? reciterId;

  Recitation();
  Recitation.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    id = json['id'];
    narrationId = json['narration_id'];
    reciterId = json['reciter_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['narration_id'] = narrationId;
    data['reciter_id'] = reciterId;
    return data;
  }
}