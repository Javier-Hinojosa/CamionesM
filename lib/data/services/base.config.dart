import 'package:camionesm/core/environment/environment.contract.dart';
import 'package:camionesm/data/models/models/environment.model.dart';

abstract class BaseConfig extends EnvironmentContract {

  bool get useHttps;
  bool get trackEvents;
  bool get reportErrors;
}
