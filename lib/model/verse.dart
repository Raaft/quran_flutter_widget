import 'dart:convert';

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

  Verse(
    this.id,
    this.text,
    this.uthmanicText,
    this.lineStart,
    this.lineEnd,
    this.image,
    this.narrationId,
    this.chapterId,
    this.bookId,
    this.partId,
    this.pageId,
  );

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

  Verse copyWith({
    int? id,
    String? text,
    String? uthmanicText,
    int? lineStart,
    int? lineEnd,
    String? image,
    int? narrationId,
    int? chapterId,
    int? bookId,
    int? partId,
    int? pageId,
  }) {
    return Verse(
      id ?? this.id,
      text ?? this.text,
      uthmanicText ?? this.uthmanicText,
      lineStart ?? this.lineStart,
      lineEnd ?? this.lineEnd,
      image ?? this.image,
      narrationId ?? this.narrationId,
      chapterId ?? this.chapterId,
      bookId ?? this.bookId,
      partId ?? this.partId,
      pageId ?? this.pageId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'uthmanicText': uthmanicText,
      'lineStart': lineStart,
      'lineEnd': lineEnd,
      'image': image,
      'narrationId': narrationId,
      'chapterId': chapterId,
      'bookId': bookId,
      'partId': partId,
      'pageId': pageId,
    };
  }

  @override
  String toString() {
    return 'Verse(id: $id, text: $text, uthmanicText: $uthmanicText, lineStart: $lineStart, lineEnd: $lineEnd, image: $image, narrationId: $narrationId, chapterId: $chapterId, bookId: $bookId, partId: $partId, pageId: $pageId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Verse &&
        other.id == id &&
        other.text == text &&
        other.uthmanicText == uthmanicText &&
        other.lineStart == lineStart &&
        other.lineEnd == lineEnd &&
        other.image == image &&
        other.narrationId == narrationId &&
        other.chapterId == chapterId &&
        other.bookId == bookId &&
        other.partId == partId &&
        other.pageId == pageId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        text.hashCode ^
        uthmanicText.hashCode ^
        lineStart.hashCode ^
        lineEnd.hashCode ^
        image.hashCode ^
        narrationId.hashCode ^
        chapterId.hashCode ^
        bookId.hashCode ^
        partId.hashCode ^
        pageId.hashCode;
  }
}
