import 'dart:async';

abstract class ICountryService {
  FutureOr<Map<String, List<String>>> getStates();
}