class TranslationModel {
  int? id;
  String? name;
  String? author;
  String? language;

  TranslationModel({this.id, this.name, this.author, this.language});

  TranslationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    author = json['author'];
    language = json['language'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['author'] = this.author;
    data['language'] = this.language;
    return data;
  }
}
