class Uom {
  int? id;
  String? name;
  String? description;
  bool? visible;

  Uom({this.id, this.name, this.description, this.visible});

  Uom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['visible'] = visible;
    return data;
  }
}
