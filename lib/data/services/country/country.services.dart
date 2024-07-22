import 'dart:async';
import 'dart:convert';

import 'package:camionesm/data/services/base.service.dart';
import 'package:camionesm/data/services/country/country.contract.dart';
import 'package:flutter/services.dart';


class CountryApiService extends BaseService implements ICountryService {

  @override
  FutureOr<Map<String, List<String>>> getStates()async {
    final String response = await rootBundle.loadString('assets/files/json/estados-municipios.json');
    final Map<String, dynamic> data = json.decode(response);
    return data.map((key, value) => MapEntry(key, List<String>.from(value)));
  }

}
