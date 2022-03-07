import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/base_model.dart';
import 'package:quran_widget_flutter/model/recitation.dart';
import 'package:quran_widget_flutter/model/verse.dart';

@Entity(tableName: 'RecitationVerses', foreignKeys: [
  ForeignKey(childColumns: ['verse_id'], parentColumns: ['id'], entity: Verse),
  ForeignKey(
      childColumns: ['recitation_id'],
      parentColumns: ['id'],
      entity: Recitation),
])
class RecitationVerses extends BaseModel {
  @primaryKey
  int? id;
  @ColumnInfo(name: 'verse_id')
  int? verseId;
  @ColumnInfo(name: 'verse_number')
  int? verseNumber;
  @ColumnInfo(name: 'recitation_id')
  int? recitationId;
  String? record;

  RecitationVerses(
    this.id,
    this.verseId,
    this.verseNumber,
    this.recitationId,
    this.record,
  );
  RecitationVerses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    verseId = json['verse_id'];
    verseNumber = json['verse_number'];
    recitationId = json['recitation_id'];
    record = json['record'];
  }

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['verse_id'] = verseId;
    data['verse_number'] = verseNumber;
    data['recitation_id'] = recitationId;
    data['record'] = record;
    return data;
  }

  RecitationVerses copyWith({
    int? id,
    int? verseId,
    int? verseNumber,
    int? recitationId,
    String? record,
  }) {
    return RecitationVerses(
      id ?? this.id,
      verseId ?? this.verseId,
      verseNumber ?? this.verseNumber,
      recitationId ?? this.recitationId,
      record ?? this.record,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'verseId': verseId,
      'verseNumber': verseNumber,
      'recitationId': recitationId,
      'record': record,
    };
  }

  @override
  String toString() {
    return 'RecitationVerses(id: $id, verseId: $verseId, verseNumber: $verseNumber, recitationId: $recitationId, record: $record)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecitationVerses &&
        other.id == id &&
        other.verseId == verseId &&
        other.verseNumber == verseNumber &&
        other.recitationId == recitationId &&
        other.record == record;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        verseId.hashCode ^
        verseNumber.hashCode ^
        recitationId.hashCode ^
        record.hashCode;
  }
}
