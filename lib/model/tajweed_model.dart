class TajweedModel {
  int? id;
  String? name;
  String? author;
  int? narration;

  TajweedModel({this.id, this.name, this.author, this.narration});

  TajweedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    author = json['author'];
    narration = json['narration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['author'] = author;
    data['narration'] = narration;
    return data;
  }
}
