import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:flutter/foundation.dart';

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
  @ColumnInfo(name: 'narration')
  int? narrationId;
  @ColumnInfo(name: 'chapters')
  List<int>? chapterId;
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

  Page copyWith({
    int? id,
    int? pageNumber,
    int? narrationId,
    List<int>? chapterId,
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
      'pageNumber': pageNumber,
      'narrationId': narrationId,
      'chapterId': chapterId,
      'bookId': bookId,
      'partId': partId,
      'subPartId': subPartId,
      'image': image,
      'localImage': localImage,
      'verses': verses?.map((x) => x?.toMap())?.toList(),
      'glyphs': glyphs?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory Page.fromMap(Map<String, dynamic> map) {
    return Page(
      id: map['id']?.toInt(),
      pageNumber: map['pageNumber']?.toInt(),
      narrationId: map['narrationId']?.toInt(),
      chapterId: List<int>.from(JsonDecoder(map['chapterId'])),
      bookId: map['bookId']?.toInt(),
      partId: map['partId']?.toInt(),
      subPartId: map['subPartId']?.toInt(),
      image: map['image'],
      localImage: map['localImage'],
    );
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
        listEquals(other.chapterId, chapterId) &&
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

  String toJson() => json.encode(toMap());

  factory Page.fromJson(String source) => Page.fromMap(json.decode(source));
}
