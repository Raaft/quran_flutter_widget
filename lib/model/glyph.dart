import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/chapter.dart';
import 'package:quran_widget_flutter/model/page.dart';
import 'package:quran_widget_flutter/model/verse.dart';

@Entity(tableName: 'Glyph', foreignKeys: [
  ForeignKey(
      childColumns: ['chapter_id'], parentColumns: ['id'], entity: Chapter),
  ForeignKey(childColumns: ['page_id'], parentColumns: ['id'], entity: Page),
  ForeignKey(childColumns: ['verse_id'], parentColumns: ['id'], entity: Verse),
])
class Glyph extends BaseModel {
  @primaryKey
  int? id;
  @ColumnInfo(name: 'verse_id')
  int? verseId;
  @ColumnInfo(name: 'page_id')
  int? pageId;
  @ColumnInfo(name: 'chapter_id')
  int? chapterId;
  @ColumnInfo(name: 'line_number')
  int? lineNumber;
  int? position;
  int? minX;
  int? maxX;
  int? minY;
  int? maxY;

  Glyph();
  Glyph.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verseId = json['verse_id'];
    pageId = json['page_id'];
    chapterId = json['chapter_id'];
    lineNumber = json['line_number'];
    position = json['position'];
    minX = json['min_x'];
    maxX = json['max_x'];
    minY = json['min_y'];
    maxY = json['max_y'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['verse_id'] = verseId;
    data['page_id'] = pageId;
    data['chapter_id'] = chapterId;
    data['line_number'] = lineNumber;
    data['position'] = position;
    data['min_x'] = minX;
    data['max_x'] = maxX;
    data['min_y'] = minY;
    data['max_y'] = maxY;
    return data;
  }
}
