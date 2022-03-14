import 'package:floor/floor.dart';

import 'package:quran_widget_flutter/model/base_model.dart';

/*
foreignKeys: [
  ForeignKey(childColumns: ['verse'], parentColumns: ['id'], entity: Verse),
  ForeignKey(
      childColumns: ['recitation'], parentColumns: ['id'], entity: Recitation),
]
 */

@Entity(
  tableName: 'RecitationVerses',
)
class RecitationVerses extends BaseModel {
  @primaryKey
  int? id;
  @ColumnInfo(name: 'verse')
  int? verseId;
  @ColumnInfo(name: 'verse_number')
  int? verseNumber;
  @ColumnInfo(name: 'recitation')
  int? recitationId;
  String? record;
  String? recordLocal;

  RecitationVerses(
    this.id,
    this.verseId,
    this.verseNumber,
    this.recitationId,
    this.record,
    this.recordLocal,
  );

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['verse'] = verseId;
    data['verse_number'] = verseNumber;
    data['recitation'] = recitationId;
    data['record'] = record;
    return data;
  }

  RecitationVerses copyWith({
    int? id,
    int? verseId,
    int? verseNumber,
    int? recitationId,
    String? record,
    String? recordLocal,
  }) {
    return RecitationVerses(
      id ?? this.id,
      verseId ?? this.verseId,
      verseNumber ?? this.verseNumber,
      recitationId ?? this.recitationId,
      record ?? this.record,
      recordLocal ?? this.recordLocal,
    );
  }

  factory RecitationVerses.fromJson(Map<String, dynamic> map) {
    return RecitationVerses(
      map['id']?.toInt(),
      map['verse']?.toInt(),
      map['verse_number']?.toInt(),
      map['recitation']?.toInt(),
      map['record'],
      map['recordLocal'],
    );
  }

  @override
  String toString() {
    return 'RecitationVerses(id: $id, verseId: $verseId, verseNumber: $verseNumber, recitationId: $recitationId, record: $record, recordLocal: $recordLocal)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecitationVerses &&
        other.id == id &&
        other.verseId == verseId &&
        other.verseNumber == verseNumber &&
        other.recitationId == recitationId &&
        other.record == record &&
        other.recordLocal == recordLocal;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        verseId.hashCode ^
        verseNumber.hashCode ^
        recitationId.hashCode ^
        record.hashCode ^
        recordLocal.hashCode;
  }
}
