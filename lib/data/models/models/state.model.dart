
import 'dart:convert';

List<StateModel> stateModelFromJson(String str) =>
    List<StateModel>.from(
        json.decode(str).map((x) => StateModel.fromJson(x)));

class StateModel {
  StateModel({
      this.id, 
      this.name, 
      this.municipals,});

  StateModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    municipals = json['municipals'] != null ? json['municipals'].cast<String>() : [];
  }

  int? id;
  String? name;
  List<String>? municipals;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['municipals'] = municipals;
    return map;
  }

}