import 'package:floor/floor.dart';

import 'package:quran_widget_flutter/model/narration.dart';

import 'base_model.dart';

@Entity(tableName: 'Book', foreignKeys: [
  ForeignKey(
      childColumns: ['narration'], parentColumns: ['id'], entity: Narration)
])
class Book extends BaseModel {
  @primaryKey
  int? id;
  String? name;
  @ColumnInfo(name: 'narration')
  int? narrationId;

  Book({
    this.id,
    this.name,
    this.narrationId,
  });

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['narration'] = narrationId;
    return data;
  }

  Book copyWith({
    int? id,
    String? name,
    int? narrationId,
  }) {
    return Book(
      id: id ?? this.id,
      name: name ?? this.name,
      narrationId: narrationId ?? this.narrationId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'narration': narrationId,
    };
  }

  factory Book.fromJson(Map<String, dynamic> map) {
    return Book(
      id: map['id']?.toInt(),
      name: map['name'],
      narrationId: map['narration']?.toInt(),
    );
  }

  @override
  String toString() => 'Book(id: $id, name: $name, narrationId: $narrationId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Book &&
        other.id == id &&
        other.name == name &&
        other.narrationId == narrationId;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ narrationId.hashCode;
}
