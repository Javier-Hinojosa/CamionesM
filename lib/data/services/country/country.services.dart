import 'dart:async';
import 'dart:convert';

import 'package:camionesm/data/models/models/state.model.dart';
import 'package:camionesm/data/services/base.service.dart';
import 'package:camionesm/data/services/country/country.contract.dart';
import 'package:flutter/services.dart';


class CountryApiService extends BaseService implements ICountryService {

  @override
  Future<List<StateModel>> getStates()async {
    final String response = await rootBundle.loadString('assets/files/json/estados-municipios.json');
   var list= stateModelFromJson(response);
   return list;
  }

}
