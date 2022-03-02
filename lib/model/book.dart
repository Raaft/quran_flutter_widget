import 'package:floor/floor.dart';

import 'package:quran_widget_flutter/model/narration.dart';

import 'base_model.dart';

@Entity(tableName: 'Book', foreignKeys: [
  ForeignKey(
      childColumns: ['narration_id'], parentColumns: ['id'], entity: Narration)
])
class Book extends BaseModel {
  @primaryKey
  int? id;
  String? name;
  @ColumnInfo(name: 'narration_id')
  int? narrationId;

  Book(
    this.id,
    this.name,
    this.narrationId,
  );

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        json['id']?.toInt(),
        json['name'],
        json['narrationId']?.toInt(),
      );

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['narration_id'] = narrationId;
    return data;
  }

  Book copyWith({
    int? id,
    String? name,
    int? narrationId,
  }) {
    return Book(
      id ?? this.id,
      name ?? this.name,
      narrationId ?? this.narrationId,
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
