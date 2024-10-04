import 'package:camionesm/core/environment/environment.contract.dart';
import 'package:camionesm/data/models/models/environment.model.dart';
import 'package:camionesm/data/providers/api.enviroments.dart';
import 'package:camionesm/data/providers/api.provider.dart';


abstract class BaseService {
  final provider = ApiProvider.instance;
  final EnvironmentContract apiHost = ApiEnvironment().config;
  final bool useHttps = ApiEnvironment().config.useHttps;
}
