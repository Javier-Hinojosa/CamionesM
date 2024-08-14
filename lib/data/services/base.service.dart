import 'package:camionesm/data/models/models/environment.model.dart';
import 'package:camionesm/data/providers/api.provider.dart';

import '../providers/api.enviroments.dart';

abstract class BaseService {
  final provider = ApiProvider.instance;
  final EnvironmentModel apiHost = ApiEnvironment().config.apisHost;
  final bool useHttps = ApiEnvironment().config.useHttps;
}
