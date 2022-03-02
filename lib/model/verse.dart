import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/book.dart';
import 'package:quran_widget_flutter/model/chapter.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/page.dart';
import 'package:quran_widget_flutter/model/part.dart';

@Entity(tableName: 'Verse', foreignKeys: [
  ForeignKey(
      childColumns: ['narration_id'], parentColumns: ['id'], entity: Narration),
  ForeignKey(
      childColumns: ['chapter_id'], parentColumns: ['id'], entity: Chapter),
  ForeignKey(childColumns: ['book_id'], parentColumns: ['id'], entity: Book),
  ForeignKey(childColumns: ['part_id'], parentColumns: ['id'], entity: Part),
  ForeignKey(childColumns: ['page_id'], parentColumns: ['id'], entity: Page),
])
class Verse extends BaseModel {
  @primaryKey
  int? id;
  String? text;
  @ColumnInfo(name: 'uthmanic_text')
  String? uthmanicText;
  @ColumnInfo(name: 'line_start')
  int? lineStart;
  @ColumnInfo(name: 'line_end')
  int? lineEnd;
  String? image;
  @ColumnInfo(name: 'narration_id')
  int? narrationId;
  @ColumnInfo(name: 'chapter_id')
  int? chapterId;
  @ColumnInfo(name: 'book_id')
  int? bookId;
  @ColumnInfo(name: 'part_id')
  int? partId;
  @ColumnInfo(name: 'page_id')
  int? pageId;

  Verse();
  Verse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    uthmanicText = json['uthmanic_text'];
    lineStart = json['line_start'];
    lineEnd = json['line_end'];
    image = json['image'];
    narrationId = json['narration_id'];
    chapterId = json['chapter_id'];
    bookId = json['book_id'];
    partId = json['part_id'];
    pageId = json['page_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['text'] = text;
    data['uthmanic_text'] = uthmanicText;
    data['line_start'] = lineStart;
    data['line_end'] = lineEnd;
    data['image'] = image;
    data['narration_id'] = narrationId;
    data['chapter_id'] = chapterId;
    data['book_id'] = bookId;
    data['part_id'] = partId;
    data['page_id'] = pageId;
    return data;
  }
}
