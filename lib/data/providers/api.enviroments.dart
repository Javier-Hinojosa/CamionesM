

import 'package:camionesm/core/config/config.dev.dart';
import 'package:camionesm/core/config/config.prod.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/services/base.config.dart';

class ApiEnvironment {
  factory ApiEnvironment() {
    return _singleton;
  }

  ApiEnvironment._internal();

  static final ApiEnvironment _singleton = ApiEnvironment._internal();
  BaseConfig config = DevConfig();

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Keys.prod:
        return ProdConfig();
      case Keys.dev:
        return DevConfig();
      default:
        return DevConfig();
    }
  }
}
