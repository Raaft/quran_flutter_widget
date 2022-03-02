import 'package:floor/floor.dart';
import 'package:quran_widget_flutter/model/base_model.dart';

@Entity(tableName: 'Narration')
class Narration extends BaseModel {
  @primaryKey
  int? id;
  String? name;
  String? description;

  factory Narration.fromJson(Map<String, dynamic> json) {
    return Narration.fromMap(json);
  }

  Narration({
    this.id,
    this.name,
    this.description,
  });

  Narration.create(this.id, this.name, this.description);

  @override
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    return data;
  }

  Narration copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return Narration(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  factory Narration.fromMap(Map<String, dynamic> map) {
    return Narration(
      id: map['id']?.toInt(),
      name: map['name'],
      description: map['description'],
    );
  }

  @override
  String toString() =>
      'Narration(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Narration &&
        other.id == id &&
        other.name == name &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
