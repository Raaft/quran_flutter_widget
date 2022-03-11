import 'package:floor/floor.dart';

import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/glyph.dart';
import 'package:quran_widget_flutter/model/verse.dart';

/*
 foreignKeys: [
 // ForeignKey( childColumns: ['narration'], parentColumns: ['id'], entity: Narration),
  //ForeignKey(childColumns: ['chapter'], parentColumns: ['id'], entity: Chapter),
 // ForeignKey(childColumns: ['book'], parentColumns: ['id'], entity: Book),
  //ForeignKey(childColumns: ['part'], parentColumns: ['id'], entity: Part),
]
 */

@Entity(
  tableName: 'Page',
)
class Page extends BaseModel {
  @primaryKey
  int? id;
  @ColumnInfo(name: 'page_number')
  int? pageNumber;
  @ColumnInfo(name: 'narration')
  int? narrationId;
  @ColumnInfo(name: 'chapters')
  int? chapterId;
  @ColumnInfo(name: 'book')
  int? bookId;
  @ColumnInfo(name: 'part')
  int? partId;
  @ColumnInfo(name: 'sub_part')
  int? subPartId;
  String? image;
  String? localImage;

  /*
  DatabaseException(FOREIGN     KEY constraint failed (code 787 SQLITE_CONSTRAINT_FOREIGNKEY)) sql 
  'INSERT OR ABORT INTO Page 
  (id, page_number, narration, chapters, book, part, sub_part, image, localImage) VALUES
   (?, ?,            ?,         ?,      ?,    ?,     NULL,    NULL, NULL)' args [1, 1, 1, 1, 1, 1]
   */

  @ignore
  List<Verse>? verses;
  @ignore
  List<Glyph>? glyphs;

  Page({
    this.id,
    this.pageNumber,
    this.narrationId,
    this.chapterId,
    this.bookId,
    this.partId,
    this.subPartId,
    this.image,
    this.localImage,
    this.verses,
    this.glyphs,
  });

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['page_number'] = pageNumber;
    data['narration'] = narrationId;
    data['chapters'] = chapterId;
    data['book'] = bookId;
    data['part'] = partId;
    data['sub_part'] = subPartId;
    data['image'] = image;
    if (verses != null) {
      data['verses'] = verses!.map((v) => v.toJson()).toList();
    }
    if (glyphs != null) {
      data['glyphs'] = glyphs!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  factory Page.fromJson(Map<String, dynamic> map) {
    List<Verse>? verses;
    List<Glyph>? glyphs;
    int chapter = 0;
    if (map['verses'] != null) {
      verses = <Verse>[];
      map['verses'].forEach((v) {
        verses!.add(Verse.fromJson(v));
      });
    }
    if (map['glyphs'] != null) {
      glyphs = <Glyph>[];
      map['glyphs'].forEach((v) {
        glyphs!.add(Glyph.fromJson(v));
      });
    }
    if (map['chapters'] != null) {
      glyphs = <Glyph>[];
      map['chapters'].forEach((v) {
        chapter = v;
      });
    }
    return Page(
        id: map['id']?.toInt(),
        pageNumber: map['page_number']?.toInt(),
        narrationId: map['narration']?.toInt(),
        chapterId: chapter,
        bookId: map['book']?.toInt(),
        partId: map['part']?.toInt(),
        subPartId: map['sub_part']?.toInt(),
        image: map['image'],
        localImage: map['localImage'],
        verses: verses,
        glyphs: glyphs);
  }
}
