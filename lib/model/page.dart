import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';

import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/book.dart';
import 'package:quran_widget_flutter/model/glyph.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/part.dart';
import 'package:quran_widget_flutter/model/verse.dart';

@Entity(tableName: 'Page', foreignKeys: [
  ForeignKey(
      childColumns: ['narration'], parentColumns: ['id'], entity: Narration),
  //ForeignKey(childColumns: ['chapter'], parentColumns: ['id'], entity: Chapter),
  ForeignKey(childColumns: ['book'], parentColumns: ['id'], entity: Book),
  ForeignKey(childColumns: ['part'], parentColumns: ['id'], entity: Part),
])
class Page extends BaseModel {
  @primaryKey
  int? id;
  @ColumnInfo(name: 'page_number')
  int? pageNumber;
  @ColumnInfo(name: 'narration')
  int? narrationId;
  @ColumnInfo(name: 'chapter')
  int? chapterId;
  @ColumnInfo(name: 'book')
  int? bookId;
  @ColumnInfo(name: 'part')
  int? partId;
  @ColumnInfo(name: 'sub_part')
  int? subPartId;
  String? image;
  String? localImage;

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
    data['chapter'] = chapterId;
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

  Page copyWith({
    int? id,
    int? pageNumber,
    int? narrationId,
    int? chapterId,
    int? bookId,
    int? partId,
    int? subPartId,
    String? image,
    String? localImage,
    List<Verse>? verses,
    List<Glyph>? glyphs,
  }) {
    return Page(
      id: id ?? this.id,
      pageNumber: pageNumber ?? this.pageNumber,
      narrationId: narrationId ?? this.narrationId,
      chapterId: chapterId ?? this.chapterId,
      bookId: bookId ?? this.bookId,
      partId: partId ?? this.partId,
      subPartId: subPartId ?? this.subPartId,
      image: image ?? this.image,
      localImage: localImage ?? this.localImage,
      verses: verses ?? this.verses,
      glyphs: glyphs ?? this.glyphs,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'page_number': pageNumber,
      'narration': narrationId,
      'chapter': chapterId,
      'book': bookId,
      'part': partId,
      'sub_part': subPartId,
      'image': image,
      'localImage': localImage,
    };
  }

  factory Page.fromJson(Map<String, dynamic> map) {
    List<Verse>? verses;
    List<Glyph>? glyphs;
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
    return Page(
        id: map['id']?.toInt(),
        pageNumber: map['pageNumber']?.toInt(),
        narrationId: map['narration']?.toInt(),
        chapterId: map['chapter']?.toInt(),
        bookId: map['book']?.toInt(),
        partId: map['part']?.toInt(),
        subPartId: map['subPart']?.toInt(),
        image: map['image'],
        localImage: map['localImage'],
        verses: verses,
        glyphs: glyphs);
  }

  @override
  String toString() {
    return 'Page(id: $id, pageNumber: $pageNumber, narrationId: $narrationId, chapterId: $chapterId, bookId: $bookId, partId: $partId, subPartId: $subPartId, image: $image, localImage: $localImage, verses: $verses, glyphs: $glyphs)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Page &&
        other.id == id &&
        other.pageNumber == pageNumber &&
        other.narrationId == narrationId &&
        other.chapterId == chapterId &&
        other.bookId == bookId &&
        other.partId == partId &&
        other.subPartId == subPartId &&
        other.image == image &&
        other.localImage == localImage &&
        listEquals(other.verses, verses) &&
        listEquals(other.glyphs, glyphs);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        pageNumber.hashCode ^
        narrationId.hashCode ^
        chapterId.hashCode ^
        bookId.hashCode ^
        partId.hashCode ^
        subPartId.hashCode ^
        image.hashCode ^
        localImage.hashCode ^
        verses.hashCode ^
        glyphs.hashCode;
  }
}
