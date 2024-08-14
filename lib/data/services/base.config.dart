import 'package:camionesm/data/models/models/environment.model.dart';

abstract class BaseConfig {
  EnvironmentModel get apisHost;
  bool get useHttps;
  bool get trackEvents;
  bool get reportErrors;
}
