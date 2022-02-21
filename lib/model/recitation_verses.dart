import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/recitation.dart';
import 'package:quran_widget_flutter/model/verse.dart';

@Entity(tableName: 'RecitationVerses', foreignKeys: [
  ForeignKey(childColumns: ['verse_id'], parentColumns: ['id'], entity: Verse),
  ForeignKey(childColumns: ['recitation_id'], parentColumns: ['id'], entity: Recitation),
])
class RecitationVerses extends BaseModel {
  @primaryKey
  int? id;
  @ColumnInfo(name: 'verse_id')
  int? verseId;
  @ColumnInfo(name: 'verse_number')
  int? verseNumber;
  @ColumnInfo(name: 'recitation_id')
  int? recitationId;
  String? record;

  RecitationVerses();
  RecitationVerses.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    id = json['id'];
    verseId = json['verse_id'];
    verseNumber = json['verse_number'];
    recitationId = json['recitation_id'];
    record = json['record'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['verse_id'] = verseId;
    data['verse_number'] = verseNumber;
    data['recitation_id'] = recitationId;
    data['record'] = record;
    return data;
  }
}
