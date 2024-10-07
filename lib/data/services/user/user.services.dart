import 'dart:async';
import 'dart:convert';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/data/models/models/auth.model.dart';
import 'package:camionesm/data/services/base.service.dart';
import 'package:camionesm/data/services/user/user.contract.dart';


class UserApiService extends BaseService implements IUserService {


  @override
  Future<AuthModel> auth(String name, String pass) async{
    try{
      final response = await provider.request(RequestMethod.post,
          apiHost.apiAuth,
          body: '{"username": "$name", "password": "$pass"}');
      final Map<String, dynamic> jsonData = json.decode(response);
      return AuthModel.fromJson(jsonData);
    }
    catch(e){
    var x = e as Exception;
      return  AuthModel(detail: x.toString());
    }
  }

  @override
  Future<AuthModel> refresh(String tokenRefresh) async{
    try{
      final response = await provider.request(RequestMethod.post,
          apiHost.apiRefresh,
          body: '{"refresh": "${tokenRefresh.isNotEmpty?tokenRefresh:"x"}"}');
      final Map<String, dynamic> jsonData = json.decode(response);
      return AuthModel.fromJson(jsonData);
    }
    catch(e){
      var x = e as Exception;
      return  AuthModel(detail: x.toString());
    }
  }



}
