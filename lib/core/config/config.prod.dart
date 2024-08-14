

import 'package:camionesm/data/models/models/environment.model.dart';
import 'package:camionesm/data/services/base.config.dart';

class ProdConfig implements BaseConfig {
  @override
  EnvironmentModel get apisHost => EnvironmentModel();
  @override
  bool get reportErrors => false;
  @override
  bool get trackEvents => false;
  @override
  bool get useHttps => true;
}
