import 'package:floor/floor.dart';

import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/reciter.dart';

@Entity(tableName: 'Recitation', foreignKeys: [
  ForeignKey(
      childColumns: ['narration'], parentColumns: ['id'], entity: Narration),
  ForeignKey(childColumns: ['reciter'], parentColumns: ['id'], entity: Reciter)
])
class Recitation extends BaseModel {
  @primaryKey
  int? id;
  @ColumnInfo(name: 'narration')
  int? narrationId;
  @ColumnInfo(name: 'reciter')
  int? reciterId;
  String? name;

  Recitation(
    this.id,
    this.narrationId,
    this.reciterId,
    this.name,
  );

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['narration'] = narrationId;
    data['reciter'] = reciterId;
    data['name'] = name;
    return data;
  }

  Recitation copyWith({
    int? id,
    int? narrationId,
    int? reciterId,
    String? name,
  }) {
    return Recitation(
      id ?? this.id,
      narrationId ?? this.narrationId,
      reciterId ?? this.reciterId,
      name ?? this.name,
    );
  }

  @override
  String toString() {
    return 'Recitation(id: $id, narrationId: $narrationId, reciterId: $reciterId, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Recitation &&
        other.id == id &&
        other.narrationId == narrationId &&
        other.reciterId == reciterId &&
        other.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        narrationId.hashCode ^
        reciterId.hashCode ^
        name.hashCode;
  }

  factory Recitation.fromJson(Map<String, dynamic> map) {
    return Recitation(
      map['id']?.toInt(),
      map['narrationId']?.toInt(),
      map['reciterId']?.toInt(),
      map['name'],
    );
  }
}
