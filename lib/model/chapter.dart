import 'dart:convert';

import 'package:floor/floor.dart';

import 'base_model.dart';

@entity
class Chapter extends BaseModel {
  @primaryKey
  int? id;
  String? name;
  @ColumnInfo(name: 'chapter_number')
  int? chapterNumber;
  String? origin;

  int? pageFrom;

  int? pageTo;

  int? versesSize;

  Chapter({
    this.id,
    this.name,
    this.chapterNumber,
    this.origin,
    this.pageFrom,
    this.pageTo,
    this.versesSize,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'chapter_number': chapterNumber,
      'origin': origin,
      'pageFrom': pageFrom,
      'pageTo': pageTo,
      'versesSize': versesSize,
    };
  }

  Chapter copyWith({
    int? id,
    String? name,
    int? chapterNumber,
    String? origin,
    int? pageFrom,
    int? pageTo,
    int? versesSize,
  }) {
    return Chapter(
      id: id ?? this.id,
      name: name ?? this.name,
      chapterNumber: chapterNumber ?? this.chapterNumber,
      origin: origin ?? this.origin,
      pageFrom: pageFrom ?? this.pageFrom,
      pageTo: pageTo ?? this.pageTo,
      versesSize: versesSize ?? this.versesSize,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'chapter_number': chapterNumber,
      'origin': origin,
      'pageFrom': pageFrom,
      'pageTo': pageTo,
      'versesSize': versesSize,
    };
  }

  @override
  String toString() {
    return 'Chapter(id: $id, name: $name, chapterNumber: $chapterNumber, origin: $origin, pageFrom: $pageFrom, pageTo: $pageTo, versesSize: $versesSize)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chapter &&
        other.id == id &&
        other.name == name &&
        other.chapterNumber == chapterNumber &&
        other.origin == origin &&
        other.pageFrom == pageFrom &&
        other.pageTo == pageTo &&
        other.versesSize == versesSize;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        chapterNumber.hashCode ^
        origin.hashCode ^
        pageFrom.hashCode ^
        pageTo.hashCode ^
        versesSize.hashCode;
  }

  factory Chapter.fromJson(Map<String, dynamic> map) {
    return Chapter(
      id: map['id']?.toInt(),
      name: map['name'],
      chapterNumber: map['chapter_number']?.toInt(),
      origin: map['origin'],
      pageFrom: map['pageFrom']?.toInt(),
      pageTo: map['pageTo']?.toInt(),
      versesSize: map['versesSize']?.toInt(),
    );
  }
}
