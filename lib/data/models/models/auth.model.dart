import 'package:camionesm/data/models/models/exception.model.dart';

class RefreshModel extends ExceptionModel{
  RefreshModel({
    this.access,
    super.detail,
    super.code
  });

  String? access;

  RefreshModel.fromJson(dynamic json) {
    access = json['access'];
    detail = json['detail'];
    code= json['code'];
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access'] = access;
    map['detail'] = detail;
    map['code'] = code;
    return map;
  }

}

class AuthModel extends ExceptionModel{
  AuthModel({
    this.refresh,
    this.access,
    this.user,
    this.permissions,
    super.detail,
    super.code
  });

  AuthModel.fromJson(dynamic json) {
    refresh = json['refresh'];
    access = json['access'];
    detail = json['detail'];
    code= json['code'];
    user = json['user'] != null ? AuthUserModel.fromJson(json['user']) : null;
    if (json['permissions'] != null) {
      permissions = [];
      json['permissions'].forEach((v) {
        permissions?.add(Permissions.fromJson(v));
      });
    }
  }
  String? refresh;
  String? access;
  AuthUserModel? user;
  List<Permissions>? permissions;

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh'] = refresh;
    map['access'] = access;
    map['detail'] = detail;
    map['code'] = code;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (permissions != null) {
      map['permissions'] = permissions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Permissions {
  Permissions({
      this.app, 
      this.verb, 
      this.model, 
      this.fullName,});

  Permissions.fromJson(dynamic json) {
    app = json['app'];
    verb = json['verb'];
    model = json['model'];
    fullName = json['full_name'];
  }
  String? app;
  String? verb;
  String? model;
  String? fullName;
Permissions copyWith({  String? app,
  String? verb,
  String? model,
  String? fullName,
}) => Permissions(  app: app ?? this.app,
  verb: verb ?? this.verb,
  model: model ?? this.model,
  fullName: fullName ?? this.fullName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['app'] = app;
    map['verb'] = verb;
    map['model'] = model;
    map['full_name'] = fullName;
    return map;
  }

}

class AuthUserModel {
  AuthUserModel(
      this.id,
      this.isActive, 
      this.username, 
      this.firstName, 
      this.lastName,
      this.isSuperuser);

 factory AuthUserModel.fromJson(dynamic json) =>
     AuthUserModel(
         json['id'],
         json['is_active'],
         json['username'],
         json['first_name'],
         json['last_name'],
         json['is_superuser']);

  int id;
  bool isActive;
  String username;
  String firstName;
  String lastName;
  bool isSuperuser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['is_active'] = isActive;
    map['username'] = username.isEmpty?"x":username;
    map['first_name'] = firstName.isEmpty?"x":firstName;
    map['last_name'] = lastName.isEmpty?"x":lastName;
    map['is_superuser'] = isSuperuser;
    return map;
  }

}