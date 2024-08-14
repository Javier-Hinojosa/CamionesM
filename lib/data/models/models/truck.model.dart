class TruckModel {
  TruckModel({
      this.id, 
      this.image, 
      this.marca, 
      this.combustible, 
      this.placa, 
      this.noperm, 
      this.anio,
      this.aseguradora, 
      this.date, 
      this.type, 
      this.typeCarga,});

  TruckModel.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    marca = json['marca'];
    combustible = json['combustible'];
    placa = json['placa'];
    noperm = json['no.perm'];
    anio = json['anio'];
    aseguradora = json['Aseguradora'];
    date = json['date'];
    type = json['type'];
    if (json['type_carga'] != null) {
      typeCarga = [];
      json['type_carga'].forEach((v) {
        typeCarga?.add(TypeCarga.fromJson(v));
      });
    }
  }
  String? id;
  String? image;
  String? marca;
  String? combustible;
  String? placa;
  num? noperm;
  num? anio;
  String? aseguradora;
  String? date;
  String? type;
  List<TypeCarga>? typeCarga;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['marca'] = marca;
    map['combustible'] = combustible;
    map['placa'] = placa;
    map['no.perm'] = noperm;
    map['anio'] = anio;
    map['Aseguradora'] = aseguradora;
    map['date'] = date;
    map['type'] = type;
    if (typeCarga != null) {
      map['type_carga'] = typeCarga?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class TypeCarga {
  TypeCarga({
      this.name, 
      this.id, 
      this.isActive,});

  TypeCarga.fromJson(dynamic json) {
    name = json['name'];
    id = json['id'];
    isActive = json['isActive'];
  }
  String? name;
  num? id;
  bool? isActive;
TypeCarga copyWith({  String? name,
  num? id,
  bool? isActive,
}) => TypeCarga(  name: name ?? this.name,
  id: id ?? this.id,
  isActive: isActive ?? this.isActive,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['id'] = id;
    map['isActive'] = isActive;
    return map;
  }

}