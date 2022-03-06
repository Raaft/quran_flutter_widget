import 'dart:convert';

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

  Glyph(
    this.id,
    this.verseId,
    this.pageId,
    this.chapterId,
    this.lineNumber,
    this.position,
    this.minX,
    this.maxX,
    this.minY,
    this.maxY,
  );
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

  Glyph copyWith({
    int? id,
    int? verseId,
    int? pageId,
    int? chapterId,
    int? lineNumber,
    int? position,
    int? minX,
    int? maxX,
    int? minY,
    int? maxY,
  }) {
    return Glyph(
      id ?? this.id,
      verseId ?? this.verseId,
      pageId ?? this.pageId,
      chapterId ?? this.chapterId,
      lineNumber ?? this.lineNumber,
      position ?? this.position,
      minX ?? this.minX,
      maxX ?? this.maxX,
      minY ?? this.minY,
      maxY ?? this.maxY,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'verseId': verseId,
      'pageId': pageId,
      'chapterId': chapterId,
      'lineNumber': lineNumber,
      'position': position,
      'minX': minX,
      'maxX': maxX,
      'minY': minY,
      'maxY': maxY,
    };
  }

  @override
  String toString() {
    return 'Glyph(id: $id, verseId: $verseId, pageId: $pageId, chapterId: $chapterId, lineNumber: $lineNumber, position: $position, minX: $minX, maxX: $maxX, minY: $minY, maxY: $maxY)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Glyph &&
        other.id == id &&
        other.verseId == verseId &&
        other.pageId == pageId &&
        other.chapterId == chapterId &&
        other.lineNumber == lineNumber &&
        other.position == position &&
        other.minX == minX &&
        other.maxX == maxX &&
        other.minY == minY &&
        other.maxY == maxY;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        verseId.hashCode ^
        pageId.hashCode ^
        chapterId.hashCode ^
        lineNumber.hashCode ^
        position.hashCode ^
        minX.hashCode ^
        maxX.hashCode ^
        minY.hashCode ^
        maxY.hashCode;
  }
}
