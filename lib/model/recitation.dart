import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/narration.dart';
import 'package:quran_widget_flutter/model/reciter.dart';

@Entity(tableName: 'Recitation', foreignKeys: [
  ForeignKey(
      childColumns: ['narration_id'], parentColumns: ['id'], entity: Narration),
  ForeignKey(
      childColumns: ['reciter_id'], parentColumns: ['id'], entity: Reciter)
])
class Recitation extends BaseModel {
  @primaryKey
  int? id;
  @ColumnInfo(name: 'narration_id')
  int? narrationId;
  @ColumnInfo(name: 'reciter_id')
  int? reciterId;

  Recitation(
    this.id,
    this.narrationId,
    this.reciterId,
  );
  Recitation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    narrationId = json['narration_id'];
    reciterId = json['reciter_id'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['narration_id'] = narrationId;
    data['reciter_id'] = reciterId;
    return data;
  }

  Recitation copyWith({
    int? id,
    int? narrationId,
    int? reciterId,
  }) {
    return Recitation(
      id ?? this.id,
      narrationId ?? this.narrationId,
      reciterId ?? this.reciterId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'narrationId': narrationId,
      'reciterId': reciterId,
    };
  }

  @override
  String toString() =>
      'Recitation(id: $id, narrationId: $narrationId, reciterId: $reciterId)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Recitation &&
        other.id == id &&
        other.narrationId == narrationId &&
        other.reciterId == reciterId;
  }

  @override
  int get hashCode => id.hashCode ^ narrationId.hashCode ^ reciterId.hashCode;
}
