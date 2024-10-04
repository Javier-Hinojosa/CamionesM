

import 'package:camionesm/core/environment/environment.dev.dart';
import 'package:camionesm/core/environment/environment.prod.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/services/base.config.dart';

class ApiEnvironment {
  factory ApiEnvironment() {
    return _singleton;
  }

  ApiEnvironment._internal();

  static final ApiEnvironment _singleton = ApiEnvironment._internal();
  BaseConfig config = EnvironmentDev();

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Keys.prod:
        return EnvironmentProd();
      case Keys.dev:
        return EnvironmentDev();
      default:
        return EnvironmentDev();
    }
  }
}
