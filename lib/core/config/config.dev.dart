import 'package:camionesm/data/models/environment.model.dart';
import 'package:camionesm/data/services/base.config.dart';

class DevConfig implements BaseConfig {
  @override
  EnvironmentModel get apisHost => EnvironmentModel(

      );
  @override
  bool get reportErrors => true;
  @override
  bool get trackEvents => true;
  @override
  bool get useHttps => false;
}
