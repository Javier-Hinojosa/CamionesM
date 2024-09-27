import 'dart:async';

import 'package:camionesm/data/models/models/state.model.dart';

abstract class ICountryService {
  Future<List<StateModel>> getStates();
}