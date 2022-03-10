import 'package:floor/floor.dart';

import 'base_model.dart';

@entity
class Chapter extends BaseModel {
  @primaryKey
  int? id;
  String? name;
  Chapter({
    this.id,
    this.name,
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
  }) {
    return Chapter(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Chapter.fromJson(Map<String, dynamic> map) {
    return Chapter(
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  @override
  String toString() => 'Chapter(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Chapter && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
