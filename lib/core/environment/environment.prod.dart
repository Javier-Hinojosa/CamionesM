

import 'package:camionesm/data/models/models/environment.model.dart';
import 'package:camionesm/data/services/base.config.dart';

class EnvironmentProd implements BaseConfig {

  @override
  bool get reportErrors => false;
  @override
  bool get trackEvents => false;
  @override
  bool get useHttps => true;

  @override
  String get apiAuth => "http://192.168.1.12:8080/api/v1/api-token-auth/";
  @override
  String get apiRefresh => "http://192.168.1.12:8080/api/v1/api/token/refresh/";
}
