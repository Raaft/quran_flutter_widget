import 'dart:convert';

import 'package:floor/floor.dart';

import 'base_model.dart';

@entity
class Chapter extends BaseModel {
  @primaryKey
  int? id;
  String? name;
  int? chapter_number;
  String? origin;

  Chapter({
    this.id,
    this.name,
    this.chapter_number,
    this.origin,
  });

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  Chapter copyWith({
    int? id,
    String? name,
    int? chapter_number,
    String? origin,
  }) {
    return Chapter(
      id: id ?? this.id,
      name: name ?? this.name,
      chapter_number: chapter_number ?? this.chapter_number,
      origin: origin ?? this.origin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'chapter_number': chapter_number,
      'origin': origin,
    };
  }

  factory Chapter.fromJson(Map<String, dynamic> map) {
    return Chapter(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  @override
  String toString() {
    return 'Chapter(id: $id, name: $name, chapter_number: $chapter_number, origin: $origin)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chapter &&
        other.id == id &&
        other.name == name &&
        other.chapter_number == chapter_number &&
        other.origin == origin;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        chapter_number.hashCode ^
        origin.hashCode;
  }

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      id: map['id']?.toInt(),
      name: map['name'],
      chapter_number: map['chapter_number']?.toInt(),
      origin: map['origin'],
    );
  }
}
