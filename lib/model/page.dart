import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/book.dart';
import 'package:quran_widget_flutter/model/chapter.dart';
import 'package:quran_widget_flutter/model/glyph.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/part.dart';
import 'package:quran_widget_flutter/model/verse.dart';

@Entity(tableName: 'Page', foreignKeys: [
  ForeignKey(
      childColumns: ['narration_id'], parentColumns: ['id'], entity: Narration),
  ForeignKey(
      childColumns: ['chapter_id'], parentColumns: ['id'], entity: Chapter),
  ForeignKey(childColumns: ['book_id'], parentColumns: ['id'], entity: Book),
  ForeignKey(childColumns: ['part_id'], parentColumns: ['id'], entity: Part),
])
class Page extends BaseModel {
  @primaryKey
  int? id;
  @ColumnInfo(name: 'page_number')
  int? pageNumber;
  @ColumnInfo(name: 'narration_id')
  int? narrationId;
  @ColumnInfo(name: 'chapter_id')
  int? chapterId;
  @ColumnInfo(name: 'book_id')
  int? bookId;
  @ColumnInfo(name: 'part_id')
  int? partId;
  @ColumnInfo(name: 'sub_part_id')
  int? subPartId;
  String? image;

  @ignore
  List<Verse>? verses;
  @ignore
  List<Glyph>? glyphs;

  Page();
  Page.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pageNumber = json['page_number'];
    narrationId = json['narration_id'];
    chapterId = json['chapter_id'];
    bookId = json['book_id'];
    partId = json['part_id'];
    subPartId = json['sub_part_id'];
    image = json['image'];

    if (json['verses'] != null) {
      verses = <Verse>[];
      json['verses'].forEach((v) {
        verses!.add(Verse.fromJson(v));
      });
    }
    if (json['glyphs'] != null) {
      glyphs = <Glyph>[];
      json['glyphs'].forEach((v) {
        glyphs!.add(Glyph.fromJson(v));
      });
    }
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['page_number'] = pageNumber;
    data['narration_id'] = narrationId;
    data['chapter_id'] = chapterId;
    data['book_id'] = bookId;
    data['part_id'] = partId;
    data['sub_part_id'] = subPartId;
    data['image'] = image;
    if (verses != null) {
      data['verses'] = verses!.map((v) => v.toJson()).toList();
    }
    if (glyphs != null) {
      data['glyphs'] = glyphs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
