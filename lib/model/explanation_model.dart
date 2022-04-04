class ExplanationModel {
  int? id;
  String? name;
  int? narration;

  ExplanationModel({this.id, this.name, this.narration});

  ExplanationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    narration = json['narration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['narration'] = narration;
    return data;
  }
}
