import 'dart:async';
import 'dart:io';
import 'package:camionesm/app/utils/shared_prefrences.utils.dart';
import 'package:camionesm/core/values/enums.dart';
import 'package:camionesm/core/values/keys.dart';
import 'package:camionesm/data/providers/api_exceptions.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  // Singleton
  ApiProvider._privateConstructor();
  static final ApiProvider _instance = ApiProvider._privateConstructor();
  static ApiProvider get instance => _instance;


  // End Singleton

  Future<dynamic> request<T>(RequestMethod method, String endPoint, {String body = '', bool returnFullResponse = false, Map<String, String>? addHeaders}) async {
    http.Response resp;
    final Uri url = Uri.parse(endPoint);

    final Map<String, String> headers = <String, String>{};
    if(addHeaders!=null) {
      headers.addAll(addHeaders);
    }else{
      headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'application/json');
      headers.putIfAbsent(HttpHeaders.acceptHeader, () => 'application/json');
      headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'Access-Control-Allow-Origin');

    }

    try {
      if (method == RequestMethod.get) {
        resp = await http.get(
          url,
          headers: headers
        );
      } else if (method == RequestMethod.put) {
        resp = await http.put(
          url,
          headers: headers,
          body: body
        );
      } else if (method == RequestMethod.patch) {
        resp = await http.patch(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.post) {
        resp = await http.post(
          url,
          headers: headers,
          body: body,
        );
      } else if (method == RequestMethod.delete) {
        resp = await http.delete(
          url,
          headers: headers,
        );
      } else {
        throw Exception('Otro error');
      }

      return _returnResponse(resp, returnFullResponse);
    } on TimeoutException catch (_) {
      throw Exception("tiempo de espera agotado, intente nuevamente");
    } on SocketException catch(r) {
      _returnResponse(http.Response(r.message, 404), returnFullResponse);
    } on Error catch (e) {
      throw Exception(e.toString());
    } on AppException catch (e) {
      print(e.toString());
      throw Exception("error por app");
    }
  }

  Future<dynamic> requestAuth<T>(RequestMethod method, String endPoint, {String body = '', bool returnFullResponse = false, Map<String, String>? addHeaders}) async {
    http.Response resp;
    final Uri url = Uri.parse(endPoint);

    var shared= await SharedUtils.create<String>();
   var accessToken= shared.getValue(Keys.accessToken);

    final Map<String, String> headers = <String, String>{};
    if(addHeaders!=null) {
      headers.addAll(addHeaders);
    }else{
      headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'application/json');
      headers.putIfAbsent(HttpHeaders.authorizationHeader, () => 'bearer $accessToken');
      headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'Access-Control-Allow-Origin');
    }

    try {
      if (method == RequestMethod.get) {
        resp = await http.get(
            url,
            headers: headers);
      } else if (method == RequestMethod.put) {
        resp = await http.put(
            url,
            headers: headers,
            body: body);
      } else if (method == RequestMethod.patch) {
        resp = await http.patch(
          url,
          headers: headers,
          body: body);
      } else if (method == RequestMethod.post) {
        resp = await http.post(
          url,
          headers: headers,
          body: body);
      } else if (method == RequestMethod.delete) {
        resp = await http.delete(
          url,
          headers: headers);
      } else {
        throw Exception('Otro error');
      }

      return _returnResponse(resp, returnFullResponse);
    } on TimeoutException catch (_) {
      throw Exception("tiempo de espera agotado, intente nuevamente");
    } on SocketException catch(r) {
      _returnResponse(http.Response(r.message, 404), returnFullResponse);
    } on Error catch (e) {
      throw Exception(e.toString());
    } on AppException catch (e) {
      print(e.toString());
      throw Exception("error por app");
    }
  }


  dynamic _returnResponse(http.Response? response, bool returnFullResponse) {
    if (response != null) {
      switch (response.statusCode) {
        case 200:
          return response.body;
        case 201:
          return response.body;
        case 400:
          return response.body;
        case 401:
          return response.body;
        case 403:
          return response.body;
        case 500:
          return response.body;
        case 502:
          return response.body;
        default:
          throw FetchDataException(
              'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
      }
    } else {
      throw FetchDataException('Error occured while Communication');
    }
  }
}
